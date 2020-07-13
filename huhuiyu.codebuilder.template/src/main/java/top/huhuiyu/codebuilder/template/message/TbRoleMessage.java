package top.huhuiyu.codebuilder.template.message;

import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import top.huhuiyu.api.spring.base.BaseEntity;
import top.huhuiyu.api.spring.base.PageBean;
import top.huhuiyu.codebuilder.template.entity.TbRole;

/**
 * TbRole应答对象
 * 
 * @author 胡辉煜
 */
@ApiModel(value = "TbRoleMessage", description = "TbRoleMessage")
public class TbRoleMessage extends BaseEntity {

  private static final long serialVersionUID = 282452315770052499L;

  @ApiModelProperty(value = "TbRole")
  private TbRole tbRole;
  @ApiModelProperty(value = "分页信息")
  private PageBean page;
  @ApiModelProperty(value = "查询结果")
  private List<TbRole> list;

  public TbRoleMessage() {
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

  public List<TbRole> getList() {
    return list;
  }

  public void setList(List<TbRole> list) {
    this.list = list;
  }
}