--Compute revenue per year 
--select * from [order]
--ALTER TABLE OrderLine  ADD Quantity INT;

CREATE FUNCTION ComputeRevenueforGivenYear
(
@Year as varchar(4)
)
RETURNS TABLE
AS

RETURN(
SELECT SUM(p.Price * ol.Quantity) AS TotalRevenuefor5Years  
FROM Product p, OrderLine ol
where p.ProductID = ol.ProductID and ol.OrderYear = '2014'
);

--Executing the function:

SELECT * from ComputeRevenueforGivenYear('2014');

---------------
CREATE PROCEDURE ComputeRevenuePerYear_SP
AS BEGIN


SELECT SUM(p.Price * ol.Quantity) AS TotalRevenuePerYears, ol.OrderYear  
FROM Product p, OrderLine ol 
GROUP BY ol.OrderYear


END;

select * from OrderLine;
EXEC ComputeRevenuePerYear_SP;
DROP PROCEDURE ComputeRevenuePerYear;
-------UDF

CREATE FUNCTION ComputeRevenuePerYear()
    RETURNS @totalRevenue TABLE (
        TotalRevenuePerYear float,
        OrderYear INT
    )
AS
BEGIN
	INSERT INTO @totalRevenue
	
    SELECT SUM(p.Price * ol.Quantity) AS TotalRevenuePerYears, ol.OrderYear  
	FROM Product p, OrderLine ol 
	GROUP BY ol.OrderYear

    RETURN;
END;


select * from ComputeRevenuePerYear()

------------------------------














