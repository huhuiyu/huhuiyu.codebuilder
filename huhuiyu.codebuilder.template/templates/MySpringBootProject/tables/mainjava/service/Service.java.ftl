package ${builderUtil.getSubPackage("service")};

import top.huhuiyu.api.spring.base.BaseResult;
import ${builderUtil.getSubPackage("message")}.${builderUtil.getClassName(tableInfo)}Message;
import ${builderUtil.getSubPackage("model")}.${builderUtil.getClassName(tableInfo)}Model;

/**
 * ${builderUtil.getClassName(tableInfo)}的Service
 * 
 * @author ${baseInfo.author}
 */
public interface ${builderUtil.getClassName(tableInfo)}Service {

  /**
   * 修改${builderUtil.getClassName(tableInfo)}信息
   * 
   * @param model 页面提交数据
   * @return 修改${builderUtil.getClassName(tableInfo)}信息的结果
   * @throws Exception 处理发生错误
   */
  BaseResult<${builderUtil.getClassName(tableInfo)}Message> update(${builderUtil.getClassName(tableInfo)}Model model) throws Exception;

  /**
   * 删除${builderUtil.getClassName(tableInfo)}信息
   * 
   * @param model 页面提交数据
   * @return 删除${builderUtil.getClassName(tableInfo)}信息的结果
   * @throws Exception 处理发生错误
   */
  BaseResult<${builderUtil.getClassName(tableInfo)}Message> delete(${builderUtil.getClassName(tableInfo)}Model model) throws Exception;

  /**
   * 添加${builderUtil.getClassName(tableInfo)}信息
   * 
   * @param model 页面提交数据
   * @return 添加${builderUtil.getClassName(tableInfo)}信息的结果
   * @throws Exception 处理发生错误
   */
  BaseResult<${builderUtil.getClassName(tableInfo)}Message> add(${builderUtil.getClassName(tableInfo)}Model model) throws Exception;

  /**
   * 按照主键查询${builderUtil.getClassName(tableInfo)}信息
   * 
   * @param model 页面提交数据
   * @return 主键查询${builderUtil.getClassName(tableInfo)}信息的结果
   * @throws Exception 处理发生错误
   */
  BaseResult<${builderUtil.getClassName(tableInfo)}Message> queryByKey(${builderUtil.getClassName(tableInfo)}Model model) throws Exception;

  /**
   * 分页查询${builderUtil.getClassName(tableInfo)}信息
   * 
   * @param model 页面提交数据
   * @return 分页查询${builderUtil.getClassName(tableInfo)}信息的结果
   * @throws Exception 处理发生错误
   */
  BaseResult<${builderUtil.getClassName(tableInfo)}Message> queryAll(${builderUtil.getClassName(tableInfo)}Model model) throws Exception;

}