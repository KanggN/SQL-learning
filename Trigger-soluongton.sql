create database Storage
drop database Storage
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

delete from donhang

--reset identity
DBCC CHECKIDENT ('dbo.kho', RESEED, 1)

alter trigger tg_ktsl on donhang for insert,update as --Bảng inserted liên quan với lệnh update chứ không riêng insert
	 if exists (select * from inserted i join kho k on k.mahang = i.mahang  where  k.slton - i.sldat < 0)
	begin 
		print 'Khong du hang'
		rollback tran
	end
create trigger tg_in on donhang for insert as
begin
	update kho
	set slton = slton - (select i.sldat from inserted i join kho k on i.mahang = k.mahang)
	from kho k join inserted i on i.mahang = k.mahang
end

alter trigger tg_de on donhang for delete as
begin
	update kho
	set slton = slton + (select d.sldat from deleted d join kho k on d.mahang = k.mahang)
	from kho k join deleted d on d.mahang = k.mahang
end

create trigger tg_up on donhang for update
as 
	begin
	update kho
	set slton = slton - (select i.sldat from inserted i join kho k on k.mahang = i.mahang)
	+ (select d.sldat from deleted d join kho k on d.mahang = k.mahang)
	from kho k join inserted i on i.mahang = k.mahang
	end


delete from kho
delete from donhang
delete from donhang where madh = 'DH003'
delete from donhang where madh = 'DH004'

insert kho values(N'Thủ đức','MH002',N'Lê Mỹ',80)
insert kho values(N'Tân bình','MH003',N'Táo Tàu',30)
insert donhang values('DH003','MH002',10)
insert donhang values('DH004','MH003',20)

update donhang set sldat = 90 where mahang = 'MH002' 
select * from donhang
select * from kho













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