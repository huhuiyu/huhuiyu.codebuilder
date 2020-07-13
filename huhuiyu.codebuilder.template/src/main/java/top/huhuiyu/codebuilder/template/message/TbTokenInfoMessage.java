package top.huhuiyu.codebuilder.template.message;

import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import top.huhuiyu.api.spring.base.BaseEntity;
import top.huhuiyu.api.spring.base.PageBean;
import top.huhuiyu.codebuilder.template.entity.TbTokenInfo;

/**
 * TbTokenInfo应答对象
 * 
 * @author 胡辉煜
 */
@ApiModel(value = "TbTokenInfoMessage", description = "TbTokenInfoMessage")
public class TbTokenInfoMessage extends BaseEntity {

  private static final long serialVersionUID = 1972384632219100879L;

  @ApiModelProperty(value = "TbTokenInfo")
  private TbTokenInfo tbTokenInfo;
  @ApiModelProperty(value = "分页信息")
  private PageBean page;
  @ApiModelProperty(value = "查询结果")
  private List<TbTokenInfo> list;

  public TbTokenInfoMessage() {
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

  public List<TbTokenInfo> getList() {
    return list;
  }

  public void setList(List<TbTokenInfo> list) {
    this.list = list;
  }
}