SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS task_idfa;
DROP TABLE IF EXISTS task_income;
DROP TABLE IF EXISTS user_order;
DROP TABLE IF EXISTS wall_task;
DROP TABLE IF EXISTS wall_user;




/* Create Tables */

-- 消息数据
CREATE TABLE message
(
	id varchar(50) NOT NULL COMMENT '主键',
	content varchar(500) NOT NULL COMMENT '内容',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '消息数据';


-- 任务去重
CREATE TABLE task_idfa
(
	id varchar(50) NOT NULL COMMENT '主键',
	task_id varchar(50) NOT NULL COMMENT '任务Id',
	idfa varchar(50) NOT NULL COMMENT 'idfa标识',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '任务去重';


-- task_income
CREATE TABLE task_income
(
	id varchar(50) NOT NULL COMMENT '主键',
	user_id varchar(50) NOT NULL COMMENT '用户Id',
	task_id decimal(10,4) NOT NULL COMMENT '任务Id',
	task_money decimal(10,4) NOT NULL COMMENT '任务价格',
	create_time datetime NOT NULL COMMENT '创建时间'
) COMMENT = 'task_income';


-- 体现记录
CREATE TABLE user_order
(
	id varchar(50) NOT NULL COMMENT '主键',
	user_id varchar(50) NOT NULL COMMENT '用户Id',
	user_name varchar(50) NOT NULL COMMENT '用户名称',
	price decimal(10,4) NOT NULL COMMENT '价格',
	status int(5) NOT NULL COMMENT '状态(1011 -成功 1010-失败)',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '体现记录';


-- 任务
CREATE TABLE wall_task
(
	id varchar(50) NOT NULL COMMENT '任务Id',
	icon varchar(100) NOT NULL COMMENT '图片',
	name varchar(50) NOT NULL COMMENT '名称',
	price decimal(10,4) NOT NULL COMMENT '价格',
	type int(5) NOT NULL COMMENT '类型(1001-快速任务，1002-收徒任务)',
	end_time datetime NOT NULL COMMENT '结束时间',
	start_time datetime NOT NULL COMMENT '开始时间',
	crate_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '任务';


-- 用户信息
CREATE TABLE wall_user
(
	id varchar(50) NOT NULL COMMENT '用户Id',
	name varchar(50) NOT NULL COMMENT '名称',
	idfa varchar(100) NOT NULL COMMENT 'ios标识',
	image varchar(50) NOT NULL COMMENT '图片',
	phone varchar(50) NOT NULL COMMENT '手机号',
	parent_id varchar(50) NOT NULL COMMENT '举荐人',
	user_card varchar(100) NOT NULL COMMENT '用户身份证',
	user_money decimal(10,4) NOT NULL COMMENT '用户金额',
	total_money decimal(10,4) NOT NULL COMMENT '用户总金额',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '用户信息';



