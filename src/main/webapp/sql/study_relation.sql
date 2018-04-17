DROP table studyrelation PURGE ;
CREATE table studyrelation(
  memberId VARCHAR2(100) not null,
  studynum VARCHAR2(100) not null,
  studyName VARCHAR2(100) not null,
  joinPoint INT,
  nickName VARCHAR2(100) ,
  joinDate DATE NOT NULL ,
  lastDate DATE NOT NULL ,
  position VARCHAR2(100),
  leader VARCHAR2(100) not null,
  status INT,
  photo varchar(50),
  rejectcount int
);
SELECT *
FROM studyrelation;