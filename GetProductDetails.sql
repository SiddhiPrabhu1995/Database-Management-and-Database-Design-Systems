--GET PRODUCT DETAILS INPUT AS PRODUCTID

CREATE PROCEDURE ProductDetails(
@productID AS varchar(20)
)
AS 
BEGIN
		
		
		select p.ProductID, p.ProductName, p.Brand,p.Price
		from Product p
		WHERE p.ProductID=@productID;
		
END;


EXEC ProductDetails 'FK8188';

