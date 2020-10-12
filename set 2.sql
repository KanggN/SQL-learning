CREATE DATABASE [set2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'set2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\set2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'set2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\set2_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
USE set2
create table TVType( 
	TypeCode varchar(10) not null unique,
	TypeName varchar(30),
	Descriptions varchar(50)
) 
create table Television (
	TVCode varchar(10) primary key,
	Manufacturer varchar(40), 
	Price int,
	Size int,
	TypeCode varchar(10) foreign key references TVType(TypeCode)
)


alter table Television
add constraint Ch_P check (Price > 50 and Price <5000)

alter table Television
add constraint Df_M default 'unknown' for Manufacturer



Create clustered index IX_Type on TVType(TypeName)

insert TVType values ('TV01','TV-small','Nho')
insert TVType values ('TV02','TV-large','To')

insert Television values ('A01','Sony',90,18, 'TV01')
insert Television values ('A02','SamSung',700,32, 'TV02')
insert Television values ('A03','Asanzo',500,18, 'TV01')
insert Television values ('A04','Panasonic',700,32, 'TV02')


alter view TVInfo as
select tv.TVCode, tv.Manufacturer, tv.Price, tv.Size, t.TypeName 
from Television tv join TVType t on tv.TypeCode = t.TypeCode
where tv.Price < 100

alter proc ShowTV @size int = null as -- gán null nếu không có gì nhập vào 
--set @size = null 
begin try
	if @size is null
	select * from Television
	else
	select * from Television
	where size < @size
end try
BEGIN CATCH
		SELECT ERROR_NUMBER() AS 'err num',
		ERROR_SEVERITY() AS 'err severity',
		ERROR_STATE() AS 'Err state',
		ERROR_MESSAGE() AS 'Err message',
		ERROR_LINE() AS 'Err Line',
		ERROR_PROCEDURE() AS 'Procedure'
	END CATCH
exec ShowTV 
exec ShowTV  

create trigger 


CREATE PROC usp_divide(
    @a decimal,
    @b decimal,
    @c decimal output
) AS
BEGIN
    BEGIN TRY
        SET @c = @a / @b;
    END TRY
    BEGIN CATCH
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;

declare @result decimal 
exec usp_divide 21,0,@result output
print @result

alter trigger DeleteTv on Television for update as
declare @a int
if exists (select * from inserted i join Television t on t.TVCode = i.TVCode where i.Size < 10)
	begin
	set @a = (select i.size from inserted i where i.Size < 10)
		delete from Television where Size = @a
	end


drop table Television
drop table TVType
delete from Television
delete from TVType
select * from Television
select * from TVType

update television set size = 2 where manufacturer = 'SamSung'