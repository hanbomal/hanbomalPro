DROP TABLE gallery;
CREATE TABLE gallery (
regdate date,
studynum number,
num number,
name varchar(20),
title varchar(50),
content varchar(3000),
filename varchar(100),
filesize number

);

create sequence gallSer
  start with 1
  increment by 1
  NOMAXVALUE
  NOCYCLE ;