CREATE DATABASE ProductDB;
GO

USE ProductDB;
GO


CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
GO


INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1,'Laptop','Electronics',75000),
(2,'Mouse','Electronics',1500),
(3,'Keyboard','Electronics',2500),
(4,'Monitor','Electronics',18000),
(5,'Printer','Electronics',18000),
(6,'Shirt','Clothing',1200),
(7,'Jeans','Clothing',2200),
(8,'Jacket','Clothing',4500),
(9,'T-Shirt','Clothing',1200),
(10,'Sweater','Clothing',4500),
(11,'Rice Bag','Groceries',1800),
(12,'Cooking Oil','Groceries',2200),
(13,'Sugar','Groceries',900),
(14,'Tea Powder','Groceries',700),
(15,'Coffee Powder','Groceries',2200);
GO


SELECT * FROM Products;
GO



SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    ROW_NUMBER() OVER
    (
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS RowNumber
FROM Products;
GO



SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    RANK() OVER
    (
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS RankNumber
FROM Products;
GO


SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    DENSE_RANK() OVER
    (
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS DenseRankNumber
FROM Products;
GO



WITH ProductRanks AS
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY Category
               ORDER BY Price DESC
           ) AS RowNumber
    FROM Products
)
SELECT *
FROM ProductRanks
WHERE RowNumber <= 3;
GO

WITH ProductRanks AS
(
    SELECT *,
           RANK() OVER
           (
               PARTITION BY Category
               ORDER BY Price DESC
           ) AS RankNumber
    FROM Products
)
SELECT *
FROM ProductRanks
WHERE RankNumber <= 3;
GO



WITH ProductRanks AS
(
    SELECT *,
           DENSE_RANK() OVER
           (
               PARTITION BY Category
               ORDER BY Price DESC
           ) AS DenseRankNumber
    FROM Products
)
SELECT *
FROM ProductRanks
WHERE DenseRankNumber <= 3;
GO