SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS ep_goods;
DROP TABLE IF EXISTS ep_integral_trace;
DROP TABLE IF EXISTS ep_notice;
DROP TABLE IF EXISTS ep_order;
DROP TABLE IF EXISTS ep_sa_user;
DROP TABLE IF EXISTS ep_user;
DROP TABLE IF EXISTS ep_user_grade;
DROP TABLE IF EXISTS ep_user_info;




/* Create Tables */

CREATE TABLE ep_goods
(
	ep_goods_id varchar(50) NOT NULL,
	ep_goods_name varchar(50) NOT NULL,
	ep_goods_image varchar(100) NOT NULL,
	ep_goods_price decimal(10,4) NOT NULL,
	ep_goods_amount int(5) NOT NULL,
	ep_goods_describe varchar(255) NOT NULL,
	status int(5) NOT NULL,
	create_time datetime NOT NULL,
	update_time datetime NOT NULL,
	dr int(5) NOT NULL,
	PRIMARY KEY (ep_goods_id)
);


CREATE TABLE ep_integral_trace
(
	ep_integral_id varchar(50) NOT NULL,
	ep_user_id varchar(50) NOT NULL,
	ep_income_amount bigint NOT NULL,
	income_time datetime NOT NULL,
	status int(5) NOT NULL,
	create_time datetime NOT NULL,
	update_time datetime NOT NULL,
	dr int(5) NOT NULL,
	PRIMARY KEY (ep_integral_id)
);


CREATE TABLE ep_notice
(
	ep_notice_id varchar(50) NOT NULL,
	ep_notice_title varbinary(200) NOT NULL,
	ep_notice_content varchar(255) NOT NULL,
	status int(5) NOT NULL,
	create_time datetime NOT NULL,
	update_time datetime NOT NULL,
	dr int(5) NOT NULL,
	PRIMARY KEY (ep_notice_id)
);


CREATE TABLE ep_order
(
	ep_order_id varchar(50) NOT NULL,
	ep_user_id varchar(50) NOT NULL,
	ep_goods_id varchar(50) NOT NULL,
	ep_goods_amount varchar(50) NOT NULL,
	ep_user_info_id varchar(50) NOT NULL,
	status int(5) NOT NULL,
	create_time datetime NOT NULL,
	update_time datetime NOT NULL,
	dr int(5) NOT NULL,
	PRIMARY KEY (ep_order_id)
);


CREATE TABLE ep_sa_user
(
	ep_sa_id varchar(50) NOT NULL,
	ep_sa_name varchar(50) NOT NULL,
	ep_sa_phone varchar(50) NOT NULL,
	ep_sa_password varchar(50) NOT NULL,
	ep_sa_apply int(5) NOT NULL,
	status int(5) NOT NULL,
	create_time datetime NOT NULL,
	update_time datetime NOT NULL,
	dr int(5) NOT NULL,
	PRIMARY KEY (ep_sa_id)
);


CREATE TABLE ep_user
(
	ep_user_id varchar(50) NOT NULL,
	ep_user_name varchar(50) NOT NULL,
	ep_user_phone varchar(50) NOT NULL,
	ep_password varchar(50) NOT NULL,
	parent_id varchar(50) NOT NULL,
	income_time datetime NOT NULL,
	status int(5) NOT NULL,
	create_time datetime NOT NULL,
	update_time datetime NOT NULL,
	dr int(5) NOT NULL,
	PRIMARY KEY (ep_user_id)
);


CREATE TABLE ep_user_grade
(
	ep_grade_id varchar(50) NOT NULL,
	ep_user_id varchar(50) NOT NULL,
	ep_user_code varchar(50) NOT NULL,
	ep_group_code varchar(50) NOT NULL,
	ep_grade_name int(5) NOT NULL,
	ep_grade_integral bigint(50) NOT NULL,
	status int(5) NOT NULL,
	create_time datetime NOT NULL,
	update_time datetime NOT NULL,
	dr int(5) NOT NULL,
	PRIMARY KEY (ep_grade_id)
);


CREATE TABLE ep_user_info
(
	ep_user_info_id varchar(50) NOT NULL,
	ep_user_id varchar(50) NOT NULL,
	bank_number varchar(100) NOT NULL,
	bank_address varchar(100) NOT NULL,
	receiver_address varchar(50) NOT NULL,
	receiver_user varchar(50) NOT NULL,
	receiver_phone varchar(50) NOT NULL,
	status int(5) NOT NULL,
	create_time datetime NOT NULL,
	update_time datetime NOT NULL,
	dr int(5) NOT NULL,
	PRIMARY KEY (ep_user_info_id)
);



