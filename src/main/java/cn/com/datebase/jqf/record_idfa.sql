SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS app_quick_base;
DROP TABLE IF EXISTS channel_contact;
DROP TABLE IF EXISTS channel_idfa_ip;
DROP TABLE IF EXISTS channel_idfa_valid;
DROP TABLE IF EXISTS channel_mail;
DROP TABLE IF EXISTS quick_channel;
DROP TABLE IF EXISTS quick_task_base;
DROP TABLE IF EXISTS record_history;
DROP TABLE IF EXISTS sys_user_channel;
DROP TABLE IF EXISTS task_verify_idfa;




/* Create Tables */

-- 快速任务返回
CREATE TABLE app_quick_base
(
	id varchar(50) NOT NULL COMMENT '主键',
	app_click_num varchar(20) NOT NULL COMMENT '任务表',
	app_click_id int(11) NOT NULL COMMENT '任务表Id',
	idfa varchar(100) NOT NULL COMMENT 'idfa',
	crate_time datetime NOT NULL COMMENT '创建时间',
	udid varchar(50) NOT NULL COMMENT 'udid',
	PRIMARY KEY (id)
) COMMENT = '快速任务返回';


-- 渠道联系人
CREATE TABLE channel_contact
(
	id int(11) NOT NULL COMMENT '主键',
	channel_id int(11) NOT NULL COMMENT '渠道Id',
	channel_name varchar(20) NOT NULL COMMENT '渠道名称',
	mailbox varchar(50) NOT NULL COMMENT '邮箱',
	name varchar(50) NOT NULL COMMENT '姓名',
	company_name varchar(50) NOT NULL COMMENT '公司名称',
	company_addr varchar(50) NOT NULL COMMENT '公司地址',
	type int(4) NOT NULL COMMENT '1001-上游,1010-下游',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '渠道联系人';


-- idfa与ip检测
CREATE TABLE channel_idfa_ip
(
	id int(11) NOT NULL COMMENT '主键',
	idfa varchar(50) NOT NULL COMMENT 'idfa',
	ip varchar(50) NOT NULL COMMENT 'ip',
	score int(3) NOT NULL COMMENT '80以上异常，80以下正常',
	resp varchar(255) NOT NULL COMMENT '响应数据',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = 'idfa与ip检测';


-- 进行idfa校验
CREATE TABLE channel_idfa_valid
(
	id int(11) NOT NULL COMMENT '主键',
	idfa varchar(50) NOT NULL COMMENT 'idfa',
	err int(3) NOT NULL COMMENT '0 正常,1 参数错误,2 非法 客户,6 服务器异常',
	stat int(3) NOT NULL COMMENT '0 是无效，1 是有效，2 是 首次出现 ',
	resp varchar(100) NOT NULL COMMENT '返回参数',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '进行idfa校验';


-- 渠道邮箱
CREATE TABLE channel_mail
(
	id int(11) NOT NULL COMMENT '主键',
	user_id int(11) NOT NULL COMMENT '用户id',
	channel_name varchar(50) NOT NULL COMMENT '渠道名称',
	title varchar(50) NOT NULL COMMENT '标题',
	send_mailbox varchar(50) NOT NULL COMMENT '发送邮箱',
	receive_mailbox varchar(200) NOT NULL COMMENT '接收邮箱',
	content varchar(500) NOT NULL COMMENT '内容',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '渠道邮箱';


-- 渠道排重
CREATE TABLE quick_channel
(
	id int(11) NOT NULL COMMENT '主键',
	app_id int(11) NOT NULL COMMENT '应用Id',
	down_id int(11) NOT NULL COMMENT '下游渠道id',
	up_id int(11) NOT NULL COMMENT '上游渠道Id',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '渠道排重';


-- 快速任务记录
CREATE TABLE quick_task_base
(
	id int(20) NOT NULL COMMENT '主键',
	task_id int(20) NOT NULL COMMENT '任务Id',
	idfa varchar(100) NOT NULL COMMENT 'idfa',
	status int(4) NOT NULL COMMENT '状态(1001 -通知)',
	ip varchar(50) NOT NULL COMMENT 'ip',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '快速任务记录';


-- 记录访问历史
CREATE TABLE record_history
(
	record_id int NOT NULL COMMENT '记录Id',
	task_id int(11) NOT NULL COMMENT '任务Id',
	down_channel_id int(11) NOT NULL COMMENT '下游渠道Id',
	app_id int(11) NOT NULL COMMENT '应用Id',
	idfa varchar(100) NOT NULL COMMENT 'idfa地址',
	ip varchar(100) NOT NULL COMMENT '请求Ip地址',
	remarks varchar(500) NOT NULL COMMENT '备注',
	status int(4) NOT NULL COMMENT '0-失败，1-成功',
	task_count int(11) NOT NULL COMMENT '任务累计',
	down_count int(11) NOT NULL COMMENT '渠道累计',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (record_id)
) COMMENT = '记录访问历史';


-- 用户渠道控制
CREATE TABLE sys_user_channel
(
	id int(11) NOT NULL COMMENT '主键',
	user_id int(11) NOT NULL COMMENT '用户Id',
	user_name varchar(100) NOT NULL COMMENT '用户名称',
	channel_id int(11) NOT NULL COMMENT '渠道Id',
	channel_name varchar(100) NOT NULL COMMENT '渠道名称',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '用户渠道控制';


-- 任务验证
CREATE TABLE task_verify_idfa
(
	id int(11) NOT NULL COMMENT '主键',
	down_channel_id int(11) NOT NULL COMMENT '下游渠道id',
	task_id int(11) NOT NULL COMMENT '任务Id',
	task_count int(11) NOT NULL COMMENT '总数',
	pass_count int(11) NOT NULL COMMENT '通过总数',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '任务验证';



