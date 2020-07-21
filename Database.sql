CREATE DATABASE QuanLyQuanAnDT
GO

USE QuanLyQuanAnDT
GO

--Food
--TableFood
--Category
--Account
--Bill
--BillInfo

CREATE TABLE TableFood
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'ban chua co ten',
	status NVARCHAR(100) NOT NULL DEFAULT N'Trong', -- ban trong hoac co nguoi


)
GO

CREATE TABLE Account
(
	UserName NVARCHAR(100) PRIMARY KEY ,
	DisplayName NVARCHAR(100) NOT NULL DEFAULT N'Group04',
	PassWord NVARCHAR(100) NOT NULL,
	Type INT NOT NULL DEFAULT  0 --1 admin, 0 employee

)
GO

CREATE TABLE FoodCategory
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'chua co ten',
)
GO

CREATE TABLE Food
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chua co ten',
	idCategory INT NOT NULL,
	Price FLOAT NOT NULL DEFAULT 0
	FOREIGN KEY (idCategory) REFERENCES dbo.FoodCategory(id)
)
GO

CREATE TABLE Bill
(
	id INT IDENTITY PRIMARY KEY,
	DateCheckIn  DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE,
	idTable INT  NOT NULL,
	status INT NOT NULL DEFAULT 0 , --1 da thanh toan, 0 chua thanh toan

	FOREIGN KEY (idTable) REFERENCES dbo.TableFood(id)

)
GO

CREATE TABLE BillInfo
(
	id INT IDENTITY PRIMARY KEY,
	idBill  INT NOT NULL,
	idFood INT NOT NULL,
	Count INT NOT NULL DEFAULT 0

	FOREIGN KEY (idBill) REFERENCES dbo.Bill(id),
	FOREIGN KEY(idFood) REFERENCES dbo.Food(id)

)
GO

CREATE PROC USP_GetAccountByUserName
@userName NVARCHAR(100)
AS
BEGIN
	SELECT *FROM dbo.Account WHERE UserName = @userName
END
GO

EXEC dbo.USP_GetAccountByUserName @userName = N'nvt' -- nvarchar(100)
GO

CREATE PROC USP_Login
@userName  nvarchar(100),@passWord nvarchar(100)
AS
BEGIN
	SELECT*FROM dbo.Account WHERE  UserName =@userName  AND PassWord = @passWord
END
GO

--them ban
DECLARE @i INT=0
WHILE @i <= 10
BEGIN
	INSERT dbo.TableFood( name) VALUES  (N'Bàn ' + CAST (@i AS  nvarchar(100)))
	SET @i=@i +1
END


SELECT *FROM dbo.TableFood
 GO

CREATE PROC USP_GetTableList
AS 
SELECT * FROM dbo.TableFood
GO
 
SELECT *FROM dbo.TableFood
UPDATE dbo.TableFood SET STATUS =N'co nguoi' WHERE id = 29

--them Category
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Lẩu'  -- name - nvarchar(100)
          )

INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Gỏi'  -- name - nvarchar(100)
          )

INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Nướng'  -- name - nvarchar(100)
          )

INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Chiên'  -- name - nvarchar(100)
          )

INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Thức Uống'  -- name - nvarchar(100)
          )
--Thêm món ăn
INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'lẩu hải sản', -- name - nvarchar(100)
          1, -- idCategory - int
          79000  -- Price - float
          )

INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'lẩu nấm kim chi', -- name - nvarchar(100)
          1, -- idCategory - int
          100000  -- Price - float
          )

INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'lẩu cá lóc măn chua', -- name - nvarchar(100)
          1, -- idCategory - int
          99000  -- Price - float
          )
INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'Gỏi xoài cá sặc', -- name - nvarchar(100)
          2, -- idCategory - int
          35000  -- Price - float
          )

INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'Gỏi tai heo', -- name - nvarchar(100)
          2, -- idCategory - int
          29000  -- Price - float
          )

INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'Gỏi Tôm thịt', -- name - nvarchar(100)
          2, -- idCategory - int
          49000  -- Price - float
          )

INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'Ba rọi nướng', -- name - nvarchar(100)
          3, -- idCategory - int
          79000  -- Price - float
          )
INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'Tôm Nướng muối ớt', -- name - nvarchar(100)
          3, -- idCategory - int
          80000  -- Price - float
          )
INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'Mực nướng sate', -- name - nvarchar(100)
          3, -- idCategory - int
          79000  -- Price - float
          )

INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'Cánh gà chiên nước mắm', -- name - nvarchar(100)
          4, -- idCategory - int
          35000  -- Price - float
          )

INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'sụn gà chiên nước mắm', -- name - nvarchar(100)
          4, -- idCategory - int
          35000  -- Price - float
          )

INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'cá trứng chiên giòn', -- name - nvarchar(100)
          4, -- idCategory - int
          35000  -- Price - float
          )
INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'Sting lon', -- name - nvarchar(100)
          5, -- idCategory - int
          12000  -- Price - float
          )

INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'Bia Tiger', -- name - nvarchar(100)
          5, -- idCategory - int
          360000  -- Price - float
          )


INSERT dbo.Food
        ( name, idCategory, Price )
VALUES  ( N'7 up', -- name - nvarchar(100)
          5, -- idCategory - int
          10000  -- Price - float
          )

--them bill
 INSERT dbo.Bill
         ( DateCheckIn ,
           DateCheckOut ,
           idTable ,
           status
         )
 VALUES  ( GETDATE() , -- DateCheckIn - date
           NULL , -- DateCheckOut - date
           23 , -- idTable - int
           0  -- status - int
         )

 INSERT dbo.Bill
         ( DateCheckIn ,
           DateCheckOut ,
           idTable ,
           status
         )
 VALUES  ( GETDATE() , -- DateCheckIn - date
           NULL , -- DateCheckOut - date
           24 , -- idTable - int
           0  -- status - int
         )

 INSERT dbo.Bill
         ( DateCheckIn ,
           DateCheckOut ,
           idTable ,
           status
         )
 VALUES  ( GETDATE() , -- DateCheckIn - date
           GETDATE() , -- DateCheckOut - date
           25 , -- idTable - int
           1  -- status - int
         )

--them bill info

INSERT dbo.BillInfo
        ( idBill, idFood, Count )
VALUES  ( 4, -- idBill - int
          1, -- idFood - int
          2  -- Count - int
          )

INSERT dbo.BillInfo
        ( idBill, idFood, Count )
VALUES  ( 4, -- idBill - int
          2, -- idFood - int
          3  -- Count - int
          )
INSERT dbo.BillInfo
        ( idBill, idFood, Count )
VALUES  ( 4, -- idBill - int
          3, -- idFood - int
          4  -- Count - int
          )
INSERT dbo.BillInfo
        ( idBill, idFood, Count )
VALUES  ( 4, -- idBill - int
          5, -- idFood - int
          1  -- Count - int
          )
INSERT dbo.BillInfo
        ( idBill, idFood, Count )
VALUES  ( 5, -- idBill - int
          6, -- idFood - int
          2  -- Count - int
          )

INSERT dbo.BillInfo
        ( idBill, idFood, Count )
VALUES  ( 5, -- idBill - int
          8, -- idFood - int
          4  -- Count - int
          )
INSERT dbo.BillInfo
        ( idBill, idFood, Count )
VALUES  ( 6, -- idBill - int
          8, -- idFood - int
          2  -- Count - int
          )

INSERT dbo.BillInfo
        ( idBill, idFood, Count )
VALUES  ( 6, -- idBill - int
          5, -- idFood - int
          2  -- Count - int
          )
GO

CREATE PROC USP_InsertBill
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

CREATE PROC USP_InsertBillInfo
@idBill INT, @idFood INT,@count INT
AS
BEGIN

	DECLARE @isExitsBillInfo INT
	DECLARE @foodCount INT = 1
	
	SELECT @isExitsBillInfo = id, @foodCount = b.count 
	FROM dbo.BillInfo AS b 
	WHERE idBill = @idBill AND idFood = @idFood

	IF (@isExitsBillInfo > 0)
	BEGIN
		DECLARE @newCount INT = @foodCount + @count
		IF (@newCount > 0)
			UPDATE dbo.BillInfo	SET count = @foodCount + @count WHERE idFood = @idFood
		ELSE
			DELETE dbo.BillInfo WHERE idBill = @idBill AND idFood = @idFood
	END
	ELSE
	BEGIN
		INSERT	dbo.BillInfo
        ( idBill, idFood, count )
		VALUES  ( @idBill, -- idBill - int
          @idFood, -- idFood - int
          @count  -- count - int
          )
	END
END
GO

ALTER TRIGGER UTG_UPdateBillInfo
ON dbo.BillInfo FOR INSERT,UPDATE

AS
BEGIN
	DECLARE @idBill INT
	SELECT  @idBill= idBill FROM Inserted

	DECLARE @idTable INT
	SELECT @idTable=idTable FROM dbo.Bill WHERE id=@idBill AND status = 0

	DECLARE @count INT
	SELECT @count =COUNT(*) FROM dbo.BillInfo WHERE  idBill=@idBill

	IF(@count<0)
	UPDATE dbo.TableFood SET status= N'co nguoi' WHERE id =@idTable
	ELSE
	UPDATE dbo.TableFood SET status= N'Trong' WHERE id =@idTable
	
END
GO




ALTER PROC USP_SwitchTable

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

CREATE TRIGGER UTG_UPdateBillInfo
ON dbo.BillInfo FOR INSERT , UPDATE
AS 
BEGIN
	DECLARE @idBill INT
	SELECT  @idBill = idBill FROM Inserted

	DECLARE @idTable INT
	SELECT @idTable= idTable FROM dbo.Bill WHERE id =@idBill AND status =0 ; 
	
	UPDATE dbo.TableFood SET status = N'co nguoi' WHERE id =@idTable
END
GO


CREATE TRIGGER UTG_UPdateBill
ON dbo.Bill FOR UPDATE

AS
BEGIN
	DECLARE @idBill INT
	SELECT @idBill=id FROM Inserted


	DECLARE @idTable INT
	SELECT @idTable=idTable FROM dbo.Bill WHERE id=@idBill

	DECLARE @count INT = 0
	SELECT @count =COUNT(*) FROM dbo.Bill WHERE idTable =@idTable AND status =0
	IF(@count = 0)
		UPDATE dbo.TableFood SET status = N'Trong' WHERE id =@idTable

END
GO

CREATE PROC USP_GetListBillByDate
@checkIn DATE, @checkOut DATE
AS
BEGIN
	SELECT t.name AS [Tên bàn],b.totalPrice AS [Tổng tiền],DateCheckIn AS [Ngày Vào], DateCheckOut AS [Ngày ra], discount AS [giảm giá]  FROM dbo.Bill AS b, dbo.TableFood AS t
	WHERE DateCheckIn >=@checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id=b.idTable
END
GO

CREATE PROC USP_UpdateAccount
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

CREATE TRIGGER UTG_DeleteBillInfo
ON dbo.BillInfo FOR DELETE
AS
BEGIN
	DECLARE @idBillInfo INT
	DECLARE @idBill INT

	SELECT @idBillInfo=id ,@idBill=Deleted.idBill FROM Deleted
	
	DECLARE @idTable INT
	SELECT	@idTable =idTable FROM dbo.Bill WHERE id =@idBill 


	DECLARE @count INT=0
	SELECT @count =COUNT(*) FROM  dbo.BillInfo AS bi ,dbo.Bill AS b WHERE b.id=bi.idBill AND b.id=@idBill AND b.status=0
	 
	 IF(@count=0)
	 UPDATE dbo.TableFood SET status = N'Trong' WHERE id =@idTable

END
GO

CREATE FUNCTION [dbo].[fuConvertToUnsign1] ( @strInput NVARCHAR(4000) ) RETURNS NVARCHAR(4000) AS BEGIN IF @strInput IS NULL RETURN @strInput IF @strInput = '' RETURN @strInput DECLARE @RT NVARCHAR(4000) DECLARE @SIGN_CHARS NCHAR(136) DECLARE @UNSIGN_CHARS NCHAR (136) SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' +NCHAR(272)+ NCHAR(208) SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee iiiiiooooooooooooooouuuuuuuuuuyyyyy AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD' DECLARE @COUNTER int DECLARE @COUNTER1 int SET @COUNTER = 1 WHILE (@COUNTER <=LEN(@strInput)) BEGIN SET @COUNTER1 = 1 WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1) BEGIN IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) ) BEGIN IF @COUNTER=1 SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1) ELSE SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER) BREAK END SET @COUNTER1 = @COUNTER1 +1 END SET @COUNTER = @COUNTER +1 END SET @strInput = replace(@strInput,' ','-') RETURN @strInput END
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

CREATE PROC USP_GetListBillByDateForReport
@checkIn DATE, @checkOut DATE
AS
BEGIN
	SELECT t.name ,b.totalPrice,DateCheckIn , DateCheckOut , discount   FROM dbo.Bill AS b, dbo.TableFood AS t
	WHERE DateCheckIn >=@checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id=b.idTable
END
GO


USE [QuanLyQuanAnDT]
GO
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
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (1, N'Lẩu')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (2, N'Gỏi')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (3, N'Nướng')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (4, N'Chiên')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (5, N'Thức Uống')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
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
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type]) VALUES (N'hxh', N'Huỳnh Xuân Hoàng', N'3', 0)
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type]) VALUES (N'nvq', N'Nguyễn Việt Quân', N'4', 0)
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type]) VALUES (N'nvt', N'Nguyễn Văn Tây ', N'1', 1)
INSERT [dbo].[Account] ([UserName], [DisplayName], [PassWord], [Type]) VALUES (N'tnt', N'Trần Nguyên Tài', N'2', 1)







