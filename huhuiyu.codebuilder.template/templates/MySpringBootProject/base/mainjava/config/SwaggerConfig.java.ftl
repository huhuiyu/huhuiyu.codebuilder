package ${builderUtil.getSubPackage("config")};

import java.util.ArrayList;
import java.util.List;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import com.google.common.base.Predicates;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
import ${builderUtil.getSubPackage("aop")}.ControllerToken;

/**
 * swagger配置
 * 
 * @author ${baseInfo.author}
 */
@Configuration
@EnableSwagger2
@ComponentScan(basePackages = { "${builderUtil.getSubPackage("")}" })
@ConditionalOnProperty(value = { "spring.web.resources.add-mappings" }, havingValue = "true")
public class SwaggerConfig {

  @Bean
  public Docket createRestApi() {
    ParameterBuilder pb   = new ParameterBuilder();
    List<Parameter>  list = new ArrayList<>();
    pb.name(ControllerToken.TOKEN_KEY).description("用户认证令牌").modelRef(new ModelRef("string")).parameterType("header").required(true).build();
    list.add(pb.build());
    return new Docket(DocumentationType.SWAGGER_2).apiInfo(apiInfo()).select().apis(RequestHandlerSelectors.any()).paths(Predicates.not(PathSelectors.regex("/error.*"))).build().globalOperationParameters(list);
  }

  private ApiInfo apiInfo() {
    return new ApiInfoBuilder().title("${baseInfo.projectName}").description("${baseInfo.projectName}").version("1.0.0").build();
  }

}