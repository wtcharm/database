SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS app_quick_base;
DROP TABLE IF EXISTS record_history;




/* Create Tables */

-- 快速任务返回
CREATE TABLE app_quick_base
(
	id varchar(50) NOT NULL COMMENT '主键',
	app_click_num varchar(20) NOT NULL COMMENT '任务表',
	app_click_id int(11) NOT NULL COMMENT '任务表Id',
	idfa varchar(100) NOT NULL COMMENT 'idfa',
	crate_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '快速任务返回';


-- 记录访问历史
CREATE TABLE record_history
(
	record_id int NOT NULL COMMENT '记录Id',
	app_id int(11) NOT NULL COMMENT '应用Id',
	app_name varchar(100) NOT NULL COMMENT '应用名称',
	idfa varchar(100) NOT NULL COMMENT 'idfa地址',
	ip varchar(100) NOT NULL COMMENT '请求Ip地址',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (record_id)
) COMMENT = '记录访问历史';



