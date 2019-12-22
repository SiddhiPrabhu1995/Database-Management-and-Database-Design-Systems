CREATE FUNCTION TotalSalesInaYear()
    RETURNS @totalsales TABLE (
        SalesYear INT,
        TotalSales INT
    )
AS
BEGIN
	INSERT INTO @totalsales
    SELECT YEAR(SalesDate) as SalesYear,
         SUM(Quantity) AS TotalSales
    FROM Sales
GROUP BY YEAR(SalesDate)
ORDER BY YEAR(SalesDate);
    RETURN;
END;



