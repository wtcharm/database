SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS app_idfa;
DROP TABLE IF EXISTS app_info;
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS app_user_order;
DROP TABLE IF EXISTS app_user_site;
DROP TABLE IF EXISTS user_site_invite;
DROP TABLE IF EXISTS user_site_urgency;




/* Create Tables */

-- 用户idfa
CREATE TABLE app_idfa
(
	id int(11) NOT NULL COMMENT '主键',
	app_id int(11) NOT NULL COMMENT 'appId',
	ip varchar(50) NOT NULL COMMENT '地理位置',
	idfa varchar(50) NOT NULL COMMENT 'idfa',
	udid varchar(50) NOT NULL COMMENT 'udid',
	osn varchar(50) NOT NULL COMMENT '设备名称',
	osv varchar(50) NOT NULL COMMENT '系统版本号',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '用户idfa';


-- app_info
CREATE TABLE app_info
(
	id int(11) NOT NULL COMMENT '主键',
	app_name varchar(50) NOT NULL COMMENT 'app名称',
	app_store_id varchar(20) NOT NULL COMMENT '应用商城id',
	app_versions varchar(50) NOT NULL COMMENT '版本号',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (id)
) COMMENT = 'app_info';


-- 应用用户
CREATE TABLE app_user
(
	id int(11) NOT NULL COMMENT '主键',
	user_phone varchar(50) NOT NULL COMMENT '用户手机号',
	user_image varchar(50) NOT NULL COMMENT '用户头像',
	user_invite varchar(20) NOT NULL COMMENT '用户邀请码',
	user_name varchar(50) NOT NULL COMMENT '用户昵称',
	app_id int(11) NOT NULL COMMENT 'appId',
	idfa varchar(50) NOT NULL COMMENT 'idfa',
	udid varchar(50) NOT NULL COMMENT 'udid',
	osn varchar(50) NOT NULL COMMENT '设备名称',
	osv varchar(50) NOT NULL COMMENT '系统版本号',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (id)
) COMMENT = '应用用户';


-- 用户订单
CREATE TABLE app_user_order
(
	id int(11) NOT NULL COMMENT '主键',
	app_id int(11) NOT NULL COMMENT 'appId',
	user_id int(11) NOT NULL COMMENT '用户Id',
	user_money decimal(10,4) NOT NULL COMMENT '用户金额',
	apple_voucher varchar(100) NOT NULL COMMENT '苹果凭证',
	outgoings_type varchar(50) NOT NULL COMMENT '购买类型',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (id)
) COMMENT = '用户订单';


-- 用户的地理位置
CREATE TABLE app_user_site
(
	id int(11) NOT NULL COMMENT '主键',
	app_id int(11) NOT NULL COMMENT 'appId',
	user_id int(11) NOT NULL COMMENT '用户Id',
	user_site varchar(100) NOT NULL COMMENT '用户位置',
	outgoings_type varchar(50) NOT NULL COMMENT '购买类型',
	outgoings_start_time datetime NOT NULL COMMENT '开始时间',
	outgoings_end_time datetime NOT NULL COMMENT '消费结束时间',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (id)
) COMMENT = '用户的地理位置';


-- 邀请记录
CREATE TABLE user_site_invite
(
	id int(11) NOT NULL COMMENT '主键',
	app_id int(11) NOT NULL COMMENT 'appId',
	parent_invite_id int(11) NOT NULL COMMENT '父级邀请人Id',
	parent_invite_name varchar(50) NOT NULL COMMENT '邀请父级备注',
	parent_invite_image varchar(50) NOT NULL COMMENT '邀请父级头像',
	parent_invite_phone varchar(50) NOT NULL COMMENT '父级手机号',
	son_invite_id int(11) NOT NULL COMMENT '子级邀请Id',
	son_invite_name varchar(50) NOT NULL COMMENT '邀请子级昵称',
	son_invite_phone varchar(50) NOT NULL COMMENT '邀请子级头像',
	invite_stauts int(5) NOT NULL COMMENT '邀请状态(200-邀请中,201-失败,210-成功)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	son_invite_image varchar(50) COMMENT '邀请子级头像',
	PRIMARY KEY (id)
) COMMENT = '邀请记录';


-- 紧急联系人
CREATE TABLE user_site_urgency
(
	id int(11) NOT NULL COMMENT '主键',
	user_id int(11) NOT NULL COMMENT '用户Id',
	urgency_phone varchar(50) NOT NULL COMMENT '紧急联系人',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (id)
) COMMENT = '紧急联系人';



