drop table member

create table member(

  num int not null ,

  memberId VARCHAR2(100) PRIMARY KEY  not null,
  passwd VARCHAR2(100) not null,
  nickName VARCHAR2(100) not null,
  passwdq VARCHAR2(100) not null,
  passwdkey VARCHAR2(100) not null,
  joinDate DATE NOT NULL ,
  lastDate DATE NOT NULL )
  select * from member
  CREATE SEQUENCE memberSer

select * from member
  CREATE SEQUENCE memberSer
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE ;

COMMIT;

select * from member