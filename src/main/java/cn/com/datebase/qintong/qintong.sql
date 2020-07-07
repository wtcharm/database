SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS qt_consumer;
DROP TABLE IF EXISTS qt_consumer_income;
DROP TABLE IF EXISTS qt_consumer_task;
DROP TABLE IF EXISTS qt_manage;
DROP TABLE IF EXISTS qt_role;
DROP TABLE IF EXISTS qt_task;
DROP TABLE IF EXISTS qt_task_click;
DROP TABLE IF EXISTS qt_task_info;
DROP TABLE IF EXISTS qt_up_app;
DROP TABLE IF EXISTS qt_up_channel;
DROP TABLE IF EXISTS qt_user_app_idfa;




/* Create Tables */

-- 用户信息表
CREATE TABLE qt_consumer
(
	consumer_id int(11) NOT NULL COMMENT '用户Id',
	consumer_phone varchar(50) NOT NULL COMMENT '用户手机号',
	consumer_name varchar(50) NOT NULL COMMENT '名称',
	openid varchar(50) NOT NULL COMMENT '微信认证个人Id',
	parent_consumer_id int(11) NOT NULL COMMENT '父级用户Id',
	income_money decimal(10,4) NOT NULL COMMENT '徒弟收益',
	total_money decimal(10,4) NOT NULL COMMENT '累计金额',
	residue_money decimal(10,4) NOT NULL COMMENT '余额',
	status int(5) NOT NULL COMMENT '状态(1101-正常,1102-异常,1103-冻结)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '1001-不删除,1010-删除',
	PRIMARY KEY (consumer_id)
) COMMENT = '用户信息表';


-- 用户收益记录
CREATE TABLE qt_consumer_income
(
	income_id int(11) NOT NULL COMMENT '收益Id',
	consumer_id int(11) NOT NULL COMMENT '用户Id',
	app_id int(11) NOT NULL COMMENT '产品Id',
	app_name varchar(50) NOT NULL COMMENT '应用名称',
	income_money decimal(10,4) NOT NULL COMMENT '收益金额',
	deposit_money decimal(10,4) NOT NULL COMMENT '提现金额',
	income_type int(5) NOT NULL COMMENT '收益来源(注册-1120,任务-1121,1122-微付,1123-宝付)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '1001-不删除,1010-删除',
	PRIMARY KEY (income_id)
) COMMENT = '用户收益记录';


-- 用户领取任务
CREATE TABLE qt_consumer_task
(
	id int(11) NOT NULL COMMENT '主键',
	consumer_id int(11) NOT NULL COMMENT '用户Id',
	qt_task_id int(11) NOT NULL COMMENT '任务主键',
	qt_task_info_id int(11) NOT NULL COMMENT '任务关键词主键',
	status int(5) NOT NULL COMMENT '状态(2110-领取,2111-完成,2112-取消)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (id)
) COMMENT = '用户领取任务';


-- 管理员
CREATE TABLE qt_manage
(
	manage_id int(11) NOT NULL COMMENT '主键',
	manage_name varchar(20) NOT NULL COMMENT '名称',
	manage_phone varchar(20) NOT NULL COMMENT '手机号',
	manage_mail varchar(50) NOT NULL COMMENT '邮箱',
	manage_password varchar(50) NOT NULL COMMENT '密码',
	role_id int(11) NOT NULL COMMENT '角色Id',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '1001-不删除,1010-删除',
	PRIMARY KEY (manage_id)
) COMMENT = '管理员';


-- 用户角色
CREATE TABLE qt_role
(
	role_id int(11) NOT NULL COMMENT '角色Id',
	role_name varchar(50) NOT NULL COMMENT '角色名称',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '1001-不删除,1010-删除'
) COMMENT = '用户角色';


-- 任务表
CREATE TABLE qt_task
(
	qt_task_id int(11) NOT NULL COMMENT '任务主键',
	app_id int(11) NOT NULL COMMENT '应用Id',
	consumer_id int(11) NOT NULL COMMENT '用户Id',
	start_time datetime NOT NULL COMMENT '开始时间',
	end_time datetime NOT NULL COMMENT '结束时间',
	paperwork_a varchar(200) NOT NULL COMMENT '文案a',
	paperwork_b varchar(200) NOT NULL COMMENT '文案b',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (qt_task_id)
) COMMENT = '任务表';


-- 任务点击表
CREATE TABLE qt_task_click
(
	qt_click_id int(11) NOT NULL COMMENT '点击Id',
	qt_task_info_id int(11) NOT NULL COMMENT '任务关键词主键',
	consumer_id int(11) NOT NULL COMMENT '用户Id',
	app_os int(5) NOT NULL COMMENT '1:ANDROID, 2:IOS',
	idfa varchar(50) NOT NULL COMMENT 'idfa',
	udid varchar(50) NOT NULL COMMENT 'udid',
	imei varchar(50) NOT NULL COMMENT 'imei',
	osn varchar(50) NOT NULL COMMENT '设备名称',
	osv varchar(50) NOT NULL COMMENT '系统版本号',
	ip varchar(50) NOT NULL COMMENT 'Ip',
	cb_time datetime NOT NULL COMMENT '回调时间',
	province varchar(100) NOT NULL COMMENT '省份',
	city varchar(100) NOT NULL COMMENT '城市',
	status int(5) NOT NULL COMMENT '状态(1501-未回调,1510-回调)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (qt_click_id)
) COMMENT = '任务点击表';


-- 任务表关键词
CREATE TABLE qt_task_info
(
	qt_task_info_id int(11) NOT NULL COMMENT '任务关键词主键',
	qt_task_id int(11) NOT NULL COMMENT '任务主键',
	plan_task_number int(11) NOT NULL COMMENT '计划任务量',
	actual_task_number int(11) NOT NULL COMMENT '实际下载量',
	start_time datetime NOT NULL COMMENT '开始时间',
	end_time datetime NOT NULL COMMENT '结束时间',
	keywords varchar(50) NOT NULL COMMENT '关键词',
	cb_rate int(5) NOT NULL COMMENT '回调率',
	rank int(5) NOT NULL COMMENT '排名',
	line int(5) NOT NULL COMMENT '顺序',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (qt_task_info_id)
) COMMENT = '任务表关键词';


-- 应用
CREATE TABLE qt_up_app
(
	id int(11) NOT NULL COMMENT '主键',
	app_name varchar(50) NOT NULL COMMENT '应用名称',
	logo varchar(50) NOT NULL COMMENT '图片',
	up_id int(11) NOT NULL COMMENT '上游ip',
	app_store_id varchar(50) NOT NULL COMMENT '苹果Id',
	up_app_id varchar(50) NOT NULL COMMENT '客户标识id',
	original_price  decimal(10,4) NOT NULL COMMENT '原价',
	release_price decimal(10,4) NOT NULL COMMENT '投放价格',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	app_type int(5) COMMENT '任务类型-1011-回调，1012-快速',
	PRIMARY KEY (id)
) COMMENT = '应用';


-- 上游渠道
CREATE TABLE qt_up_channel
(
	up_id int(11) NOT NULL COMMENT '上游ip',
	up_name varchar(50) NOT NULL COMMENT '客户名称',
	up_server varchar(50) NOT NULL COMMENT '客户服务',
	up_channel_id varchar(50) NOT NULL COMMENT '客户分配渠道号',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (up_id)
) COMMENT = '上游渠道';


-- 用户历史产品留痕
CREATE TABLE qt_user_app_idfa
(
	id int(11) NOT NULL COMMENT '主键',
	consumer_id int(11) NOT NULL COMMENT '用户Id',
	qt_task_id int(11) NOT NULL COMMENT '任务主键',
	qt_task_info_id int(11) NOT NULL COMMENT '任务关键词主键',
	app_id int(11) NOT NULL COMMENT '应用Id',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (id)
) COMMENT = '用户历史产品留痕';



