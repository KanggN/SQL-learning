create database Taphoa

use Taphoa
create table KhoHang(
	Id int unique not null,
	Mahang varchar(10) primary key,
	Tenhang nvarchar(40),
	Soluongton int
)
create table DatHang(
	Mahang varchar(10) foreign key references Khohang(Mahang),
	Soluongdat int
)
drop table Khohang
drop table DatHang


insert Khohang values (1,'A01',N'Rau Muống',50)
insert Khohang values (2,'A02',N'Rau Mồng Tơi',60)
insert Khohang values (3,'A03',N'Rau Dền',70)

go
create trigger tg_In on DatHang
for insert
as 
	begin
	update KhoHang
	set Soluongton =  Soluongton - (select Soluongdat from inserted where inserted.Mahang = KhoHang.Mahang)
	from Khohang join inserted on KhoHang.Mahang = inserted.Mahang
	end

create trigger tg_up on DatHang
for update
as
	begin
	update KhoHang 
	set Soluongton = Soluongton - (select Soluongdat from inserted where Mahang = KhoHang.Mahang) 
	+ (select Soluongdat from deleted where Mahang = KhoHang.Mahang)
	from KhoHang
	join inserted on inserted.Mahang = KhoHang.Mahang --inserted hay deleted đều ok
	end

create trigger tg_de on DatHang for delete
as 
	begin 
		update KhoHang
		set Soluongton = Soluongton + (select Soluongdat from deleted where deleted.Mahang = KhoHang.Mahang)
		from KhoHang join deleted on deleted.Mahang = KhoHang.Mahang
	end
	

create trigger tg_limit 
on DatHang 
for insert, update
as 
	if (select Soluongton from Khohang k join inserted i on k.Mahang=i.Mahang where K.Mahang = i.Mahang) < 0
	begin
	print N'Không đủ hàng'
	rollback tran
	end

delete from DatHang
delete from KhoHang


insert DatHang values ('A01',-10)
delete from DatHang where Mahang = 'A01'
update DatHang 
set Soluongdat = '60' where Mahang = 'A01'

select * from Khohang
select * from DatHang
