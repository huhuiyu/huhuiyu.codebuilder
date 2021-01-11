use code_build_demo;

/* 框架必要的基础功能表 */
create table tb_config
(
  cid integer auto_increment primary key not null comment '主键',
  config_key varchar(50) unique comment '配置键值',
  config_value varchar(2000) comment '配置值',
  lastupdate timestamp on update now() default now() not null comment '最后更新时间'
)comment '系统配置表';

/* token过期时间配置，值是分钟数 */
insert into tb_config(config_key,config_value) values('token_timeout','14400');
/* 图片校验码干扰线数量 */
insert into tb_config(config_key,config_value) values('image_code_amount',20);
/* 图片校验码长度 */
insert into tb_config(config_key,config_value) values('image_code_length',5);
/* 同一个ip申请新token的次数限制 */
insert into tb_config(config_key,config_value) values('ip_max_new_token_count',10);
/* ip超过token申请限制后停用时间（秒） */
insert into tb_config(config_key,config_value) values('ip_ban_timeount',600);

select cid,config_key,config_value,lastupdate from tb_config;

create table tb_token_info
(
  tiid integer auto_increment primary key not null comment '主键',
  token varchar(50) not null comment '令牌',
  info_key varchar(50) comment '令牌信息key值',
  info varchar(2000) comment '令牌信息值',
  lastupdate timestamp on update now() default now() not null comment '最后更新时间',
  constraint unique_tb_tokeninfo_token_info_key unique(token,info_key)
)comment 'token信息表';

select tiid,token,info_key,info,lastupdate from tb_token_info;

create table tb_role
(
  role_name varchar(50) primary key not null comment '主键，角色名称',
  role_group varchar(50) not null comment '角色组',
  role_info varchar(200) not null comment '角色描述',
  enable enum('y','n') default 'y' not null comment '是否启用'
)comment '角色信息表';

/* 管理员角色信息 */
insert into tb_role(role_name,role_group,role_info) values('admin','admin','可以管理全部信息的管理员');

select role_name,role_group,role_info,enable from tb_role;

create table tb_admin
(
  aid integer auto_increment primary key not null comment '主键',
  username varchar(20) unique not null comment '登录用户名',
  password varchar(50) not null comment '登录密码',
  salt varchar(20) not null comment '密码盐',
  nickname varchar(50) not null comment '昵称',
  role varchar(200) default '' not null comment '用户角色列表', 
  enable enum('y','n') default 'y' not null comment '是否启用',
  lastupdate timestamp on update now() default now() not null comment '最后更新时间'
)comment '管理员信息表';

/* 默认管理员数据,密码是admin_pwd */
insert into tb_admin(username,password,salt,nickname,role) values('admin','d48dc3be25a60dafc4db503fbc36d397','JX1XRO','内置管理员','admin');

select aid,username,password,salt,nickname,role,enable,lastupdate from tb_admin;

create table tb_actions
(
  aid integer auto_increment primary key comment '主键',
  url varchar(255) unique not null comment 'api的url地址',
  info varchar(200) not null comment 'api描述信息',
  role varchar(200) not null comment '可以访问api的角色列表'
)comment '托管的api地址信息表';

/* 管理员登陆功能测试权限数据 */
insert into tb_actions(url,info,role) values('/test/adminLogin','测试管理员登陆功能','admin');

select aid,url,info,role from tb_actions;
