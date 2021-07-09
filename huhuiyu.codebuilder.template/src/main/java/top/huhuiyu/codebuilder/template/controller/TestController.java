package top.huhuiyu.codebuilder.template.controller;

import java.io.ByteArrayOutputStream;
import java.util.Date;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import top.huhuiyu.api.spring.base.BaseResult;
import top.huhuiyu.api.spring.exception.AppException;
import top.huhuiyu.api.utils.ImageCode;
import top.huhuiyu.codebuilder.template.aop.AnnoNoToken;
import top.huhuiyu.codebuilder.template.base.MyBaseModel;
import top.huhuiyu.codebuilder.template.entity.TbTokenInfo;
import top.huhuiyu.codebuilder.template.message.UtilMessage;
import top.huhuiyu.codebuilder.template.model.TestModel;
import top.huhuiyu.codebuilder.template.model.UtilModel;
import top.huhuiyu.codebuilder.template.service.UtilService;

/**
 * 测试控制器
 * 
 * @author 胡辉煜
 *
 */
@Api(tags = { "测试" })
@RestController
@RequestMapping("/test")
public class TestController {
  @Autowired
  private UtilService utilService;

  @ApiOperation(value = "图片验证码")
  @GetMapping("/imageCode")
  public BaseResult<Object> imageCode(UtilModel model) throws Exception {
    String code = utilService.makeImageCode(model.getToken());
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    ImageIO.write(ImageCode.makeImage(code), "jpeg", baos);
    byte[] bytes = baos.toByteArray();
    String base64 = Base64Utils.encodeToString(bytes).trim();
    return BaseResult.getSuccess(String.format("data:image/jpg;base64,%s", base64));
  }

  @ApiOperation(value = "管理员登陆测试，需要管理员登陆")
  @PostMapping("/adminLogin")
  public BaseResult<UtilMessage> adminLogin(MyBaseModel model) throws Exception {
    BaseResult<UtilMessage> result = new BaseResult<>(new UtilMessage());
    result.setSuccessInfo("");
    result.getResultData().setLoginInfo(model.getLoginAdmin());
    return result;
  }

  @ApiOperation(value = "图片校验码测试")
  @ApiImplicitParams({ @ApiImplicitParam(name = "imageCode", value = "图片校验码", paramType = "query", required = true) })
  @PostMapping("/checkImageCode")
  public BaseResult<Object> checkImageCode(UtilModel model) throws Exception {
    TbTokenInfo tbTokenInfo = model.makeTbTokenInfo();
    tbTokenInfo.setInfo(model.getImageCode());
    boolean result = utilService.checkImageCode(tbTokenInfo);
    return result ? BaseResult.getSuccess("校验码正确") : BaseResult.getFail("校验码错误");
  }

  @ApiOperation(value = "转换器测试")
  @PostMapping("/converter")
  public BaseResult<Object> converter(TestModel model) throws Exception {
    return BaseResult.getSuccess(String.format("%s", model));
  }

  @AnnoNoToken
  @ApiOperation(value = "token注解测试，本方法不需要token信息")
  @PostMapping("/notoken")
  public BaseResult<Object> notoken() throws Exception {
    BaseResult<Object> result = BaseResult.getSuccess("本方法不需要token信息");
    result.setResultData(new Date());
    return result;
  }

  @ApiOperation(value = "自定义异常信息测试")
  @PostMapping("/exception")
  public BaseResult<Object> notoken(TestModel model) throws Exception {
    throw AppException.getAppException("自定义异常", model.getToken());
  }
}