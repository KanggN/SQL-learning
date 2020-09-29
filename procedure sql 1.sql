create database PhongVu
create table Laptop (
	lapCode varchar(10) primary key nonclustered,
	lapName varchar(40),
	price int
)
select * from Laptop
--Tạo cluster index trên cột lapName cua table desktop
create clustered index idx_lapname on laptop(lapname)
insert into Laptop values ('L004','Acer',900)
insert into Laptop values ('L005','Lenovo',700)
insert into Laptop values ('L006','Dell',800)
--tạo view vwListPrice hien thi thong tin laptop co gia tu 600 den 800
--tạo store proc ShowLaptop với tham số đầu vào là price 
--a) nếu gọi store proc mà không có tham số đầu thì liệt kê tất cả Laptop
--b) nếu truyền @price thì chỉ hiển thị các laptop có giá tương ứng 
--c) Tạo store updatePrice với tham số đầu vào lapCode 
-- giam gia laptop do xuống 10%. Sau khi giam giá cho hiển thị thông tin mới
go
create view vwListPrice as
select *
from Laptop
where price between 600 and 800
select * from vwListPrice
go
create proc ShowLaptop (@price int = null)
as
	if (@price is null)
	begin
		select *
		from Laptop
	end
	else 
		begin 
			select *
			from Laptop
			where @price = price
exec ShowLaptop 800

go
create proc updatePrice (@lapCode varchar(40) = null)
as 
	if @lapCode = 'Hello'
	begin 
		update laptop set price = price*0.9 
		where lapCode = @lapCode
		select * from Laptop where lapCode = @lapCode ---
	end
	else
	begin
		print 'Wrong code'
	end
exec updatePrice Hello