DROP table checklist PURGE ;
CREATE table checklist (

  studynum int ,
  num int ,
  boardid VARCHAR2(100)  ,
  reader VARCHAR2(100)  ,
  readerposition VARCHAR2(100)  ,
  readdate DATE not null

);
SELECT *
FROM checklist;