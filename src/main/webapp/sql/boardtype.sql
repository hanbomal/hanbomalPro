DROP table boardtype PURGE ;
CREATE table boardtype (
  studynum int NOT NULL ,
  boardid VARCHAR2(100) PRIMARY KEY ,
  boardname VARCHAR2(100) NOT NULL ,
  createdate Date not null
);
SELECT *
FROM boardtype;
drop SEQUENCE boardidser;
create SEQUENCE boardidser
   START WITH 1
  INCREMENT BY 1
  NOMAXVALUE ;