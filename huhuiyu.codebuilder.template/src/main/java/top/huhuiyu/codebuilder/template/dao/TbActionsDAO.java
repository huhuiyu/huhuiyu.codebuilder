package top.huhuiyu.codebuilder.template.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import top.huhuiyu.codebuilder.template.entity.TbActions;

/**
 * tb_actions表的dao
 * 
 * @author 胡辉煜
 */
@Mapper
public interface TbActionsDAO {
  /**
   * 查询全部tb_actions
   *
   * @return tb_actions的信息
   * 
   * @throws Exception 处理发生异常
   */
  List<TbActions> queryAll() throws Exception;

  /**
   * 按照主键查询tb_actions
   *
   * @param tbActions 主键信息
   * 
   * @return 主键查询tb_actions的结果
   * 
   * @throws Exception 处理发生异常
   */
  TbActions queryByKey(TbActions tbActions) throws Exception;

  /**
   * 添加tb_actions信息
   *
   * @param tbActions tbActions信息
   * 
   * @return 添加tbActions信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int add(TbActions tbActions) throws Exception;

  /**
   * 修改tb_actions信息
   *
   * @param tbActions tbActions信息
   * 
   * @return 修改tbActions信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int update(TbActions tbActions) throws Exception;

  /**
   * 删除tb_actions信息
   *
   * @param tbActions tbActions信息
   * 
   * @return 删除tbActions信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int delete(TbActions tbActions) throws Exception;

}