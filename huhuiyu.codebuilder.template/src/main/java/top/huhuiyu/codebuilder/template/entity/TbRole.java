package top.huhuiyu.codebuilder.template.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiParam;
import top.huhuiyu.api.spring.base.BaseEntity;

/**
 * tb_role表
 * 
 * @author 胡辉煜
 */
@ApiModel(value = "TbRole", description = "TbRole")
public class TbRole extends BaseEntity {

  private static final long serialVersionUID = 1488392073719532672L;

  @ApiModelProperty(value = "roleName")
  @ApiParam(hidden = true)
  private java.lang.String roleName;
  @ApiModelProperty(value = "roleGroup")
  @ApiParam(hidden = true)
  private java.lang.String roleGroup;
  @ApiModelProperty(value = "roleInfo")
  @ApiParam(hidden = true)
  private java.lang.String roleInfo;
  @ApiModelProperty(value = "enable")
  @ApiParam(hidden = true)
  private java.lang.String enable;

  public TbRole() {
  }

  public java.lang.String getRoleName() {
    return roleName;
  }

  public void setRoleName(java.lang.String roleName) {
    this.roleName = roleName;
  }

  public java.lang.String getRoleGroup() {
    return roleGroup;
  }

  public void setRoleGroup(java.lang.String roleGroup) {
    this.roleGroup = roleGroup;
  }

  public java.lang.String getRoleInfo() {
    return roleInfo;
  }

  public void setRoleInfo(java.lang.String roleInfo) {
    this.roleInfo = roleInfo;
  }

  public java.lang.String getEnable() {
    return enable;
  }

  public void setEnable(java.lang.String enable) {
    this.enable = enable;
  }

}