create database SinhVien
use SinhVien
create table Khoa
(
	Ma varchar(10) primary key,
	tenKhoa nvarchar(100),
	namThanhLap int
)
create table KhoaHoc
(
	Ma varchar(10) primary key,
	namBatDau int,
	namKetThuc int
)
create table SinhVien
(
	Ma varchar(10) primary key,
	hoTen nvarchar(100),
	namSinh int,
	danToc nvarchar(20),
	maLop varchar(10)
)
create table ChuongTrinh
(
	Ma varchar(10) primary key,
	tenChuongTrinh nvarchar(100)
)
create table MonHoc
(
	Ma varchar(10) primary key,
	tenMonHoc nvarchar(100),
	maKhoa varchar (10)
)
create table KetQua
(
	maSinhVien varchar(10) foreign key references SinhVien(Ma),
	maMonHoc varchar(10) foreign key references MonHoc(Ma),
	lanThi int,
	diem float
)
alter table KetQua
--alter column maSinhvien varchar(10) not null
--alter column maMonHoc varchar(10) not null
--alter column lanthi int not null
add constraint pr_MaSV_maMH_lt primary key (maSinhVien,maMonHoc,lanThi)
create table GiangKhoa
(
	maChuongTrinh varchar(10) foreign key references ChuongTrinh(Ma) not null,
	maKhoa varchar(10) foreign key references Khoa(ma) not null,
	maMonHoc varchar(10) foreign key references MonHoc(Ma) not null,
	namHoc int,
	hocKy int,
	soTietLyThuyet int,
	soTietThucHanh int,
	soTinChi int
)
alter table GiangKhoa
add constraint pk_GK primary key (maChuongTrinh,maKhoa,maMonHoc)
create table Lop
(
	Ma varchar(10) primary key,
	maKhoaHoc varchar(10) foreign key references KhoaHoc(Ma),
	maKhoa varchar(10) foreign key references Khoa(ma),
	maChuongTrinh varchar(10) foreign key references ChuongTrinh(Ma),
	soThuTu int
)

insert Khoa values('CNTT',N'Công nghệ thông tin',1995)
insert Khoa values('VL',N'Vật lý',1970)

insert KhoaHoc values('K2002',2002,2006),('K2003',2003,2007),('K2004',2004,2008)

insert SinhVien values
('0212001',N'Nguyễn Vĩnh An',1984,'Kinh','TH2002/01'),
('0212002',N'Nguyễn Thanh Bình',1985,'Kinh','TH2002/01'),
('0212003',N'Nguyễn Thanh Cường',1984,'Kinh','TH2002/02'),
('0212004',N'Nguyễn Quốc Duy',1983,'Kinh','VL2003/02'),
('0311001',N'Phan Tuấn Anh',1985,'Kinh','VL2003/01'),
('0311002',N'Huỳnh Thanh Sang',1984,'Kinh','VL2003/01')

insert ChuongTrinh values('CQ',N'Chính Qui')

insert MonHoc values('THT01',N'Toán Cao cấp A1','CNTT'),
('VLT01',N'Toán Cao cấp A1','VL'),('THT02',N'Toán rời rạc','CNTT'),
('THCS01',N'Cấu trúc dữ liệu 1','CNTT'),('THCS02',N'Hệ điều hành','CNTT')

insert KetQua values
('0212001','THT01',1,4),('0212001','THT01',2,7),('0212002','THT01',1,8),('0212003','THT01',1,6),
('0212004','THT01',1,9),('0212001','THT02',1,8),('0212002','THT02',1,5.5),('0212003','THT02',1,4),
('0212003','THT02',2,6),('0212001','THCS01',1,6.5),('0212002','THCS01',1,4),('0212003','THCS01',1,7)

insert GiangKhoa values('CQ','CNTT','THT01',2003,1,60,0,5),
('CQ','CNTT','THT02',2003,2,45,0,4),
('CQ','CNTT','THCS01',2004,1,45,30,4)

insert Lop values('TH2002/01','K2002','CNTT','CQ',1),
('TH2002/02','K2002','CNTT','CQ',2),
('VL2003/01','K2003','VL','CQ',1)

--Câu 4.1
select sv.hoTen, k.tenKhoa
from SinhVien sv join Lop l on sv.maLop = l.Ma join Khoa k on l.maKhoa = k.Ma
where k.tenKhoa = N'Công nghệ thông tin'
--Câu 4.2
select sv.hoTen,sv.namSinh,year(getdate()) - sv.namSinh age
from SinhVien sv
where year(getdate()) - sv.namSinh < 18
--Câu 4.3
select sv.hoTen, kq.maMonHoc
from SinhVien sv join Lop l on sv.maLop = l.Ma join KhoaHoc kh on kh.Ma = l.maKhoaHoc
join KetQua kq on kq.maSinhVien = sv.Ma join MonHoc mh on mh.Ma = kq.maMonHoc
where l.maKhoa = 'CNTT' and kh.namBatDau = 2002 and kh.namKetThuc = 2006 and mh.tenMonHoc = N'Cấu trúc dữ liệu 1'
and sv.Ma not in (select maSinhVien from KetQua)
group by sv.hoTen,kq.maMonHoc 
--Câu 4.4 
select sv.hoTen
from SinhVien sv join KetQua kq on sv.Ma = kq.maSinhVien join MonHoc mh on mh.Ma = kq.maMonHoc
where kq.diem < 5 and kq.lanThi = 1 and mh.tenMonHoc = N'Cấu trúc dữ liệu 1'
--Câu 4.5 
select sv.hoTen,sv.maLop, l.maKhoaHoc, ct.tenChuongTrinh, SL
from SinhVien sv join Lop l on sv.maLop = l.Ma
join ChuongTrinh ct on l.maChuongTrinh = ct.Ma
join SiSo s on s.maLop = sv.maLop

select sv.maLop, count(sv.maLop) SL into SiSo --Temp Table
from SinhVien sv
group by sv.maLop
--Câu 4.6 
select avg(A.diem)--,A.maSinhVien,A.maMonHoc,A.diem,B.Lanthimax
from KetQua A join (
select distinct kq.maMonHoc,max(kq.lanThi) as Lanthimax
from KetQua kq
where kq.maSinhVien = '0212003'
group by kq.maMonHoc) B on A.maMonHoc = B.maMonHoc
where A.lanThi = B.Lanthimax and A.maSinhVien = '0212003'
--Câu 5.1
create proc Kiemtrakhoa @hoten nvarchar(50), @ma varchar(20), @result char(1) output as --Cẩn thận nvarchar input
if exists(
select sv.*
from SinhVien sv join lop l on l.Ma = sv.maLop
where sv.hoTen = @hoten and l.maKhoa = @ma)
	set @result = 'D'
	else 
	set @result = 'S'
declare @a char(1)
exec kiemtra N'Nguyễn Vĩnh An','VL',@a output
print @a
--Câu 5.2
create proc Tradiem @Masv varchar(10), @Mon varchar(10), @diemthi int output as
select @diemthi = kq.diem
from KetQua kq join (select distinct kq.maMonHoc,max(kq.lanThi) as Lanthimax
from KetQua kq
where kq.maSinhVien = @Masv
group by kq.maMonHoc
) t on t.maMonHoc = kq.maMonHoc
where kq.maSinhVien = @Masv and kq.maMonHoc = @Mon and kq.lanThi = t.Lanthimax
declare @diem int
exec Tradiem '0212003','THT02', @diem output
print @diem
--Câu 5.3
create proc Tradiemtb @Masv varchar(10), @Diemtb float output as
select @Diemtb = avg(kq.diem)
from KetQua kq join (select distinct kq.maMonHoc,max(kq.lanThi) as Lanthimax
from KetQua kq
where kq.maSinhVien = @Masv
group by kq.maMonHoc
) t on t.maMonHoc = kq.maMonHoc
where kq.maSinhVien = @Masv and kq.lanThi = t.Lanthimax
declare @diem float
exec Tradiemtb '0212003', @diem output
print @diem
--Câu 5.4
create proc Tradiem1 @Masv varchar(10), @Mon varchar(10) as
select kq.lanThi,kq.diem
from KetQua kq 
where kq.maSinhVien = @Masv and kq.maMonHoc = @Mon 
exec Tradiem1 '0212003','THT01'
--Câu 5.5
create proc Tramonhoc @Masv varchar(10) as
select mh.tenMonHoc
from SinhVien sv join lop l on l.Ma = sv.maLop
join MonHoc mh on mh.maKhoa = l.maKhoa
where sv.Ma = @Masv
exec Tramonhoc '0311002'
--Câu 6.1
create proc Tralop @Malop varchar (20) as
select *
from SinhVien
where maLop = @Malop
exec Tralop 'TH2002/01'
--Câu 6.2
create proc Sodiem @Masv varchar(10),@Masv1 varchar(10), @Mon varchar(20) as
declare @diem float, @diem1 float
select @diem = kq.diem
from KetQua kq 
where maSinhVien = @Masv
and maMonHoc = @Mon and lanThi = 1 
select @diem1 = kq.diem
from KetQua kq 
where maSinhVien = @Masv1
and maMonHoc = @Mon and lanThi = 1
If (@diem > @diem1)
	print N'SV thứ nhất cao điểm hơn (' + CAST(@diem as varchar) + N' điểm so với ' + CAST(@diem1 as varchar) + N' điểm)'
	else if (@diem = @diem1)
	print N'Điểm 2 SV bằng nhau (' + CAST(@diem as varchar) + N' điểm'
	else
	print N'SV thứ hai cao điểm hơn (' + CAST(@diem1 as varchar) + N' điểm so với ' + CAST(@diem as varchar) + N' điểm)'
exec Sodiem '0212001','0212002','THT02'
select *
from KetQua
where maMonHoc = 'VLT01'
--Câu 6.3
create proc Ketquathilanmot @Masv varchar(10) as
select distinct maMonHoc, diem, case when diem < 5 then N'Rớt' else N'Đậu' end as KetQua
from KetQua
where lanThi = 1 and maSinhVien = @Masv
exec Ketquathilanmot '0212002'
--Câu 6.4
create proc Sinhvienkhoa @Makhoa varchar(10) as
select sv.Ma,sv.hoTen,sv.namSinh
from khoa k join lop l on l.maKhoa = k.Ma
join SinhVien sv on sv.maLop = l.Ma
where k.Ma = @Makhoa
exec Sinhvienkhoa 'VL'
--Câu 6.5 
alter proc Ketquachung @Masv varchar(10), @Mon varchar(10) as
declare @diem int, @diem1 int, @diem2 int
declare @t table (lanthi int, diem float)
insert into @t 
select lanThi, diem 
from KetQua
where maSinhVien = @Masv and maMonHoc = @Mon
select @diem = diem
from @t where lanthi = 1
select @diem1 = diem
from @t where lanthi = 2
select @diem2 = diem
from @t where lanthi = 3
print N'Lần 1: ' + cast(@diem as varchar) + N' điẻm'
print N'Lần 2: ' + cast(@diem1 as varchar) + N' điẻm'
print N'Lần 3: ' + cast(@diem2 as varchar) + N' điẻm'
exec Ketquachung '0212001','THT02'
--Câu 6.6
alter proc Showmonhoc @Masv varchar(10) as
declare @Monhoc nvarchar(20), @Monhoc1 nvarchar(20), @Monhoc2 nvarchar(20), @Monhoc3 nvarchar(20)
declare @t table (Id int identity ,tenMonHoc nvarchar(20))
insert into @t(tenMonHoc)
select mh.tenMonHoc
from SinhVien sv join Lop l on l.Ma = sv.maLop 
join MonHoc mh on mh.maKhoa = l.maKhoa
where sv.Ma = @Masv 
select @Monhoc = tenMonHoc 
from @t where Id = 1 
select @Monhoc1 = tenMonHoc 
from @t where Id = 2 
select @Monhoc2 = tenMonHoc 
from @t where Id = 3 
select @Monhoc3 = tenMonHoc 
from @t where Id = 4 
print cast(@Monhoc as nvarchar)
print cast(@Monhoc1 as nvarchar)
print cast(@Monhoc2 as nvarchar)
print cast(@Monhoc3 as nvarchar)
exec Showmonhoc '0212001'
--Câu 6.7 
create proc Daulandau @Mon varchar(10) as
select * from Ketqua where maSinhVien not in
(select maSinhVien
from KetQua
where lanThi = 2 and maMonHoc = @Mon) 
and maMonHoc = @Mon
exec Daulandau 'THT02'
--Câu 6.8
--6.8.1
create proc Ketquathi @Masv varchar(10) as
select * 
from KetQua
where maSinhVien = @Masv
--6.8.2
alter proc Ketquathi1 @Masv varchar(10) as
select A.Ma,B.lanThi,B.diem from (
select mh.Ma,mh.tenMonHoc
from MonHoc mh 
where mh.maKhoa = (select l.maKhoa
from SinhVien sv join Lop l on l.Ma = sv.maLop
where sv.Ma = @Masv)) A left join (
select * from KetQua where maSinhVien = @Masv) B
on B.maMonHoc = A.Ma
exec Ketquathi1 '0212003'

select * from KetQua where maSinhVien = '0212001'

select * from SiSo
select * from SinhVien
select * from Lop
select * from KhoaHoc
select * from MonHoc
select * from Khoa
select * from ChuongTrinh
select * from KetQua
select * from GiangKhoa

