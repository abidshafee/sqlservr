use [Abid]
go

--Inserting data into Student Table
insert into Student values
(3456330,'Shafekul Abid','Abid@',31,3.41),
(3456331,'Abid Shafee','Shafee@29',29,3.61);

-- Inserting multiple Values
insert into Student values
(3456331,'Rasibul Karim','Rasib@kst',32,3.21),
(3456332,'Abid Shafee','Shafee@29',29,3.61);

select * from Student;

-- Deleting Duplicated item in student table
DELETE FROM [dbo].[Student]
      WHERE name='Rafiq Alam'
GO

-- updating data in student table
update dbo.student set login='nobin@'
where login='nobin@g'

--Set sid col as Primary key of the Student table
alter table Student add primary key (sid);

-- Creating Course table
create table Course 
(
	cid varchar(20) not null,
	name varchar(50) not null,

	primary key(cid)
);
select * from Course;

insert into Course values(
	'15-447', 'SQL Server Management Studio'
);

-- Creating table enrolled with foreign table contrint
Create Table enrolled
(
	sid int,
	cid varchar(20),
	grade varchar(20)

	Foreign key (sid) references student(sid),
	Foreign key (cid) references course(cid)
);
select * from enrolled;
select * from Student;
select * from Course;

insert into enrolled values(3456330, '15-447', 'A');
insert into enrolled values(3456329, '15-447', 'A-');
insert into enrolled values(3456329, '15-446', 'B+');
insert into enrolled values(3456329, '15-445', 'A-');
insert into enrolled values(3456327, '15-445', 'B-');
insert into enrolled values(3456327, '15-446', 'A-');
insert into enrolled values(3456327, '15-447', 'A+');

-- Seecting destinct items in course table
select distinct(grade) from enrolled;

-- query from multiple table
select s.sid, s.name, c.Subject, e.grade from enrolled e 
inner join student s on s.sid=e.sid 
inner join course c on c.cid=e.cid;

-- Nested Query
select * from Student
where age = (select max(age) from Student)

select * from Student
where age = (select min(age) from Student)

select * from Student
where gpa = (select min(gpa) from Student)