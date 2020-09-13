create database Nganhang
use Nganhang
create table TaiKhoan(
	MaTK varchar(12) primary key,
	NgayLap date,
	SoDu int,
	LoaiTK int, --foreign key references LoaiTaiKhoan(Maloai),
	MaKH varchar(9) --foreign key references KhachHang(MaKH)
)


create table LoaiTaiKhoan(
	MaLoai int primary key,
	TenLoai varchar(20),
)
create table KhachHang(
	MaKH varchar(9) primary key,
	HoTen varchar(30),
	CMND varchar(9),
	DiaChi varchar(40),
	NgaySinh date
)
create table GiaoDich(
	MaGD int identity primary key,
	MaTK varchar(12) foreign key references TaiKhoan(MaTK),
	SoTien int,
	ThoiGianGD datetime,
	Ghichu varchar(30)
)


insert into TaiKhoan(MaTK,NgayLap,SoDu) values (190020110001, '2013/02/14', 10000)
insert into TaiKhoan(MaTK,NgayLap,SoDu) values (190020110002, '2013/02/14', 45000)
insert into TaiKhoan(MaTK,NgayLap,SoDu) values (190020110003, '2013/05/14', 30000)
insert into TaiKhoan(MaTK,NgayLap,SoDu) values (190020110004, '2013/07/14', 25000)
insert into TaiKhoan(MaTK,NgayLap,SoDu) values (190020110005, '2013/03/14', 15000)

update TaiKhoan
set LoaiTK = 1, MaKH = 'C1D100003'
where MaTK = 190020110005



insert into LoaiTaiKhoan values (1,'Co ky han')
insert into LoaiTaiKhoan values (2,'Khong ky han')

insert into KhachHang values ('C1D100001','Nguyen Thanh',240112111,'Ho Chi Minh','1985/5/18')
insert into KhachHang values ('C1D100002','Tran Thi Tra Huong',241000222,'Ca Mau','1986/4/26')
insert into KhachHang values ('C1D100003','Nguyen Van An',243112011,'Ba ria','1955/3/27')


insert into GiaoDich(MaTK,SoTien,ThoiGianGD) values (190020110001,10000,'2013/02/14 12:00:00')
insert into GiaoDich(MaTK,SoTien,ThoiGianGD) values (190020110002,45000,'2013/02/14 12:00:00')
insert into GiaoDich(MaTK,SoTien,ThoiGianGD) values (190020110003,30000,'2013/02/14 19:00:00')
insert into GiaoDich(MaTK,SoTien,ThoiGianGD) values (190020110004,20000,'2013/02/14 13:00:00')
insert into GiaoDich(MaTK,SoTien,ThoiGianGD) values (190020110004,-2000,'2013/02/17 7:00:00')
insert into GiaoDich(MaTK,SoTien,ThoiGianGD) values (190020110004,-5000,'2013/02/19 9:00:00')
insert into GiaoDich(MaTK,SoTien,ThoiGianGD) values (190020110004,15000,'2013/02/24 15:00:00')
insert into GiaoDich(MaTK,SoTien,ThoiGianGD) values (190020110005,-6000,'2013/02/26 9:00:00') 
insert into GiaoDich(MaTK,SoTien,ThoiGianGD) values (190020110005,25000,'2013/02/27 14:00:00') --deleted



select * from GiaoDich
delete from GiaoDich
where MaTK = 190020110005
DBCC CHECKIDENT (GiaoDich, RESEED, 0)
GO


--Cau 1
select tk.MaTK, tk.SoDu
from TaiKhoan tk
where tk.SoDu > 10000
--Cau 2
select kh.HoTen, kh.DiaChi
from KhachHang kh
where DiaChi = 'Ho Chi Minh'
--Cau 3
select tk.MaTK, tk.NgayLap
from TaiKhoan tk
where tk.NgayLap like '2013-02-14'
--Câu 4
select *
from KhachHang
where month(NgaySinh) = 4
--Câu 5
select *
from TaiKhoan
where NgayLap like '2013-05%'
--Câu 6
select kh.HoTen, gd.*
from KhachHang kh join TaiKhoan tk 
on kh.MaKH = tk.MaKH
join GiaoDich gd
on gd.MaTK = tk.MaTK
where kh.HoTen = 'Nguyen Van An'
--Câu 7 
select tk.MaTK, tk.LoaiTK, tk.NgayLap
from TaiKhoan tk 
where month(NgayLap) = 2
-- Câu 8 
select kh.HoTen, tk.SoDu
from KhachHang kh join TaiKhoan tk
on kh.MaKH = tk.MaKH
where tk.SoDu > 20000
-- Câu 9
select gd.*
from GiaoDich gd join TaiKhoan tk
on tk.MaTK = gd.MaTK
where tk.MaKH = 'C1D100002'
-- Cau 10
select kh.HoTen, tk.LoaiTK
from KhachHang kh join TaiKhoan tk
on kh.MaKH = tk.MaKH
join LoaiTaiKhoan ltk
on ltk.MaLoai = tk.LoaiTK
where ltk.TenLoai = 'Co ky han'
-- Cau 11
select kh.HoTen, getdate() as Today
from KhachHang kh join TaiKhoan tk
on kh.MaKH = tk.MaKH
where datediff(YY,kh.NgaySinh,getdate()) >=50

select datediff(YY,kh.NgaySinh,getdate())
from KhachHang kh

select kh.NgaySinh, datediff(YY,kh.NgaySinh,getdate()) -
case when 
dateadd(YY,datediff(YY,kh.NgaySinh,getdate()),kh.NgaySinh) > getdate() then 1
else 0 end as Tuoi
from KhachHang kh 
-- Câu 12
select kh.HoTen
from KhachHang kh join TaiKhoan tk
on kh.MaKH = tk.MaKH
where kh.MaKH in(
select MaKH
from TaiKhoan
group by MaKH
having count(MaKH) = 2)
group by kh.HoTen
-- Câu 13 
select tk.MaTK
from TaiKhoan tk 
where tk.MaTK not in (select gd.MaTK from GiaoDich gd )
-- Câu 14
select gd.MaTK as 'Danh sach tk gui tien 02/2013'
from GiaoDich gd
where gd.MaTK not in(
select gd.MaTK
from GiaoDich gd
where gd.SoTien < 0
group by gd.MaTK) and year(gd.ThoiGianGD) = 2013 and month(gd.ThoiGianGD) = 2
-- Câu 15
select gd.MaTK, kh.HoTen
from GiaoDich gd join TaiKhoan tk on tk.MaTK = gd.MaTK join KhachHang kh on kh.MaKH = tk.MaKH
where gd.SoTien < 0 and gd.MaTK not in (
select gd.MaTK
from GiaoDich gd
where gd.SoTien > 0 )
-- Câu 16
select sum(tk.SoDu)
from TaiKhoan tk join LoaiTaiKhoan ltk on tk.LoaiTK = ltk.MaLoai
where ltk.TenLoai = 'Khong ky han'
-- Câu 17
select sum(gd.SoTien)
from GiaoDich gd join TaiKhoan tk on gd.MaTK = tk.MaTK join LoaiTaiKhoan ltk on tk.LoaiTK = ltk.MaLoai
where ltk.TenLoai = 'Co ky han'
-- Câu 18
select distinct gd.MaTK, count(gd.MaTK) as 'So lan giao dich'
from GiaoDich gd
group by gd.MaTK
-- Câu 19
select distinct gd.MaTK, count(gd.MaTK) as 'So lan gui tien'
from GiaoDich gd
where gd.SoTien > 0
group by gd.MaTK
-- Câu 20
select kh.HoTen, tk.MaTK, count(kh.HoTen) as 'So lan rut tien 02/2013'
from KhachHang kh join TaiKhoan tk on kh.MaKH = tk.MaKH join GiaoDich gd on tk.MaTK = gd.MaTK
where gd.SoTien < 0 and month(gd.ThoiGianGD) = 2 and year(gd.ThoiGianGD) = 2013
group by kh.HoTen, tk.MaTK
-- Câu 21
select count(gd.MaTk) as 'So lan gd cua 190020110004'
from GiaoDich gd
where gd.MaTK = 190020110004 and year(gd.ThoiGianGD) = 2013
-- Cau 22
insert into TaiKhoan values (190020110006,getdate(),0,1,'C1D100001')
-- Cau 23
delete from TaiKhoan where SoDu = 0

select * from KhachHang
select * from TaiKhoan
select * from GiaoDich

select * from LoaiTaiKhoan
