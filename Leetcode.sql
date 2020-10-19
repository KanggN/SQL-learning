create database Leetcode
use leetcode
-- Employees Earning More Than Their Managers  ------------------------------------------------------------------------------------------------  
create table Employee (
	Id int primary key,
	[Name] varchar (20),
	Salary int,
	ManagerId int foreign key references Employee(Id)
)
insert Employee(Id,Name,Salary) values (1,'Joe',70000)
insert Employee(Id,Name,Salary) values (2,'Henry',80000)
insert Employee(Id,Name,Salary) values (3,'Sam',60000)
insert Employee(Id,Name,Salary) values (4,'Max',90000)

select * from Employee
select A.* 
from Employee A join Employee B on A.ManagerId = B.id
where A.Salary > B.Salary --and A.ManagerId = B.id          ---->Dý

update Employee set Salary = 70000 where id =  1
update Employee set Salary = 100000 where id =  2
--Customers Who Never Order-------------------------------------------------------------------------------------------------------------------
create table Customers (
	Id int primary key,
	[Name] varchar (10)
)
create table Orders (
	Id int primary key,
	CustomerId int foreign key references Customers(Id)
)
insert Customers values (1,'Joe')
insert Customers values (2,'Henry')
insert Customers values (3,'Sam')
insert Customers values (4,'Max')
insert Orders values (1,3)
insert Orders values (2,1)

select c.Name Customers
from Customers c 
where c.Id not in (select CustomerId from Orders)

select * from Customers
select * from Orders
--Duplicate Emails -------------------------------------------------------------------------------------------------
create table Person(
	Id int primary key,
	Email varchar (10)
)
insert Person values (1,'a@b.com')
insert Person values (2,'b@b.com')
insert Person values (3,'a@b.com')
insert Person values (3,'a@b.com')
insert Person values (3,'a@b.com')

select Email from Person
group by Email
having count(Email) > 1
--Rising Temperature----------------------------------------------------------------------------------
create table Weather (
	Id int primary key,
	Recorddate date,
	Temperature int
)
insert Weather values (1,'2015-01-01',10)
insert Weather values (2,'2015-01-02',25)
insert Weather values (3,'2015-01-03',20)
insert Weather values (4,'2015-01-04',30)

select A.id
from Weather A join Weather B on dateadd(day,-1,A.Recorddate) = B.Recorddate
where A.Temperature > B.Temperature 




select * from Weather
