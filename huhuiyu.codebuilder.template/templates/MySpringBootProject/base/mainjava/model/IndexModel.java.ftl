package ${builderUtil.getSubPackage("model")};

import io.swagger.annotations.ApiParam;
import ${builderUtil.getSubPackage("base")}.MyBaseModel;

/**
 * 首页model数据
 * 
 * @author ${baseInfo.author}
 */
public class IndexModel extends MyBaseModel {

  private static final long serialVersionUID = ${builderUtil.serialVersionUid};
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