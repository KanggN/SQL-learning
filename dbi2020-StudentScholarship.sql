CREATE DATABASE [DBI202_SPRING2017_BLOCK5]
USE [DBI202_SPRING2017_BLOCK5]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 25/03/2020 18:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Class](
	[classCode] [varchar](10) NOT NULL,
	[className] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[classCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DummyTable]    Script Date: 25/03/2020 18:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DummyTable](
	[value] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exam]    Script Date: 25/03/2020 18:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Exam](
	[studentID] [varchar](10) NOT NULL,
	[subjectCode] [varchar](10) NOT NULL,
	[examDate] [date] NOT NULL,
	[examScore] [float] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[studentID] ASC,
	[subjectCode] ASC,
	[examDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Scholarship]    Script Date: 25/03/2020 18:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Scholarship](
	[schoName] [varchar](150) NOT NULL,
	[schoGranted] [float] NOT NULL,
 CONSTRAINT [PK_Scholarship] PRIMARY KEY CLUSTERED 
(
	[schoName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 25/03/2020 18:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[studentID] [varchar](10) NOT NULL,
	[studentFName] [varchar](150) NOT NULL,
	[studentLName] [varchar](150) NULL,
	[studentGender] [bit] NOT NULL,
	[studentDOB] [date] NOT NULL,
	[studentAddress] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[studentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student_Class]    Script Date: 25/03/2020 18:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student_Class](
	[studentID] [varchar](10) NOT NULL,
	[classCode] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Student_Class] PRIMARY KEY CLUSTERED 
(
	[studentID] ASC,
	[classCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student_Scholarship]    Script Date: 25/03/2020 18:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student_Scholarship](
	[StudentID] [varchar](10) NOT NULL,
	[schoName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Student_Scholarship] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[schoName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 25/03/2020 18:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectCode] [varchar](10) NOT NULL,
	[subjectName] [varchar](150) NOT NULL,
	[numOfCredit] [int] NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subjectCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Class] ([classCode], [className]) VALUES (N'Class01', N'Class Number 1')
INSERT [dbo].[Class] ([classCode], [className]) VALUES (N'Class02', N'Class Number 2')
INSERT [dbo].[Class] ([classCode], [className]) VALUES (N'Class03', N'Class NUmber 3')
INSERT [dbo].[Class] ([classCode], [className]) VALUES (N'Class1000', N'New Class')
INSERT [dbo].[Class] ([classCode], [className]) VALUES (N'Class99', N'Class with No Student')
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST01', N'DBA', CAST(0x253C0B00 AS Date), 2)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST01', N'DBI', CAST(0x253C0B00 AS Date), 5)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST01', N'DIS', CAST(0x253C0B00 AS Date), 6)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST01', N'ENG1', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST01', N'ENG2', CAST(0x253C0B00 AS Date), 4)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST01', N'MAD', CAST(0x253C0B00 AS Date), 4)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST01', N'MAE', CAST(0x253C0B00 AS Date), 1)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST01', N'MAO', CAST(0x253C0B00 AS Date), 9)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST01', N'OOP', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST01', N'PRJ', CAST(0x253C0B00 AS Date), 5)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST01', N'WIG', CAST(0x253C0B00 AS Date), 1)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST02', N'DBA', CAST(0x253C0B00 AS Date), 8)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST02', N'DBI', CAST(0x253C0B00 AS Date), 8)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST02', N'DIS', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST02', N'ENG1', CAST(0x253C0B00 AS Date), 5)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST02', N'ENG2', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST02', N'MAD', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST02', N'MAE', CAST(0x253C0B00 AS Date), 8)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST02', N'MAO', CAST(0x253C0B00 AS Date), 4)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST02', N'OOP', CAST(0x253C0B00 AS Date), 9)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST02', N'PRJ', CAST(0x253C0B00 AS Date), 6)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST02', N'WIG', CAST(0x253C0B00 AS Date), 8)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST03', N'DBA', CAST(0x253C0B00 AS Date), 1)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST03', N'DBI', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST03', N'DIS', CAST(0x253C0B00 AS Date), 1)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST03', N'ENG1', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST03', N'ENG2', CAST(0x253C0B00 AS Date), 6)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST03', N'MAD', CAST(0x253C0B00 AS Date), 9)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST03', N'MAE', CAST(0x253C0B00 AS Date), 9)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST03', N'MAO', CAST(0x253C0B00 AS Date), 8)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST03', N'OOP', CAST(0x253C0B00 AS Date), 9)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST03', N'PRJ', CAST(0x253C0B00 AS Date), 6)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST03', N'WIG', CAST(0x253C0B00 AS Date), 1)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST04', N'DBA', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST04', N'DBI', CAST(0x253C0B00 AS Date), 1)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST04', N'DIS', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST04', N'ENG1', CAST(0x253C0B00 AS Date), 8)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST04', N'ENG2', CAST(0x253C0B00 AS Date), 9)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST04', N'MAD', CAST(0x253C0B00 AS Date), 4)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST04', N'MAE', CAST(0x253C0B00 AS Date), 9)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST04', N'MAO', CAST(0x253C0B00 AS Date), 6)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST04', N'OOP', CAST(0x253C0B00 AS Date), 4)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST04', N'PRJ', CAST(0x253C0B00 AS Date), 6)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST04', N'WIG', CAST(0x253C0B00 AS Date), 5)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST05', N'DBA', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST05', N'DBI', CAST(0x253C0B00 AS Date), 2)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST05', N'DIS', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST05', N'ENG1', CAST(0x253C0B00 AS Date), 5)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST05', N'ENG2', CAST(0x253C0B00 AS Date), 5)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST05', N'MAD', CAST(0x253C0B00 AS Date), 6)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST05', N'MAE', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST05', N'MAO', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST05', N'OOP', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST05', N'PRJ', CAST(0x253C0B00 AS Date), 1)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST05', N'WIG', CAST(0x253C0B00 AS Date), 6)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST06', N'DBA', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST06', N'DBI', CAST(0x253C0B00 AS Date), 9)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST06', N'DIS', CAST(0x253C0B00 AS Date), 4)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST06', N'ENG1', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST06', N'ENG2', CAST(0x253C0B00 AS Date), 4)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST06', N'MAD', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST06', N'MAE', CAST(0x253C0B00 AS Date), 4)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST06', N'MAO', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST06', N'OOP', CAST(0x253C0B00 AS Date), 2)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST06', N'PRJ', CAST(0x253C0B00 AS Date), 2)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST06', N'WIG', CAST(0x253C0B00 AS Date), 1)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST07', N'DBA', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST07', N'DBI', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST07', N'DIS', CAST(0x253C0B00 AS Date), 8)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST07', N'ENG1', CAST(0x253C0B00 AS Date), 5)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST07', N'ENG2', CAST(0x253C0B00 AS Date), 4)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST07', N'MAD', CAST(0x253C0B00 AS Date), 8)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST07', N'MAE', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST07', N'MAO', CAST(0x253C0B00 AS Date), 8)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST07', N'OOP', CAST(0x253C0B00 AS Date), 6)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST07', N'PRJ', CAST(0x253C0B00 AS Date), 2)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST07', N'WIG', CAST(0x253C0B00 AS Date), 1)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST08', N'DBA', CAST(0x253C0B00 AS Date), 8)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST08', N'DBI', CAST(0x253C0B00 AS Date), 9)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST08', N'DIS', CAST(0x253C0B00 AS Date), 8)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST08', N'ENG2', CAST(0x253C0B00 AS Date), 2)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST08', N'MAD', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST08', N'MAE', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST08', N'MAO', CAST(0x253C0B00 AS Date), 5)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST08', N'OOP', CAST(0x253C0B00 AS Date), 6)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST08', N'PRJ', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST08', N'WIG', CAST(0x253C0B00 AS Date), 2)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST09', N'DBA', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST09', N'DBI', CAST(0x253C0B00 AS Date), 9)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST09', N'DIS', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST09', N'ENG2', CAST(0x253C0B00 AS Date), 2)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST09', N'MAD', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST09', N'MAE', CAST(0x253C0B00 AS Date), 9)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST09', N'MAO', CAST(0x253C0B00 AS Date), 1)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST09', N'OOP', CAST(0x253C0B00 AS Date), 4)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST09', N'PRJ', CAST(0x253C0B00 AS Date), 6)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST09', N'WIG', CAST(0x253C0B00 AS Date), 4)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST09', N'WIG', CAST(0x263C0B00 AS Date), 9)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST10', N'DBA', CAST(0x253C0B00 AS Date), 8)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST10', N'DBI', CAST(0x253C0B00 AS Date), 9)
GO
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST10', N'DIS', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST10', N'ENG1', CAST(0x253C0B00 AS Date), 4)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST10', N'ENG2', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST10', N'MAD', CAST(0x253C0B00 AS Date), 3)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST10', N'MAE', CAST(0x253C0B00 AS Date), 4)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST10', N'MAO', CAST(0x253C0B00 AS Date), 8)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST10', N'OOP', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST10', N'PRJ', CAST(0x253C0B00 AS Date), 7)
INSERT [dbo].[Exam] ([studentID], [subjectCode], [examDate], [examScore]) VALUES (N'ST10', N'PRJ', CAST(0x263C0B00 AS Date), 5)
INSERT [dbo].[Scholarship] ([schoName], [schoGranted]) VALUES (N'Hard', 5000)
INSERT [dbo].[Scholarship] ([schoName], [schoGranted]) VALUES (N'NoGranted', 999999)
INSERT [dbo].[Scholarship] ([schoName], [schoGranted]) VALUES (N'Talent', 10000)
INSERT [dbo].[Student] ([studentID], [studentFName], [studentLName], [studentGender], [studentDOB], [studentAddress]) VALUES (N'ST01', N'Alex', N'Mark', 0, CAST(0x18190B00 AS Date), N'123 Doren St. Peetbuck')
INSERT [dbo].[Student] ([studentID], [studentFName], [studentLName], [studentGender], [studentDOB], [studentAddress]) VALUES (N'ST02', N'Willson', N'III Smith', 1, CAST(0x2E180B00 AS Date), N'57 Fallow Eve')
INSERT [dbo].[Student] ([studentID], [studentFName], [studentLName], [studentGender], [studentDOB], [studentAddress]) VALUES (N'ST03', N'Link', N'Vu', 0, CAST(0x471B0B00 AS Date), N'8 th floor, Victoria bulding, 8 St Jonh P Jonh')
INSERT [dbo].[Student] ([studentID], [studentFName], [studentLName], [studentGender], [studentDOB], [studentAddress]) VALUES (N'ST04', N'Sam', N'Willschester', 1, CAST(0x2A1A0B00 AS Date), N'124 Fallow Eve')
INSERT [dbo].[Student] ([studentID], [studentFName], [studentLName], [studentGender], [studentDOB], [studentAddress]) VALUES (N'ST05', N'Joshua', N'David', 1, CAST(0x1C190B00 AS Date), N'4 Wiston Chuchil Street')
INSERT [dbo].[Student] ([studentID], [studentFName], [studentLName], [studentGender], [studentDOB], [studentAddress]) VALUES (N'ST06', N'Andrew', N'Ng', 1, CAST(0x651A0B00 AS Date), N'5 Jonh Kenedy Street')
INSERT [dbo].[Student] ([studentID], [studentFName], [studentLName], [studentGender], [studentDOB], [studentAddress]) VALUES (N'ST07', N'Lorem', N'Buttcher', 0, CAST(0x841A0B00 AS Date), N'89 Billy Apartment')
INSERT [dbo].[Student] ([studentID], [studentFName], [studentLName], [studentGender], [studentDOB], [studentAddress]) VALUES (N'ST08', N'Linsay', N'Lohan', 0, CAST(0xFE150B00 AS Date), N'90 Sandiego de DC street')
INSERT [dbo].[Student] ([studentID], [studentFName], [studentLName], [studentGender], [studentDOB], [studentAddress]) VALUES (N'ST09', N'Muriel', N'Visani', 0, CAST(0x19160B00 AS Date), N'80 Ilunois Bay')
INSERT [dbo].[Student] ([studentID], [studentFName], [studentLName], [studentGender], [studentDOB], [studentAddress]) VALUES (N'ST10', N'Alex', N'Pinter', 1, CAST(0x51170B00 AS Date), N'93 Wall Frolemson')
INSERT [dbo].[Student] ([studentID], [studentFName], [studentLName], [studentGender], [studentDOB], [studentAddress]) VALUES (N'ST1000', N'New', N'Student', 0, CAST(0x09190B00 AS Date), N'FU Hoa Lac')
INSERT [dbo].[Student_Class] ([studentID], [classCode]) VALUES (N'ST01', N'Class01')
INSERT [dbo].[Student_Class] ([studentID], [classCode]) VALUES (N'ST01', N'Class02')
INSERT [dbo].[Student_Class] ([studentID], [classCode]) VALUES (N'ST02', N'Class01')
INSERT [dbo].[Student_Class] ([studentID], [classCode]) VALUES (N'ST03', N'Class01')
INSERT [dbo].[Student_Class] ([studentID], [classCode]) VALUES (N'ST04', N'Class02')
INSERT [dbo].[Student_Class] ([studentID], [classCode]) VALUES (N'ST05', N'Class02')
INSERT [dbo].[Student_Class] ([studentID], [classCode]) VALUES (N'ST06', N'Class03')
INSERT [dbo].[Student_Class] ([studentID], [classCode]) VALUES (N'ST07', N'Class03')
INSERT [dbo].[Student_Class] ([studentID], [classCode]) VALUES (N'ST08', N'Class03')
INSERT [dbo].[Student_Class] ([studentID], [classCode]) VALUES (N'ST09', N'Class03')
INSERT [dbo].[Student_Class] ([studentID], [classCode]) VALUES (N'ST10', N'Class01')
INSERT [dbo].[Student_Class] ([studentID], [classCode]) VALUES (N'st1000', N'class1000')
INSERT [dbo].[Student_Scholarship] ([StudentID], [schoName]) VALUES (N'ST01', N'Hard')
INSERT [dbo].[Student_Scholarship] ([StudentID], [schoName]) VALUES (N'ST01', N'Talent')
INSERT [dbo].[Student_Scholarship] ([StudentID], [schoName]) VALUES (N'ST02', N'Hard')
INSERT [dbo].[Student_Scholarship] ([StudentID], [schoName]) VALUES (N'ST03', N'Hard')
INSERT [dbo].[Subject] ([subjectCode], [subjectName], [numOfCredit]) VALUES (N'DBA', N'Data analysis', 15)
INSERT [dbo].[Subject] ([subjectCode], [subjectName], [numOfCredit]) VALUES (N'DBI', N'Database Design and Implementation', 15)
INSERT [dbo].[Subject] ([subjectCode], [subjectName], [numOfCredit]) VALUES (N'DIS', N'Distributed Information System', 10)
INSERT [dbo].[Subject] ([subjectCode], [subjectName], [numOfCredit]) VALUES (N'ENG1', N'Basic English', 5)
INSERT [dbo].[Subject] ([subjectCode], [subjectName], [numOfCredit]) VALUES (N'ENG2', N'Advanced English', 5)
INSERT [dbo].[Subject] ([subjectCode], [subjectName], [numOfCredit]) VALUES (N'MAD', N'Discrete Mathematics', 15)
INSERT [dbo].[Subject] ([subjectCode], [subjectName], [numOfCredit]) VALUES (N'MAE', N'Advanced math', 15)
INSERT [dbo].[Subject] ([subjectCode], [subjectName], [numOfCredit]) VALUES (N'MAO', N'Optimization ', 15)
INSERT [dbo].[Subject] ([subjectCode], [subjectName], [numOfCredit]) VALUES (N'OOP', N'Object Oriented Programming', 15)
INSERT [dbo].[Subject] ([subjectCode], [subjectName], [numOfCredit]) VALUES (N'PRJ', N'Java Programming', 10)
INSERT [dbo].[Subject] ([subjectCode], [subjectName], [numOfCredit]) VALUES (N'WIG', N'Work In Group', 5)
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Student] FOREIGN KEY([studentID])
REFERENCES [dbo].[Student] ([studentID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Student]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Subject] FOREIGN KEY([subjectCode])
REFERENCES [dbo].[Subject] ([subjectCode])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Subject]
GO
ALTER TABLE [dbo].[Student_Class]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class_Class] FOREIGN KEY([classCode])
REFERENCES [dbo].[Class] ([classCode])
GO
ALTER TABLE [dbo].[Student_Class] CHECK CONSTRAINT [FK_Student_Class_Class]
GO
ALTER TABLE [dbo].[Student_Class]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class_Student] FOREIGN KEY([studentID])
REFERENCES [dbo].[Student] ([studentID])
GO
ALTER TABLE [dbo].[Student_Class] CHECK CONSTRAINT [FK_Student_Class_Student]
GO
ALTER TABLE [dbo].[Student_Scholarship]  WITH CHECK ADD  CONSTRAINT [FK_Student_Scholarship_Scholarship] FOREIGN KEY([schoName])
REFERENCES [dbo].[Scholarship] ([schoName])
GO
ALTER TABLE [dbo].[Student_Scholarship] CHECK CONSTRAINT [FK_Student_Scholarship_Scholarship]
GO
ALTER TABLE [dbo].[Student_Scholarship]  WITH CHECK ADD  CONSTRAINT [FK_Student_Scholarship_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([studentID])
GO
ALTER TABLE [dbo].[Student_Scholarship] CHECK CONSTRAINT [FK_Student_Scholarship_Student]
GO

--Câu 1
select *
from Student
where studentGender = '1'
--Câu 2
select s.studentFName, s.studentLName, CAST(avg(e.examScore) as decimal(38, 2)) as Average
from Student s right join Exam e on s.studentID = e.studentID
group by s.studentFName, s.studentLName
--Câu 3
select s.studentFName, s.studentLName, CAST(avg(e.examScore) as decimal(38, 2)) as Average
from Exam e join Student s on e.studentID = s.studentID
group by s.studentFName, s.studentLName
having avg(e.examScore) between 5 and 6
--Câu 4
select c.classCode, count(s.studentID)
from Class c left join Student_Class s on c.classCode = s.classCode
group by c.classCode
--Câu 5
select *,datediff(yy,studentDOB,getdate())
from Student
where studentGender = '1' and datediff(yy,studentDOB,getdate())>28
--Câu 6
select s.*,c.className
from Class c join Student_Class Z on c.classCode = Z.classCode 
right join Student s on s.studentID = Z.studentID
--Câu 7
select s.*,Y.schoName, Y.schoGranted
from Student s join Student_Scholarship Z on Z.StudentID = s.studentID 
join Scholarship Y on Y.schoName = Z.schoName
where Z.StudentID in (select top 1 StudentID
from Student_Scholarship
group by StudentID)

select s.*, t.schoName, t.schoGranted from Student s join
(select top 1 s.schoGranted, ss.StudentID, ss.schoName
from Student_Scholarship ss join Scholarship s on s.schoName = ss.schoName
order by s.schoGranted desc) t on s.studentID = t. StudentID

select * from Exam
select * from Student
select * from [Subject]
select * from Class
select * from Student_Class
select * from Scholarship
select * from Student_Scholarship

--Câu 8
select B.schoName,case 
	when B.schoName not in (select schoName from Student_Scholarship  ) then 0
	else sum(B.schoGranted) end
from Student_Scholarship A right join Scholarship B on A.schoName = B.schoName
group by B.schoName
--Cách 2
select s.schoName, count(ss.schoName) * s.schoGranted as total
from Student_Scholarship ss right join Scholarship s on ss.schoName = s.schoName
group by s.schoName, s.schoGranted



select * from Exam
select * from Student
select * from [Subject]
select * from Class
select * from Student_Class
select * from Scholarship
select * from Student_Scholarship


