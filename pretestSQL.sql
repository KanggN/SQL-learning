create database pretestSQL
use pretestSQL
create table MatHang(
	maMH varchar(10) primary key,
	tenMH varchar(50),
	DVT varchar(20) check (DVT in ('cai','thung','lon','chai','bo')),
	Dongia int, check (Dongia > 0)
)

create table KhachHang(
	maKH varchar(10) primary key, 
	tenKH varchar(50), 
	Diachi varchar(50) unique,
	Dthoai varchar(12) check (Dthoai like '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9]')
)
create table DonHang(
	maDH varchar(10) primary key,
	maKH varchar(10) foreign key references KhachHang(maKH), 
	ngayDH datetime, 
	ngayGH datetime 
)

select * from dbo.DonHang
alter table DonHang       ------------error
add constraint ss_ngay check (ngayGh>ngayDh)
create table CTDonHang(
	maDH varchar(10) foreign key references DonHang(maDH), 
	maMH varchar(10) foreign key references MatHang(maMH), 
	Sluong int check (Sluong > 0)
)
insert MatHang values('MG100', 'May giat Hitachi cua dung', 'cai',1000)
insert MatHang values('MG203', 'May giat cua truoc', 'cai',900)
insert MatHang values('TLH20', 'Tu lanh Hitachi', 'cai',1000)
insert MatHang values('TLS20', 'Tu lanh SanYo', 'cai',900)
insert MatHang values('TV203', 'Ti vi Sam Sung 32"', 'cai',1000)
insert MatHang values('TV320', 'Ti vi Sony 32"', 'cai',750)
insert MatHang values('TV321', 'Ti vi Sony 24"', 'cai',450)


insert KhachHang values('KH01', 'Hung', '212 Le Loi','090-3123-456')
insert KhachHang values('KH02', 'Tung', '1 Le Loi','090-3123-454')
insert KhachHang values('KH03', 'Can', '123 Tran Hung Dao','090-1123-456')
insert KhachHang values('KH04', 'Thoi', '590 CMT8','090-3123-458')
insert KhachHang values('KH05', 'Nghia', '11 Le Lai','090-3123-354')
insert KhachHang values('KH06', 'Tin', '121 Tran Hung Dao','090-1123-456')

set dateformat dmy
insert DonHang values ('DH01','KH01','12/05/2014','13/05/2014')
insert DonHang values ('DH02','KH01','12/05/2014','16/05/2014')
insert DonHang values ('DH03','KH02','12/04/2014','13/04/2014')
insert DonHang values ('DH04','KH03','14/05/2014','16/05/2014')

insert CTDonHang values ('DH01','MG100',5)
insert CTDonHang values ('DH01','TLH20',3)
insert CTDonHang values ('DH02','TLH20',2)
insert CTDonHang values ('DH03','TV320',6)
insert CTDonHang values ('DH04','TV321',5)

create view vw_Donhang with encryption as
select *
from DonHang

drop view vw_Donhang

select * from DonHang
exec sp_helptext vw_Donhang

create view vw_MathangTV as
select mh.maMH, mh.tenMH, mh.DVT, mh.Dongia
from MatHang mh
where maMH like 'TV%'

select * from vw_MathangTV
insert vw_MathangTV values ('ML111','May lanh 1.5  HP Hitachi','cai',600)

select kh.tenKH
from KhachHang kh join DonHang dh on kh.maKH = dh.maKH
where kh.tenKH like 'T%'
group by kh.tenKH
having count (dh.maKH) > 1

select mh.*
from MatHang mh join CTDonHang ct on mh.maMH = ct.maMH
join DonHang dh on dh.maDH = ct.maDH
where month(dh.ngayDH) = 1 and year(dh.ngayDH) = 2014 

select top 2 maDH
from DonHang
order by ngayDH desc

alter view vw_TinhSLDat 
as
select mh.maMH, mh.tenMH, isnull(sum(ct.Sluong),0) as Sluongdat
from MatHang mh left join CTDonHang ct on
mh.maMH = ct.maMH
group by mh.maMH, mh.tenMH

select * from vw_TinhSLDat 

create proc listMH as
select * from MatHang
exec listMH

create proc listMH2 @maMH varchar(10) as
select * from MatHang
where @maMH = maMH

exec listMH2 'TV203'

create proc top1muanhieu as
select top 1 kh.tenKH, ct.Sluong
from KhachHang kh join DonHang dh on kh.maKH = dh.maKH
join CTDonHang ct on ct.maDH = dh.maDH
order by ct.Sluong desc
exec top1muanhieu

create proc listDH @maKH varchar(10) as 
select dh.*
from DonHang dh join KhachHang kh on kh.maKH = dh.maKH
where kh.maKH = @maKH
exec listDH 'KH01'

create proc discount @month int, @year int as
select ct.maDH, sum(ct.Sluong*mh.Dongia)*0.9 as 'GiaGiam10%'
from CTDonHang ct join MatHang mh on mh. maMH = ct.maMH join DonHang dh on dh.maDH = ct.maDH
where month(dh.ngayDH) = @month and year(dh.ngayDH) = @year
group by ct.maDH
exec discount 5,2014


select * from MatHang
select * from DonHang
select * from CTDonHang
select * from KhachHang
