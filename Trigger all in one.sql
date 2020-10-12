--CREATE DATABASE PretestDM
--drop database PretestDM
--USE PretestDM


CREATE TABLE ItemForSale
(
	ItemId INT IDENTITY(1,1) PRIMARY KEY,
	ItemName VARCHAR(30),
	Quantity INT
)

CREATE TABLE Sale
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	ItemId INT FOREIGN KEY REFERENCES ItemForSale(ItemId),
	SaleQuantity INT
)

INSERT INTO ItemForSale (ItemName, Quantity) VALUES
('Laptop', 100),
('Smart Phone', 59),
('Ipad', 80)
insert Sale(itemId, saleQuantity) values (1,10)
insert Sale(itemId, saleQuantity) values (2,9)
update Sale set saleQuantity = 999999 where itemId = 1
delete from Sale
delete from ItemForSale
select * from Sale
select * from ItemForSale
create trigger tg_in on Sale for insert,update as
	if exists (select * from inserted i join ItemForSale It ON It.itemId = i.itemId where It.Quantity - i.saleQuantity < 0 )
	begin 
		print 'Khong du hang'
		rollback tran
	end
--drop trigger tg_in
go
CREATE TRIGGER OrderItemForSale ON Sale
FOR INSERT, UPDATE, DELETE
AS
DECLARE @Action AS CHAR(1);
SET @Action = (
				CASE WHEN EXISTS(SELECT * FROM INSERTED) AND 
						  EXISTS(SELECT * FROM DELETED)
                    THEN 'U' 
					-- Vì khi update thì nó sẽ lưu data xuống 2 bảng inserted và deleted
					--Ngoại trừ 2 trường hợp trên thì chỉ còn insert hoặc delete, bản nào có data thì sẽ có hành động tương ứng
                    WHEN EXISTS(SELECT * FROM INSERTED)
                    THEN 'I'
                    WHEN EXISTS(SELECT * FROM DELETED)
                    THEN 'D'
                    ELSE NULL
                END
				)

IF (@Action = 'U')
BEGIN
	UPDATE ItemForSale 
	SET Quantity = Quantity  
					- (SELECT SaleQuantity FROM inserted i join ItemForSale It On It.itemId = i.itemId)
					+ (SELECT SaleQuantity FROM deleted d join ItemForSale It ON It.itemId = d.itemId)
	FROM ItemForSale It join inserted i ON It.Id = i.itemId
END
IF (@Action = 'I')
BEGIN
	UPDATE ItemForSale 
	SET Quantity = Quantity  
					- (SELECT SaleQuantity FROM inserted i join ItemForSale It ON It.itemId = i.itemId)
	FROM ItemForSale It join inserted i ON It.itemId = i.itemId
END
IF (@Action = 'D')
BEGIN
	UPDATE ItemForSale 
	SET Quantity = Quantity  
					+ (SELECT SaleQuantity FROM deleted d join ItemForSale It ON It.itemId = d.itemId)
	FROM ItemForSale It join deleted d ON It.itemId = d.itemId
END
if exists (select * from inserted i join ItemForSale It ON It.ItemId = i.itemId where It.Quantity - i.saleQuantity < 0 )
	begin
		print 'Khong du hang'
		rollback tran
	end

