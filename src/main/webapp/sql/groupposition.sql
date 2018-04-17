DROP table groupposition PURGE ;
CREATE table groupposition (
  studynum int ,
  groupposition VARCHAR2(100) NOT NULL,
  memberid VARCHAR2(100),
  id int PRIMARY KEY
  
);
SELECT *
FROM groupposition;
