package top.huhuiyu.codebuilder.template.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import top.huhuiyu.codebuilder.template.entity.TbRole;

/**
 * tb_role表的dao
 * 
 * @author 胡辉煜
 */
@Mapper
public interface TbRoleDAO {
  /**
   * 查询全部tb_role
   *
   * @return tb_role的信息
   * 
   * @throws Exception 处理发生异常
   */
  List<TbRole> queryAll() throws Exception;

  /**
   * 按照主键查询tb_role
   *
   * @param tbRole 主键信息
   * 
   * @return 主键查询tb_role的结果
   * 
   * @throws Exception 处理发生异常
   */
  TbRole queryByKey(TbRole tbRole) throws Exception;

  /**
   * 添加tb_role信息
   *
   * @param tbRole tbRole信息
   * 
   * @return 添加tbRole信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int add(TbRole tbRole) throws Exception;

  /**
   * 修改tb_role信息
   *
   * @param tbRole tbRole信息
   * 
   * @return 修改tbRole信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int update(TbRole tbRole) throws Exception;

  /**
   * 删除tb_role信息
   *
   * @param tbRole tbRole信息
   * 
   * @return 删除tbRole信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int delete(TbRole tbRole) throws Exception;

}