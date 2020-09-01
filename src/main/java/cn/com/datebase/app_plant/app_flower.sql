SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS flower_article_comment;
DROP TABLE IF EXISTS flower_content;
DROP TABLE IF EXISTS flower_user_article;
DROP TABLE IF EXISTS flower_user_relation;




/* Create Tables */

-- 文章评论
CREATE TABLE flower_article_comment
(
	id int(11) NOT NULL COMMENT '主键',
	article_id int(11) NOT NULL COMMENT '文章Id',
	user_id int(11) NOT NULL COMMENT '用户Id',
	user_name varchar(50) NOT NULL COMMENT '用户名称',
	comment_content varchar(200) NOT NULL COMMENT '评论内容',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '文章评论';


-- 种花推送
CREATE TABLE flower_content
(
	id int(11) NOT NULL COMMENT '主键',
	title varchar(50) NOT NULL COMMENT '标题',
	brief_info varchar(100) NOT NULL COMMENT '摘要',
	info_image varchar(100) NOT NULL COMMENT '图片',
	content text NOT NULL COMMENT '内容',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '种花推送';


-- 用户文章发送
CREATE TABLE flower_user_article
(
	id int(11) NOT NULL COMMENT '主键',
	user_id int(11) NOT NULL COMMENT '用户Id',
	article_content varchar(50) NOT NULL COMMENT '文章内容',
	article_image varchar(200) NOT NULL COMMENT '文章图片',
	likes_amount int(11) NOT NULL COMMENT '点赞总数',
	comment_amount int(11) NOT NULL COMMENT '评论总数',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '用户文章发送';


-- 用户关注
CREATE TABLE flower_user_relation
(
	id int(11) NOT NULL COMMENT '主键',
	user_id int(11) NOT NULL COMMENT '用户Id',
	parent_id  int(11) NOT NULL COMMENT '父级id',
	create_time datetime NOT NULL COMMENT '创建时间',
	PRIMARY KEY (id)
) COMMENT = '用户关注';



