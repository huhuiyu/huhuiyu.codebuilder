package ${builderUtil.getSubPackage("entity")};

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiParam;
import top.huhuiyu.api.spring.base.BaseEntity;

/**
 * ${tableInfo.name}表
 * 
 * @author ${baseInfo.author}
 */
@ApiModel(value = "${builderUtil.getClassName(tableInfo)}", description = "${builderUtil.getClassName(tableInfo)}")
public class ${builderUtil.getClassName(tableInfo)} extends BaseEntity {

  private static final long serialVersionUID = ${builderUtil.serialVersionUid};
  
<#list tableInfo.columnInfos as column>
  @ApiModelProperty(value = "${builderUtil.getColFieldName(column)}")
  @ApiParam(hidden = true)
  private ${builderUtil.getColType(column)} ${builderUtil.getColFieldName(column)};
</#list>

  public ${builderUtil.getClassName(tableInfo)}() {
  }

<#list tableInfo.columnInfos as column>
  public ${builderUtil.getColType(column)} ${builderUtil.getColGetter(column)}() {
    return ${builderUtil.getColFieldName(column)};
  }

  public void ${builderUtil.getColSetter(column)}(${builderUtil.getColType(column)} ${builderUtil.getColFieldName(column)}) {
    this.${builderUtil.getColFieldName(column)} = ${builderUtil.getColFieldName(column)};
  }

</#list>
}