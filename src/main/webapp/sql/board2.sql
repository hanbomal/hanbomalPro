  drop table board2

create table board2(

 num int PRIMARY KEY ,
 writer VARCHAR2(100) ,
  subject varchar2(100),
  content varchar2(3000),


  ref int not null,
  re_step int not null,
  re_level int not null,

  regdate date not null,
  readcount int,

 filename VARCHAR2(100) ,
  filesize INT



)
select * from  board2

drop sequence board2Ser
create sequence board2Ser
  start with 1
  increment by 1
  NOMAXVALUE
  NOCYCLE ;