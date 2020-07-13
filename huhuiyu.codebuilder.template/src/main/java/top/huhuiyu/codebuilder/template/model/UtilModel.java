package top.huhuiyu.codebuilder.template.model;

import io.swagger.annotations.ApiParam;
import top.huhuiyu.codebuilder.template.base.MyBaseModel;
import top.huhuiyu.codebuilder.template.entity.TbAdmin;

/**
 * 工具model数据
 * 
 * @author 胡辉煜
 */
public class UtilModel extends MyBaseModel {
  private static final long serialVersionUID = -2171697600647197787L;
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