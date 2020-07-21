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
