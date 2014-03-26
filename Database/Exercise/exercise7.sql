CREATE SEQUENCE serialstudent START 1;
CREATE TABLE student(
	sid integer PRIMARY KEY DEFAULT nextval('serialstudent'),
	firstname varchar(15) NOT NULL,
	lastname varchar(30) NOT NULL,
	semester integer NOT NULL,
	birthdate varchar(30) NOT NULL
);

CREATE SEQUENCE serialtutor START 1;
CREATE TABLE tutor(
	tid integer PRIMARY KEY DEFAULT nextval('serialtutor'),
	firstname varchar(15) NOT NULL,
	lastname varchar(30) NOT NULL,
	issenior boolean NOT NULL
);

CREATE SEQUENCE serialstudygroup START 1;
CREATE TABLE studygroup(
	gid integer PRIMARY KEY DEFAULT nextval('serialstudygroup'),
	tid integer NOT NULL,
	weekday varchar(10),
	room varchar(30),
	starttime varchar(30),
	FOREIGN KEY(tid) REFERENCES tutor(tid)
);

CREATE SEQUENCE serialexercisesheet START 1;
CREATE TABLE exercisesheet(
	eid integer PRIMARY KEY DEFAULT nextval('serialexercisesheet'),
	maxpoints integer
);

CREATE TABLE handsin(
	sid integer,
	eid integer,
	achievedpoints integer,
	PRIMARY KEY(sid,eid),
	FOREIGN KEY(sid) REFERENCES student(sid),
	FOREIGN KEY(eid) REFERENCES exercisesheet(eid)
);

CREATE TABLE member(
	sid integer,
	gid integer,
	PRIMARY KEY(sid,gid),
	FOREIGN KEY(sid) REFERENCES student(sid),
	FOREIGN KEY(gid) references studygroup(gid)
);

INSERT INTO student (firstname, lastname, semester, birthdate) VALUES ('jens','thiesson',6,'24-12-1992');
INSERT INTO tutor (firstname,lastname,issenior) VALUES ('Lasse', 'Carlsson',true)

INSERT INTO studygroup (tid) VALUES ((SELECT tid FROM tutor WHERE firstname = 'Lasse'))

INSERT INTO exercisesheet(maxpoints) VALUES (100)

INSERT INTO handsin (sid,eid,achievedpoints) VALUES ((SELECT sid FROM student WHERE firstname = 'jens'),(SELECT eid FROM exercisesheet WHERE maxpoints = 100), 90)

INSERT INTO member (sid,gid) VALUES ((SELECT sid FROM student WHERE firstname = 'jens'), 1)

UPDATE student SET firstname = 'JENS' WHERE lastname = 'Doe';

DELETE FROM student WHERE firstname = 'Tom';

SELECT firstname, lastname FROM student WHERE semester >= 2 and semester <= 4;

SELECT DISTINCT firstname FROM (SELECT firstname, lastname FROM student UNION SELECT firstname,lastname FROM tutor) AS foo WHERE lastname LIKE 'P%';

SELECT issenior FROM tutor WHERE tid = (SELECT tid FROM studygroup WHERE gid = 1);

