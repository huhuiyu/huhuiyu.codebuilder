package top.huhuiyu.codebuilder.template.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.NoHandlerFoundException;

import top.huhuiyu.api.spring.base.BaseResult;
import top.huhuiyu.api.spring.exception.AppException;

/**
 * controller层全局错误处理器 <br>
 * ControllerAdvice注解表示是控制器层拦截处理（aop-面向切面编程）<br>
 * ExceptionHandler注解表示方法为错误处理器，参数是错误的类型
 * 
 * @author 胡辉煜
 *
 */
@ControllerAdvice
@ResponseBody
public class MyExceptionHandler {

  private static final Logger log = LoggerFactory.getLogger(MyExceptionHandler.class);

  @ExceptionHandler(Exception.class)
  public BaseResult<?> handleException(Exception ex) {

    log.error("服务器发生错误：", ex);
    // 处理应用程序自定义异常
    if (ex instanceof AppException) {
      AppException appException = (AppException) ex;
      BaseResult<Object> result = BaseResult.getFail(appException.getCode(), appException.getMessage());
      result.setToken(appException.getToken());
      log.debug("自定义异常token：{}", appException.getToken());
      return result;
    }
    if (ex instanceof NoHandlerFoundException) {
      return BaseResult.getFail(404, "资源不存在");
    }
    return BaseResult.getFail("服务器忙，请稍后重试！");
  }

}