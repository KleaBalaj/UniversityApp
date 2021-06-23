CREATE TABLE users (
	id serial primary key,
	users_name character varying(100) NOT NULL,
	surname character varying(100) NOT NULL,
	email character varying(100) NOT NULL,
	phone_number character varying(15) NOT NULL,
	gender char(1) NOT NULL,
	birthday date NOT NULL,
	profile_pic character varying NOT NULL,
	usersname character varying(20) NOT NULL,
	passwords character varying(64) NOT NULL,
	role_id int references users(id) NOT NULL
);

CREATE TABLE roles (
	id serial primary key,
	name character varying(20) NOT NULL
);

CREATE TABLE friends_request (
	id serial primary key,
	sender_id int references users(id) NOT NULL,
	receiver_id int references users(id) NOT NULL,
	status int NOT NULL
);

CREATE TABLE updates(
	id serial primary key,
	contents character varying(500) NOT NULL,
	like_nr int NOT NULL,
	users_id int references users(id) NOT NULL	
);

CREATE TABLE update_comment(
	id serial primary key,
	contents character varying (500) NOT NULL,
	like_nr int NOT NULL,
	update_id int references updates(id) NOT NULL,
	users_id int references users(id) NOT NULL	
);

CREATE TABLE update_comment_replay(
	id serial primary key,
	contents character varying (500) NOT NULL,
	like_nr int NOT NULL,
	update_comment_id int references update_comment(id) NOT NULL,
	users_id int references users(id) NOT NULL	
);

CREATE TABLE subject(
	id serial primary key,
	subject_name character varying NOT NULL,
	subject_type character varying NOT NULL	
);

CREATE TABLE course(
	id serial primary key,
	course_name character varying NOT NULL,
	subject_id int references subject(id) NOT NULL
);

CREATE TABLE course_users(
	users_id int references users(id) NOT NULL,
	course_id int references course(id) NOT NULL
);

CREATE TABLE calendar(
	id serial primary key,
	course_date timestamp without time zone NOT NULL,
	course_location character varying NOT NULL,
	lection character varying NOT NULL
);

CREATE TABLE course_calendar(
	calendar_id int references calendar(id) NOT NULL,
	course_id int references course(id) NOT NULL
);

CREATE TABLE  announcement(
	id serial primary key,
	content character varying(500) NOT NULL,
	like_nr int NOT NULL,
	course_id int references course(id) NOT NULL	
);

CREATE TABLE announcement_comment(
	id serial primary key,
	content character varying (500) NOT NULL,
	like_nr int NOT NULL,
	announcement_id int references announcement(id) NOT NULL,
	users_id int references users(id) NOT NULL	
);

CREATE TABLE announcement_comment_replay(
	id serial primary key,
	contents character varying (500) NOT NULL,
	like_nr int NOT NULL,
	announcement_comment_id int references announcement_comment(id) NOT NULL,
	users_id int references users(id) NOT NULL	
);

CREATE TABLE  course_comment(
	id serial primary key,
	contents character varying(500) NOT NULL,
	like_nr int NOT NULL,
	course_id int references course(id) NOT NULL,
	users_id int references users(id) NOT NULL		
);

CREATE TABLE course_comment_replay(
	id serial primary key,
	contents character varying (500) NOT NULL,
	like_nr int NOT NULL,
	course_comment_id int references course_comment(id) NOT NULL,
	users_id int references users(id) NOT NULL	
);

CREATE TABLE course_comment_replay_replay(
	id serial primary key,
	contents character varying (500) NOT NULL,
	like_nr int NOT NULL,
	course_comment_replay_id int references course_comment_replay(id) NOT NULL,
	users_id int references users(id) NOT NULL	
);
