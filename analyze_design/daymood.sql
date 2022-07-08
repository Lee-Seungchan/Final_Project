use daymood;

/* Create Tables */

CREATE TABLE User
(
	user_no 					int 			NOT NULL 		AUTO_INCREMENT,
	username 					varchar(30) 	NOT NULL,
	email 						varchar(30) 	NOT NULL,
	password 					varchar(20) 	NOT NULL,
	nation 						varchar(15) 	NOT NULL,
	createDate 					timestamp 		NOT NULL,
	role 						varchar(10) 	NOT NULL,
	PRIMARY KEY (user_no),
	UNIQUE (email)
);

CREATE TABLE Board
(
	board_no 					int 			NOT NULL 		AUTO_INCREMENT,
	user_no 					int 			NOT NULL,
	nation 						varchar(10) 	NOT NULL,
	author 						varchar(30) 	NOT NULL,
	reply_cnt 					int 			NOT NULL		default 0,
	title 						varchar(50) 	NOT NULL,
	content 					varchar(10000) 	NOT NULL,
	view_cnt 					int 			NOT NULL 		default 0,
	recommend_cnt 				int 			NOT NULL		default 0,
	create_date 				timestamp 		NOT NULL,
	weather_category 			varchar(10)		check(weather_category in('맑음', '흐림', '비')),
	recommend_category 			varchar(10)		check(recommend_category in('영화', '도서', '음악')),
	info_category 				varchar(10),
	PRIMARY KEY (board_no),
    FOREIGN KEY (user) REFERENCES User(user_no)
);

CREATE TABLE Reply
(
	reply_no 					int 			NOT NULL 		AUTO_INCREMENT,
	user_no 					int 			NOT NULL,
	board_no 					int 			NOT NULL,
	content 					varchar(500) 	NOT NULL,
	create_date 				timestamp 		NOT NULL,
	reply_cnt 					int 			NOT NULL		default 0,
	PRIMARY KEY (reply_no),
    FOREIGN KEY (board_no) REFERENCES Board (board_no)
);

CREATE TABLE Letter
(
	letter_no 					int 			NOT NULL 		AUTO_INCREMENT,
	user_no 					int 			NOT NULL,
	title 						varchar(50) 	NOT NULL,
	content 					varchar(500) 	NOT NULL,
	receiver 					varchar(20) 	NOT NULL,
	sender 						varchar(20) 	NOT NULL,
	receive_time 				timestamp 		NOT NULL,
	send_time 					timestamp 		NOT NULL,
	read_check 					int 			NOT NULL,
	PRIMARY KEY (letter_no),
    FOREIGN KEY (user_no) REFERENCES User (user_no)
);

CREATE TABLE Scrap
(
	user_no					   	int 			NOT NULL,
	scrap_no 					int 			NOT NULL 		AUTO_INCREMENT,
	board_no 					int 			NOT NULL,
	PRIMARY KEY (scrapno),
    FOREIGN KEY (board_no) REFERENCES Board (board_no)
);

CREATE TABLE Friend
(
	friend_no 					int 			NOT NULL 		AUTO_INCREMENT,
	user_no 					int 			NOT NULL,
	PRIMARY KEY (friend_no),
    FOREIGN KEY (user_no) REFERENCES User (user_no)
);

CREATE TABLE RequestFriend
(
	request_frinen_no 			int 			NOT NULL 		AUTO_INCREMENT,
	user_no 					int 			NOT NULL,
	f_id 						varchar(20) 	NOT NULL,
	t_id 						varchar(20) 	NOT NULL,
	PRIMARY KEY (request_frinen_no),
    FOREIGN KEY (user_no) REFERENCES User (user_no)
);