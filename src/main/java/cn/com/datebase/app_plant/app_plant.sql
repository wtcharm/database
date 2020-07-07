SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS app_info;
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS app_user_site;




/* Create Tables */

-- app_info
CREATE TABLE app_info
(
	id int(11) NOT NULL COMMENT '主键',
	app_name varchar(50) NOT NULL COMMENT 'app名称',
	app_store_id varchar(20) NOT NULL COMMENT '应用商城id',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (id)
) COMMENT = 'app_info';


-- 应用用户
CREATE TABLE app_user
(
	id int(11) NOT NULL COMMENT '主键',
	user_phone varchar(50) NOT NULL COMMENT '用户手机号',
	app_id int(11) NOT NULL COMMENT 'appId',
	idfa varchar(50) NOT NULL COMMENT 'idfa',
	udid varchar(50) NOT NULL COMMENT 'udid',
	osn varchar(50) NOT NULL COMMENT '设备名称',
	osv varchar(50) NOT NULL COMMENT '系统版本号',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (id)
) COMMENT = '应用用户';


-- 用户的地理位置
CREATE TABLE app_user_site
(
	id int(11) NOT NULL COMMENT '主键',
	app_id int(11) NOT NULL COMMENT 'appId',
	user_id int(11) NOT NULL COMMENT '用户Id',
	user_site varchar(100) NOT NULL COMMENT '用户位置',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (id)
) COMMENT = '用户的地理位置';



