// buildscript是项目和项目子项目的公共配置
buildscript {
  repositories {
    // 使用本地仓库
    mavenLocal()
    //使用阿里的maven仓库（避免去国外的地址下载，可以加快下载速度）
    maven {url maveninfo_aliyun_url}
    // 自建私有仓库
    maven {url maveninfo_url}
    // 使用官方maven仓库
    mavenCentral()
  }
}

// 插件配置
plugins {
  // springboot插件
  id 'org.springframework.boot' version '2.5.2'
  // springboot依赖管理插件
  id 'io.spring.dependency-management' version '1.0.11.RELEASE'
  // java开发插件
  id 'java'
  id 'java-library'
   // war打包依赖
  id 'war'
  // eclipse开发插件（会自动配置eclipse）
  id 'eclipse'
}

// 代码编译等级
sourceCompatibility = java_compatibility
targetCompatibility = java_compatibility

// 源码和javadoc编码设置
[compileJava, compileTestJava, javadoc]*.options*.encoding = java_encoding

//项目版本号
version = project_version

//项目的maven仓库
repositories {
  // 使用本地仓库
  mavenLocal()
  //使用阿里的maven仓库（避免去国外的地址下载，可以加快下载速度）
  maven {url maveninfo_aliyun_url}
  // 自建私有仓库
  maven {url maveninfo_url}
  // 使用官方maven仓库
  mavenCentral()
}

//项目依赖的第三方库配置
dependencies {
  //springboot依赖
  implementation('org.springframework.boot:spring-boot-starter-web')
  //springboot开发工具，可以热部署代码（不要用于生成环境）
  implementation('org.springframework.boot:spring-boot-devtools')
  //springboot整合mybatis
  implementation('org.mybatis.spring.boot:mybatis-spring-boot-starter:2.2.0')
  // mysql jdbc驱动
  implementation('mysql:mysql-connector-java:8.0.12')
  // pagehelper的springboot依赖
  implementation('com.github.pagehelper:pagehelper-spring-boot-starter:1.3.1')
  // springboot的aop依赖
  implementation('org.springframework.boot:spring-boot-starter-aop')
  
  // swagger2依赖
  implementation('io.springfox:springfox-swagger2:2.9.2')
  // swagger2界面依赖
  // implementation('io.springfox:springfox-swagger-ui:2.9.2'
  // swagger-ui-layer界面依赖
  implementation('com.github.caspar-chen:swagger-ui-layer:1.1.3')
  // websocket
  implementation('org.springframework.boot:spring-boot-starter-websocket')
    
  // huhuiyu.api
  implementation('top.huhuiyu.api:huhuiyu.api.fileutils:' + fileutils_version)
  implementation('top.huhuiyu.api:huhuiyu.api.utils:' + utils_version)
  implementation('top.huhuiyu.api:huhuiyu.api.spring:' + spring_version)

  // 打包tomcat的war文件依赖
  providedCompile('org.springframework.boot:spring-boot-starter-tomcat')
  //springboot测试依赖
  testImplementation('org.springframework.boot:spring-boot-starter-test')
}

bootRun {
  sourceResources sourceSets.main
}