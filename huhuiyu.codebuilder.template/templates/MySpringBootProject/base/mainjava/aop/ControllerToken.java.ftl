package ${builderUtil.getSubPackage("aop")};

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import top.huhuiyu.api.spring.base.BaseResult;
import top.huhuiyu.api.utils.StringUtils;
import ${builderUtil.getSubPackage("base")}.MyBaseModel;
import ${builderUtil.getSubPackage("dao")}.UtilsDAO;
import ${builderUtil.getSubPackage("entity")}.TbActions;
import ${builderUtil.getSubPackage("entity")}.TbAdmin;
import ${builderUtil.getSubPackage("entity")}.TbTokenInfo;
import ${builderUtil.getSubPackage("service")}.UtilService;

/**
 * 控制器token切面
 *
 * @author ${baseInfo.author}
 */
@Aspect
@Component
public class ControllerToken extends BaseControllerAop {
  /**
   * 需要登陆的错误提示信息
   */
  public static final String NEED_ROLE_LOGIN = "需要相关角色用户登陆！";
  /**
   * 请求头中的token信息key
   */
  public static final String TOKEN_KEY = "token";
  /**
   * 需要登陆
   */
  public static final int NEED_LOGIN = 1000;
  /**
   * 封ip
   */
  public static final int IP_BAN = 1001;
  /**
   * 封ip错误提示
   */
  public static final String IP_BAN_ERROR = "需要正确的token信息！";

  private static final Logger log = LoggerFactory.getLogger(ControllerToken.class);

  @Autowired
  private UtilService utilService;
  @Autowired
  private UtilsDAO utilsDAO;

  /**
   * 处理登陆信息拦截
   * 
   * @param pjp 切面信息
   * 
   * @throws Exception 处理发生错误
   */
  private void processAuthInfo(ProceedingJoinPoint pjp) throws Exception {
    MyBaseModel model = getMyBaseModel(pjp);
    if (model == null) {
      return;
    }
    // 登陆信息处理
    TbTokenInfo tbTokenInfo = model.makeTbTokenInfo();
    // 管理员登陆信息
    tbTokenInfo.setInfoKey(UtilService.LOGIN_ADMIN);
    TbAdmin admin = utilsDAO.queryAdminByToken(tbTokenInfo);
    ControllerToken.log.debug(String.format("admin=====>", admin));
    model.setLoginAdmin(admin);
  }

  private BaseResult<?> processAuth(ProceedingJoinPoint pjp) throws Exception {
    MyBaseModel model = getMyBaseModel(pjp);
    RequestAttributes ra = RequestContextHolder.getRequestAttributes();
    ServletRequestAttributes sra = (ServletRequestAttributes) ra;
    HttpServletRequest request = sra.getRequest();
    TbActions actions = new TbActions();
    actions.setUrl(request.getRequestURI());
    actions = utilsDAO.queryByUrl(actions);
    // 查询不到的url不受管制
    if (actions == null) {
      return null;
    }
    // url的权限列表
    List<String> roles = getRoles(actions.getRole());
    List<String> check = new ArrayList<>();
    check.addAll(roles);
    // 登陆用户的权限列表
    List<String> userRoles = new ArrayList<>();
    // 管理员校验
    TbAdmin admin = model.getLoginAdmin();
    if (admin != null && !StringUtils.isEmpty(admin.getRole())) {
      userRoles.clear();
      userRoles = getRoles(admin.getRole());
    }
    check.retainAll(userRoles);
    // 不为空就表示权限吻合
    if (!check.isEmpty()) {
      return null;
    }
    return BaseResult.getFail(NEED_LOGIN, NEED_ROLE_LOGIN);
  }

  private List<String> getRoles(String role) {
    List<String> roles = new ArrayList<>(Arrays.asList(role.split(",")));
    return roles;
  }

  /**
   * 获取基础model信息
   * 
   * @param pjp 切面信息
   * 
   * @return model信息
   * 
   * @throws Exception 处理发生错误
   */
  private MyBaseModel getMyBaseModel(ProceedingJoinPoint pjp) throws Exception {
    MyBaseModel model = null;
    Object[] args = pjp.getArgs();
    for (Object arg : args) {
      if (arg instanceof MyBaseModel) {
        model = (MyBaseModel) arg;
        break;
      }
    }
    return model;
  }

  /**
   * 处理token信息
   * 
   * @param pjp 切面信息
   * 
   * @return token信息
   * 
   * @throws Exception 处理发生错误
   */
  private TbTokenInfo processToken(ProceedingJoinPoint pjp) throws Exception {
    MyBaseModel model = getMyBaseModel(pjp);
    if (model != null) {
      RequestAttributes ra = RequestContextHolder.getRequestAttributes();
      ServletRequestAttributes sra = (ServletRequestAttributes) ra;
      HttpServletRequest request = sra.getRequest();
      model.setToken(request.getHeader(TOKEN_KEY));
      TbTokenInfo token = model.makeTbTokenInfo();
      // 校验并更新token信息
      token = utilService.checkToken(token);
      model.setToken(token.getToken());
      return token;
    }
    return null;
  }

  @Around("controller()")
  public Object around(ProceedingJoinPoint pjp) throws Throwable {
    log.debug("控制器切面token处理");
    TbTokenInfo token = processToken(pjp);
    log.debug(String.format("token信息：%s", token));
    // 登陆信息处理
    processAuthInfo(pjp);
    // 权限拦截
    BaseResult<?> check = processAuth(pjp);
    if (check != null) {
      return check;
    }
    Object result = pjp.proceed();
    // 如果应答为JsonMessage且token存在就应答回去
    if ((token != null) && (result instanceof BaseResult)) {
      BaseResult<?> message = (BaseResult<?>) result;
      message.setToken(token.getToken());
    }
    return result;
  }
}