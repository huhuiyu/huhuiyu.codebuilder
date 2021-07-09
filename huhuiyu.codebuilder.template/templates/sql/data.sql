/*
  用户相关脚本
  CREATE USER 'test'@'%' IDENTIFIED BY 'User4-test';
  ALTER USER 'test'@'%' IDENTIFIED BY 'User4-test';
  GRANT ALL ON code_build_demo.* TO 'test'@'%';
  FLUSH PRIVILEGES;
*/
use information_schema; 
drop database if exists code_build_demo; 
create database code_build_demo default charset utf8mb4 collate utf8mb4_general_ci; 
use code_build_demo;