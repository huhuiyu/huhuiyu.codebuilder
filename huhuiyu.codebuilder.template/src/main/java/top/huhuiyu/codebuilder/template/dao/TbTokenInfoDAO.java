package top.huhuiyu.codebuilder.template.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import top.huhuiyu.codebuilder.template.entity.TbTokenInfo;

/**
 * tb_token_info表的dao
 * 
 * @author 胡辉煜
 */
@Mapper
public interface TbTokenInfoDAO {
  /**
   * 查询全部tb_token_info
   *
   * @return tb_token_info的信息
   * 
   * @throws Exception 处理发生异常
   */
  List<TbTokenInfo> queryAll() throws Exception;

  /**
   * 按照主键查询tb_token_info
   *
   * @param tbTokenInfo 主键信息
   * 
   * @return 主键查询tb_token_info的结果
   * 
   * @throws Exception 处理发生异常
   */
  TbTokenInfo queryByKey(TbTokenInfo tbTokenInfo) throws Exception;

  /**
   * 添加tb_token_info信息
   *
   * @param tbTokenInfo tbTokenInfo信息
   * 
   * @return 添加tbTokenInfo信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int add(TbTokenInfo tbTokenInfo) throws Exception;

  /**
   * 修改tb_token_info信息
   *
   * @param tbTokenInfo tbTokenInfo信息
   * 
   * @return 修改tbTokenInfo信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int update(TbTokenInfo tbTokenInfo) throws Exception;

  /**
   * 删除tb_token_info信息
   *
   * @param tbTokenInfo tbTokenInfo信息
   * 
   * @return 删除tbTokenInfo信息的结果
   * 
   * @throws Exception 处理发生异常
   */
  int delete(TbTokenInfo tbTokenInfo) throws Exception;

}