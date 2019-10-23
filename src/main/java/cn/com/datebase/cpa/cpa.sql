SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS cpa_ask;
DROP TABLE IF EXISTS cpa_track;
DROP TABLE IF EXISTS up_channel;




/* Create Tables */

-- 验证判定

CREATE TABLE cpa_ask
(
	ask_id varchar(50) NOT NULL COMMENT '验证Id',
	app_os int(5) NOT NULL COMMENT '0-android, 1: ios, 2: windowsphone, 3: other',
	idfa varchar(50) NOT NULL COMMENT 'ios独有',
	imei varchar(50) NOT NULL COMMENT '安卓标识',
	imsi varchar(50) NOT NULL COMMENT '安卓独有',
	ip varchar(50) NOT NULL COMMENT '访问iP',
	channel varchar(50) NOT NULL COMMENT '渠道数据',
	adid varchar(50) NOT NULL COMMENT '广告id',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	resp varchar(500) NOT NULL COMMENT '相应数据',
	PRIMARY KEY (ask_id)
) COMMENT = '验证判定';


-- 淘宝反馈
CREATE TABLE cpa_track
(
	track_id varchar(50) NOT NULL COMMENT 'track_id',
	channel varchar(50) NOT NULL COMMENT '渠道标识',
	adid varchar(50) NOT NULL COMMENT '广告Id',
	trace_id varchar(50) NOT NULL COMMENT '出价信息',
	app_os int(5) NOT NULL COMMENT '0:android, 1:ios, 2: windowsphone, 3: other',
	imei varchar(50) NOT NULL COMMENT '安卓标识',
	idfa varchar(50) NOT NULL COMMENT 'ios标识',
	action_code int(5) NOT NULL COMMENT '1-媒体在用户看到广告时调用,2-媒体在用户点击广告时调用',
	resp varchar(100) NOT NULL COMMENT '返回数据',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (track_id)
) COMMENT = '淘宝反馈';


-- 下游渠道
CREATE TABLE up_channel
(
	id varchar(50) NOT NULL COMMENT '主键',
	name varchar(50) NOT NULL COMMENT '渠道名称',
	channel_id varchar(50) NOT NULL COMMENT '分配的渠道Id',
	qd_channel varchar(50) NOT NULL COMMENT '自己的渠道Id',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '下游渠道';



