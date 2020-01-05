SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS im_advert;
DROP TABLE IF EXISTS im_consult;
DROP TABLE IF EXISTS im_consult_info;
DROP TABLE IF EXISTS im_data_source;
DROP TABLE IF EXISTS im_guestbook;
DROP TABLE IF EXISTS im_menu;
DROP TABLE IF EXISTS im_resource;
DROP TABLE IF EXISTS im_role;
DROP TABLE IF EXISTS im_role_menu;
DROP TABLE IF EXISTS im_role_resource;
DROP TABLE IF EXISTS im_tag;
DROP TABLE IF EXISTS im_user;




/* Create Tables */

-- 广告信息
CREATE TABLE im_advert
(
	id varchar(50) NOT NULL COMMENT '主键',
	code int(11) NOT NULL COMMENT '编号',
	image_url varchar(50) NOT NULL COMMENT '广告图片',
	jump_url varchar(50) NOT NULL COMMENT '跳转url',
	show_site int(5) NOT NULL COMMENT '展示位置(1210-首页1,1211-首页2,1212-咨询列表.1213-文章详情)',
	open_mode int(5) NOT NULL COMMENT '打开方式(1220-新建,1221-本页)',
	status int(5) NOT NULL COMMENT '状态(1003-开启,1030-关闭)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '删除标识(1001-未删除,1010-删除)',
	PRIMARY KEY (id)
) COMMENT = '广告信息';


-- 咨询数据
CREATE TABLE im_consult
(
	id varchar(50) NOT NULL COMMENT '主键',
	code int(11) NOT NULL COMMENT '编号',
	title varchar(100) NOT NULL COMMENT '标题',
	author varchar(50) NOT NULL COMMENT '作者',
	im_tag_id varchar(50) NOT NULL COMMENT '标签Id',
	image_url varchar(100) NOT NULL COMMENT '封面图片',
	type int(5) NOT NULL COMMENT '类型(1120-头条咨询,1121-ASO咨询,1122-运营咨询)',
	source_url varchar(50) NOT NULL COMMENT '来源地址',
	source_time datetime NOT NULL COMMENT '来源时间',
	read_quantity int(11) NOT NULL COMMENT '阅读量',
	status int(5) NOT NULL COMMENT '状态(1003-开启,1030-关闭)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '删除标识(1001-未删除,1010-删除)',
	PRIMARY KEY (id)
) COMMENT = '咨询数据';


-- 咨询数据扩展包
CREATE TABLE im_consult_info
(
	im_consult_id varchar(50) NOT NULL COMMENT '主键',
	content varchar(1000) NOT NULL COMMENT '内容',
	brief_info varchar(50) NOT NULL COMMENT '摘要',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (im_consult_id)
) COMMENT = '咨询数据扩展包';


-- 数据源
CREATE TABLE im_data_source
(
	id varchar(50) NOT NULL COMMENT '主键',
	code int(11) NOT NULL COMMENT '编号',
	name varchar(50) NOT NULL COMMENT '名称',
	url varchar(50) NOT NULL COMMENT 'url',
	data varchar(20) NOT NULL COMMENT '时间',
	type int(5) NOT NULL COMMENT '类型(1120-头条咨询,1121-ASO咨询,1122-运营咨询)',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '数据源';


-- 留言板
CREATE TABLE im_guestbook
(
	id varchar(50) NOT NULL COMMENT '主键',
	code int(11) NOT NULL COMMENT '序号',
	phone varchar(50) NOT NULL COMMENT '手机号',
	content varchar(500) NOT NULL COMMENT '留言信息',
	crate_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '留言板';


-- 菜单
CREATE TABLE im_menu
(
	id varchar(25) NOT NULL COMMENT '主键',
	name varchar(50) NOT NULL COMMENT '名称',
	url varchar(50) NOT NULL COMMENT '对应的路径',
	tag int(5) NOT NULL COMMENT '标识',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '菜单';


-- 子菜单
CREATE TABLE im_resource
(
	id varchar(50) NOT NULL COMMENT '主键',
	im_menu_id varchar(25) NOT NULL COMMENT '主菜单Id',
	name varchar(50) NOT NULL COMMENT '名称',
	url varchar(50) NOT NULL COMMENT '访问路径',
	tag int(5) NOT NULL COMMENT '标识',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '子菜单';


-- 用户角色
CREATE TABLE im_role
(
	id varchar(50) NOT NULL COMMENT '主键',
	name varchar(50) NOT NULL COMMENT '角色名称',
	code varchar(50) NOT NULL COMMENT '角色序号',
	status int(5) NOT NULL COMMENT '状态(1003-开启,1030-关闭)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '删除标识(1001-未删除,1010-删除)',
	PRIMARY KEY (id)
) COMMENT = '用户角色';


-- 角色菜单
CREATE TABLE im_role_menu
(
	id varchar(50) NOT NULL COMMENT '主键',
	im_role_id varchar(50) NOT NULL COMMENT '角色id',
	im_menu_id varchar(25) NOT NULL COMMENT '菜单Id',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '角色菜单';


-- 角色子菜单
CREATE TABLE im_role_resource
(
	id varchar(50) NOT NULL COMMENT '主键',
	im_role_id varchar(50) NOT NULL COMMENT '角色Id',
	im_resource_id varchar(50) NOT NULL COMMENT '子菜单Id',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '角色子菜单';


-- 标签
CREATE TABLE im_tag
(
	id varchar(50) NOT NULL COMMENT '主键',
	code int(5) NOT NULL COMMENT '标签序号',
	name varchar(50) NOT NULL COMMENT '名称',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '标签';


-- 咨询用户
CREATE TABLE im_user
(
	id varchar(50) NOT NULL COMMENT '主键',
	code int(11) NOT NULL COMMENT '编号',
	name varchar(50) NOT NULL COMMENT '姓名',
	mailbox varchar(100) NOT NULL COMMENT '邮箱',
	phone varchar(50) NOT NULL COMMENT '手机号',
	password varchar(50) NOT NULL COMMENT '密码',
	im_role_id varchar(50) NOT NULL COMMENT '角色id',
	status int(5) NOT NULL COMMENT '状态(1003-开启,1030-关闭)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '删除标识(1001-未删除,1010-删除)',
	PRIMARY KEY (id)
) COMMENT = '咨询用户';



