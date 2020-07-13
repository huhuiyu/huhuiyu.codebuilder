package top.huhuiyu.codebuilder.template.model;

import io.swagger.annotations.ApiParam;
import top.huhuiyu.api.spring.base.PageBean;
import top.huhuiyu.codebuilder.template.base.MyBaseModel;
import top.huhuiyu.codebuilder.template.entity.TbRole;

/**
 * TbRole的Model
 * 
 * @author 胡辉煜
 */
public class TbRoleModel extends MyBaseModel {

  private static final long serialVersionUID = 8043499231854885433L;

  @ApiParam(hidden = true)
  private TbRole tbRole = new TbRole();
  @ApiParam(hidden = true)
  private PageBean page = new PageBean();

  public TbRoleModel() {
  }

  public TbRole getTbRole() {
    return tbRole;
  }

  public void setTbRole(TbRole tbRole) {
    this.tbRole = tbRole;
  }

  public PageBean getPage() {
    return page;
  }

  public void setPage(PageBean page) {
    this.page = page;
  }

  /*
   * 所有参数模板
   * @ApiImplicitParam(name = "tbRole.roleName", value = "描述：roleName", paramType = "query")
   * @ApiImplicitParam(name = "tbRole.roleGroup", value = "描述：roleGroup", paramType = "query")
   * @ApiImplicitParam(name = "tbRole.roleInfo", value = "描述：roleInfo", paramType = "query")
   * @ApiImplicitParam(name = "tbRole.enable", value = "描述：enable", paramType = "query")
   */
}
