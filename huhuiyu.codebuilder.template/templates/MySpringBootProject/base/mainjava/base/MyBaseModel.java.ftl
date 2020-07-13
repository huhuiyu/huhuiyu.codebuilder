package ${builderUtil.getSubPackage("base")};

import io.swagger.annotations.ApiParam;
import top.huhuiyu.api.spring.base.BaseModel;
import ${builderUtil.getSubPackage("entity")}.TbAdmin;
import ${builderUtil.getSubPackage("entity")}.TbTokenInfo;

/**
 * model层基类
 * 
 * @author ${baseInfo.author}
 *
 */
public class MyBaseModel extends BaseModel {

  private static final long serialVersionUID = ${builderUtil.serialVersionUid};
  @ApiParam(hidden = true)
  private TbAdmin loginAdmin;

  public MyBaseModel() {
  }

  /**
   * 获取tokeninfo的委托方法
   * 
   * @return TbTokenInfo信息
   */
  public TbTokenInfo makeTbTokenInfo() {
    TbTokenInfo tokenInfo = new TbTokenInfo();
    tokenInfo.setToken(getToken());
    return tokenInfo;
  }

  public TbAdmin getLoginAdmin() {
    return loginAdmin;
  }

  public void setLoginAdmin(TbAdmin loginAdmin) {
    this.loginAdmin = loginAdmin;
  }
}