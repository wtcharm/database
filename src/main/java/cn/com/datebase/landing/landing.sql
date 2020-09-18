SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS landing_commodity;
DROP TABLE IF EXISTS landing_info_stream;
DROP TABLE IF EXISTS landing_visit;
DROP TABLE IF EXISTS landing_visit_user;




/* Create Tables */

-- 落地页产品
CREATE TABLE landing_commodity
(
	id int(11) NOT NULL COMMENT '主键',
	type int(5) NOT NULL COMMENT '类型，1011-pc 1012-yd',
	name varchar(50) NOT NULL COMMENT '姓名',
	phone varchar(50) NOT NULL COMMENT '手机号',
	appName varchar(100) NOT NULL COMMENT '应用名称',
	content varchar(255) NOT NULL COMMENT '内容',
	ip varchar(50) NOT NULL COMMENT '地址',
	submitTime varchar(50) NOT NULL COMMENT '提交时间',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '落地页产品';


-- 落地页信息流
CREATE TABLE landing_info_stream
(
	id int(11) NOT NULL COMMENT '主键',
	order_id varchar(50) NOT NULL COMMENT '订单Id',
	article_name varchar(50) NOT NULL COMMENT '商品名称',
	combo varchar(100) NOT NULL COMMENT '套餐',
	order_number int(5) NOT NULL COMMENT '订单数量',
	order_price decimal(10,4) NOT NULL COMMENT '订单价格',
	consignee_name varchar(50) NOT NULL COMMENT '收货人',
	consignee_phone varchar(50) NOT NULL COMMENT '收货手机号',
	consignee_area varchar(100) NOT NULL COMMENT '收货地区',
	detailed_site varchar(255) NOT NULL COMMENT '详情地址',
	remark varchar(100) NOT NULL COMMENT '备注',
	payment_type varchar(20) NOT NULL COMMENT '支付方式',
	website_url varchar(255) NOT NULL COMMENT '访问地址url',
	ip varchar(50) NOT NULL COMMENT 'ip地址',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '落地页信息流';


-- 落地页访问日志
CREATE TABLE landing_visit
(
	id int(11) NOT NULL COMMENT '主键',
	type int(5) NOT NULL COMMENT '类型，1011-pc 1012-yd',
	time varchar(50) NOT NULL COMMENT '时间',
	PRIMARY KEY (id)
) COMMENT = '落地页访问日志';


-- 落地页访问日志
CREATE TABLE landing_visit_user
(
	id int(11) NOT NULL COMMENT '主键',
	type int(5) NOT NULL COMMENT '1-电话',
	time varchar(50) NOT NULL COMMENT '时间',
	ip varchar(50) NOT NULL COMMENT 'ip地址',
	pages_url varchar(100) NOT NULL COMMENT '页面路径',
	counts int(11) NOT NULL COMMENT '计数访问时间',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '落地页访问日志';



