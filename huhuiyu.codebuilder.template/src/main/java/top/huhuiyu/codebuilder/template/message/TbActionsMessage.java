package top.huhuiyu.codebuilder.template.message;

import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import top.huhuiyu.api.spring.base.BaseEntity;
import top.huhuiyu.api.spring.base.PageBean;
import top.huhuiyu.codebuilder.template.entity.TbActions;

/**
 * TbActions应答对象
 * 
 * @author 胡辉煜
 */
@ApiModel(value = "TbActionsMessage", description = "TbActionsMessage")
public class TbActionsMessage extends BaseEntity {

  private static final long serialVersionUID = 10507574179480516L;

  @ApiModelProperty(value = "TbActions")
  private TbActions tbActions;
  @ApiModelProperty(value = "分页信息")
  private PageBean page;
  @ApiModelProperty(value = "查询结果")
  private List<TbActions> list;

  public TbActionsMessage() {
  }

  public TbActions getTbActions() {
    return tbActions;
  }

  public void setTbActions(TbActions tbActions) {
    this.tbActions = tbActions;
  }

  public PageBean getPage() {
    return page;
  }

  public void setPage(PageBean page) {
    this.page = page;
  }

  public List<TbActions> getList() {
    return list;
  }

  public void setList(List<TbActions> list) {
    this.list = list;
  }
}