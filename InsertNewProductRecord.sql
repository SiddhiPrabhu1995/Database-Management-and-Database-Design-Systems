-- CREATE SP TO ADD NEW PRODUCT RECORD
CREATE PROCEDURE NewProductRecord( 
@ProductName varchar(255), 
@Price float,
@Brand varchar(20)
--@ProductID varchar(20)
)
AS 
BEGIN
		DECLARE @ProductIDRan varchar(20);
		

		-- SET @allowedChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
		
		SET @ProductIDRan = ABS(CHECKSUM(NEWID())) % 1000000 + 1;
		
		
		INSERT into Product
		values(@ProductIDRan,@ProductName,@Price,@Brand);

		Select *
		from Product p 
		WHERE p.ProductID = @ProductIDRan ;


END;


EXEC NewProductRecord 'Hill',132,'Adidas';
