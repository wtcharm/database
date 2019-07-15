SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS kol_order;
DROP TABLE IF EXISTS sa_message;
DROP TABLE IF EXISTS sa_restrict;
DROP TABLE IF EXISTS sa_role;
DROP TABLE IF EXISTS sa_user;




/* Create Tables */

-- kol提现订单
CREATE TABLE kol_order
(
	order_id varchar(50) NOT NULL COMMENT '提现订单Id',
	order_code varchar(50) NOT NULL COMMENT '订单编号',
	kol_user_id varchar(50) NOT NULL COMMENT '提现用户Id',
	withdraw_money decimal(10,4) NOT NULL COMMENT '提现金额',
	wtchat_serial_number varchar(100) NOT NULL COMMENT '微信流水号',
	wtchat_id varchar(50) NOT NULL COMMENT '微信Id',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (order_id)
) COMMENT = 'kol提现订单';


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
	role_code varbinary(50) NOT NULL COMMENT '角色编号',
	role_name varchar(50) NOT NULL COMMENT '角色名称',
	status int(5) NOT NULL COMMENT '状态(1003 -启用,1030-关闭)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (role_id)
) COMMENT = '后台角色';


-- 后台用户
CREATE TABLE sa_user
(
	user_id varchar(50) NOT NULL COMMENT '用户Id',
	user_code varchar(50) NOT NULL COMMENT '用户编号',
	user_name varchar(100) COMMENT '用户姓名',
	user_phone varchar(25) NOT NULL COMMENT '用户手机号',
	user_password varchar(50) NOT NULL COMMENT '用户密码',
	user_image varchar(100) COMMENT '用户头像',
	user_role_id varchar(50) COMMENT '用户角色',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	remarks varchar(255) COMMENT '备注',
	dr int(5) NOT NULL COMMENT '是否删除 1001 不删除，1010 删除',
	PRIMARY KEY (user_id)
) COMMENT = '后台用户';



