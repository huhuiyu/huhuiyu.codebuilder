server:
  port: 20000
  servlet:
    encoding:
      force: true
      charset: UTF-8
spring:
  jmx:
    default-domain: ${baseInfo.projectName}
  web: 
    resources:
      add-mappings: true
  mvc:
    throw-exception-if-no-handler-found: true
  jackson:
    default-property-inclusion: non-null
    serialization:
      write-dates-as-timestamps: true
  servlet:
    multipart:
      enabled: true
      file-size-threshold: 50MB
      max-file-size: 10MB
      max-request-size: 10MB
  datasource:
    driver-class-name: ${dataSourceInfo.driver}
    url: ${dataSourceInfo.url}
    username: ${dataSourceInfo.username}
    password: ${dataSourceInfo.password}
    hikari:
      connection-test-query: select 1
      max-lifetime: 60000
mybatis:
  config-location: classpath:mybatis-config.xml
pagehelper:
  reasonable: true