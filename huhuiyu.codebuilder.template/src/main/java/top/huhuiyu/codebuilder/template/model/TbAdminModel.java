package top.huhuiyu.codebuilder.template.model;

import io.swagger.annotations.ApiParam;
import top.huhuiyu.api.spring.base.PageBean;
import top.huhuiyu.codebuilder.template.base.MyBaseModel;
import top.huhuiyu.codebuilder.template.entity.TbAdmin;

/**
 * TbAdmin的Model
 * 
 * @author 胡辉煜
 */
public class TbAdminModel extends MyBaseModel {

  private static final long serialVersionUID = -3666182755635370634L;

  @ApiParam(hidden = true)
  private TbAdmin tbAdmin = new TbAdmin();
  @ApiParam(hidden = true)
  private PageBean page = new PageBean();

  public TbAdminModel() {
  }

  public TbAdmin getTbAdmin() {
    return tbAdmin;
  }

  public void setTbAdmin(TbAdmin tbAdmin) {
    this.tbAdmin = tbAdmin;
  }

  public PageBean getPage() {
    return page;
  }

  public void setPage(PageBean page) {
    this.page = page;
  }

  /*
   * 所有参数模板
   * @ApiImplicitParam(name = "tbAdmin.aid", value = "描述：aid", paramType = "query")
   * @ApiImplicitParam(name = "tbAdmin.username", value = "描述：username", paramType = "query")
   * @ApiImplicitParam(name = "tbAdmin.password", value = "描述：password", paramType = "query")
   * @ApiImplicitParam(name = "tbAdmin.salt", value = "描述：salt", paramType = "query")
   * @ApiImplicitParam(name = "tbAdmin.nickname", value = "描述：nickname", paramType = "query")
   * @ApiImplicitParam(name = "tbAdmin.role", value = "描述：role", paramType = "query")
   * @ApiImplicitParam(name = "tbAdmin.enable", value = "描述：enable", paramType = "query")
   * @ApiImplicitParam(name = "tbAdmin.lastupdate", value = "描述：lastupdate", paramType = "query")
   */
}
