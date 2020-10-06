create database pretestDM
use pretestDM
drop table ItemForSale
drop table Sale
create table ItemForSale (
	Id int primary key,
	itemName varchar(30),
	Quantity int
)
create table Sale (
	itemId int foreign key references ItemForSale,
	saleQuantity int
)
insert Sale values ()
alter trigger tg_insert on sale for insert 
as
  if(select Quantity from ItemForSale a join inserted i on i.itemId = a.Id  where i.itemId = a.Id ) < 0
  begin 
	print N'Khong đủ hàng'
	rollback tran
  end
update ItemForSale
set Quantity = Quantity - (select i.saleQuantity from inserted i join Sale s on i.itemId = s.itemId)
from inserted where ItemForSale.Id = inserted.itemId


insert Sale values (1,10)
insert Sale values (2,10)

insert ItemForSale values (1,'Laptop',100)
insert ItemForSale values (2,'Iphone',80)



select * from ItemForSale
select * from Sale



delete from Sale
delete from ItemForSale