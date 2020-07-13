package ${builderUtil.getSubPackage("model")};

import io.swagger.annotations.ApiParam;
import ${builderUtil.getSubPackage("base")}.MyBaseModel;
import ${builderUtil.getSubPackage("entity")}.TbAdmin;

/**
 * 工具model数据
 * 
 * @author ${baseInfo.author}
 */
public class UtilModel extends MyBaseModel {
  private static final long serialVersionUID = ${builderUtil.serialVersionUid};
  @ApiParam(hidden = true)
  private TbAdmin tbAdmin = new TbAdmin();
  @ApiParam(hidden = true)
  private String imageCode;

  public UtilModel() {
  }

  public TbAdmin getTbAdmin() {
    return tbAdmin;
  }

  public void setTbAdmin(TbAdmin tbAdmin) {
    this.tbAdmin = tbAdmin;
  }

  public String getImageCode() {
    return imageCode;
  }

  public void setImageCode(String imageCode) {
    this.imageCode = imageCode;
  }

}