# NVL, NVL2
select nvl(e.salary,9999) as mgr,e.* from hr.employees_shruti e where e.employee_id = 100
select name,NVL2(id,2,3) as p_id from persons;
#Coalesce
select coalesce(e.manager_id,9999) as mgr,e.* from hr.employees_shruti e where e.employee_id = 100

# Find current user
show user;

# Pseudo table in Oracle
select * from dual

# Sample Table
create table persons (id int primary key not null,name varchar(50));
create table ead (
id int ,
ssn varchar(50),
name_id int, CONSTRAINT fk foreign key (name_id) references persons(id)
);
insert into persons values(04,'sati');
insert into persons values (05,'sailu');
insert into persons values (00,'sarayu');
insert into ead values(3,'555-3678',04);
insert into ead values (4,'555-3676',05);

# Delete, Rollback, Update, Alter
delete from ead where name_id = 4;
rollback;
update ead set ssn= null where name_id=4;
alter table ead add constraint i primary key (id);

# To run a query from command line
--echo select employee_id,first_name,last_name from HR.EMPLOYEES where employee_id = 100; | sqlplus hr/sailendra@localhost:1521/xe
# To run a script from command line
--sqlplus hr/sailendra@localhost:1521/xe < script.sql
# Contents of script.sql
# spool is to write output to a file, PAGESIZE is to suppress column names in the output for every 10 rows
/*
C:\Users\pinup>type script.sql
set PAGESIZE 10000;
spool test.csv
select employee_id,first_name,last_name from HR.EMPLOYEES where rownum < 20;
spool off;
*/
 
# Unlock OE schema with password "hello"
alter user oe identified by hello account unlock;