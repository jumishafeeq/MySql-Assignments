create database Management;
use Management;

create table Managers(
Manager_Id int auto_increment primary key,
First_Name varchar(30) not null,
Last_Name varchar(30) not null,
DOB date not null,
Age int check (Age>18 and age<90),
Last_Update date default (current_date),
Gender char(1) check (Gender in ('M','F')),
Department varchar(30) not null,
Salary decimal(10,2) not null);

desc Managers;

insert into Managers (Manager_Id, First_Name, Last_Name, DOB, Age, Last_Update, Gender, Department, Salary)
values 
(1, 'John', 'Pual', '1985-05-15', 39, '2024-06-30', 'M', 'IT', 50000.00),
(2, 'Jane', 'Smith', '1990-03-22', 34, default, 'F', 'Finance', 32000.00),
(3, 'Samual', 'Jon', '1980-11-02', 44, '2023-12-30', 'M', 'HR', 56000.00),
(4, 'Emily', 'Davis', '1995-07-14', 29,'2023-06-30', 'F', 'HR', 25000.00),
(5, 'Robert', 'Taylor', '1978-09-09', 46, default, 'M', 'Sales', 50000.00),
(6, 'Aaliya', 'Wilson', '1992-12-30', 31, '2024-06-30', 'F', 'Sales', 34000.00),
(7, 'James', 'Allen', '1987-06-18', 37, default, 'M', 'Marketing', 60000.00),
(8, 'Sara', 'Jorge', '1998-01-25', 26, '2023-12-30', 'F', 'IT', 38000.00),
(9, 'David', 'Thomas', '1983-04-10', 41, '2024-06-30', 'M', 'Finance', 45000.00),
(10, 'Rose', 'Marry', '1996-08-20', 28, default, 'F', 'IT', 25000.00);

select * from Managers;

select Manager_Id, concat(First_Name,' ',Last_Name) as Name, DOB from Managers where Manager_Id = 1;

select Manager_Id, First_Name, Last_Name, Salary * 12 as Annuel_Income from Managers;

select * from Managers where First_Name <> 'Aaliya';

select * from Managers where Department = 'IT' and salary > 25000;

select * from Managers where salary between 10000 and 35000;
