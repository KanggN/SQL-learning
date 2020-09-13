USE [master]
GO

/****** Object:  Database [companyDB]    Script Date: 12/09/2020 8:16:50 CH ******/
CREATE DATABASE [companyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'companyDB_dat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\companyDB.mdf' , SIZE = 10MB , MAXSIZE = 100MB, FILEGROWTH = 1MB )
 LOG ON 
( NAME = N'companyDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\companyDB_log.ldf' , SIZE = 5MB , MAXSIZE = 25MB , FILEGROWTH = 1MB )
GO

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

select * from Employee
insert Employee values ('E001','Philip','AC','01/01/01',400)
insert Employee values ('E002','Hann','SA','01/01/03',300)
insert Employee values ('E003','Anna','TE','01/01/02',450)
insert Employee values ('E004','Smith','RD','01/01/07',600)
insert Employee values ('E005','John','AD','01/01/05',550)


select e.Dep, count(e.DeptID) as Soluog
from Employee e join Department d on d.DeptID = e.DeptID
group by e.DeptID
order by e.Salary ASC

select e.gender
from Employee e

select * from Employee
select * from Department

