SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS enter_variety;
DROP TABLE IF EXISTS fodder_register;
DROP TABLE IF EXISTS leave_enter_info;
DROP TABLE IF EXISTS leave_enter_order;
DROP TABLE IF EXISTS leave_enter_order_info;
DROP TABLE IF EXISTS sickness_info;
DROP TABLE IF EXISTS zoon_farm;




/* Create Tables */

-- 种类
CREATE TABLE enter_variety
(
	variety_id int(5) NOT NULL COMMENT '种类主键',
	variety_name varchar(100) NOT NULL COMMENT '种类名称',
	variety_type int(5) NOT NULL COMMENT '种类类型(入栏种类-9001,饲料种类-9002)',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (variety_id)
) COMMENT = '种类';


-- 饲料登记
CREATE TABLE fodder_register
(
	fodder_id int(5) NOT NULL COMMENT '饲料主键',
	enter_variety_id int(5) NOT NULL COMMENT '种类Id',
	fodder_amount int(5) NOT NULL COMMENT '饲料数量',
	fodder_price decimal(5,2) NOT NULL COMMENT '饲料价格',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (fodder_id)
) COMMENT = '饲料登记';


-- 出入栏信息
CREATE TABLE leave_enter_info
(
	info_id int(11) NOT NULL COMMENT '主键',
	enter_time datetime NOT NULL COMMENT '入栏时间',
	enter_age int(5) NOT NULL COMMENT '入栏年龄(月)',
	enter_weight decimal(5,2) NOT NULL COMMENT '入栏体重',
	enter_price decimal(5,2) NOT NULL COMMENT '入栏价格',
	enter_source_address varchar(255) NOT NULL COMMENT '入栏来源地址',
	enter_images varchar(255) COMMENT '入栏图片',
	enter_variety_id int(5) NOT NULL COMMENT '种类Id',
	leave_time datetime NOT NULL COMMENT '出栏时间',
	leave_age int(5) NOT NULL COMMENT '出栏年龄',
	leave_weight decimal(5,2) NOT NULL COMMENT '出栏体重',
	leave_price decimal(5,2) NOT NULL COMMENT '出栏价格',
	leave_source_address varchar(255) NOT NULL COMMENT '出栏目的地',
	leave_images varchar(255) NOT NULL COMMENT '出栏图片',
	leave_type int(5) NOT NULL COMMENT '出栏状态(1001-入栏，1010-出栏)',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (info_id)
) COMMENT = '出入栏信息';


-- 出入栏单
CREATE TABLE leave_enter_order
(
	order_id int(5) NOT NULL COMMENT '出入栏订单主键',
	order_type int(5) NOT NULL COMMENT '入栏状态(1001-入栏，1010-出栏)',
	user_id int(11) NOT NULL COMMENT '操作人Id',
	amount_price decimal(5,2) NOT NULL COMMENT '价格',
	amount_number int(5) NOT NULL COMMENT '总数',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (order_id)
) COMMENT = '出入栏单';


-- 出入栏单详情
CREATE TABLE leave_enter_order_info
(
	order_info_id int(5) NOT NULL COMMENT '详情主键',
	order_id int(5) NOT NULL COMMENT '出入栏订单主键',
	leaver_enter_id int(5) NOT NULL COMMENT '出入栏主键',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (order_info_id)
) COMMENT = '出入栏单详情';


-- 疾病信息
CREATE TABLE sickness_info
(
	sickness_id int(5) NOT NULL COMMENT '疾病信息',
	info_id int(11) NOT NULL COMMENT '主键',
	sickness_time datetime NOT NULL COMMENT '登记时间',
	sickness_type varchar(100) NOT NULL COMMENT '病种类',
	sickness_doctor varchar(100) NOT NULL COMMENT '医生',
	sickness_price decimal(5,2) NOT NULL COMMENT '看病价格',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (sickness_id)
) COMMENT = '疾病信息';


-- 养殖场
CREATE TABLE zoon_farm
(
	farm_id int(5) NOT NULL COMMENT '养殖场主键',
	farm_type varchar(100) NOT NULL COMMENT '养殖花销类型',
	farm_price decimal(5,2) NOT NULL COMMENT '花销价格',
	farm_remark varchar(200) NOT NULL COMMENT '备注',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (farm_id)
) COMMENT = '养殖场';



