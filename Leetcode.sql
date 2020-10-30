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
where A.Salary > B.Salary --and A.ManagerId = B.id          ---->Dư

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
--Gameplay Analysis I-------------------------------------------------------------------------------------
create table Activity (
	player_id int,
	device_id int,
	event_date date,
	game_played int
	primary key (player_id, event_date)
)
alter table activity add primary key (player_id,event_date)
insert Activity values (1,2,'2016-03-01',5)
insert Activity values (1,2,'2016-05-02',6)
insert Activity values (2,3,'2017-06-25',1)
insert Activity values (3,1,'2016-03-02',0)
insert Activity values (3,4,'2018-07-03',5)

select player_id, min(event_date) first_login
from Activity
group by player_id
select * from Activity
--Gameplay Analysis II----------------------------------------------------
select a.player_id, a.device_id
from Activity a join (select player_id, min(event_date) first_login
from Activity
group by player_id) t on a.event_date = t.first_login
--Employee Bonus----------------------------------------------------------
drop table Employee
create table Employee (
	empId int primary key,
	[Name] varchar (20),
	Supervisor int,
	Salary int,
)
create table Bonus (
	empId int foreign key references Employee(empId),
	Bonus int ,
)
insert Employee values (1,'John',3,1000)
insert Employee values (2,'Dan',3,2000)
insert Employee values (3,'Brad',null,4000)
insert Employee values (4,'Thomas',3,4000)

insert Bonus values (2,500)
insert Bonus values (4,2000)

select e.empId,b.Bonus
from Employee e left join bonus b on e.empId = b.empId 
where e.empId not in 
(select empId from Bonus where Bonus >= 1000)
select * from Employee
select * from Bonus
--Find Customer Referee-----------------------------------------
drop table Orders
drop table Customers
create table Customer (
	Id int primary key,
	[Name] varchar (10),
	referee_id int
)
insert Customer values (1,'Will',null)
insert Customer values (2,'Jane',null)
insert Customer values (3,'Alex',2)
insert Customer values (4,'Bill',null)
insert Customer values (5,'Jack',1)
insert Customer values (6,'Mark',2)
select name 
from Customer 
where referee_id is null or referee_id <> 2
select * from Customer
--Customer Placing the Largest Number of Orders----------------------------------------------------------

create table Orders (
	order_number int,
	customer_number int,
	order_date date,
	required_date date,
	shipped_date date,
	[status] char(15),
	comment char(200)
	constraint PK_Orders primary key(order_number)
)

insert Orders values (1,1,'2017-04-09','2017-04-13','2017-04-12','Closed',null)
insert Orders values (2,2,'2017-04-15','2017-04-20','2017-04-18','Closed',null)
insert Orders values (3,3,'2017-04-16','2017-04-25','2017-04-20','Closed',null)
insert Orders values (4,3,'2017-04-18','2017-04-28','2017-04-25','Closed',null)
insert Orders values (5,2,'2017-04-18','2017-04-28','2017-04-25','Closed',null)
insert Orders values (6,3,'2017-04-18','2017-04-28','2017-04-25','Closed',null)
delete from Orders where order_number = 5 

select t.customer_number from 
(select distinct customer_number,  
ROW_NUMBER() OVER(ORDER BY count (*) desc) AS Row#,
count(*) presence
from Orders
group by customer_number
) t where Row# = 1

select top 1 customer_number from orders
group by customer_number
order by count(*) desc  ---order count (*) <---Học

--Classes More Than 5 Students-----------------------------
create table courses (
	Student varchar(1) unique,
	Class varchar(10)
)

insert courses values ('A','Math')
insert courses values ('B','English')
insert courses values ('C','Math')
insert courses values ('D','Biology')
insert courses values ('E','Math')
insert courses values ('F','Computer')
insert courses values ('G','Math')
insert courses values ('H','Math')
insert courses values ('I','Math')
select class 
from courses 
group by class 
having count(distinct Student)=6

--Friend Requests I: Overall Acceptance Rate -------------------------
create table friend_request (
	sender_id int,
	send_to_id int,
	request_date date,
)
create table request_accepted (
	requester_id int,
	accepter_id int,
	accept_date date,
)
insert friend_request values (1,2,'2016-06-01')
insert friend_request values (1,3,'2016-06-01')
insert friend_request values (1,4,'2016-06-01')
insert friend_request values (2,3,'2016-06-02')
insert friend_request values (3,4,'2016-06-09')

insert request_accepted values (1,2,'2016-06-03')
insert request_accepted values (1,3,'2016-06-08')
insert request_accepted values (2,3,'2016-06-08')
insert request_accepted values (3,4,'2016-06-09')
insert request_accepted values (3,4,'2016-06-10')

select cast(Accepted as dec(2,0)) / cast(Requested as dec(2,0)) from
(select count(*) as Requested from friend_request) A,
(select sum(uniAcceptID) as Accepted from
(select requester_id,count (distinct accepter_id) uniAcceptID
from request_accepted
group by requester_id) t) B

--Biggest Single Number---------------
create table number (
	num int
)

insert number values (8),(8),(3),(3),(1),(4),(5),(6)

select max(num) num from (
select distinct(num)
from number
group by num
having count(*) = 1) t



-----------------------------------------------------Easy------------------------------------------
--Employees Earning More Than Their Managers  --
--Customers Who Never Order--------
--Duplicate Emails -----------------
--Rising Temperature-----
--Gameplay Analysis I----------
--Gameplay Analysis II----------
--Employee Bonus-------------------
--Find Customer Referee-----------
--Customer Placing the Largest Number of Orders-----------
--Classes More Than 5 Students-------------
--Friend Requests I: Overall Acceptance Rate -----
--Biggest Single Number---------