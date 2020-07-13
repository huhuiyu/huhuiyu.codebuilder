package ${builderUtil.getSubPackage("")};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * SpringBoot启动类
 * 
 * @author ${baseInfo.author}
 */
@SpringBootApplication
@ComponentScan(basePackages = { "${builderUtil.getSubPackage("")}", "top.huhuiyu.api.spring.converter" })
@EnableScheduling
public class Application {
  
  public static void main(String[] args) {
    SpringApplication.run(Application.class, args);
  }

}