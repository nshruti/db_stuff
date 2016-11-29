CREATE INDEX:
create index phn_idx on employee(phone_number);
	#phn_idx :index name u created
	#employee:table name
	#phone_number:column name
	Index can be created for multiple columns

Types of index:
1.Bittree index:it used if qurey requires range like salaries
2.hash index :it is used mainly in "equal" operators and performs hash function
3.Bitmap:store data in '1' and '0'.used for genders

ALTERING SCHEMAS:
1.ADD COLUMN:
alter table person add column name varchar(50) not null after id#adds new column'name' after id
alter table person drop column name
2.ADD FOREIGN KEY:
create table book (id int primary key auto_increment, name varchar(50), library int)
create table library(id int auto_increment primary key, name varchar(50))
alter table book add constraint fk_book_library foreign key (library) references library(id)
alter table book drop foreign key fk_book_library
3.ADD INDEX:
alter table music add index idx_band(band)
alter table music drop index idx_band
4.ADD MULTIPLE INDEX:
alter table music add index idx_band(band,song)


VIEWS:
VIEW is a virtual table based on the resut set of sql statement.
field in view are fields from one or more tables in db

create table book(id int primary key auto_increment, name varchar(50) not null, notes varchar(100));

create view bookview as select id, name from book;#its a virtual table cant add index to view
show full tables;

select * from bookview LIMIT 0, 1000;
insert into bookview (id, name) values (2, "War and Peace");# inserting in view also updates table too
drop view view;









