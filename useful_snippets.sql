#create table
create table teacher(id int primary key,name varchar(20));
create table courses(c_id int primary key,name varchar(10),t_id int, foreign key fk_tid (t_id) references teacher(id));

# to change column datatype
alter table courses modify c_id int NOT NULL;
#add unique constarint
alter table students add unique u_s_id(id);
#delete primary key constraint
alter table students drop primary key;
#drop constraint
alter table students drop u_s_id;
#add index
alter table students add index i_id (id);
#drop index name
drop index i_id on students;
#add column
alter table students add column surname varchar(20) after id;
#drop column
alter table students drop column surname;
#nth highest salary
select name ,salary from employee e1 where (n-1)=(select count(distint(salary)) from employee e2 where e2.salary>e1.salary);#n=3 then 3rd high salary
#change sex in one line using CASE
update up set sex=case when 'm' then 'f' else  'm' end;
#"minus" and "not in" are present in mysql(A_B)
#Using "NOT IN" (mysql)
select id from test_a
where id not in
(select id from test_b);
#using "EXCEPT" in postgresql
select id from test_a
except
select id from test_b
#using "MINUS" in oracle sql
select id from test_a
minus
select id from test_b



#IFNULL:(MYSQL)
#(if bizphone is null select homephone or let ib be bizphone)
SELECT 
    c_name, ifnull(bizphone, homephone) phone
FROM
    contacts;
#NVL(oracle/plsql)
#if exp1 is not null, then the value of exp1 is returned; otherwise, the value of exp2 is returned
SELECT 
    c_name, nvl(bizphone, homephone) phone
FROM
    contacts;
 #NVL2
 #With the NVL2(exp1, exp2, exp3) function, if exp1 is not null, then exp2 is returned; otherwise, the value of exp3 is returned. 
 #Coalesce  
# COALESCE function takes two or more compatible arguments and returns the first argument that is not null.
SELECT 
    c_name, coalesce(bizphone, homephone,mobile,fax) phone
FROM
    contacts;
#isnull

#top 1 salary
select salary from employee order by salary desc limit 1;
#top2 salary
select max(salary)from employee where salary <(select salary from employee order by salary desc limit 1);
#top n salary
SELECT name, salary FROM Employee e1 WHERE (3-1) = (SELECT COUNT(DISTINCT salary) FROM Employee e2 WHERE e2.salary > e1.salary);
#top n salary(mysql)
select salary from employee order by salary desc limit n,s;#here n is nth highest and s denotes no or rows from nth row 
#partition by,rank,dense_rank

#using WITHOUT JOINS(A-B)
select a.id from test_a a inner join test_b b
on a.id=b.id where b.id is null;
#Using JOINS(A-B)
select salary,name from employee where salary not in(
select salary from employee1);
    #(A-B) union (B-A) i.e A intersect B
select salary,name from employee where salary not in(
select salary from employee1)
union
select salary,name from employee1 where salary not in(
select salary from employee);
#(A-B)U(B-A)
select a.id from test_a a full outer join test_b b
on a.id=b.id where b.id is null or a.id is null;


#union
select salary,name from employee
union 
select salary,name from employee1;
#union all
select salary,name from employee
union all
select salary,name from employee1;

#SQL SELECT TOP Equivalent in MySQL and Oracle
#MYSQL
SELECT *
FROM Persons
LIMIT 5;
#oracle
SELECT *
FROM Persons
WHERE ROWNUM <= 5;
#SQL Server
SELECT TOP 5 * FROM Customers;

#Rank,Dense_rank
In cases where there is a “tie”,RANK() will assign non-consecutive “ranks” to the values in the set
DENSE_RANK() will assign consecutive ranks to the values in the set 