SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS app_info;
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS app_user_site;




/* Create Tables */

CREATE TABLE app_info
(
	id int(11) NOT NULL,
	app_name varchar(50) NOT NULL,
	app_store_id varchar(20) NOT NULL,
	create_time datetime NOT NULL,
	update_time datetime NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE app_user
(
	id  NOT NULL,
	user_phone varchar(50) NOT NULL,
	app_id int(11) NOT NULL,
	idfa varchar(50) NOT NULL,
	udid varchar(50) NOT NULL,
	osn varchar(50) NOT NULL,
	osv varchar(50) NOT NULL,
	create_time datetime NOT NULL,
	update_time datetime NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE app_user_site
(
	id int(11) NOT NULL,
	app_id int(11) NOT NULL,
	user_id int(11) NOT NULL,
	user_site varchar(100) NOT NULL,
	create_time datetime NOT NULL,
	update_time datetime NOT NULL,
	PRIMARY KEY (id)
);



