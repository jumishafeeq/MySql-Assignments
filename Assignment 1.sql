create database SCHOOL;

use School;

create table STUDENT(
Roll_No int auto_increment primary key ,
Name_ varchar(30) not null,
Marks int not null check (Marks<=100),
Grade varchar(5)
);
desc STUDENT;

insert into STUDENT (Roll_No, Name_, Marks, Grade)
values
(1, 'Alice', 85, 'A'),
(2, 'Ram', 70, 'B'),
(3, 'David', 92, 'A+'),
(4, 'Rose', 55, 'C+'),
(5, 'Mary', 80, 'B+');

select * from STUDENT;

alter table STUDENT add Contact varchar(15) unique;

alter table STUDENT drop Grade;

rename table STUDENT to CLASSTEN;

truncate table CLASSTEN;

drop table CLASSTEN;