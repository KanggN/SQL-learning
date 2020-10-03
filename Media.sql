use Media
create database Media
create table Categories
(
	CateID int unique, --primary key,
	CateName varchar (15),
	Decription varchar (20)
)
create table Album
(
	Albumid int primary key,
	title varchar (20),
	CateID int, --foreign key references Categories(CateID),
	CoverImage varchar (50),
	ShortDescription varchar(50),
	price int check (price >0),
	Edition int default 1
)
drop table Album
drop table Categories
insert into Categories values(1,'Phuong Thanh','Rock'),
(2,'Phuong Thanh','Balas'),
(3,'Lam Truong','Nhac Hoa'),
(4,'Lam Truong','Nhac Viet'),
(5,'Dan Truong','Hat voi Cam Ly')
insert into Album values(1,'PT1',1,'Anh PT1','Vol1',25000,1), 
(2,'PT2',2,'Anh PT2','Vol2',30000,1), 
(3,'LT1',3,'Anh LT1','Vol1',25000,1),
(4,'LT2',4,'Anh LT2','Vol2',35000,2), 
(5,'DT',5,'Anh DT','Vol1',40000,3)

select * from Categories
select * from Album
create clustered index IX_CateID on Categories(CateID)

create trigger tg_e @CateID varchar(20) on categories 
for delete 
as if exists (
select a.*
from Album a join Categories c on a.CateId = c.CateId
where c.CateID = @CateID)
begin
print 'you cant'
rollback tran
end
