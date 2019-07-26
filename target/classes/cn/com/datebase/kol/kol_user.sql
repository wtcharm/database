SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS kol_user;
DROP TABLE IF EXISTS kol_user_message;
DROP TABLE IF EXISTS kol_user_task;
DROP TABLE IF EXISTS kol_user_wechat;




/* Create Tables */

-- kol用户表
CREATE TABLE kol_user
(
	user_id varchar(50) NOT NULL COMMENT '主键Id',
	user_name varchar(100) COMMENT '用户名称',
	user_phone varchar(50) NOT NULL COMMENT '用户手机号',
	user_code varchar(50) NOT NULL COMMENT '用户编号',
	user_image varchar(50) COMMENT '用户头像',
	user_password varchar(50) NOT NULL COMMENT '用户密码',
	user_card varchar(50) COMMENT '用户身份证号码',
	plan_deposit decimal(10,4) COMMENT '预计提现(限制提现)',
	total_income decimal(10,4) NOT NULL COMMENT '总计收入',
	totla_deposit decimal(10,4) NOT NULL COMMENT '累计提现',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (user_id)
) COMMENT = 'kol用户表';


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
	task_allot_number int(50) NOT NULL COMMENT '任务分配数量',
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



