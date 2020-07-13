package top.huhuiyu.codebuilder.template.service;

import top.huhuiyu.api.spring.base.BaseResult;
import top.huhuiyu.codebuilder.template.message.IndexMessage;
import top.huhuiyu.codebuilder.template.model.IndexModel;

/**
 * 首页服务
 * 
 * @author 胡辉煜
 */
public interface IndexService {

  /**
   * 首页
   * 
   * @param model 页面数据
   * 
   * @return 应答结果
   * 
   * @throws Exception 处理发生异常
   */
  BaseResult<IndexMessage> index(IndexModel model) throws Exception;
}