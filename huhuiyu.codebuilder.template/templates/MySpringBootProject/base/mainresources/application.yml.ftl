server:
  port: 20000
spring:
  jackson:
    default-property-inclusion: non-null
    serialization:
      write-dates-as-timestamps: true
  servlet:
    multipart:
      max-file-size: 10MB
      max-request-size: 10MB
  http:
    encoding:
      force: true
      charset: UTF-8
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
swagger-enable: true