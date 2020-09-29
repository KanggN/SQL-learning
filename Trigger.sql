create database ACBbank
use ACBbank
create table account (
	Id varchar(10) primary key,
	AccountName varchar (30),
	balance int
)
create table account_audit (
	Id varchar(10) primary key,
	AccountName varchar (30),
	balance int,
	Audit_action varchar(50),
	Audit_Timestamp datetime
)

insert into Account values ('A001', 'Trung', 60000)
insert into Account values ('A002', 'Ngoan', 80000)
select * from account

go
alter trigger tgInsert
on account
for insert
as if ( select balance from inserted balance ) > 50000
	begin
	print N'Không thể rút quá 50k'
	rollback tran --Hủy bỏ giao dịch
	end

insert into Account values ('A003', 'Quang', 70000)
insert into Account values ('A004', 'Khang', 100000)
insert into Account values ('A005', 'Tân', 20000)

alter trigger tgAfterInsert
on Account 
for insert
as 
	declare @Id varchar(10), 
	@AccountName varchar (30), 
	@balance int, 
	@Audit_action varchar(50),
	@Audit_Timestamp datetime
	select @Id = i.Id from inserted i;
	select @AccountName = i.AccountName from inserted i
	select @balance = i.balance from inserted i
	set @Audit_action = 'Inserted record --After insert trigger'
	insert into account_audit values (@Id,@AccountName,@balance,@Audit_action,getdate())
	print 'After trigger fired'
	select * from account_audit
	select * from account

create trigger tgIDmodify
on account
for update
as if (update (id))
	begin 
	print N'Bạn không thể thay đổi ID' 
	rollback tran
	end

update account
set Id = 'A009'
where Id = 'A001'

