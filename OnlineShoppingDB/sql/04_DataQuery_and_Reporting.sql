--En cok siparis veren 5 musteri
SELECT TOP 5 
    c.CustomerID,
    c.Name + ' ' + c.Surname AS CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customer c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name, c.Surname
ORDER BY TotalOrders DESC;


-- En cok satilan urunler
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    SUM(od.Quantity) AS TotalSold
FROM OrderDetail od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.Name
ORDER BY TotalSold DESC;



-- En yuksek cirosu olan saticilar
SELECT 
    s.SellerID,
    s.Name AS SellerName,
    SUM(od.Quantity * od.Price) AS TotalRevenue
FROM OrderDetail od
JOIN Product p ON od.ProductID = p.ProductID
JOIN Seller s ON p.SellerID = s.SellerID
GROUP BY s.SellerID, s.Name
ORDER BY TotalRevenue DESC;



-- Aggregate & Group By --

-- sehirlere göre musteri sayisi
SELECT 
    City,
    COUNT(*) AS CustomerCount
FROM Customer
GROUP BY City
ORDER BY CustomerCount DESC;



-- Kategori bazli toplam satislar
SELECT 
    c.CategoryID,
    c.Name AS CategoryName,
    SUM(od.Quantity) AS TotalSold
FROM OrderDetail od
JOIN Product p ON od.ProductID = p.ProductID
JOIN Category c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.Name
ORDER BY TotalSold DESC;



-- Aylara gore siparis sayisi
SELECT 
    DATENAME(MONTH, OrderDate) AS MonthName,
    COUNT(*) AS OrderCount
FROM Orders
GROUP BY DATENAME(MONTH, OrderDate), MONTH(OrderDate)
ORDER BY MONTH(OrderDate);



--JOIN--

-- Siparislerde musteri bilgisi + urun bilgisi + satici bilgisi

SELECT 
    o.OrderID,
    o.OrderDate,
    c.Name + ' ' + c.Surname AS CustomerName,
    p.Name AS ProductName,
    od.Quantity,
    od.Price,
    s.Name AS SellerName
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN OrderDetail od ON o.OrderID = od.OrderID
JOIN Product p ON od.ProductID = p.ProductID
JOIN Seller s ON p.SellerID = s.SellerID
ORDER BY o.OrderDate DESC;


-- Hic satilmamis urunler
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.Stock,
    c.Name AS CategoryName,
    s.Name AS SellerName
FROM Product p
JOIN Category c ON p.CategoryID = c.CategoryID
JOIN Seller s ON p.SellerID = s.SellerID
LEFT JOIN OrderDetail od ON p.ProductID = od.ProductID
WHERE od.OrderDetailID IS NULL;


--Hic siparis vermemis musteriler
SELECT 
    c.CustomerID,
    c.Name + ' ' + c.Surname AS CustomerName,
    c.City,
    c.Email
FROM Customer c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;