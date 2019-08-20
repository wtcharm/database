SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS ep_goods;
DROP TABLE IF EXISTS ep_integral_trace;
DROP TABLE IF EXISTS ep_notice;
DROP TABLE IF EXISTS ep_order;
DROP TABLE IF EXISTS ep_sa_user;
DROP TABLE IF EXISTS ep_user;
DROP TABLE IF EXISTS ep_user_grade;
DROP TABLE IF EXISTS ep_user_info;




/* Create Tables */

-- 商品表
CREATE TABLE ep_goods
(
	ep_goods_id varchar(50) NOT NULL COMMENT '商品Id',
	ep_goods_name varchar(50) NOT NULL COMMENT '商品名称',
	ep_goods_image varchar(100) NOT NULL COMMENT '商品图片',
	ep_goods_price decimal(10,4) NOT NULL COMMENT '商品价格',
	ep_goods_amount int(5) NOT NULL COMMENT '商品数量',
	ep_goods_describe varchar(255) NOT NULL COMMENT '商品描述',
	status int(5) NOT NULL COMMENT '(是否激活)1000-未激活，1001-激活',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '是否删除(1000-未删除，1001-删除)',
	PRIMARY KEY (ep_goods_id)
) COMMENT = '商品表';


-- 积分痕迹表
CREATE TABLE ep_integral_trace
(
	ep_integral_id varchar(50) NOT NULL COMMENT '积分痕迹Id',
	ep_user_id varchar(50) NOT NULL COMMENT '会员Id',
	ep_income_amount bigint NOT NULL COMMENT '收入金额',
	income_time datetime NOT NULL COMMENT '收入时间',
	status int(5) NOT NULL COMMENT '(是否激活)1000-未激活，1001-激活',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '是否删除(1000-未删除，1001-删除)',
	PRIMARY KEY (ep_integral_id)
) COMMENT = '积分痕迹表';


-- 公告数据
CREATE TABLE ep_notice
(
	ep_notice_id varchar(50) NOT NULL COMMENT '公告Id',
	ep_notice_title varbinary(200) NOT NULL COMMENT '公告标题',
	ep_notice_content varchar(255) NOT NULL COMMENT '公告内容',
	status int(5) NOT NULL COMMENT '(是否激活)1000-未激活，1001-激活',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '是否删除(1000-未删除，1001-删除)',
	PRIMARY KEY (ep_notice_id)
) COMMENT = '公告数据';


-- 用户订单数据
CREATE TABLE ep_order
(
	ep_order_id varchar(50) NOT NULL COMMENT '用户订单',
	ep_user_id varchar(50) NOT NULL COMMENT '用户Id',
	ep_goods_id varchar(50) NOT NULL COMMENT '商品Id',
	ep_goods_amount varchar(50) NOT NULL COMMENT '商品数量',
	ep_user_info_id varchar(50) NOT NULL COMMENT '用户基础数据',
	status int(5) NOT NULL COMMENT '(是否激活)1000-未激活，1001-激活',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '是否删除(1000-未删除，1001-删除)',
	PRIMARY KEY (ep_order_id)
) COMMENT = '用户订单数据';


-- 管理员
CREATE TABLE ep_sa_user
(
	ep_sa_id varchar(50) NOT NULL COMMENT '用户id',
	ep_sa_name varchar(50) NOT NULL COMMENT '管理员名称',
	ep_sa_phone varchar(50) NOT NULL COMMENT '管理员手机号',
	ep_sa_password varchar(50) NOT NULL COMMENT '管理员密码',
	ep_sa_apply int(5) NOT NULL COMMENT '是否进行提交(1001-不提交,1010-提交)',
	status int(5) NOT NULL COMMENT '(是否激活)1000-未激活，1001-激活',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '是否删除(1000-未删除，1001-删除)',
	PRIMARY KEY (ep_sa_id)
) COMMENT = '管理员';


-- 用户信息
CREATE TABLE ep_user
(
	ep_user_id varchar(50) NOT NULL COMMENT '用户Id',
	ep_user_name varchar(50) NOT NULL COMMENT '用户名称',
	ep_user_phone varchar(50) NOT NULL COMMENT '用户手机号',
	ep_password varchar(50) NOT NULL COMMENT '用户密码',
	ep_user_card varchar(50) NOT NULL COMMENT '用户的身份证号码',
	parent_id varchar(50) NOT NULL COMMENT '举荐人',
	income_time datetime NOT NULL COMMENT '入金时间',
	status int(5) NOT NULL COMMENT '(是否激活)1000-未激活，1001-激活',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '是否删除(1000-未删除，1001-删除)',
	PRIMARY KEY (ep_user_id)
) COMMENT = '用户信息';


-- 会员等级
CREATE TABLE ep_user_grade
(
	ep_grade_id varchar(50) NOT NULL COMMENT '用户的会员等级Id',
	ep_user_id varchar(50) NOT NULL COMMENT '用户Id',
	ep_user_code varchar(50) NOT NULL COMMENT '用户的序列号',
	ep_group_code varchar(50) NOT NULL COMMENT '用户的组号',
	ep_grade_name int(5) NOT NULL COMMENT '等级名称(2010-游客,2011- 储备,2012-正式,2013-晋升,2014-中级,2015-高级,2016-总监)',
	ep_grade_integral bigint(50) NOT NULL COMMENT '会员等级积分',
	status int(5) NOT NULL COMMENT '(是否激活)1000-未激活，1001-激活',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '是否删除(1000-未删除，1001-删除)',
	PRIMARY KEY (ep_grade_id)
) COMMENT = '会员等级';


-- 用户基础信息
CREATE TABLE ep_user_info
(
	ep_user_info_id varchar(50) NOT NULL COMMENT '基础信息Id',
	ep_user_id varchar(50) NOT NULL COMMENT '用户信息表',
	bank_number varchar(100) NOT NULL COMMENT '银行卡号码',
	bank_address varchar(100) NOT NULL COMMENT '开户行地址',
	receiver_address varchar(50) NOT NULL COMMENT '收货地址',
	receiver_user varchar(50) NOT NULL COMMENT '收货人',
	receiver_phone varchar(50) NOT NULL COMMENT '收货手机号',
	status int(5) NOT NULL COMMENT '(是否激活)1000-未激活，1001-激活',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	dr int(5) NOT NULL COMMENT '是否删除(1000-未删除，1001-删除)',
	PRIMARY KEY (ep_user_info_id)
) COMMENT = '用户基础信息';



