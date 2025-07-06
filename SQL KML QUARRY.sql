1. SELECT TOP(1) [Product Category], ROUND(SUM([Sales]), 2) AS TotalSales
FROM [dbo].[KMS DBO]
GROUP BY [Product category]

2. SELECT TOP(3) [Region],ROUND(SUM([Sales]), 2) AS TotalSales
FROM [dbo].[KMS DBO]
GROUP BY [Region]


3. SELECT 
    [Order ID], 
    Region, 
    ROUND(SUM([Sales]), 2) AS TotalSales
FROM [dbo].[KMS DBO]
WHERE [Order ID] IN (
    SELECT TOP 3 [Order ID]
    FROM [dbo].[KMS DBO]
    ORDER BY [Order ID] ASC
)
GROUP BY [Order ID], Region
ORDER BY [Order ID] ASC;

4. SELECT [Region],[Product Sub-Category], ROUND(SUM([Sales]), 2) AS TotalSales
FROM [dbo].[KMS DBO]
WHERE [Product Sub-Category]= 'Appliances' AND Region='Ontario'
GROUP BY Region,[Product Sub-Category]

5. SELECT TOP (10) [Row ID]
      ,[Order ID] 
      ,[Order Priority]
      ,[Order Quantity]
      ,[Sales] 
      ,[Discount]
      ,[Ship Mode]
      ,[Profit]
      ,[Shipping Cost]
      ,[Customer Name]
      ,[Region]
      ,[Customer Segment]
      ,[Product Category]
      ,[Ship Date]
  FROM [KMS CASE DBO].[dbo].[KMS DBO]
  ORDER BY Profit DESC

  Advise : I will advise the bottom 10 to stop giving discounts on sales , it will help increase profits 

  SELECT *
 FROM [dbo].[KMS DBO]
 6. SELECT TOP 1 [Shipping Cost],[Ship Mode]
    FROM [dbo].[KMS DBO]
    ORDER BY [Shipping Cost] DESC

7. SELECT TOP(10)[Customer Name],[Product Category],ROUND(SUM([sales]), 2) AS TotalSales,ROUND(SUM([Profit]),2) AS TotalProfit,COUNT([Product Category]) AS Totoal_count_of_product
    FROM [dbo].[KMS DBO]
    GROUP BY [Customer Name],[Product Category]
	ORDER BY TotalProfit ASC,Totoal_count_of_product DESC

8.	SELECT TOP 1 [Customer Name], [Customer Segment],SUM([Sales]) AS TotalSales
    FROM [dbo].[KMS DBO]
	WHERE [Customer Segment]='small business'
	GROUP BY  [Customer Name],[Customer Segment]

SELECT TOP 1
    [Customer Segment],
    [Customer Name],
    YEAR([Order Date]) AS OrderYear,
    SUM([Order Quantity]) AS TotalOrder
FROM [dbo].[KMS DBO]
WHERE [Customer Segment] = 'Corporate'
  AND YEAR([Order Date])>= 2009 AND YEAR([Order Date])<=2012
GROUP BY 
    [Customer Segment],
    [Customer Name],
    YEAR([Order Date])
ORDER BY 
    TotalOrder DESC;

	SELECT TOP 1 [Customer Name],[Customer Segment],SUM([Profit]) AS Totalprofit
	FROM [dbo].[KMS DBO]
	WHERE [Customer Segment]='Consumer'
	GROUP BY  [Customer Name],[Customer Segment]
	ORDER BY Totalprofit DESC

	SELECT DISTINCT KMS.[Order ID],KMS.[Customer Name], [Customer Segment]
      ,[Status]
FROM [KMS CASE DBO].dbo.[KMS DBO] AS KMS
left JOIN [dbo].[Order_Status] AS OS
ON KMS. [Order ID]=OS.[Order_ID]
WHERE Status='Returned'

SELECT 
    [Order ID],
    [Order Priority],
    [Ship Mode],
    [Shipping Cost]
FROM dbo.[KMS DBO]
ORDER BY [Order Priority], [Ship Mode];

If you observe that:

Critical/High orders mostly use Express Air : Costs are appropriately aligned with urgency.

Low/Medium orders mostly use Delivery Truck : Cost savings are prioritized where speed isn't crucial.

Then yes, the company is appropriately spending on shipping based on order priority. which is fair

Otherwise, if the data shows a mismatch, such as high-cost shipping for low-priority orders, then the spending isn't aligned with priorities and suggests inefficiency.














	













