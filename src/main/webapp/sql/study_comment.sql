DROP table studycomment PURGE ;
CREATE table studycomment (

  studynum int ,
  num int ,
  boardid VARCHAR2(100)  ,
  writer VARCHAR2(100)  ,
  profile VARCHAR2(100)  ,
  content VARCHAR2(3000) ,
  commentdate DATE not null

);
SELECT *
FROM studycomment;