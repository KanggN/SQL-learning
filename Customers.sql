USE [master]
GO

/****** Object:  Database [Customers]    Script Date: 12/09/2020 7:26:18 CH ******/
CREATE DATABASE [Customers]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Customer_dat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Customers.mdf' , SIZE = 10MB , MAXSIZE = 100MB, FILEGROWTH = 1MB )
 LOG ON 
( NAME = N'Customers_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Customers_log.ldf' , SIZE = 5MB , MAXSIZE = 25MB , FILEGROWTH = 1MB )
GO

create table Customers (
	CusId varchar(10) primary key,
	FirstName varchar(20),
	LastName varchar(30),
	City varchar(15) default 'Mumbai',
	Country varchar(12),
	BirthDate datetime
)

insert Customers values ('C001', 'Linh','Tran Vu','sydney','australia','12/12/1994 00:00:00')
insert Customers values ('C002', 'Khanh','Ngo Quoc','Ha Noi','Viet Nam','09/30/1993 03:00:00')
insert Customers values ('C003', 'Quang','Nguyen Van','Bac Kinh','Trung Quoc','02/09/1998 04:00:00')
insert Customers values ('C004', 'Thoa','Le Thi Kim','bangkok','thaland','12/11/1999 02:00:00')
insert Customers values ('C005', 'Hoang','Nguyen Van','Mascouva','Nga','3/4/1993 08:00:00')

update Customers
set City = 'Ha Noi', Country = 'Viet Nam'
where CusId = 'C003' or CusId = 'C004'

select * into NewCustomer from Customers
select * from NewCustomer


ALTER TABLE Customers
ADD [State] varchar(10)

select City,count(*) as Total
from Customers c
group by c.City
having count(*)>=3

select top 30 percent *
from Customers

select LastName, City, datediff(yy,BirthDate,getdate()) as age
from Customers
where datediff(yy,BirthDate,getdate()) > 18

select * from Customers