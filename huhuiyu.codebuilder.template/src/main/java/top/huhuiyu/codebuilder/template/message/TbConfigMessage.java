package top.huhuiyu.codebuilder.template.message;

import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import top.huhuiyu.api.spring.base.BaseEntity;
import top.huhuiyu.api.spring.base.PageBean;
import top.huhuiyu.codebuilder.template.entity.TbConfig;

/**
 * TbConfig应答对象
 * 
 * @author 胡辉煜
 */
@ApiModel(value = "TbConfigMessage", description = "TbConfigMessage")
public class TbConfigMessage extends BaseEntity {

  private static final long serialVersionUID = 7003268776726267704L;

  @ApiModelProperty(value = "TbConfig")
  private TbConfig tbConfig;
  @ApiModelProperty(value = "分页信息")
  private PageBean page;
  @ApiModelProperty(value = "查询结果")
  private List<TbConfig> list;

  public TbConfigMessage() {
  }

  public TbConfig getTbConfig() {
    return tbConfig;
  }

  public void setTbConfig(TbConfig tbConfig) {
    this.tbConfig = tbConfig;
  }

  public PageBean getPage() {
    return page;
  }

  public void setPage(PageBean page) {
    this.page = page;
  }

  public List<TbConfig> getList() {
    return list;
  }

  public void setList(List<TbConfig> list) {
    this.list = list;
  }
}