/*FOR THEORY*/
/*BASIC TERMINOLOGIES
DBMS
DATA
RECORDS
FIELDS
SUPER KEY
CANDIDATE KEY
BUSINESS KEY
PRIMARY KEY
FOREIGN KEY*/
/*WHAT IS DEPENDENCIES AND ITS TYPES*/
/* WHAT IS NORMALIZATION AND ITS TYPES*/
/*ENTITY RELATIONSHIP DIAGRAM*/

/*CREATING DATABASE*/

create database paper;

/*USE DATABASE*/
use paper;

/*CREATING A TABLE*/
create table student(
first_name varchar(20) not null,
last_name varchar(20) not null,
date_of_birth date not null,
seat_number varchar(15),
joining_date date not null,
fees int,
primary key (seat_number)
);

create table teacher(
first_name varchar(20) not null,
last_name varchar(20) not null,
date_of_birth date not null,
cnic_number varchar(15),
joining_date date not null,
salary int,
seat_number varchar(15),
primary key (cnic_number),
foreign key (seat_number) references student(seat_number)
);



/*INSERTING VALUES IN A TABLE*/
insert into student values("hasham","uddin","2000-09-07","eb20103038","2021-01-17",2500,55);
insert into student values("azhar","uddin","2001-09-07","eb20103039","2020-01-17",3500,65);
insert into student values("hammad","khan","2000-04-07","eb20103040","2021-09-17",4500,53);
insert into student values("bilal","ali","2000-06-07","eb20103041","2021-10-17",5500,51);
insert into student values("zubair","ahmed","2001-08-08","eb20103042","2020-12-17",6500,88);
insert into student values("bilal","ali","2000-06-07","eb20103045","2021-10-17",5500,51);
insert into student values("zubair","ahmed","2001-08-08","eb20103046","2020-12-17",6500,88);

insert into teacher values("hasham","uddin","2000-09-07","42101","2021-01-17",2500,"eb20103038");
insert into teacher values("azhar","uddin","2001-09-07","42102","2020-01-17",3500,"eb20103039");
insert into teacher values("hammad","khan","2000-04-07","42103","2021-09-17",4500,"eb20103040");
insert into teacher values("bilal","ali","2000-06-07","42104","2021-10-17",5500,"eb20103041");
insert into teacher values("zubair","ahmed","2001-08-08","42105","2020-12-17",6500,"eb20103042");

/*DELETE THE TABLE*/
drop table student;

/*DELETE ALL THE VALUES OF TABLE*/
truncate table student;

/*VIEW ALL THE RECORDS AND VALUES*/
select * from student;

/*VIEW THE DISTANCT LAST NAME*/


/*TO VIEW PARTICULAR COLUMN*/
select first_name,last_name from student;

/*UPDATE THE VALUE FROM A TABLE*/
update student set first_name="kamran" where seat_number="eb20103042";

/*UPDATION IN MULTIPLE RECORDS*/
update student set joining_date ="1999-03-21";

/*ALTER THE TABLE*/
/*ADD THE NEW COLUMN*/
alter table student add attendance int;

/*TO DROP A COLUMN*/
alter table student drop column attendance;

/*TO CHANGE DATA TYPE OF A COLUMN*/
alter table student modify column attendance varchar(20);

/*TO RENAME THE COLUMN*/
alter table student rename column attendance to Attendance;

/*ORDER QUIRY FOR SORT THE COLUMN*/
select * from student order by first_name;

/*DESCENDING ORDER*/
select * from student order by first_name desc;

/*WHERE CLAUSE*/
select * from student where date_of_birth<"2001-01-01";
select count(*) from student where fees>3500;

/*IS NULL*/
select * from student where first_name is null;

/*IS NOT NULL*/
select * from student where first_name is not null;

/*DELETE ANY RECORD*/
delete from student where first_name="hasham";

/*DETE ALL RECORDS*/
delete from student;

/*VIEW STARTING 3 RECORDS*/
select * from student limit 3;

/*MIN VALUE*/
select min(Attendance) as LOW_ATTENDANCE from student;

/*MAX VALUE*/
select max(Attendance) as HIGH_ATTENDANCE from student;

/*COUNT*/
select count(*) as TOTAL_ROWS from student;

/*SUM*/
select sum(Attendance) as SUMMATION_ATTENDANCE from student;

/*AVERAGE*/
select avg(Attendance) as AVG_ATTENDANCE from student;

/*LIKE*/
/*SELECT THOSE RECORDS FIRST NAME START FROM A*/
select * from student where first_name like "a%";

/*SELECT THOSE RECORDS FIRST NAME ENDS FROM M*/
select * from student where first_name like "%m";

/*SELECT THOSE RECORDS FIRST NAME CONTAIN A IN MID*/
select * from student where first_name like "%a%";

/*SELECT THOSE RECORDS FIRST NAME SECOND CHARACTER IS A*/
select * from student where first_name like "_a%";

/*SELECT THOSE RECORDS FIRST NAME STARTS FROM A AND HAVE LENGTH 5*/
select * from student where first_name like "a____%";

/*SELECT THOSE RECORDS FIRST STARTS WITH A AND ENDS WITH r*/
select * from student where first_name like "a%r";

/*ALIAS*/
select first_name as stud_name from student;

/*CREATING VIEW */
create view demo as select * from student limit 2;

/*SELECT QUERY IN VIEW*/
select * from demo;

/*TO SEE THE CHARACTERISTICS OF VIEW*/
show create view demo;

/*DROPING A VIEW*/
drop view demo;

/*UPPARCASE*/
select UPPER("pakistan");

/*LOWERCASE*/
select LOWER("PAKISTAN");

/*CURRENT TIME*/
SELECT CURRENT_TIME;

/*CURRENT DATE*/
SELECT CURRENT_DATE;

/*IDENTIFY A WEEK OF A GIVEN DATE*/
SELECT WEEK('2009-05-18');


create table staff(
staff_id int,
staff_name varchar(20),
primary key(staff_id)
);

insert into staff values(1101,"teacher");
insert into staff values(1102,"teacher");
insert into staff values(1103,"peon");
insert into staff values(1104,"peon");
insert into staff values(1105,"peon");
insert into staff values(1106,"administrator");

/*HAVING CLAUSE*/
select * from staff group by staff_name having count(staff_name)>1;

/*IN STATEMENT*/
select * from student where seat_number in ("eb20103038","eb20103041","eb20103040");

create table stud(
seat_number varchar(20),
first_name varchar(20),
last_name varchar(20)
);

insert into stud values("eb20103038","ali","akbar");
insert into stud values("eb20103040","ahmed","khan");
insert into stud values("eb20103039","kamran","ali");
insert into stud values("eb20103041","ahmed","khan");
insert into stud values("eb20103042","kamran","ali");
insert into stud values("eb20103043","kamran","ali");
insert into stud values("eb20103044","kamran","ali");

/*                         JOINS         */
/*INNER JOIN*/
select s.first_name,s.last_name,st.first_name,st.last_name,st.fees
from student as st
inner join stud as s
on s.seat_number=st.seat_number;

/*LEFT JOIN*/
select s.first_name,s.last_name,st.first_name,st.last_name,st.fees
from student as st
left join stud as s
on st.seat_number=s.seat_number;

/*RIGHT JOIN*/
select s.first_name,s.last_name,st.first_name,st.last_name,st.fees
from student as st
right join stud as s
on st.seat_number=s.seat_number;

/*AUTO INCREMENT*/
/*DEFAULT*/
create table demo1(
fname varchar(20) default "hasham",
id int not null auto_increment,
primary key (id)
);

/*UNION*/
/*DUPLICATE IS PRINT ONLY ONE TIME*/
select seat_number from stud
union
select seat_number from student;

/*UNION ALL*/
/*To allow duplicate values*/
select seat_number from stud
union all
select seat_number from student;

/*CASE*/
select seat_number,fees,
case
when fees<=4000  then "IT IS SMALL AMOUNT"
when fees>4000  then "IT IS LARGE AMOUNT"
END as FEES_CHECKING
from student;

select seat_number,fees,
case
when fees>4000  then "IT IS LARGE AMOUNT"
else "GOOD VALUE"
END as FEES_CHECKING
from student;

/*COMMIT*/
/*ROLLBACK*/

select * from student;

commit;
update student set last_name="khan" where seat_number="eb20103038";

update student set last_name="khan" where seat_number="eb20103039";

rollback;

/*SUBQUERY*/
select first_name,last_name from student 
where seat_number =(select seat_number from stud where seat_number="eb20103039");

select first_name,last_name from student 
where seat_number in (select seat_number from stud where seat_number in ("eb20103039","eb20103041"));

/*TRIGGERS*/
CREATE TRIGGER before_stud_update 
    after UPDATE ON student
    FOR EACH ROW 
 INSERT INTO stud
 SET action = 'update',
      seat_number= null,
     changedat = NOW();
     
show triggers;

/*TO SEE ALL THE TABLES*/
show tables;


