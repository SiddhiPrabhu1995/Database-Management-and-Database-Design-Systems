--Compute revenue based on year 
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
where p.ProductID = ol.ProductID and ol.OrderYear = @Year
);

--Executing the function:

SELECT * from ComputeRevenueforGivenYear('2014');

