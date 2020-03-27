SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS daily;
DROP TABLE IF EXISTS in_user;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS week;




/* Create Tables */

-- 日报
CREATE TABLE daily
(
	id int(11) NOT NULL COMMENT '主键',
	user_id int(11) NOT NULL COMMENT '用户',
	title varchar(50) NOT NULL COMMENT '标题',
	task_info varchar(500) NOT NULL COMMENT '任务信息',
	task_finish varchar(500) NOT NULL COMMENT '任务完成',
	creat_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '日报';


-- 用户
CREATE TABLE in_user
(
	id int(11) NOT NULL COMMENT 'id',
	name varchar(20) NOT NULL COMMENT '名称',
	mobile varchar(50) NOT NULL COMMENT '手机号',
	password varchar(50) NOT NULL COMMENT '密码',
	create_time datetime NOT NULL COMMENT '创建时间',
	role_id int(5) NOT NULL COMMENT '角色',
	PRIMARY KEY (id)
) COMMENT = '用户';


-- 角色
CREATE TABLE role
(
	id int(5) NOT NULL COMMENT '主键',
	name varchar(20) NOT NULL COMMENT '名称',
	content varchar(50) NOT NULL COMMENT '内容',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '角色';


-- 周报
CREATE TABLE week
(
	id int(11) NOT NULL COMMENT '主键',
	user_id int(11) NOT NULL COMMENT '用户',
	title varchar(50) NOT NULL COMMENT '标题',
	task_info varchar(500) NOT NULL COMMENT '任务信息',
	task_finish varchar(500) NOT NULL COMMENT '任务完成',
	creat_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '周报';



