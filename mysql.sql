# Source Data
use sakila;
drop table emp3;
create table emp3 (name varchar(4),id int,manid int);
insert into emp3 values ('a',1,2);
insert into emp3 values ('b',2,14);
insert into emp3 values ('c',3,null);
insert into emp3 values ('d',4,2);
insert into emp3 values ('e',14,3);
select * from emp3

# Oracle's NVL equivalent in mysql using coalesce
SELECT COALESCE(e.manid, 9999) AS mgr, e.* 
FROM   emp3 e 
WHERE  e.id = 3; 

# Oracle's NVL equivalent in mysql using IFNULL
SELECT Ifnull(e.manid, 2000) AS mgr, e.* 
FROM   emp3 e 
WHERE  e.id = 3; 

# Oracle DECODE equivalent using CASE
SELECT NAME, 
       CASE NAME 
         WHEN 'a' THEN'APPLE' 
         WHEN 'b' THEN 'BAC' 
         WHEN 'c' THEN 'CAT' 
         ELSE 'Unnkown' 
       END AS decoded 
FROM   emp3; 

# Oracle DECODE equivalent using ETL and FIELD
SELECT NAME, 
       Ifnull (Elt (Field (NAME, 'a', 'b', 'c'), 'APPLE', 'BAC', 'CAT'), 
       'Unknown') AS 
       decoded 
FROM   emp3; 