SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS app_visit;
DROP TABLE IF EXISTS kol_collect;
DROP TABLE IF EXISTS kol_user;
DROP TABLE IF EXISTS kol_user_info;
DROP TABLE IF EXISTS kol_user_message;
DROP TABLE IF EXISTS kol_user_task;
DROP TABLE IF EXISTS kol_user_wechat;
DROP TABLE IF EXISTS user_task_cb;




/* Create Tables */

-- 访问历史
CREATE TABLE app_visit
(
	visit_id varchar(50) NOT NULL COMMENT '访问Id',
	kol_user_id varchar(50) NOT NULL COMMENT '用户Id',
	app_os int(5) NOT NULL COMMENT '1:ANDROID, 2:IOS',
	imei varchar(50) NOT NULL COMMENT '设备号',
	ip varchar(50) NOT NULL COMMENT '访问Id',
	visit_time datetime NOT NULL COMMENT '访问时间',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (visit_id)
) COMMENT = '访问历史';


-- 用户收藏
CREATE TABLE kol_collect
(
	collect_id varchar(50) NOT NULL COMMENT '收藏Id',
	kol_user_id varchar(50) NOT NULL COMMENT '用户Id',
	task_id varchar(50) NOT NULL COMMENT '任务Id',
	task_name varchar(200) NOT NULL COMMENT '任务名称',
	advertiser_id varchar(50) NOT NULL COMMENT '广告主Id',
	advertiser_name varchar(200) NOT NULL COMMENT '广告主名称',
	collect_type int(5) NOT NULL COMMENT '收藏类型(1111-广告主,1112-任务)',
	collect_image varchar(200) NOT NULL COMMENT '收藏广告主图片',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (collect_id)
) COMMENT = '用户收藏';


-- kol用户表
CREATE TABLE kol_user
(
	user_id varchar(50) NOT NULL COMMENT '主键Id',
	user_name varchar(100) NOT NULL COMMENT '用户名称',
	user_phone varchar(50) NOT NULL COMMENT '用户手机号',
	user_code varchar(50) NOT NULL COMMENT '用户编号',
	user_image varchar(50) NOT NULL COMMENT '用户头像',
	user_password varchar(50) NOT NULL COMMENT '用户密码',
	user_card varchar(50) NOT NULL COMMENT '用户身份证号码',
	income_money decimal(10,4) NOT NULL COMMENT '徒弟带来收益',
	total_income decimal(10,4) NOT NULL COMMENT '总计收入',
	totla_deposit decimal(10,4) NOT NULL COMMENT '累计提现',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (user_id)
) COMMENT = 'kol用户表';


-- kol用户扩展表
CREATE TABLE kol_user_info
(
	user_info_id varchar(50) NOT NULL COMMENT '扩充表Id',
	kol_user_id varchar(50) NOT NULL COMMENT '用户Id',
	invitation_code varchar(20) NOT NULL COMMENT '用户邀请码',
	parent_user_id varchar(50) NOT NULL COMMENT '父级用户Id',
	kol_user_sex int(5) NOT NULL COMMENT '性别(1-男 2-女)',
	kol_user_birth datetime NOT NULL COMMENT '出生年月',
	kol_user_age int(3) NOT NULL COMMENT '用户年龄',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (user_info_id)
) COMMENT = 'kol用户扩展表';


-- 用户消息数据
CREATE TABLE kol_user_message
(
	user_message_id varchar(50) NOT NULL COMMENT '消息id',
	user_id varchar(50) NOT NULL COMMENT '用户Id',
	message_id varchar(50) NOT NULL COMMENT '消息Id',
	is_read int(5) NOT NULL COMMENT '是否进行阅读(1004 未阅读，1040 已阅读)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (user_message_id)
) COMMENT = '用户消息数据';


-- 用户和任务表
CREATE TABLE kol_user_task
(
	user_task_id varchar(50) NOT NULL COMMENT '用户任务表主键',
	user_id varchar(50) NOT NULL COMMENT '用户Id',
	task_id varchar(50) NOT NULL COMMENT '任务Id',
	task_finish_money decimal(10,4) NOT NULL COMMENT '任务收益',
	task_finish_number int(50) NOT NULL COMMENT '任务完成数量',
	status int(5) NOT NULL COMMENT '状态(领取 1002 , 完成 1020 )',
	task_end_time datetime NOT NULL COMMENT '任务结束时间',
	task_start_time datetime NOT NULL COMMENT '任务开始时间',
	is_settlement_money int(5) NOT NULL COMMENT '是否结算(2111 -正常结算,2112 -异常(正常结算) 2113-不结算,2114 -完成)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (user_task_id)
) COMMENT = '用户和任务表';


-- 用户微信信息表
CREATE TABLE kol_user_wechat
(
	user_wtchat_id varchar(50) NOT NULL COMMENT '微信主键',
	user_id varchar(50) NOT NULL COMMENT '用户Id',
	openid varchar(50) NOT NULL COMMENT '微信认证个人Id',
	wechat_amount int(20) COMMENT '微信好友数',
	wechat_area varchar(255) COMMENT '微信地区',
	wechat_id varchar(50) COMMENT '微信Id',
	wechat_name varchar(50) COMMENT '微信昵称',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (user_wtchat_id)
) COMMENT = '用户微信信息表';


-- 用户任务的回调时间
CREATE TABLE user_task_cb
(
	task_cb_id varchar(50) NOT NULL COMMENT '回调Id',
	task_id varchar(50) NOT NULL COMMENT '任务Id',
	kol_user_id varchar(50) NOT NULL COMMENT '人员Id',
	cb_time timestamp NOT NULL COMMENT '回调时间',
	idfa varchar(50) NOT NULL COMMENT 'idfa',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (task_cb_id)
) COMMENT = '用户任务的回调时间';



