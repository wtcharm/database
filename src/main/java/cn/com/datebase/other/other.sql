SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS video_zan;




/* Create Tables */

-- video_zan
CREATE TABLE video_zan
(
	video_id  int NOT NULL COMMENT '小院视频ID',
	member_id int NOT NULL COMMENT '用户ID',
	state int NOT NULL COMMENT '状态'
) COMMENT = 'video_zan';



