-- 1)INSERT EXAMPLES

-- Yeni musteri ekleme
INSERT INTO Customer (Name, Surname, Email, City) VALUES
('Burak', 'Yildiz', 'burak@example.com', 'Istanbul');

-- Yeni urun ekleme
INSERT INTO Product (Name, Price, Stock, CategoryID, SellerID) VALUES
('Smartwatch', 3500, 25, 1, 1);

-- Yeni siparis ekleme 
INSERT INTO Orders (CustomerID, TotalAmount, PaymentType) VALUES
(11, 3500, 'Credit Card');

-- Siparis detayini ekleme 
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Price) VALUES
(23, 14, 1, 3500);

-- 2)UPDATE EXAMPLES

--CustomerID = 11 olan müsterinin sehrini degistirme
UPDATE Customer
SET City = 'Ankara'
WHERE CustomerID = 11;


--Electronics kategorisindeki tüm urunlere %15 indirim yap
UPDATE Product
SET Price = Price * 0.85
FROM Product p
JOIN Category c ON p.CategoryID = c.CategoryID
WHERE c.Name = 'Electronics';


--Son 3 ayda 3'ten fazla siparis veren müsterilere toplam tutarlarinin %5'i kadar indirim uygula
--Önce Orders tablosuna Discount kolonu ekle

ALTER TABLE Orders
ADD Discount DECIMAL(10,2) DEFAULT 0;
GO

UPDATE o
SET o.Discount = o.TotalAmount * 0.05
FROM Orders o
WHERE o.CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE OrderDate >= DATEADD(MONTH, -3, GETDATE())
    GROUP BY CustomerID
    HAVING COUNT(OrderID) > 3
);

--3)DELETE EXAMPLE

--Belirli müsteriyi silme
DELETE FROM Orders
WHERE OrderID = 18;


--2024'ten once kayit olan VE hic siparis vermemis musterileri sil

DELETE FROM Customer
WHERE RegistrationDate < '2024-01-01'
AND CustomerID NOT IN (
    SELECT DISTINCT CustomerID 
    FROM Orders
);

--Stoku 10'dan az olan VE son 6 ayda hic satilmamis urunleri sil

DELETE FROM Product
WHERE Stock < 10
AND ProductID NOT IN (
    SELECT DISTINCT od.ProductID
    FROM OrderDetail od
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE o.OrderDate >= DATEADD(MONTH, -6, GETDATE())
);


--4) TRUNCATE EXAMPLE

TRUNCATE TABLE OrderDetail;


-- 5) STOCK UPDATE
GO

CREATE TRIGGER trg_UpdateStock_AfterOrderDetail  
ON OrderDetail  
AFTER INSERT  
AS  
BEGIN  
    SET NOCOUNT ON;
    
    -- Once stok guncellemesi
    UPDATE p
    SET p.Stock = p.Stock - i.Quantity
    FROM Product p
    INNER JOIN inserted i ON p.ProductID = i.ProductID;
    
    -- Sonra negatif stok kontrolu
    IF EXISTS (
        SELECT 1 
        FROM Product p
        INNER JOIN inserted i ON p.ProductID = i.ProductID
        WHERE p.Stock < 0
    )
    BEGIN
        RAISERROR(N'Yetersiz stok! Ýþlem iptal edildi.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO