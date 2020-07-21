USE [master]
GO
/****** Object:  Database [QuanLyQuanAnDT]    Script Date: 7/21/2020 9:31:58 PM ******/
CREATE DATABASE [QuanLyQuanAnDT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanAnDT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLyQuanAnDT.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyQuanAnDT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLyQuanAnDT_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyQuanAnDT] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanAnDT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanAnDT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanAnDT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyQuanAnDT] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyQuanAnDT]
GO
/****** Object:  UserDefinedFunction [dbo].[fuConvertToUnsign1]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fuConvertToUnsign1] ( @strInput NVARCHAR(4000) ) RETURNS NVARCHAR(4000) AS BEGIN IF @strInput IS NULL RETURN @strInput IF @strInput = '' RETURN @strInput DECLARE @RT NVARCHAR(4000) DECLARE @SIGN_CHARS NCHAR(136) DECLARE @UNSIGN_CHARS NCHAR (136) SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' +NCHAR(272)+ NCHAR(208) SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee iiiiiooooooooooooooouuuuuuuuuuyyyyy AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD' DECLARE @COUNTER int DECLARE @COUNTER1 int SET @COUNTER = 1 WHILE (@COUNTER <=LEN(@strInput)) BEGIN SET @COUNTER1 = 1 WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1) BEGIN IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) ) BEGIN IF @COUNTER=1 SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1) ELSE SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER) BREAK END SET @COUNTER1 = @COUNTER1 +1 END SET @COUNTER = @COUNTER +1 END SET @strInput = replace(@strInput,' ','-') RETURN @strInput END

GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL DEFAULT (N'Group04'),
	[PassWord] [nvarchar](100) NOT NULL,
	[Type] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [date] NOT NULL CONSTRAINT [DF__Bill__DateCheckI__1FCDBCEB]  DEFAULT (getdate()),
	[DateCheckOut] [date] NULL,
	[idTable] [int] NOT NULL,
	[status] [int] NOT NULL CONSTRAINT [DF__Bill__status__20C1E124]  DEFAULT ((0)),
	[discount] [int] NULL,
	[totalPrice] [float] NULL,
 CONSTRAINT [PK__Bill__3213E83F4EED5697] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[Count] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL DEFAULT (N'Chua co ten'),
	[idCategory] [int] NOT NULL,
	[Price] [float] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL DEFAULT (N'chua co ten'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL DEFAULT (N'ban chua co ten'),
	[status] [nvarchar](100) NOT NULL DEFAULT (N'Trong'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type]) VALUES (N'hxh', N'Huỳnh Xuân Hoàng', N'3', 0)
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type]) VALUES (N'nvq', N'Nguyễn Việt Quân', N'4', 0)
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type]) VALUES (N'nvt', N'Nguyễn Văn Tây ', N'1', 1)
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type]) VALUES (N'tnt', N'Trần Nguyên Tài', N'2', 1)
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (33, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 23, 1, 0, 278)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (34, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 24, 1, 20, 91.2)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (35, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 25, 1, 30, 284.9)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (36, CAST(N'2020-07-21' AS Date), NULL, 23, 0, 0, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (37, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (38, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 30, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (39, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 30, 1, 0, 158)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (40, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 30, 1, 0, 158)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (41, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 60, 169.2)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (42, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 30, 1, 40, 214.2)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (43, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 29, 1, 20, 168)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (44, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (45, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (46, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (47, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (48, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (49, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (50, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (51, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (52, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (53, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (54, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (55, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (56, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (57, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (58, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (59, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (60, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (61, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (62, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (63, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (64, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (65, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 26, 1, 0, 79)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (66, CAST(N'2020-07-21' AS Date), NULL, 25, 0, 0, NULL)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (67, CAST(N'2020-07-21' AS Date), CAST(N'2020-07-21' AS Date), 32, 1, 0, 477)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [status], [discount], [totalPrice]) VALUES (68, CAST(N'2020-07-21' AS Date), NULL, 24, 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (58, 33, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (59, 33, 2, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (60, 33, 3, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (61, 34, 4, 6)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (62, 34, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (63, 35, 13, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (64, 35, 14, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (65, 35, 4, 6)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (68, 37, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (69, 38, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (70, 39, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (71, 40, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (72, 41, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (73, 41, 3, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (74, 41, 12, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (75, 41, 4, 6)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (76, 42, 4, 6)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (77, 42, 6, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (78, 43, 10, 6)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (79, 44, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (80, 45, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (81, 46, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (82, 47, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (83, 48, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (84, 49, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (85, 50, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (86, 51, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (87, 52, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (88, 53, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (89, 54, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (90, 55, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (91, 56, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (92, 57, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (93, 58, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (94, 59, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (95, 60, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (96, 61, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (97, 62, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (98, 63, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (99, 64, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (100, 65, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (101, 66, 2, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (102, 66, 3, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (103, 66, 20, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (104, 66, 8, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (105, 66, 9, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (106, 66, 4, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (107, 66, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (108, 66, 14, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (109, 36, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (110, 36, 8, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (111, 36, 9, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (112, 36, 4, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (113, 36, 6, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (114, 36, 13, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (115, 36, 14, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (116, 67, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (117, 67, 8, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [Count]) VALUES (118, 68, 1, 1)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (1, N'lẩu hải sản', 1, 79000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (2, N'lẩu nấm kim chi', 1, 100000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (3, N'lẩu cá lóc măn chua', 1, 99000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (4, N'Gỏi xoài cá sặc', 2, 35000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (5, N'Gỏi tai heo', 2, 29000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (6, N'Gỏi Tôm thịt', 2, 49000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (7, N'Ba rọi nướng', 3, 79000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (8, N'Tôm Nướng muối ớt', 3, 80000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (9, N'Mực nướng sate', 3, 79000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (10, N'Cánh gà chiên nước mắm', 4, 35000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (11, N'sụn gà chiên nước mắm', 4, 35000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (12, N'cá trứng chiên giòn', 4, 35000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (13, N'Sting lon', 5, 12000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (14, N'Bia Tiger', 5, 360000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (15, N'7 up', 5, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [Price]) VALUES (20, N'lẩu hải sản', 1, 79000)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (1, N'Lẩu')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (2, N'Gỏi')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (3, N'Nướng')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (4, N'Chiên')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (5, N'Thức Uống')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
SET IDENTITY_INSERT [dbo].[TableFood] ON 

INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (23, N'Bàn 0', N'co nguoi')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (24, N'Bàn 1', N'co nguoi')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (25, N'Bàn 2', N'co nguoi')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (26, N'Bàn 3', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (27, N'Bàn 4', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (28, N'Bàn 5', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (29, N'Bàn 6', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (30, N'Bàn 7', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (31, N'Bàn 8', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (32, N'Bàn 9', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (33, N'Bàn 10', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (34, N'Bàn 0', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (35, N'Bàn 1', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (36, N'Bàn 2', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (37, N'Bàn 3', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (38, N'Bàn 4', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (39, N'Bàn 5', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (40, N'Bàn 6', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (41, N'Bàn 7', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (42, N'Bàn 8', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (43, N'Bàn 9', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (44, N'Bàn 10', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (45, N'Bàn 0', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (46, N'Bàn 1', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (47, N'Bàn 2', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (48, N'Bàn 3', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (49, N'Bàn 4', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (50, N'Bàn 5', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (51, N'Bàn 6', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (52, N'Bàn 7', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (53, N'Bàn 8', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (54, N'Bàn 9', N'Trong')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (55, N'Bàn 10', N'Trong')
SET IDENTITY_INSERT [dbo].[TableFood] OFF
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__idTable__21B6055D] FOREIGN KEY([idTable])
REFERENCES [dbo].[TableFood] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__idTable__21B6055D]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [FK__BillInfo__Count__25869641] FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [FK__BillInfo__Count__25869641]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([idCategory])
REFERENCES [dbo].[FoodCategory] ([id])
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountByUserName]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetAccountByUserName]
@userName nvarchar(100)
AS
BEGIN
	SELECT *FROM dbo.Account WHERE UserName=@userName
	END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDate]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetListBillByDate]
@checkIn DATE, @checkOut DATE
AS
BEGIN
	SELECT t.name AS [Tên bàn],b.totalPrice AS [Tổng tiền],DateCheckIn AS [Ngày Vào], DateCheckOut AS [Ngày ra], discount AS [giảm giá]  FROM dbo.Bill AS b, dbo.TableFood AS t
	WHERE DateCheckIn >=@checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id=b.idTable
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDateAndPage]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetListBillByDateAndPage]
@checkIn date, @checkOut date, @page int
AS 
BEGIN
	DECLARE @pageRows INT = 10
	DECLARE @selectRows INT = @pageRows
	DECLARE @exceptRows INT = (@page - 1) * @pageRows
	
	;WITH BillShow AS( SELECT b.ID, t.name AS [Tên bàn], b.totalPrice AS [Tổng tiền], DateCheckIn AS [Ngày vào], DateCheckOut AS [Ngày ra], discount AS [Giảm giá]
	FROM dbo.Bill AS b,dbo.TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id = b.idTable)
	
	SELECT TOP (@selectRows) * FROM BillShow WHERE id NOT IN (SELECT TOP (@exceptRows) id FROM BillShow)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDateForReport]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetListBillByDateForReport]
@checkIn DATE, @checkOut DATE
AS
BEGIN
	SELECT t.name ,b.totalPrice,DateCheckIn , DateCheckOut , discount   FROM dbo.Bill AS b, dbo.TableFood AS t
	WHERE DateCheckIn >=@checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id=b.idTable
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetNumBillByDate]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetNumBillByDate]
@checkIn date, @checkOut date
AS 
BEGIN
	SELECT COUNT(*)
	FROM dbo.Bill AS b,dbo.TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id = b.idTable
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetTableList]
AS 
SELECT * FROM dbo.TableFood

GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertBill]
@idTable INT
AS
BEGIN
	INSERT dbo.Bill
	        ( DateCheckIn ,
	          DateCheckOut ,
	          idTable ,
	          status,
			  discount

	        )
	VALUES  ( GETDATE() , -- DateCheckIn - date
	          NULL , -- DateCheckOut - date
	          @idTable , -- idTable - int
	          0,  -- status - int
			  0
	        )
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertBillInfo]
@idBill INT, @idFood INT,@count INT
AS
BEGIN

	DECLARE @isExitsBillInfo INT;
	DECLARE @foodCount INT = 1;
	SELECT @isExitsBillInfo = id ,@foodCount = b.count FROM dbo.BillInfo AS b WHERE idBill=@idBill AND idFood=@idFood

	IF(@isExitsBillInfo>0)
	BEGIN
		DECLARE @newCount INT =@foodCount +@count
		IF(@newCount>0)
			UPDATE dbo.BillInfo SET count= @foodCount +@count WHERE idFood=@idFood
		ELSE
			DELETE dbo.BillInfo WHERE idBill=@idBill AND idFood=@idFood
	END
	ELSE
	BEGIN
			INSERT dbo.BillInfo
				   ( idBill, idFood, Count )
			VALUES  ( @idBill, -- idBill - int
					  @idFood, -- idFood - int
					  @count  -- Count - int
					  )
	END
END

GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_Login]
@userName  nvarchar(100),@passWord nvarchar(100)
AS
BEGIN
	SELECT*FROM dbo.Account WHERE  UserName =@userName  AND PassWord = @passWord
END

GO
/****** Object:  StoredProcedure [dbo].[USP_SwitchTable]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_SwitchTable]

@idTable1 INT, @idTable2 int
AS BEGIN

	DECLARE @idFirstBill int
	DECLARE @idSeconrdBill INT
	
	DECLARE @isFirstTablEmty INT = 1
	DECLARE @isSecondTablEmty INT = 1
	
	
	SELECT @idSeconrdBill = id FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
	SELECT @idFirstBill = id FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'
	
	IF (@idFirstBill IS NULL)
	BEGIN
		PRINT '0000001'
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable1 , -- idTable - int
		          0  -- status - int
		        )
		        
		SELECT @idFirstBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
		
	END
	
	SELECT @isFirstTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idFirstBill
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'
	
	IF (@idSeconrdBill IS NULL)
	BEGIN
		PRINT '0000002'
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable2 , -- idTable - int
		          0  -- status - int
		        )
		SELECT @idSeconrdBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
		
	END
	
	SELECT @isSecondTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idSeconrdBill
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'

	SELECT id INTO IDBillInfoTable FROM dbo.BillInfo WHERE idBill = @idSeconrdBill
	
	UPDATE dbo.BillInfo SET idBill = @idSeconrdBill WHERE idBill = @idFirstBill
	
	UPDATE dbo.BillInfo SET idBill = @idFirstBill WHERE id IN (SELECT * FROM IDBillInfoTable)
	
	DROP TABLE IDBillInfoTable
	
	IF (@isFirstTablEmty = 0)
		UPDATE dbo.TableFood SET status = N'Trong' WHERE id = @idTable2
		
	IF (@isSecondTablEmty= 0)
		UPDATE dbo.TableFood SET status = N'Trong' WHERE id = @idTable1
END


GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateAccount]    Script Date: 7/21/2020 9:31:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateAccount]
@userName NVARCHAR(100),@displayName NVARCHAR(100),@password NVARCHAR(100),@newPassword NVARCHAR(100)

AS
BEGIN
	DECLARE @isRightPass INT = 0
	SELECT @isRightPass =COUNT(*) FROM dbo.Account WHERE UserName = @userName AND  PassWord =@password

	IF (@isRightPass=1)
	BEGIN
		IF (@newPassword = NULL OR @newPassword='')
		BEGIN
			UPDATE dbo.Account SET DisplayName=@displayName WHERE UserName=@userName
		END
		ELSE 
			UPDATE dbo.Account SET DisplayName=@displayName,PassWord=@newPassword WHERE UserName=@userName
	END
END

GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanAnDT] SET  READ_WRITE 
GO
