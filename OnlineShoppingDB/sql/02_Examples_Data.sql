
INSERT INTO Category (Name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home Appliances'),
('Toys'),
('Sports Equipment');
GO


INSERT INTO Seller (Name, Address) VALUES
('TechStore', 'Istanbul, Turkey'),
('FashionHub', 'Ankara, Turkey'),
('BookWorld', 'Izmir, Turkey'),
('HomePlus', 'Bursa, Turkey'),
('ToyLand', 'Antalya, Turkey'),
('SportX', 'Istanbul, Turkey');
GO


INSERT INTO Product (Name, Price, Stock, CategoryID, SellerID) VALUES
('Smartphone', 12000, 50, 1, 1),
('Laptop', 25000, 30, 1, 1),
('Headphones', 750, 100, 1, 1),
('T-Shirt', 250, 300, 2, 2),
('Jeans', 600, 150, 2, 2),
('Novel Book', 150, 200, 3, 3),
('Cookbook', 200, 80, 3, 3),
('Microwave', 3000, 40, 4, 4),
('Vacuum Cleaner', 4500, 25, 4, 4),
('Toy Car', 500, 120, 5, 5),
('Doll', 700, 90, 5, 5),
('Football', 400, 70, 6, 6),
('Tennis Racket', 1500, 40, 6, 6);
GO


INSERT INTO Customer (Name, Surname, Email, City) VALUES
('Ahmet', 'Yilmaz', 'ahmet@example.com', 'Istanbul'),
('Ayse', 'Demir', 'ayse@example.com', 'Istanbul'),
('Mehmet', 'Kara', 'mehmet@example.com', 'Ankara'),
('Fatma', 'Celik', 'fatma@example.com', 'Ankara'),
('Ali', 'Oz', 'ali@example.com', 'Izmir'),
('Zeynep', 'Aydin', 'zeynep@example.com', 'Izmir'),
('Murat', 'Arslan', 'murat@example.com', 'Bursa'),
('Elif', 'Kilic', 'elif@example.com', 'Antalya'),
('Can', 'Topal', 'can@example.com', 'Istanbul'),
('Selin', 'Sari', 'selin@example.com', 'Ankara');
GO


INSERT INTO Orders (CustomerID, TotalAmount, PaymentType) VALUES
(1, 25000, 'Credit Card'),
(1, 12000, 'Cash'),
(1, 3500, 'Credit Card'),
(1, 700, 'Cash'),
(1, 500, 'Credit Card'),
(2, 12000, 'Credit Card'),
(2, 250, 'Cash'),
(2, 4500, 'Credit Card'),
(2, 700, 'Cash'),
(3, 25000, 'Credit Card'),
(3, 750, 'Cash'),
(3, 3000, 'Credit Card'),
(4, 250, 'Cash'),
(4, 150, 'Credit Card'),
(5, 3000, 'Cash'),
(5, 500, 'Credit Card'),
(6, 12000, 'Credit Card'),
(7, 400, 'Cash'),
(9, 1500, 'Credit Card'),
(9, 700, 'Cash'),
(9, 25000, 'Credit Card'),
(10, 4500, 'Credit Card');
GO


INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Price) VALUES
(1, 2, 1, 25000),
(2, 1, 1, 12000),
(3, 8, 1, 3000),  
(3, 3, 1, 500),   
(4, 11, 1, 700),  
(5, 10, 1, 500),  
(6, 1, 1, 12000), 
(7, 4, 1, 250),  
(8, 9, 1, 4500),  
(9, 11, 1, 700),  
(10, 2, 1, 25000), 
(11, 3, 1, 750),   
(12, 8, 1, 3000), 
(13, 4, 1, 250),  
(14, 6, 1, 150),   
(15, 8, 1, 3000), 
(16, 10, 1, 500),  
(17, 1, 1, 12000), 
(18, 12, 1, 400),  
(19, 13, 1, 1500),
(20, 11, 1, 700),  
(21, 2, 1, 25000),
(22, 9, 1, 4500);  
GO
