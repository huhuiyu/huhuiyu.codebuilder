package top.huhuiyu.codebuilder.template.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import top.huhuiyu.codebuilder.template.entity.TbConfig;

/**
 * tb_config表的dao
 * 
 * @author 胡辉煜
 */
@Mapper
public interface TbConfigDAO {
  /**
   * 查询全部tb_config
   *
   * @return tb_config的信息
   * 
   * @throws Exception 处理发生异常
   */
  List<TbConfig> queryAll() throws Exception;

  /**
   * 按照主键查询tb_config
   *
   * @param tbConfig 主键信息
   * 
   * @return 主键查询tb_config的结果
   * 
   * @throws Exception 处理发生异常
   */
  TbConfig queryByKey(TbConfig tbConfig) throws Exception;

  /**
   * 添加tb_config信息
   *
   * @param tbConfig tbConfig信息
   * 
   * @return 添加tbConfig信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int add(TbConfig tbConfig) throws Exception;

  /**
   * 修改tb_config信息
   *
   * @param tbConfig tbConfig信息
   * 
   * @return 修改tbConfig信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int update(TbConfig tbConfig) throws Exception;

  /**
   * 删除tb_config信息
   *
   * @param tbConfig tbConfig信息
   * 
   * @return 删除tbConfig信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int delete(TbConfig tbConfig) throws Exception;

}