SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS record_history;

/* Create Tables */

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



