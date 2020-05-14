SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS mt_brand;
DROP TABLE IF EXISTS mt_fashion_imgs;
DROP TABLE IF EXISTS mt_fittings;
DROP TABLE IF EXISTS mt_fittings_comment;
DROP TABLE IF EXISTS mt_fittings_fashion;
DROP TABLE IF EXISTS mt_genre;
DROP TABLE IF EXISTS mt_goods;
DROP TABLE IF EXISTS mt_goods_comment;
DROP TABLE IF EXISTS mt_goods_fashion;
DROP TABLE IF EXISTS mt_goods_info;
DROP TABLE IF EXISTS mt_label;
DROP TABLE IF EXISTS mt_manage;
DROP TABLE IF EXISTS mt_manage_user;
DROP TABLE IF EXISTS mt_order;
DROP TABLE IF EXISTS mt_order_goods;
DROP TABLE IF EXISTS mt_order__fittings;
DROP TABLE IF EXISTS mt_role;
DROP TABLE IF EXISTS mt_store;
DROP TABLE IF EXISTS mt_user;
DROP TABLE IF EXISTS mt_user_collect;
DROP TABLE IF EXISTS mt_user_fedex;
DROP TABLE IF EXISTS mt_user_grade;




/* Create Tables */

-- 品牌
CREATE TABLE mt_brand
(
	id int(11) NOT NULL COMMENT '主键',
	name varchar(50) NOT NULL COMMENT '品牌名称',
	PRIMARY KEY (id)
) COMMENT = '品牌';


-- 款式图库
CREATE TABLE mt_fashion_imgs
(
	imgs_id int(11) NOT NULL COMMENT '主键',
	fashion_id int(11) NOT NULL COMMENT '款式Id',
	fashion_name varchar(100) NOT NULL COMMENT '款式名称',
	goods_diameter varchar(50) NOT NULL COMMENT '直径',
	goods_style varchar(50) NOT NULL COMMENT '风格',
	img_urls varchar(200) NOT NULL COMMENT '图片地址',
	create_time datetime NOT NULL COMMENT '创建时间',
	dr int(5) NOT NULL COMMENT '1001-未删除，1010-已删除',
	PRIMARY KEY (imgs_id)
) COMMENT = '款式图库';


-- 配件信息
CREATE TABLE mt_fittings
(
	fittings_id int(11) NOT NULL COMMENT '主键',
	fittings_name varchar(50) NOT NULL COMMENT '配件名称',
	brand_id bigint(11) NOT NULL COMMENT '品牌Id',
	genre_id bigint(11) NOT NULL COMMENT '类型',
	fittings_carousel varchar(200) NOT NULL COMMENT '轮播图',
	fittings_code varchar(20) NOT NULL COMMENT '编号',
	aftermarket_time varchar(10) NOT NULL COMMENT '售后时间',
	fittings_deliver varchar(100) NOT NULL COMMENT '发货地址',
	fittings_status int(5) NOT NULL COMMENT '上架-1001,下架-1010',
	yield_company varchar(100) NOT NULL COMMENT '生产企业',
	yield_company_addr varchar(255) NOT NULL COMMENT '生产商地址',
	place_origin varchar(200) NOT NULL COMMENT '产地',
	fittings_type int(5) NOT NULL COMMENT '标签(2001-无,2002-推荐,2003-优惠)',
	fittings_icon varchar(100) NOT NULL COMMENT '详情图',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (fittings_id)
) COMMENT = '配件信息';


-- 订单配件评分
CREATE TABLE mt_fittings_comment
(
	id bigint(11) NOT NULL COMMENT '主键',
	order_fitting_id bigint NOT NULL COMMENT '订单详情id',
	user_id bigint(11) NOT NULL COMMENT '用户Id',
	fittings_id int(11) NOT NULL COMMENT '配件Id',
	comment_content varchar(150) NOT NULL COMMENT '商品评分',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '订单配件评分';


-- 配件款式
CREATE TABLE mt_fittings_fashion
(
	fashion_id int(11) NOT NULL COMMENT '款式Id',
	fittings_id int(11) NOT NULL COMMENT '配件Id',
	fashion_name varchar(100) NOT NULL COMMENT '款式名称',
	fashion_model varchar(100) NOT NULL COMMENT '款式型号',
	cost_price decimal(10,4) NOT NULL COMMENT '成本价',
	sale_price decimal(10,4) NOT NULL COMMENT '售价',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (fashion_id)
) COMMENT = '配件款式';


-- 分类
CREATE TABLE mt_genre
(
	id int(11) NOT NULL COMMENT '主键',
	name varchar(100) NOT NULL COMMENT '名称',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '分类';


-- 商品
CREATE TABLE mt_goods
(
	id int(11) NOT NULL COMMENT '主键',
	brand_id int(11) NOT NULL COMMENT '品牌Id',
	goods_name varchar(100) NOT NULL COMMENT '商品名称',
	goods_code varchar(50) NOT NULL COMMENT '商品编号',
	goods_imgs varchar(100) NOT NULL COMMENT '商品图片',
	goods_style varchar(50) NOT NULL COMMENT '风格',
	goods_watery varchar(50) NOT NULL COMMENT '含水',
	goods_texture varchar(50) NOT NULL COMMENT '材质',
	goods_diameter varchar(50) NOT NULL COMMENT '直径',
	goods_period varchar(50) NOT NULL COMMENT '销售时长',
	goods_aftermarket_time datetime NOT NULL COMMENT '售后时间',
	goods_arc varchar(50) NOT NULL COMMENT '基弧',
	goods_colour varchar(50) NOT NULL COMMENT '商品颜色',
	goods_fashion varchar(200) NOT NULL COMMENT '款式',
	cost_price_one decimal(10,4) NOT NULL COMMENT '一副成本价',
	cost_price_two decimal(10,4) NOT NULL COMMENT '两幅成本价',
	cost_price_three decimal(10,4) NOT NULL COMMENT '三幅成本价',
	sale_price_one decimal(10,4) NOT NULL COMMENT '售价一副',
	sale_price_two decimal(10,4) NOT NULL COMMENT '售价二副',
	sale_price_three decimal(10,4) NOT NULL COMMENT '销价三幅',
	goods_deliver varchar(50) NOT NULL COMMENT '发货地址',
	goods_status int(5) NOT NULL COMMENT '上架-1001,下架-1010',
	create_time datetime NOT NULL COMMENT '创建时间',
	dr int(5) NOT NULL COMMENT '1001-未删除，1010-已删除',
	PRIMARY KEY (id),
	UNIQUE (goods_code)
) COMMENT = '商品';


-- 订单商品评分
CREATE TABLE mt_goods_comment
(
	id bigint(11) NOT NULL COMMENT '主键',
	order_goods_id bigint NOT NULL COMMENT '订单详情id',
	user_id bigint(11) NOT NULL COMMENT '用户Id',
	good_id int(11) NOT NULL COMMENT '商品Id',
	comment_content varchar(150) NOT NULL COMMENT '商品评分',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '订单商品评分';


-- 商品款式
CREATE TABLE mt_goods_fashion
(
	fashion_id int(11) NOT NULL COMMENT '款式Id',
	fashion_name int(5) NOT NULL COMMENT '款式名称',
	fashion_degree varchar(255) NOT NULL COMMENT '款式度数',
	create_time datetime NOT NULL COMMENT '创建时间',
	dr int(5) NOT NULL COMMENT '1001-未删除，1010-已删除',
	PRIMARY KEY (fashion_id)
) COMMENT = '商品款式';


-- 商品详情
CREATE TABLE mt_goods_info
(
	id int(11) NOT NULL COMMENT '主键',
	goods_id int(11) NOT NULL COMMENT '商品id',
	yield_company varchar(100) NOT NULL COMMENT '生产企业',
	goods_icon varchar(100) NOT NULL COMMENT '商品详情图',
	yield_company_addr varchar(255) NOT NULL COMMENT '生产商地址',
	place_origin varchar(200) NOT NULL COMMENT '产地',
	goods_table int(5) NOT NULL COMMENT '标签(2001-无,2002-推荐,2003-优惠)',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id),
	UNIQUE (goods_id)
) COMMENT = '商品详情';


-- 标签
CREATE TABLE mt_label
(
	id int(5) NOT NULL COMMENT '主键',
	meaning varchar(20) NOT NULL COMMENT '含义',
	tag varchar(20) NOT NULL COMMENT '标签',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '标签';


-- mt_manage
CREATE TABLE mt_manage
(
	id int(11) NOT NULL COMMENT '主键',
	name varchar(50) NOT NULL COMMENT '名称',
	password varchar(50) NOT NULL COMMENT '密码',
	role_id int(11) NOT NULL COMMENT '角色',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = 'mt_manage';


-- 管理员
CREATE TABLE mt_manage_user
(
	id bigint(11) NOT NULL COMMENT '主键',
	manage_name varchar(50) NOT NULL COMMENT '名称',
	mobile varchar(50) NOT NULL COMMENT '手机号',
	password varchar(50) NOT NULL COMMENT '密码',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '管理员';


-- 订单
CREATE TABLE mt_order
(
	id int(11) NOT NULL COMMENT '主键',
	user_id bigint(11) NOT NULL COMMENT '用户Id',
	order_code varchar(11) NOT NULL COMMENT '订单编号',
	order_sale_price decimal(10,4) NOT NULL COMMENT '订单售卖价格',
	order_cost_price decimal(10,4) NOT NULL COMMENT '订单成本价',
	logistics_number varchar(100) NOT NULL COMMENT '物流单号',
	logistics_company varchar(100) NOT NULL COMMENT '物流公司',
	order_status int(5) NOT NULL COMMENT '状态(100-待付款,101-待发货,102-待收货,103-售后)',
	create_time datetime NOT NULL COMMENT '创建时间',
	dr int(5) NOT NULL COMMENT '1001-未删除，1010-已删除',
	PRIMARY KEY (id)
) COMMENT = '订单';


-- 订单商品
CREATE TABLE mt_order_goods
(
	id bigint(11) NOT NULL COMMENT '主键',
	order_id int(11) NOT NULL COMMENT '订单Id',
	goods_id int(11) NOT NULL COMMENT '商品Id',
	goods_name varchar(100) NOT NULL COMMENT '商品名称',
	fashion_id int(11) NOT NULL COMMENT '款式Id',
	fashion_name int(5) NOT NULL COMMENT '款式名称',
	right_degree int(5) NOT NULL COMMENT '右边度数',
	right_count int(5) NOT NULL COMMENT '右边数量',
	left_degree int(5) NOT NULL COMMENT '左边度数',
	left_count int(5) NOT NULL COMMENT '左边数量',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '订单商品';


-- 订单配件
CREATE TABLE mt_order__fittings
(
	id bigint(11) NOT NULL COMMENT '主键',
	order_id int(11) NOT NULL COMMENT '订单Id',
	fittings_id int(11) NOT NULL COMMENT '配件Id',
	fittings_name varchar(100) NOT NULL COMMENT '配件名称',
	fashion_id int(11) NOT NULL COMMENT '款式Id',
	fashion_name varchar(100) NOT NULL COMMENT '款式名称',
	fittings_count int(5) NOT NULL COMMENT '数量',
	fashion_model varchar(100) NOT NULL COMMENT '款式型号',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '订单配件';


-- 角色
CREATE TABLE mt_role
(
	id int(11) NOT NULL COMMENT '主键',
	name varchar(50) NOT NULL COMMENT '名称',
	content varchar(200) NOT NULL COMMENT '权限内容',
	PRIMARY KEY (id)
) COMMENT = '角色';


-- 美瞳门店
CREATE TABLE mt_store
(
	id int(11) NOT NULL COMMENT '主键',
	name varchar(100) NOT NULL COMMENT '名称',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '美瞳门店';


-- 用户表
CREATE TABLE mt_user
(
	id bigint(11) NOT NULL COMMENT '主键',
	openid varchar(50) NOT NULL COMMENT '微信登录',
	name varchar(50) NOT NULL COMMENT '昵称',
	mobile varchar(50) NOT NULL COMMENT '手机号',
	code int(5) NOT NULL COMMENT '邀请码',
	icon varchar(200) NOT NULL COMMENT '头像',
	password varchar(50) NOT NULL COMMENT '密码',
	parent_id bigint(11) NOT NULL COMMENT '举荐人',
	dr int(5) NOT NULL COMMENT '1001-未删除，1010-已删除',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '用户表';


-- 用户收藏
CREATE TABLE mt_user_collect
(
	id int(11) NOT NULL COMMENT '主键',
	user_id bigint(11) NOT NULL COMMENT '用户信息',
	goods_id bigint(11) NOT NULL COMMENT '商品',
	opinion varchar(255) NOT NULL COMMENT '意见',
	type int(5) NOT NULL COMMENT '类型(1101-收藏，1102-意见)',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '用户收藏';


-- 收获地址
CREATE TABLE mt_user_fedex
(
	id int(11) NOT NULL COMMENT '主键',
	user_id bigint(11) NOT NULL COMMENT 'user_id',
	consignee varchar(50) NOT NULL COMMENT '收货人',
	mobile varchar(50) NOT NULL COMMENT '手机号',
	province varchar(50) NOT NULL COMMENT '省',
	city varchar(50) NOT NULL COMMENT '市',
	area varchar(50) NOT NULL COMMENT '地区',
	address varchar(255) NOT NULL COMMENT '地址',
	status int(5) NOT NULL COMMENT '1002-非默认 1020-默认',
	create_time datetime NOT NULL COMMENT '时间',
	PRIMARY KEY (id)
) COMMENT = '收获地址';


-- 会员级别
CREATE TABLE mt_user_grade
(
	user_id bigint(11) NOT NULL COMMENT '用户Id',
	integral bigint(11) NOT NULL COMMENT '积分',
	grade_name int(5) NOT NULL COMMENT '会员级别(2010-普,2011-白银,2012-黄金,2013-白金)',
	start_time datetime NOT NULL COMMENT '开始时间',
	end_time datetime NOT NULL COMMENT '结束时间',
	buy_count bigint(11) NOT NULL COMMENT '购买次数',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (user_id)
) COMMENT = '会员级别';



