package ${builderUtil.getSubPackage("model")};

import io.swagger.annotations.ApiParam;
import top.huhuiyu.api.spring.base.PageBean;
import ${builderUtil.getSubPackage("base")}.MyBaseModel;
import ${builderUtil.getSubPackage("entity")}.${builderUtil.getClassName(tableInfo)};

/**
 * ${builderUtil.getClassName(tableInfo)}的Model
 * 
 * @author ${baseInfo.author}
 */
public class ${builderUtil.getClassName(tableInfo)}Model extends MyBaseModel {

  private static final long serialVersionUID = ${builderUtil.serialVersionUid};

  @ApiParam(hidden = true)
  private ${builderUtil.getClassName(tableInfo)} ${builderUtil.getTableFieldName(tableInfo)}=new ${builderUtil.getClassName(tableInfo)}();
  @ApiParam(hidden = true)
  private PageBean page=new PageBean();
  
  public ${builderUtil.getClassName(tableInfo)}Model() {
  }

  public ${builderUtil.getClassName(tableInfo)} ${builderUtil.getTableGetter(tableInfo)}() {
    return ${builderUtil.getTableFieldName(tableInfo)};
  }

  public void ${builderUtil.getTableSetter(tableInfo)}(${builderUtil.getClassName(tableInfo)} ${builderUtil.getTableFieldName(tableInfo)}) {
    this.${builderUtil.getTableFieldName(tableInfo)} = ${builderUtil.getTableFieldName(tableInfo)};
  }

  public PageBean getPage() {
    return page;
  }

  public void setPage(PageBean page) {
    this.page = page;
  }

  /*
   * 所有参数模板
   <#list tableInfo.columnInfos as column>
   * @ApiImplicitParam(name = "${builderUtil.getTableFieldName(tableInfo)}.${builderUtil.getColFieldName(column)}", value = "描述：${builderUtil.getColFieldName(column)}", paramType = "query")
   </#list>
   */
}
