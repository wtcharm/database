SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS xintu_info;




/* Create Tables */

-- 星图信息
CREATE TABLE xintu_info
(
	id varchar(50) NOT NULL COMMENT '主键',
	short_id varchar(50) NOT NULL COMMENT '用户id',
	nick_name varchar(100) NOT NULL COMMENT '用户名称',
	avatar_uri varchar(255) NOT NULL COMMENT '头像',
	xt_type varchar(20) NOT NULL COMMENT '抓取类型',
	expected_play_num int(11) NOT NULL COMMENT '预期播放量',
	follower int(11) NOT NULL COMMENT '粉丝量',
	expected_cpm double NOT NULL COMMENT '预期Cpm',
	price_dtos varchar(255) NOT NULL COMMENT '价格',
	video_finish_play varchar(50) NOT NULL COMMENT '完播率',
	min_video_play varchar(50) NOT NULL COMMENT '最低播放',
	max_video_play varchar(50) NOT NULL COMMENT '最高播放',
	values_dtos varchar(255) NOT NULL COMMENT '性别和比例',
	dt_url varchar(100) NOT NULL COMMENT '详情图片',
	fs_url varchar(100) NOT NULL COMMENT '粉丝图片地址',
	bf_url varchar(100) NOT NULL COMMENT '播放url',
	bf_num varchar(100) NOT NULL COMMENT '播放图片解析',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '星图信息';



