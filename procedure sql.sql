
create database BanHang
use banhang
create table MatHang
(
	mamh varchar(10) primary key,
	tenmh varchar(50),
	gia int
)
create table DonHang
(
	madh varchar(10) primary key,
	ngaydh date,
	tenkh varchar(30)
)
create table ChiTietDH
(
	mamh varchar(10) foreign key references MatHang,
	madh varchar(10) foreign key references DonHang,
	soluong int,
	constraint pk_DH_MH primary key (madh, mamh)
)
go
create proc NhapMh (@mamh varchar(10), @tenmh varchar(50), @gia int)
as 
	insert into MatHang values(@mamh,@tenmh,@gia)
	exec NhapMh 'MH002','Keo Bigbabol',18
	select * from MatHang



go
create proc NhapDonHang (@madh varchar(10), @ngaydh date, @tenkh varchar(30))
as
	insert DonHang values (@madh,@ngaydh,@tenkh)
	set dateformat dmy
	exec NhapDonHang 'DH001','2/4/2020','Quang'
	select * from DonHang

select * from ChiTietDH
go
create proc NhapChiTietDH (@madh varchar(10), @mamh varchar(10), @soluong int)
as
	insert ChiTietDH values (@madh,@mamh,@soluong)
	exec NhapChiTietDH 'MH001','DH001',2

go
create proc lietkeDH
@tenkh varchar(30)
as
	select * from DonHang
	where @tenkh = tenkh
	exec lietkeDH 'Trung'

go
create proc hienthiCTDH
@madh varchar(30)
as
	select ct.madh, mh.tenmh, ct.soluong, mh.gia, ct.soluong*mh.gia Thanhtien
	from DonHang dh 
	join ChiTietDH ct on ct.madh = dh.madh 
	join MatHang mh on ct.mamh = mh.mamh  
	where @madh = dh.madh
	exec hienthiCTDH 'DH001'
go
alter proc hienthiSLDat
@madh varchar(30),
@mamh varchar(10), @sldat int output
as
	select @sldat = ct.soluong
	from DonHang dh 
	join ChiTietDH ct on ct.madh = dh.madh 
	join MatHang mh on ct.mamh = mh.mamh  
	where @madh = dh.madh and @mamh = mh.mamh

	declare @sldat int, @mamh
	exec hienthiSLDat 'DH001','MH001', @sldat output
	print 'So luong: ' + cast(@sldat as varchar(10))


select * from ChiTietDH
select * from MatHang
select * from DonHang
