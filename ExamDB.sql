/**/
drop database ExamDB
create database ExamDB
use ExamDB
create table Semeters (
	SemId varchar(30) unique, --primary key,
	SemName varchar(20),
	CurriculumName varchar(30),
)
create table Subjects (
	SubId varchar(5),
	SubName varchar(30),
	NumOfHours int,
	PracticalHours int, 
	SemId varchar (30)-- foreign key references Semeters(SemId)
)
-- Câu 1
alter table Subjects
add constraint C_NOH check (PracticalHours > 0)
-- Câu 2
alter table Subjects
add constraint C_PH check (PracticalHours < NumOfHours)
-- Câu 3
create clustered index idx_Semester on Semeters(SemName)
-- Câu 4
insert into Semeters values ('A01','ACCP2007','CHuong trinh 1' ), 
('A02','ACCP2008','CHuong trinh 2' ), 
('A03','ACCP2009','CHuong trinh 3' )
insert into Subjects values ('S001', 'Cong nghe A', 45, 20, 'A01'),
('S002', 'Cong nghe B', 70, 30,'A02'),('S003', 'Cong nghe C', 60, 35,'A01'), 
('S004', 'Cong nghe D', 90, 45,'A03'), ('S005', 'Cong nghe E', 90, 45,'A02')
create view SubjectDetail as
select sj.SubId,sj.SubName, s.SemName,sj.NumOfHours
from Semeters s join Subjects sj on s.SemId = sj.SemId
where s.SemName = 'ACCP2007'

select * from Semeters
select * from Subjects
/*Write query to accept only positive values in the NumOfHour field
  Write query to accept the values in the PracticalHours field must less than the value in the numofHours field
  Create a clustered index named idx_Semester on the SemName column in the semester table
  Write statement to insert some records into two tables
  Create a view named SubjectDetail based on information from the table Semester and the Subjects include SubId Subname, Semname
  and NumofHour of the 'ACCP2007'
  Write a store proc with the following specifications:
  a) Procedure name : ShowStudents
  b) parameter @hours int
  c) procedure tasks: it displays all the subjects have practicalhours greater than or equal with parameter
  Execute the stored procedure 
  write a script to create a trigger named 'Updatevalid' on subjects table
  if the updated value of NumOfhours is more than 250, the update operation is not allowed to success*/