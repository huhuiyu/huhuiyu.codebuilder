package top.huhuiyu.codebuilder.template.aop;

import org.aspectj.lang.annotation.Pointcut;

/**
 * 控制器切点定义
 * 
 * @author 胡辉煜
 *
 */
public abstract class BaseControllerAop {

  @Pointcut("execution(public * top.huhuiyu.codebuilder.template.controller..*.*(..))")
  public void controller() {
  }

}