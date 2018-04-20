DROP table studyboard PURGE ;
CREATE table studyboard (
  num int PRIMARY KEY ,
  studynum VARCHAR2(100) not null,
  boardid VARCHAR2(100) not null,
  writer VARCHAR2(100) not null,
  subject VARCHAR2(100) not null,
  ref int not null,
  re_step int not null,
  re_level int not null,
  reg_date DATE,
  readcount INT,
  content VARCHAR2(3000) not null,
  filename VARCHAR2(100) ,
  filesize INT

);
SELECT *
FROM studyboard;

create sequence studyboardser
  start with 1
  increment by 1
  NOMAXVALUE
  NOCYCLE ;

