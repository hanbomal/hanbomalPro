DROP table groupposition PURGE ;
CREATE table groupposition (
  studynum int ,
  groupposition VARCHAR2(100) NOT NULL,
  id int PRIMARY KEY
  
);
SELECT *
FROM groupposition;
