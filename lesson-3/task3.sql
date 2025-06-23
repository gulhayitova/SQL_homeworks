
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO Products (ProductID, ProductName, Category, Price, Stock) VALUES
(1, 'Wireless Mouse', 'Electronics', 29.99, 120),
(2, 'Bluetooth Headphones', 'Electronics', 59.99, 75),
(3, 'Cotton T-Shirt', 'Clothing', 15.00, 200),
(4, 'Running Shoes', 'Footwear', 89.50, 60),
(5, 'Organic Green Tea', 'Groceries', 9.99, 150),
(6, 'LED Desk Lamp', 'Home Decor', 34.95, 40),
(7, 'USB-C Charger', 'Electronics', 19.99, 180),
(8, 'Stainless Steel Water Bottle', 'Accessories', 22.50, 90),
(9, 'Notebook (A5, Ruled)', 'Stationery', 4.75, 300),
(10, 'Gaming Keyboard', 'Electronics', 79.00, 45),
(11, 'Winter Jacket', 'Clothing', 120.00, 35),
(12, 'Sneaker Cleaner Kit', 'Footwear', 12.99, 50),
(13, 'Avocado Oil (500ml)', 'Groceries', 13.49, 100),
(14, 'Scented Candle - Lavender', 'Home Decor', 17.99, 80),
(15, 'Reusable Shopping Bag', 'Accessories', 3.99, 250);

SELECT DISTINCT Category
FROM Products

SELECT  Category, MAX(Price) AS MaxPrice
FROM Products
GROUP BY Category

SELECT ProductName, Stock, IIF(Stock = 0, 'Out of Stock', IIF(Stock BETWEEN 1 AND 10, 'Low Stock', 'In Stock')) AS InventoryStatus
FROM Products

SELECT *
FROM Products
ORDER BY Price DESC
OFFSET 5 ROWS