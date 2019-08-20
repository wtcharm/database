SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS kol_order;
DROP TABLE IF EXISTS sa_advert;
DROP TABLE IF EXISTS sa_advertiser;
DROP TABLE IF EXISTS sa_banner;
DROP TABLE IF EXISTS sa_bulletin;
DROP TABLE IF EXISTS sa_message;
DROP TABLE IF EXISTS sa_order_restrict;
DROP TABLE IF EXISTS sa_restrict;
DROP TABLE IF EXISTS sa_role;
DROP TABLE IF EXISTS sa_task;
DROP TABLE IF EXISTS sa_user;




/* Create Tables */

-- kol提现订单
CREATE TABLE kol_order
(
	order_id varchar(50) NOT NULL COMMENT '提现订单Id',
	order_code varchar(50) NOT NULL COMMENT '订单编号',
	kol_user_id varchar(50) NOT NULL COMMENT '提现用户Id',
	withdraw_money decimal(10,4) NOT NULL COMMENT '提现金额',
	wtchat_serial_mark varchar(100) NOT NULL COMMENT '微信流水号',
	wtchat_id varchar(50) NOT NULL COMMENT '微信Id',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (order_id)
) COMMENT = 'kol提现订单';


-- 广告商的广告
CREATE TABLE sa_advert
(
	advert_id varchar(50) NOT NULL COMMENT '广告商广告Id',
	advertiser_id varchar(50) NOT NULL COMMENT '广告商Id',
	advert_name varchar(50) NOT NULL COMMENT '广告名称',
	advert_area varchar(100) NOT NULL COMMENT '投放城市',
	advert_url varchar(255) NOT NULL COMMENT '广告链接',
	advert_status int(5) NOT NULL COMMENT '广告状态(1003-开启 1030 关闭)',
	advert_icon varchar(255) NOT NULL COMMENT '广告图片',
	advert_api varchar(255) NOT NULL COMMENT '广告回调接口',
	advert_type int(5) NOT NULL COMMENT '任务类型(2001-小程序，2010-H5)',
	advert_article varchar(255) COMMENT '文案',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (advert_id)
) COMMENT = '广告商的广告';


-- 广告商
CREATE TABLE sa_advertiser
(
	advertiser_id varchar(50) NOT NULL COMMENT '广告商Id',
	advertiser_code varchar(25) NOT NULL COMMENT '广告商编号',
	advertiser_name varchar(25) NOT NULL COMMENT '广告商名称',
	advertiser_status int(5) NOT NULL COMMENT '广告商状态(1003 -开启,1030 - 关闭)',
	advertiser_image varchar(50) NOT NULL COMMENT '广告商图片',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (advertiser_id)
) COMMENT = '广告商';


-- banner首页
CREATE TABLE sa_banner
(
	banner_id varchar(50) NOT NULL COMMENT '首页Id',
	banner_code varchar(50) COMMENT '编号',
	banner_image varchar(100) NOT NULL COMMENT 'banner图片',
	banner_url varchar(100) NOT NULL COMMENT 'banner访问连接',
	banner_status int(5) NOT NULL COMMENT '状态(1003 -开启,1030 - 关闭)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (banner_id)
) COMMENT = 'banner首页';


-- 广告牌
CREATE TABLE sa_bulletin
(
	bulletin_id varchar(50) NOT NULL COMMENT '广告牌Id',
	user_id varchar(50) COMMENT '用户Id',
	bulletin_title varchar(100) COMMENT '广告标题',
	content varchar(255) NOT NULL COMMENT '内容',
	bulletin_status int(5) NOT NULL COMMENT '广告牌状态(1003-开启，1030-关闭)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (bulletin_id)
) COMMENT = '广告牌';


-- 消息数据
CREATE TABLE sa_message
(
	user_message_id varchar(50) NOT NULL COMMENT '消息id',
	title varchar(255) COMMENT '消息标题',
	content text NOT NULL COMMENT '内容',
	status int(5) NOT NULL COMMENT '消息状态(1003 -开启,1030 - 关闭)',
	is_send int(5) NOT NULL COMMENT '是否发送(1005 -发送，1050 -未发送)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (user_message_id)
) COMMENT = '消息数据';


-- 用户下单提现限制
CREATE TABLE sa_order_restrict
(
	order_restrict_id varchar(50) NOT NULL COMMENT '订单限制主键Id',
	order_restrict_code varchar(20) NOT NULL COMMENT '限制编号',
	restrict_total_money decimal(10,4) COMMENT '限制提现金额',
	restrict_user_quantity int(10) COMMENT '限制提现人数',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (order_restrict_id)
) COMMENT = '用户下单提现限制';


-- 对kol用户限制
CREATE TABLE sa_restrict
(
	restrict_id varchar(50) NOT NULL COMMENT '主键Id',
	kol_user_id varchar(200) NOT NULL COMMENT '用户id',
	is_browse int(5) NOT NULL COMMENT '是否可以浏览(1006 可以 ,1060 不可以)',
	is_withdraw  int(5) NOT NULL COMMENT '是否可以提现(1006 -可以,1060 不可以) ',
	is_receive int(5) NOT NULL COMMENT '是否可以领取(1006 -可以，1060-不可以)',
	total_qualify_money decimal(10,4) COMMENT '提现金额限定',
	day_qualify_money decimal(10,4) COMMENT '用户的当日限定金额',
	area varchar(100) COMMENT '地区',
	user_status int(5) NOT NULL COMMENT '用户状态(2030-正常,2031-异常,2032-黑名单)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (restrict_id)
) COMMENT = '对kol用户限制';


-- 后台角色
CREATE TABLE sa_role
(
	role_id varchar(50) NOT NULL COMMENT '角色id',
	role_code varchar(50) NOT NULL COMMENT '角色编号',
	role_name varchar(50) NOT NULL COMMENT '角色名称',
	status int(5) NOT NULL COMMENT '状态(1003 -启用,1030-关闭)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (role_id)
) COMMENT = '后台角色';


-- 任务信息
CREATE TABLE sa_task
(
	task_id varchar(50) NOT NULL COMMENT '任务Id',
	task_nam varchar(50) NOT NULL COMMENT '任务名称',
	task_code varchar(25) NOT NULL COMMENT '任务编号',
	advertiser_id varchar(50) NOT NULL COMMENT '广告商Id',
	advert_id varchar(50) NOT NULL COMMENT '广告主Id',
	task_type int(5) NOT NULL COMMENT '任务类型(2001-小程序，2010-H5)',
	task_priority int(5) NOT NULL COMMENT '任务优先级(2011-举荐3,2012-普通,2013-预告)',
	task_amount int(10) NOT NULL COMMENT '任务量(投放量)',
	task_price decimal(10,4) NOT NULL COMMENT '任务单价',
	tash_area varchar(50) NOT NULL COMMENT '任务投放地址',
	start_time timestamp NOT NULL COMMENT '任务开始时间',
	end_time timestamp NOT NULL COMMENT '任务结束时间',
	task_status int(5) NOT NULL COMMENT '任务状态(2020-投放中,2021-暂停中,2023-停止)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (task_id)
) COMMENT = '任务信息';


-- 后台用户
CREATE TABLE sa_user
(
	user_id varchar(50) NOT NULL COMMENT '用户Id',
	user_code varchar(50) NOT NULL COMMENT '用户编号',
	user_name varchar(100) COMMENT '用户姓名',
	user_phone varchar(25) NOT NULL COMMENT '用户手机号',
	user_password varchar(100) NOT NULL COMMENT '用户密码',
	user_image varchar(255) NOT NULL COMMENT '用户头像',
	user_role_id varchar(50) COMMENT '用户角色',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (user_id)
) COMMENT = '后台用户';



