drop database Employees
create database Employees
create table Department (
	DeptID char(2) primary key,
	DeptName varchar(40) not null,
)

create table Employee (
	EmpID char(5) primary key,
	EmpName varchar(25) not null,
	DeptID char(2) foreign key references Department(DeptID),
	JoinDate datetime not null,
	Salary int
)

select * from Department
insert Department values ('AD','Administration')
insert Department values ('AC','Accounting')
insert Department values ('SA','Sales')
insert Department values ('TE','Technology')
insert Department values ('RD','R and D')
insert Department values ('MK','Marketing')

drop table Employee
select * from Nhanvien
insert Employee values ('E001','Philip','AC','01/01/01',400)
insert Employee values ('E002','Hann','SA','01/01/03',300)
insert Employee values ('E003','Anna','TE','01/01/02',450)
insert Employee values ('E004','Smith','RD','01/01/07',600)
insert Employee values ('E005','John','AD','01/01/05',550)





select d.DeptName,n.empName, count(n.DeptID) as [Số lượng nv],n.Salary
from Department d left join em  on d.DeptID = n.DeptID
group by d.DeptName,n.empName,n.Salary
order by n.Salary Desc

create table Employee (
	EmpID char(5) primary key,
	EmpName varchar(25) not null,
	DeptID char(2) foreign key references Department(DeptID),
	JoinDate datetime not null,
	Salary int
)
create table Employee (
	EmpID char(5) primary key
)
alter table Employee
--add DeptID char(2) foreign key references Department(DeptID)
--add EmpName varchar(25) not null
--add	JoinDate datetime not null
add	Salary int
insert Employee values ('E001','Philip','AC','01/01/01',400)
insert em


drop table Employee
select * from Department
select * from Employees.dbo.

