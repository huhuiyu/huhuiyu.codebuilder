package top.huhuiyu.codebuilder.template.model;

import io.swagger.annotations.ApiParam;
import top.huhuiyu.codebuilder.template.base.MyBaseModel;

/**
 * 首页model数据
 * 
 * @author 胡辉煜
 */
public class IndexModel extends MyBaseModel {

  private static final long serialVersionUID = -8686378451674856049L;
  @ApiParam(hidden = true)
  private String echo;

  public IndexModel() {
  }

  public String getEcho() {
    return echo;
  }

  public void setEcho(String echo) {
    this.echo = echo;
  }

}