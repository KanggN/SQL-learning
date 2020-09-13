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
	PhieuDk char(10) foreign key references PHIEU_DANG_KY(MaPdk),                   --datatype tạo theo mẫu minh họa
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



