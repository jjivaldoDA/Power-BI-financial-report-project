SELECT [ProductKey]
      ,[OrderDateKey]
      --,[DueDateKey]
      --,[ShipDateKey]
      --,[CustomerKey]
      --,[PromotionKey]
      ,[CurrencyKey]
      ,[SalesTerritoryKey]
      ,[SalesOrderNumber]
      ,[SalesOrderLineNumber]
      --,[RevisionNumber]
      ,[OrderQuantity]
      ,[UnitPrice]
      --,[ExtendedAmount]
      --,[UnitPriceDiscountPct]
      --,[DiscountAmount]
      ,[ProductStandardCost]
      ,OrderQuantity*ProductStandardCost AS COGS -- Unit price * StandardCost
      ,[SalesAmount] AS TotalSales
	  ,SalesAmount-(OrderQuantity*ProductStandardCost) AS GrossProfit --Gross Sales minus COGS.
	  ,(SalesAmount-(OrderQuantity*ProductStandardCost))-(TaxAmt+Freight) AS NetIncome
	  , (SalesAmount-(OrderQuantity*ProductStandardCost))/SalesAmount AS GrossProfitMargin  -- (GrossSales - Cost of Goods Sold) / Total Revenue
	  , ((SalesAmount-(OrderQuantity*ProductStandardCost))-(TaxAmt+Freight))/SalesAmount AS NetProfitMargin -- NetSales / Total Revenue
      --,[TaxAmt]
      --,[Freight]
	  ,TaxAmt-Freight AS OperatingExpenses
      --,[CarrierTrackingNumber]
      --,[CustomerPONumber]
      --,[OrderDate]
      --,[DueDate]
      --,[ShipDate]
  FROM [AdventureWorksDW2022].[dbo].[FactInternetSales]
  WHERE YEAR(OrderDate) in (2011,2012,2013)
