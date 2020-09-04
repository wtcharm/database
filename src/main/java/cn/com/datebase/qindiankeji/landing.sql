SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS landing_commodity;
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



