CREATE DATABASE OnlineShoppingDB;
GO

USE OnlineShoppingDB;
GO

-- CREATE TABLES --

CREATE TABLE Customer(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Surname NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    City NVARCHAR(50) NOT NULL,
    RegistrationDate DATE DEFAULT GETDATE()
);
GO


CREATE TABLE Category(
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL UNIQUE
);
GO

CREATE TABLE Seller(
    SellerID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Address NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE Product(
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(200) NOT NULL,
    Price DECIMAL(10,2) NOT NULL 
        CHECK(Price >= 0),
    Stock INT NOT NULL DEFAULT 0
        CHECK(Stock >= 0),
    CategoryID INT NOT NULL,
    SellerID INT NOT NULL,
    FOREIGN KEY(CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY(SellerID) REFERENCES Seller(SellerID)
);
GO


CREATE TABLE Orders(
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE DEFAULT GETDATE(), 
    TotalAmount DECIMAL(12,2) NOT NULL CHECK(TotalAmount >= 0),
    PaymentType NVARCHAR(50) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
GO


CREATE TABLE OrderDetail(
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL CHECK(Price >= 0),
    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
GO
