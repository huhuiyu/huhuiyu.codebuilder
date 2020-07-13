package top.huhuiyu.codebuilder.template.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiParam;
import top.huhuiyu.api.spring.base.BaseEntity;

/**
 * tb_admin表
 * 
 * @author 胡辉煜
 */
@ApiModel(value = "TbAdmin", description = "TbAdmin")
public class TbAdmin extends BaseEntity {

  private static final long serialVersionUID = -7443952036572742254L;

  @ApiModelProperty(value = "aid")
  @ApiParam(hidden = true)
  private java.lang.Integer aid;
  @ApiModelProperty(value = "username")
  @ApiParam(hidden = true)
  private java.lang.String username;
  @ApiModelProperty(value = "password")
  @ApiParam(hidden = true)
  private java.lang.String password;
  @ApiModelProperty(value = "salt")
  @ApiParam(hidden = true)
  private java.lang.String salt;
  @ApiModelProperty(value = "nickname")
  @ApiParam(hidden = true)
  private java.lang.String nickname;
  @ApiModelProperty(value = "role")
  @ApiParam(hidden = true)
  private java.lang.String role;
  @ApiModelProperty(value = "enable")
  @ApiParam(hidden = true)
  private java.lang.String enable;
  @ApiModelProperty(value = "lastupdate")
  @ApiParam(hidden = true)
  private java.util.Date lastupdate;

  public TbAdmin() {
  }

  public java.lang.Integer getAid() {
    return aid;
  }

  public void setAid(java.lang.Integer aid) {
    this.aid = aid;
  }

  public java.lang.String getUsername() {
    return username;
  }

  public void setUsername(java.lang.String username) {
    this.username = username;
  }

  public java.lang.String getPassword() {
    return password;
  }

  public void setPassword(java.lang.String password) {
    this.password = password;
  }

  public java.lang.String getSalt() {
    return salt;
  }

  public void setSalt(java.lang.String salt) {
    this.salt = salt;
  }

  public java.lang.String getNickname() {
    return nickname;
  }

  public void setNickname(java.lang.String nickname) {
    this.nickname = nickname;
  }

  public java.lang.String getRole() {
    return role;
  }

  public void setRole(java.lang.String role) {
    this.role = role;
  }

  public java.lang.String getEnable() {
    return enable;
  }

  public void setEnable(java.lang.String enable) {
    this.enable = enable;
  }

  public java.util.Date getLastupdate() {
    return lastupdate;
  }

  public void setLastupdate(java.util.Date lastupdate) {
    this.lastupdate = lastupdate;
  }

}