create database BatDongSan
create table NGUOI_BAN (
	MaNb char(9) primary key,
	HoTen varchar(50),
	DiaChi varchar(70),
	SoDT char(10)
)
create table DIA_OC (
	MaDo char(9) primary key,
	So varchar(10),
	Duong varchar(30),
	Phuong varchar(30),
	Quan varchar(30),
	DTDat real,
	DTXD real,
	Huong varchar(10),
	ViTri varchar(20),
	MoTa varchar(100),
	MaLDo int foreign key references LOAI_DIA_OC(MaLDo)
)
create table LOAI_DIA_OC (
	MaLDo int primary key,
	TenLDo varchar(50)
)
create table DICH_VU (
	MaDv int primary key,
	TenDv	varchar(50),
	TienDv money,
)
create table PHIEU_DANG_KY(
	MaPdk char(10) primary key,
	NgayDk datetime,
	TongsoDk int,
	TongTien money,
	MaNb char(9) foreign key references NGUOI_BAN(MaNb)
)
create table CHI_TIET_PDK(
	MaPdk char(10) foreign key references PHIEU_DANG_KY(MaPdk),
	MaDo char(9) foreign key references DIA_OC(MaDo),
	MaDv int foreign key references DICH_VU(MaDv),
	TuNgay datetime,
	DenNgay datetime,
	SoTien money,
)
create table PHIEU_THU (
	MaPt char(10) primary key,
	PhieuDk char(10) foreign key references PHIEU_DANG_KY(MaPdk),                   
	NgayThu datetime,
	LanThu int,
	SoTien money,
	MaPtGoc char(10)                   --datatype theo phieu thu
)
create table PHIEU_GIA_HAN(
	MaPgh char(10) primary key,
	PhieuDk char(10) foreign key references PHIEU_DANG_KY(MaPdk),
	MaDo char(9) foreign key references DIA_OC(MaDo),
	MaDv int foreign key references DICH_VU(MaDv),
	NgayGh datetime,
	TuNgay datetime,
	DenNgay datetime
)

insert into NGUOI_BAN values (111222333,N'Nguyễn Tường Vân',N'330/2 Lê Hồng Phong Quận 5', 8111222)
insert into NGUOI_BAN values (222333444,N'Trần Thanh Tùng',N'111 Trương Định Quận 3', 8222333)
insert into NGUOI_BAN values (333444555,N'Nguyễn Ngọc Nga',N'315 An Dương Vương Quận 5', 8111222)
ALTER TABLE NGUOI_BAN
ALTER COLUMN HoTen NVARCHAR(100) null -- Đổi datatype
delete from NGUOI_BAN
update NGUOI_BAN
set HoTen = N'Nguyễn Tường Vân', DiaChi = N'330/2 Lê Hồng Phong Quận 5'

alter table LOAI_DIA_OC
alter column TenLDo nvarchar(50)
insert LOAI_DIA_OC values (1,N'Nhà và đất')
insert LOAI_DIA_OC values (2,N'Đất')

alter table DICH_VU
alter column TenDv nvarchar(50)
insert DICH_VU values (1,N'Tờ Bướm quảng cáo 200 tờ', 200000)
insert DICH_VU values (2,N'Tờ Bướm quảng cáo 100 tờ', 100000)
insert DICH_VU values (3,N'Quảng cáo trên báo', 300000)
select TienDv + 1 as total --Test 200.000
from DICH_VU
delete from DICH_VU

insert DIA_OC values ('DO111', '731', N'Trần Hưng Đạo', 7, 1, 1000, 800, N'Đông', N'Mặt tiền',null,1)
insert DIA_OC values ('DO222', '638', N'Nguyễn Văn Cừ', 5, 5, 500, 450, N'Tây', N'Mặt tiền',null,2)
insert DIA_OC values ('DO333', '332/1', N'Nguyễn Thái Học', 9, 1, 100, 100, N'Nam', N'Hẻm',null,1)
insert DIA_OC values ('DO444', '980', N'Lê Hồng Phong', 4, 5, 450, 450, N'Bắc', N'Mặt tiền',null,2)
insert DIA_OC values ('DO555', '111/45', N'Trương Định', 10, 3, 85, 85, N'Đông Nam', N'Hẻm',null,1)

SET DATEFORMAT dmy    --Chỉnh lại pattern cho Date
insert PHIEU_DANG_KY values ('PDK111','1/5/2005', 1, 1040000,111222333)
insert PHIEU_DANG_KY values ('PDK222','19/10/2005', 2, 600000,222333444)
insert PHIEU_DANG_KY values ('PDK333','7/9/2005', 3, 1000000,333444555)

insert CHI_TIET_PDK values ('PDK111','DO111','1','5/5/2005','5/7/2005',400000)
insert CHI_TIET_PDK values ('PDK222','DO222','1','1/11/2005','31/12/2005',400000)
insert CHI_TIET_PDK values ('PDK222','DO333','2','1/11/2005','31/12/2005',200000)
insert CHI_TIET_PDK values ('PDK333','DO444','1','15/9/2005','15/10/2005',200000)
insert CHI_TIET_PDK values ('PDK333','DO444','2','15/9/2005','15/10/2005',100000)
insert CHI_TIET_PDK values ('PDK333','DO555','3','15/9/2005','15/10/2005',300000)

insert PHIEU_THU values ('PT111','PDK111','1/5/2005',1,400000,null)
insert PHIEU_THU values ('PT222','PDK222','19/10/2005',1,400000,null)
insert PHIEU_THU values ('PT333',null,'15/12/2005',2,200000,'PT222')
insert PHIEU_THU values ('PT444',null,'5/7/2005',2,320000,'PT111')
insert PHIEU_THU values ('PT555',null,'1/11/2005',3,320000,'PT111')
insert PHIEU_THU values ('PT666','PDK333','7/9/2005',1,600000,null)
insert PHIEU_THU values ('PT777',null,'15/11/2005',2,400000,'PT666')
ALTER TABLE PHIEU_THU --add foreign key
ADD constraint FK_MAPTG FOREIGN KEY (MaPtGoc) REFERENCES PHIEU_THU(MaPt)

select * from NGUOI_BAN
select * from LOAI_DIA_OC
select * from DICH_VU
select * from DIA_OC
Select * from PHIEU_DANG_KY
select * from CHI_TIET_PDK

select * from PHIEU_THU

select * from PHIEU_GIA_HAN




