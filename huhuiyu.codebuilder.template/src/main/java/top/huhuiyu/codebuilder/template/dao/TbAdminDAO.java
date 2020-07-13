package top.huhuiyu.codebuilder.template.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import top.huhuiyu.codebuilder.template.entity.TbAdmin;

/**
 * tb_admin表的dao
 * 
 * @author 胡辉煜
 */
@Mapper
public interface TbAdminDAO {
  /**
   * 查询全部tb_admin
   *
   * @return tb_admin的信息
   * 
   * @throws Exception 处理发生异常
   */
  List<TbAdmin> queryAll() throws Exception;

  /**
   * 按照主键查询tb_admin
   *
   * @param tbAdmin 主键信息
   * 
   * @return 主键查询tb_admin的结果
   * 
   * @throws Exception 处理发生异常
   */
  TbAdmin queryByKey(TbAdmin tbAdmin) throws Exception;

  /**
   * 添加tb_admin信息
   *
   * @param tbAdmin tbAdmin信息
   * 
   * @return 添加tbAdmin信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int add(TbAdmin tbAdmin) throws Exception;

  /**
   * 修改tb_admin信息
   *
   * @param tbAdmin tbAdmin信息
   * 
   * @return 修改tbAdmin信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int update(TbAdmin tbAdmin) throws Exception;

  /**
   * 删除tb_admin信息
   *
   * @param tbAdmin tbAdmin信息
   * 
   * @return 删除tbAdmin信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int delete(TbAdmin tbAdmin) throws Exception;

}