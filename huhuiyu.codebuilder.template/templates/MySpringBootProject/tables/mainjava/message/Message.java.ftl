package ${builderUtil.getSubPackage("message")};

import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import top.huhuiyu.api.spring.base.BaseEntity;
import top.huhuiyu.api.spring.base.PageBean;
import ${builderUtil.getSubPackage("entity")}.${builderUtil.getClassName(tableInfo)};

/**
 * ${builderUtil.getClassName(tableInfo)}应答对象
 * 
 * @author ${baseInfo.author}
 */
@ApiModel(value = "${builderUtil.getClassName(tableInfo)}Message", description = "${builderUtil.getClassName(tableInfo)}Message")
public class ${builderUtil.getClassName(tableInfo)}Message extends BaseEntity {

  private static final long serialVersionUID = ${builderUtil.serialVersionUid};

  @ApiModelProperty(value = "${builderUtil.getClassName(tableInfo)}")
  private ${builderUtil.getClassName(tableInfo)} ${builderUtil.getTableFieldName(tableInfo)};
  @ApiModelProperty(value = "分页信息")
  private PageBean page;
  @ApiModelProperty(value = "查询结果")
  private List<${builderUtil.getClassName(tableInfo)}> list;

  public ${builderUtil.getClassName(tableInfo)}Message() {
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

  public List<${builderUtil.getClassName(tableInfo)}> getList() {
    return list;
  }

  public void setList(List<${builderUtil.getClassName(tableInfo)}> list) {
    this.list = list;
  }
}