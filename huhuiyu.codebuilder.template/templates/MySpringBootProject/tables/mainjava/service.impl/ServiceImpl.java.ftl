package ${builderUtil.getSubPackage("service.impl")};

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.huhuiyu.api.spring.base.BaseResult;
import top.huhuiyu.api.spring.base.PageBean;
import ${builderUtil.getSubPackage("dao")}.${builderUtil.getClassName(tableInfo)}DAO;
import ${builderUtil.getSubPackage("entity")}.${builderUtil.getClassName(tableInfo)};
import ${builderUtil.getSubPackage("message")}.${builderUtil.getClassName(tableInfo)}Message;
import ${builderUtil.getSubPackage("model")}.${builderUtil.getClassName(tableInfo)}Model;
import ${builderUtil.getSubPackage("service")}.${builderUtil.getClassName(tableInfo)}Service;

/**
 * ${builderUtil.getClassName(tableInfo)}的实现层
 * 
 * @author ${baseInfo.author}
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ${builderUtil.getClassName(tableInfo)}ServiceImpl implements ${builderUtil.getClassName(tableInfo)}Service {
  @Autowired
  private ${builderUtil.getClassName(tableInfo)}DAO ${builderUtil.getTableFieldName(tableInfo)}DAO;

  @Override
  public BaseResult<${builderUtil.getClassName(tableInfo)}Message> queryAll(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    PageBean page = model.getPage();
    PageHelper.startPage(page.getPageNumber(), page.getPageSize());
    List<${builderUtil.getClassName(tableInfo)}> list = ${builderUtil.getTableFieldName(tableInfo)}DAO.queryAll();
    PageInfo<?> pageInfo = new PageInfo<>(list);
    page.setPageInfo(pageInfo);
    BaseResult<${builderUtil.getClassName(tableInfo)}Message> message = new BaseResult<${builderUtil.getClassName(tableInfo)}Message>(new ${builderUtil.getClassName(tableInfo)}Message());
    message.setSuccessInfo("");
    message.getResultData().setPage(page);
    message.getResultData().setList(list);
    return message;
  }

  @Override
  public BaseResult<${builderUtil.getClassName(tableInfo)}Message> queryByKey(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    BaseResult<${builderUtil.getClassName(tableInfo)}Message> message = new BaseResult<${builderUtil.getClassName(tableInfo)}Message>(new ${builderUtil.getClassName(tableInfo)}Message());
    message.setSuccessInfo("");
    message.getResultData().${builderUtil.getTableSetter(tableInfo)}(${builderUtil.getTableFieldName(tableInfo)}DAO.queryByKey(model.${builderUtil.getTableGetter(tableInfo)}()));
    return message;
  }

  @Override
  public BaseResult<${builderUtil.getClassName(tableInfo)}Message> add(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    BaseResult<${builderUtil.getClassName(tableInfo)}Message> message = new BaseResult<${builderUtil.getClassName(tableInfo)}Message>(new ${builderUtil.getClassName(tableInfo)}Message());
    int result = ${builderUtil.getTableFieldName(tableInfo)}DAO.add(model.${builderUtil.getTableGetter(tableInfo)}());
    if (result == 1) {
      message.setSuccessInfo("添加数据成功");
    } else {
      message.setFailInfo("添加数据失败");
    }
    return message;
  }

  @Override
  public BaseResult<${builderUtil.getClassName(tableInfo)}Message> delete(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    BaseResult<${builderUtil.getClassName(tableInfo)}Message> message = new BaseResult<${builderUtil.getClassName(tableInfo)}Message>(new ${builderUtil.getClassName(tableInfo)}Message());
    int result = ${builderUtil.getTableFieldName(tableInfo)}DAO.delete(model.${builderUtil.getTableGetter(tableInfo)}());
    if (result == 1) {
      message.setSuccessInfo("删除数据成功");
    } else {
      message.setFailInfo("删除数据失败");
    }
    return message;
  }

  @Override
  public BaseResult<${builderUtil.getClassName(tableInfo)}Message> update(${builderUtil.getClassName(tableInfo)}Model model) throws Exception {
    BaseResult<${builderUtil.getClassName(tableInfo)}Message> message = new BaseResult<${builderUtil.getClassName(tableInfo)}Message>(new ${builderUtil.getClassName(tableInfo)}Message());
    int result = ${builderUtil.getTableFieldName(tableInfo)}DAO.update(model.${builderUtil.getTableGetter(tableInfo)}());
    if (result == 1) {
      message.setSuccessInfo("修改数据成功");
    } else {
      message.setFailInfo("修改数据失败");
    }
    return message;
  }
}