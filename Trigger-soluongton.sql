create database Storage
use Storage
create table kho
(
	makho int identity,
	tenkho nvarchar(50),
	mahang varchar(10) primary key,
	tenhang nvarchar(50),
	slton int
	)

insert kho values(N'Thủ đức','MH002',N'Lê Mỹ',80)
delete from kho
create table donhang
(
	madh varchar(10) primary key,
	mahang varchar(10) foreign key references kho,
	sldat int
	)
insert donhang values('DH002','MH002',10)
delete from donhang

--reset identity
DBCC CHECKIDENT ('dbo.kho', RESEED, 1)

--Tao trigger tg_ktSlHang
alter trigger tg_ktSlHang
on Donhang
for insert
as
	declare @sl int
	select @sl = count(*) from kho k join inserted i
	on k.mahang = i.mahang
	where k.slton - i.sldat <0
	if(@sl > 0)
		begin
			print 'Khong du hang de ban'
			rollback tran
			return
		end
	update kho set slton = slton - inserted.sldat from inserted where kho.mahang = inserted.mahang

select * from kho
select * from donhang
insert donhang values('DH002','MH002',40)
insert donhang values('DH003','MH002',90)
update donhang set sldat = 90 where madh = 'DH002'
/* Đơn hàng DH002 chỉ muốn đặt 30 thùng Lê Mỹ. Viết trigger để cập nhật lại slton của mh này trong kho.*/

create trigger tgUpKho
on donhang
for update
as
	update kho set slton = slton - (select sldat from inserted) + (select sldat from deleted)
	from donhang inner join deleted
	on donhang.mahang = deleted.mahang
--test
update donhang set sldat = 30 where madh = 'DH002'

/* Khi xóa 1 đơn hàng thì phải cập nhật lại slton trong kho */
create trigger tgDelDH on donhang
for delete
as
	update kho set slton = slton + (select sldat from deleted)
	from donhang inner join deleted
	on donhang.mahang = deleted.mahang
--test
delete donhang where madh = 'DH002'