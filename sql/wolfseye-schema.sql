##create database wolfseye;
##grant all privileges on wolfseye.* to wolfseye@localhost identified by 'wolfseye' with grant option;

drop table c_admin;
drop table c_contact;
drop table cs_connection_test;

create table c_admin
(
	pwd								varchar(1000)  			not null
);
## give pwd 123456 as default
insert into c_admin (pwd) values ('E10ADC3949BA59ABBE56E057F20F883E');

create table c_contact
(
	id 								int auto_increment 		not null,
	name							varchar(1000)  					,
	email							varchar(1000)					,
	phone							varchar(1000)					,
	content							text							,
	update_date						datetime				not null,
	create_date						datetime				not null,
	is_open							boolean					not null,
	is_reply						boolean					not null,
	sort_id							int						not null,
	primary key(id)													
);

################################# 展示型页面 [开始] #################################

drop table c_prd;
create table c_prd  ##[产品]{fa fa-code-fork}
(
	id 								int auto_increment 		not null,	
	today_image						varchar(500)  			not null,				##[日内回顾图片]{i,768,768}
	more_today_images				varchar(500)  			not null,				##[日内回顾更多图片]{m,768,768}
	predict_image					varchar(500)  			not null,				##[日后前瞻图片]{i,768,768}
	more_predict_images				varchar(500)  			not null,				##[日后前瞻更多图片]{m,768,768}
	alert_level						int						not null,				##@[交通灯预警]{ALERT_LEVEL_1,ALERT_LEVEL_2,ALERT_LEVEL_3}
	hold_percentage					int						not null,				##!$@[持仓比例]
	notification					varchar(500)  			not null,				##@[操作提示]{t}
	show_date						datetime				not null,				##@[公示日期]{d}
	display							boolean					not null,				##@[是否显示]
	update_date						datetime				not null,
	create_date						datetime				not null,
	sort_id							int						not null	default 0,	##[排列序号]
	primary key(id)															
);

create table cs_connection_test
(
	val						int						not null
);

insert into cs_connection_test(val) values (1);

################################# 展示型页面 [结束] #################################
