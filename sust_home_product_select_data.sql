-- Before read my Docs about Sustainable Home Made Product

-- 1. Total sales amount grouped by product category
SELECT pc.CategoryName, SUM(oi.Quantity * oi.PricePerUnit) AS TotalSales
FROM Order_Item oi
JOIN Product p ON oi.ProductID = p.ProductID
JOIN Product_Category pc ON p.CategoryID = pc.CategoryID
GROUP BY pc.CategoryName;

-- 2. Average order value per customer
SELECT c.CustomerID, c.FirstName, c.LastName, AVG(o.TotalAmount) AS AvgOrderValue
FROM [Order] o
JOIN Customer c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- 3. Total quantity sold per product
SELECT p.ProductName, SUM(oi.Quantity) AS TotalQuantitySold
FROM Order_Item oi
JOIN Product p ON oi.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantitySold DESC;

-- 4. Number of orders per customer
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(o.OrderID) AS NumberOfOrders
FROM [Order] o
JOIN Customer c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- 5. Maximum order amount per customer
SELECT c.CustomerID, c.FirstName, c.LastName, MAX(o.TotalAmount) AS MaxOrderAmount
FROM [Order] o
JOIN Customer c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;


-- 6. Total number of orders per month in 2025
SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, COUNT(OrderID) AS TotalOrders
FROM [Order]
WHERE YEAR(OrderDate) = 2025
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;



-- 7. Total revenue per city based on shipping address
SELECT a.City, SUM(o.TotalAmount) AS TotalRevenue
FROM [Order] o
JOIN Address a ON o.ShippingAddressID = a.AddressID
GROUP BY a.City;

-- 8. Total tax amount collected per month
SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, SUM(TaxAmount) AS TotalTax
FROM [Order]
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;

-- 9. Product categories with total sales greater than 50000 BDT
SELECT pc.CategoryName, SUM(oi.Quantity * oi.PricePerUnit) AS TotalSales
FROM Order_Item oi
JOIN Product p ON oi.ProductID = p.ProductID
JOIN Product_Category pc ON p.CategoryID = pc.CategoryID
GROUP BY pc.CategoryName
HAVING SUM(oi.Quantity * oi.PricePerUnit) > 50000;

-- 10. Average price of products per category
SELECT pc.CategoryName, AVG(p.Price) AS AvgPrice
FROM Product p
JOIN Product_Category pc ON p.CategoryID = pc.CategoryID
GROUP BY pc.CategoryName;

-- 11. Number of unique customers who placed orders in each district
SELECT a.StateProvince AS District, COUNT(DISTINCT o.CustomerID) AS UniqueCustomers
FROM [Order] o
JOIN Address a ON o.ShippingAddressID = a.AddressID
GROUP BY a.StateProvince;

-- 12. Total shipping cost per shipping method
SELECT ShippingMethod, SUM(ShippingCost) AS TotalShippingCost
FROM [Order]
GROUP BY ShippingMethod;

-- 13. Highest quantity sold per product and customer who purchased it
;WITH ProductMaxQty AS (
    SELECT oi.ProductID, MAX(oi.Quantity) AS MaxQuantity
    FROM Order_Item oi
    GROUP BY oi.ProductID
)
SELECT p.ProductName, c.CustomerID, c.FirstName, c.LastName, oi.Quantity AS QuantitySold
FROM Order_Item oi
JOIN ProductMaxQty pmq ON oi.ProductID = pmq.ProductID AND oi.Quantity = pmq.MaxQuantity
JOIN [Order] o ON oi.OrderID = o.OrderID
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN Product p ON oi.ProductID = p.ProductID;

-- 14. Top 5 customers by total purchase amount
SELECT TOP 5 c.CustomerID, c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
FROM [Order] o
JOIN Customer c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

-- 15. Total carbon footprint per category from sold products
SELECT pc.CategoryName, SUM(p.CarbonFootprint * oi.Quantity) AS TotalCarbonFootprint
FROM Order_Item oi
JOIN Product p ON oi.ProductID = p.ProductID
JOIN Product_Category pc ON p.CategoryID = pc.CategoryID
GROUP BY pc.CategoryName;

-- 16. Number of orders and average order value per payment type
SELECT pm.PaymentType, COUNT(o.OrderID) AS NumberOfOrders, AVG(o.TotalAmount) AS AvgOrderValue
FROM [Order] o
JOIN Payment_Method pm ON o.PaymentMethodID = pm.PaymentMethodID
GROUP BY pm.PaymentType;

-- 17. Monthly trend of eco-packaging usage
SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, COUNT(*) AS EcoPackagingCount
FROM [Order]
WHERE EcoPackagingOption = 1
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;

-- 18. Products with average rating > 4 and at least 3 customer reviews
SELECT p.ProductName, AVG(r.Rating) AS AvgRating, COUNT(DISTINCT r.CustomerID) AS ReviewerCount
FROM Review r
JOIN Product p ON r.ProductID = p.ProductID
GROUP BY p.ProductName
HAVING AVG(r.Rating) > 4 AND COUNT(DISTINCT r.CustomerID) >= 3;

-- 19. Average quantity per order for each product
SELECT p.ProductName, AVG(oi.Quantity) AS AvgQuantityPerOrder
FROM Order_Item oi
JOIN Product p ON oi.ProductID = p.ProductID
GROUP BY p.ProductName;

-- 20. Products below reorder level in stock but still being sold
SELECT p.ProductName, pi.QuantityInStock, pi.ReorderLevel, SUM(oi.Quantity) AS QuantitySold
FROM Product_Inventory pi
JOIN Product p ON pi.ProductID = p.ProductID
JOIN Order_Item oi ON p.ProductID = oi.ProductID
GROUP BY p.ProductName, pi.QuantityInStock, pi.ReorderLevel
HAVING pi.QuantityInStock < pi.ReorderLevel AND SUM(oi.Quantity) > 0;
