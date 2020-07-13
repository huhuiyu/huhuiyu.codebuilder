package top.huhuiyu.codebuilder.template.model;

import io.swagger.annotations.ApiParam;
import top.huhuiyu.api.spring.base.PageBean;
import top.huhuiyu.codebuilder.template.base.MyBaseModel;
import top.huhuiyu.codebuilder.template.entity.TbTokenInfo;

/**
 * TbTokenInfo的Model
 * 
 * @author 胡辉煜
 */
public class TbTokenInfoModel extends MyBaseModel {

  private static final long serialVersionUID = -8266182062844479974L;

  @ApiParam(hidden = true)
  private TbTokenInfo tbTokenInfo = new TbTokenInfo();
  @ApiParam(hidden = true)
  private PageBean page = new PageBean();

  public TbTokenInfoModel() {
  }

  public TbTokenInfo getTbTokenInfo() {
    return tbTokenInfo;
  }

  public void setTbTokenInfo(TbTokenInfo tbTokenInfo) {
    this.tbTokenInfo = tbTokenInfo;
  }

  public PageBean getPage() {
    return page;
  }

  public void setPage(PageBean page) {
    this.page = page;
  }

  /*
   * 所有参数模板
   * @ApiImplicitParam(name = "tbTokenInfo.tiid", value = "描述：tiid", paramType = "query")
   * @ApiImplicitParam(name = "tbTokenInfo.token", value = "描述：token", paramType = "query")
   * @ApiImplicitParam(name = "tbTokenInfo.infoKey", value = "描述：infoKey", paramType = "query")
   * @ApiImplicitParam(name = "tbTokenInfo.info", value = "描述：info", paramType = "query")
   * @ApiImplicitParam(name = "tbTokenInfo.lastupdate", value = "描述：lastupdate", paramType = "query")
   */
}
