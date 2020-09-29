CREATE DATABASE LibraryManagement
	create table Publisher (
		Code varchar(10) primary key,
		PubName varchar(30),
		[Address] varchar(50),
	)

	create table Books(
		BookCode varchar(10) primary key,
		BookName varchar(40),
		Price int,
		QOH int,
		Code varchar(10) foreign key references Publisher(Code)
	)
	alter table Books
	add check (Price > 0 and Price < 1000)
	alter table Books
	add check (QOH>=0)
	delete from Publisher
	insert Publisher values('111','Kim Dong','12 CMT8 Quan 3')
	insert Publisher values('222','Giao Duc','23 Quang Trung Quan Go Vap')
	insert Publisher values('333','Oreil','11 Pham Van Dong Quan Go Vap')
	insert Publisher values('444','Van Hoc','11 Nguyen Van Qua Quan 12')
	insert Publisher values('555','Chinh tri','66 Vo Van Tan Quan 3')

	insert Books values ('B01','Co Tien Xanh',100,10,111)
	insert Books values ('B02','Giao duc cong dan',200,12,222)
	insert Books values ('B03','C Programming',400,16,333)
	insert Books values ('B04','Tat Den',500,33,444)
	insert Books values ('B05','Mac Lenin',800,0,555)

	create view vwBookInfo as
	select b.BookCode,b.BookName,b.Price,b.QOH,p.PubName
	from Publisher p join Books b on p.Code = b.Code
	where b.QOH > 0
	select * from vwBookInfo
	/*BookCode, BookName, PubName and Price*/
	go --
	alter proc Soldbooks(@qty int = null)
	as 
		if @qty is null
		begin
			select b.BookCode,b.BookName,p.PubName, b.Price
			from Books b join Publisher p on b.Code = p.Code
		end
		else 
			begin
				update Books set QOH = QOH - @qty
				select * from Books
			end
	exec Soldbooks 0
		
/*
    Publisher(Code varchar(10) PK, PubName varchar(30),
	Address varchar(50)

	Books (bookCode varchar(10) PK
	BookName varchar(40),
	Price int ,
	QOH int // số lượng trong kho
	Code varchar(10) FK
1. Write a query to accept the price>0 anf price <1000
2. Write a query to accept QOH>=0
3. Write statements ton insert some records 
	into two tables above
4. Create a view named vwBookInfo based on information from the 
tables Books and Publisher includes BookCode,BookName,Price,
QOH and PubName where QOH>0
5.Write a store procedure with the following specifications:
Procedure Name : SoldBooks
Parameters : @qty as Integer
Tasks:
  - Using Try catch to handle errors
  -If no value is paased to @qty argument , it will list
  out BookCode, BookName, PubName and Price of all bOkks
  Else , it will decrease the QOH of all books
  by @qty parameter
*/
/*Tạo clustered index tên IDX_Pub trên cột PubName của bảng Publisher*/

/* Ver 2
A)Tạo database tên BookStore có 2 table
    1) Publisher (PubCode varchar(10) PK, pubName varchar(30),
	   Address varchar(50)
    2) Book (BookCode varchar(10) PK, bookName varchar(40),
	Price int, QOH int, PubCode varchar(10) FK)
	B) Viết query để ràng buộc Price>0 and price <1000
	C) Viết query để ràng buộc QOH >=0
	D) Tạo clustered index tên IDX_Pub trên cột PubName của bảng 
	Publisher
	E) Tạo view tên vwBookInfo hiển thị các thông tin
	BookCode, BookName, Price, QOH, pubName với điều kiện
	QOH >0
	F) Tạo store proc tên SoldBooks
	với tham số đầu vào @qty integer
	Nhiện vụ của store proc :
	- Nếu không có giá trị được truyền cho @qty thì sẽ liệt kê
	tất cả sách.
	-Ngược lại : sẽ giảm QOH của tất cả sách bởi tham số @qty
	Ex: Exec SoldBooks 5
*/