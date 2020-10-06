create database demoMasking
use demoMasking
drop table employee
create table employee
(
	empid varchar (10) primary key,
	fname varchar (30) masked with (function= 'partial(3,"xxxx",1)') null,
	lname varchar (20) masked with (function= 'partial(1,"xxxx",1)') null,
	salary int masked with (function= 'random(1,9)') null,
	email varchar (50) masked with (function= 'email()') null,
	phone varchar (12) masked with (function= 'default()') null,
	creditCard varchar (12) masked with (function= 'partial(2,"xxxxx",5)') null
)
insert into employee values ('E001', 'TrungNguyen', 'Nguyen', 5000, 'Trung@gmail.com', '090123456','11223344')
select * from employee
--- che thong tin nhay cam
-- tao user ma user do ko login vao (vo danh)
create user Ngoan without login
grant select on employee to Ngoan
execute as user = 'Ngoan'
select * from employee
revert