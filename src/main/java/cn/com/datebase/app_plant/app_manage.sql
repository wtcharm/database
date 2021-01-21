SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS app_manager;
DROP TABLE IF EXISTS manage_menus;
DROP TABLE IF EXISTS manage_privilege;




/* Create Tables */

-- 产品管理员
CREATE TABLE app_manager
(
	id int(5) NOT NULL COMMENT '主键',
	user_name varchar(50) NOT NULL COMMENT '用户名称',
	password varchar(50) NOT NULL COMMENT '密码',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '产品管理员';


-- 菜单表
CREATE TABLE manage_menus
(
	id int(5) NOT NULL COMMENT '主键',
	app_id int(11) NOT NULL COMMENT '产品Id',
	menus_name varchar(100) NOT NULL COMMENT '菜单名称',
	menus_tag int(5) NOT NULL COMMENT '菜单tag',
	PRIMARY KEY (id)
) COMMENT = '菜单表';


-- 管理员产品权限
CREATE TABLE manage_privilege
(
	id int(11) NOT NULL COMMENT '主键',
	user_id int(11) NOT NULL COMMENT '用户Id',
	app_id int(11) NOT NULL COMMENT '产品Id',
	PRIMARY KEY (id)
) COMMENT = '管理员产品权限';



