package ${builderUtil.getSubPackage("message")};

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import top.huhuiyu.api.spring.base.BaseEntity;
import ${builderUtil.getSubPackage("entity")}.TbAdmin;

/**
 * 工具应答对象
 * 
 * @author ${baseInfo.author}
 */
@ApiModel(value = "UtilMessage", description = "工具应答信息")
public class UtilMessage extends BaseEntity {

  private static final long serialVersionUID = -1340107909583044408L;

  @ApiModelProperty(value = "登陆管理员信息")
  private TbAdmin loginInfo;

  public UtilMessage() {
  }

  public TbAdmin getLoginInfo() {
    return loginInfo;
  }

  public void setLoginInfo(TbAdmin loginInfo) {
    this.loginInfo = loginInfo;
  }

}