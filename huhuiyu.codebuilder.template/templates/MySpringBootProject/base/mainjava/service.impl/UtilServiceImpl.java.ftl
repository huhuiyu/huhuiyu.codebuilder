package ${builderUtil.getSubPackage("service.impl")};

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import top.huhuiyu.api.fileutil.Md5;
import top.huhuiyu.api.spring.base.BaseResult;
import top.huhuiyu.api.spring.exception.AppException;
import top.huhuiyu.api.utils.ImageCode;
import top.huhuiyu.api.utils.StringUtils;
import ${builderUtil.getSubPackage("aop")}.ControllerToken;
import ${builderUtil.getSubPackage("dao")}.UtilsDAO;
import ${builderUtil.getSubPackage("entity")}.TbAdmin;
import ${builderUtil.getSubPackage("entity")}.TbConfig;
import ${builderUtil.getSubPackage("entity")}.TbTokenInfo;
import ${builderUtil.getSubPackage("message")}.UtilMessage;
import ${builderUtil.getSubPackage("model")}.UtilModel;
import ${builderUtil.getSubPackage("service")}.UtilService;
import ${builderUtil.getSubPackage("utils")}.IpUtils;

/**
 * 工具服务实现
 * 
 * @author ${baseInfo.author}
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UtilServiceImpl implements UtilService {
  @Autowired
  private UtilsDAO utilsDAO;

  /**
   * 处理admin的敏感信息
   * 
   * @param admin 要处理的admin信息
   */
  private void processAdminInfo(TbAdmin admin) {
    if (admin == null) {
      return;
    }
    admin.setAid(null);
    admin.setEnable(null);
    admin.setPassword(null);
    admin.setSalt(null);
    admin.setRole(null);
  }

  @Override
  public int deleteTokens() throws Exception {
    return utilsDAO.deleteTokenInfos();
  }

  @Override
  public TbTokenInfo checkToken(TbTokenInfo token) throws Exception {
    // 没有传入就返回新的
    if (token == null || StringUtils.isEmpty(token.getToken())) {
      return newToken();
    }
    token.setInfoKey(TOKEN);
    token.setInfo(IpUtils.getIpAddress());
    // 数据库校验
    TbTokenInfo stoken = utilsDAO.queryTokenInfo(token);
    // 校验不通过就返回新的
    if (stoken == null) {
      return newToken();
    }
    stoken.setInfo(IpUtils.getIpAddress());
    // 通过就更新时间
    utilsDAO.updateTokenInfo(stoken);
    // 删除ip的token记录
    TbConfig config = new TbConfig();
    config.setConfigKey(getIpBanKey(IpUtils.getIpAddress()));
    utilsDAO.deleteConfig(config);
    return stoken;
  }

  private String getIpBanKey(String ip) throws Exception {
    return String.format("%s-%s", IP_BAN_RECODE, ip);
  }

  /**
   * 产生新的token信息
   * 
   * @return 新的token信息
   * 
   * @throws Exception 处理发生异常
   */
  private TbTokenInfo newToken() throws Exception {
    TbConfig check = new TbConfig();
    check.setConfigKey(IP_MAX_NEW_TOKEN_COUNT);
    int amount = Integer.parseInt(utilsDAO.queryConfig(check).getConfigValue());
    String ip = IpUtils.getIpAddress();
    TbConfig tbConfig = new TbConfig();
    tbConfig.setConfigKey(getIpBanKey(ip));
    tbConfig = utilsDAO.queryConfig(tbConfig);
    // 没有记录就添加一笔
    if (tbConfig == null) {
      tbConfig = new TbConfig();
      tbConfig.setConfigKey(getIpBanKey(ip));
      tbConfig.setConfigValue(1 + "");
      utilsDAO.saveConfig(tbConfig);
    } else {
      // 有记录就更新次数
      tbConfig.setConfigValue(Integer.parseInt(tbConfig.getConfigValue()) + 1 + "");
      utilsDAO.updateConfig(tbConfig);
    }
    // 超过次数就ban掉
    if (amount < Integer.parseInt(tbConfig.getConfigValue())) {
      throw new AppException(ControllerToken.IP_BAN, ControllerToken.IP_BAN_ERROR);
    }
    // 正常生成新token
    TbTokenInfo token = new TbTokenInfo();
    token.setToken(UUID.randomUUID().toString());
    token.setInfoKey(TOKEN);
    token.setInfo(IpUtils.getIpAddress());
    utilsDAO.addTokenInfo(token);
    return token;
  }

  @Override
  public String makeImageCode(String token) throws Exception {
    TbConfig tbConfig = new TbConfig();
    tbConfig.setConfigKey(CONFIG_IMAGE_CODE_AMOUNT);
    int amount = Integer.parseInt(utilsDAO.queryConfig(tbConfig).getConfigValue());
    tbConfig = new TbConfig();
    tbConfig.setConfigKey(CONFIG_IMAGE_CODE_LENGTH);
    int length = Integer.parseInt(utilsDAO.queryConfig(tbConfig).getConfigValue());
    // 产生图片校验码
    ImageCode.setLength(length);
    ImageCode.setAmount(amount);
    String code = ImageCode.makeCode();
    TbTokenInfo tokenInfo = new TbTokenInfo();
    tokenInfo.setToken(token);
    // 获取token信息
    tokenInfo.setInfoKey(IMAGE_CODE);
    // 判断图片校验码是否存在
    TbTokenInfo sinfo = utilsDAO.queryTokenInfo(tokenInfo);
    if (sinfo == null) {
      // 不存在就将图片code写入
      tokenInfo.setInfo(code);
      utilsDAO.addTokenInfo(tokenInfo);
    } else {
      // 存在就更新图片code
      sinfo.setInfo(code);
      utilsDAO.updateTokenInfo(sinfo);
    }
    return code;
  }

  @Override
  public boolean checkImageCode(TbTokenInfo tokenInfo) throws Exception {
    // code不存在就返回false
    if (StringUtils.isEmpty(tokenInfo.getInfo())) {
      return false;
    }
    tokenInfo.setInfoKey(IMAGE_CODE);
    // 获取数据库中code
    TbTokenInfo sinfo = utilsDAO.queryTokenInfo(tokenInfo);
    if (sinfo == null) {
      // 不存在就返回false
      return false;
    }
    // 删除数据库中的code（只能使用一次）
    utilsDAO.deleteTokenInfo(sinfo);
    // 返回数据库中code和传入的code比对结果
    return sinfo.getInfo().equalsIgnoreCase(tokenInfo.getInfo());
  }

  @Override
  public BaseResult<UtilMessage> adminLogin(UtilModel model) throws Exception {
    BaseResult<UtilMessage> result = new BaseResult<>(new UtilMessage());
    TbAdmin user = model.getTbAdmin();
    if (StringUtils.isEmpty(user.getUsername())) {
      result.setFailInfo("用户名必须填写");
      return result;
    }
    if (StringUtils.isEmpty(user.getPassword())) {
      result.setFailInfo("密码必须填写");
      return result;
    }
    TbAdmin check = utilsDAO.queryAdminByName(user);
    if (check == null) {
      result.setFailInfo("用户不存在");
      return result;
    }
    if (!Md5.checkSaltMd5(user.getPassword(), check.getSalt(), check.getPassword())) {
      result.setFailInfo("密码错误，登陆失败");
      return result;
    }
    // 处理tokeninfo
    TbTokenInfo tokenInfo = model.makeTbTokenInfo();
    tokenInfo.setInfoKey(LOGIN_ADMIN);
    utilsDAO.deleteTokenInfo(tokenInfo);
    tokenInfo.setInfo(check.getAid() + "");
    utilsDAO.addTokenInfo(tokenInfo);
    // 处理敏感信息
    processAdminInfo(check);
    result.setSuccessInfo("");
    result.getResultData().setLoginInfo(check);
    return result;
  }

  @Override
  public BaseResult<UtilMessage> getAdminLoginInfo(UtilModel model) throws Exception {
    TbTokenInfo tokenInfo = model.makeTbTokenInfo();
    tokenInfo.setInfoKey(LOGIN_ADMIN);
    TbAdmin user = utilsDAO.queryAdminByToken(tokenInfo);
    processAdminInfo(user);
    BaseResult<UtilMessage> result = new BaseResult<>(new UtilMessage());
    result.setSuccessInfo("");
    result.getResultData().setLoginInfo(user);
    return result;
  }

  @Override
  public BaseResult<UtilMessage> adminLogout(UtilModel model) throws Exception {
    TbTokenInfo tokenInfo = model.makeTbTokenInfo();
    tokenInfo.setInfoKey(LOGIN_ADMIN);
    utilsDAO.deleteTokenInfo(tokenInfo);
    BaseResult<UtilMessage> result = new BaseResult<>();
    result.setSuccessInfo("登出成功");
    return result;
  }
}