SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS chant_Income;
DROP TABLE IF EXISTS chant_money;
DROP TABLE IF EXISTS chant_music;
DROP TABLE IF EXISTS chant_task;
DROP TABLE IF EXISTS chant_wx;




/* Create Tables */

-- 猜歌收益表
CREATE TABLE chant_Income
(
	record_id int(11) NOT NULL COMMENT '主键',
	user_id int(11) NOT NULL COMMENT '用户id',
	Income_money decimal(10,4) NOT NULL COMMENT '收益金额',
	money_type int(5) NOT NULL COMMENT '收益类型(3101-金钱,3110-金币)',
	source_name varchar(100) NOT NULL COMMENT '来源名称(音乐或者任务)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (record_id)
) COMMENT = '猜歌收益表';


-- 猜歌金额
CREATE TABLE chant_money
(
	money_id int(11) NOT NULL COMMENT '金额Id',
	user_id int(11) NOT NULL COMMENT '用户id',
	total_money decimal(10,4) NOT NULL COMMENT '总金额',
	total_gold decimal(10,4) NOT NULL COMMENT '总金币',
	withdraw_money decimal(10,4) NOT NULL COMMENT '提现金额',
	total_task_amount int(5) NOT NULL COMMENT '总任务数',
	total_right_amount int(5) NOT NULL COMMENT '正确任务数',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (money_id)
) COMMENT = '猜歌金额';


-- 音乐数据
CREATE TABLE chant_music
(
	music_id int(11) NOT NULL COMMENT '音乐主键',
	music_name varchar(100) NOT NULL COMMENT '音乐名称',
	music_url varchar(100) NOT NULL COMMENT '音乐播放地址',
	music_choice varchar(255) NOT NULL COMMENT '音乐备选(json选择项)',
	music_grade int(5) NOT NULL COMMENT '音乐级别(3120-0级,3121-1级)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (music_id)
) COMMENT = '音乐数据';


-- 任务
CREATE TABLE chant_task
(
	task_id int(11) NOT NULL COMMENT '任务Id',
	task_name varchar(100) NOT NULL COMMENT '任务名称',
	task_limit int(5) NOT NULL COMMENT '任务上限',
	task_money decimal(10,4) NOT NULL COMMENT '任务金额',
	task_image varchar(100) NOT NULL COMMENT '任务图片',
	task_type int(5) NOT NULL COMMENT '任务类型(3102-猜歌,3120-每日)',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (task_id)
) COMMENT = '任务';


-- 微信信息
CREATE TABLE chant_wx
(
	wx_id int(11) NOT NULL COMMENT '微信主键',
	user_id int(11) NOT NULL COMMENT '用户Id',
	wx_name varchar(100) NOT NULL COMMENT '微信名称-加密',
	wx_image varchar(100) NOT NULL COMMENT '微信图片',
	open_id varchar(50) NOT NULL COMMENT '微信用户主键',
	create_time datetime NOT NULL COMMENT '创建时间',
	update_time datetime NOT NULL COMMENT '修改时间',
	PRIMARY KEY (wx_id)
) COMMENT = '微信信息';



