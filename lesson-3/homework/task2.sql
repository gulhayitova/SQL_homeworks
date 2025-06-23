
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

INSERT INTO Orders (OrderID, CustomerName, OrderDate, TotalAmount, Status) VALUES
(1, 'Alice Johnson', '2021-02-14', 120.50, 'Delivered'),
(2, 'Bob Smith', '2021-06-30', 89.99, 'Cancelled'),
(3, 'Charlie Brown', '2021-11-22', 49.99, 'Shipped'),
(4, 'Diana Prince', '2022-01-05', 310.00, 'Pending'),
(5, 'Ethan Hunt', '2022-03-18', 150.75, 'Delivered'),
(6, 'Fiona Gallagher', '2022-06-07', 80.25, 'Delivered'),
(7, 'George Bluth', '2022-09-14', 215.00, 'Cancelled'),
(8, 'Hannah Montana', '2022-12-25', 400.00, 'Shipped'),
(9, 'Ian Curtis', '2023-02-01', 95.99, 'Delivered'),
(10, 'Jack Reacher', '2023-04-12', 560.10, 'Pending'),
(11, 'Kara Zor-El', '2023-07-08', 320.50, 'Shipped'),
(12, 'Liam Gallagher', '2023-10-01', 105.45, 'Delivered'),
(13, 'Mia Wallace', '2023-12-15', 89.00, 'Pending'),
(14, 'Noah Centineo', '2024-01-20', 44.99, 'Cancelled'),
(15, 'Olivia Rodrigo', '2024-03-11', 299.99, 'Delivered'),
(16, 'Peter Parker', '2024-05-27', 180.00, 'Pending'),
(17, 'Quinn Fabray', '2024-08-13', 75.50, 'Shipped'),
(18, 'Rachel Green', '2024-10-30', 129.99, 'Delivered'),
(19, 'Steve Rogers', '2024-12-09', 399.00, 'Shipped'),
(20, 'Tony Stark', '2025-01-02', 1000.00, 'Delivered'),
(21, 'Uma Thurman', '2025-02-18', 134.99, 'Cancelled'),
(22, 'Victor Stone', '2025-04-06', 225.00, 'Pending'),
(23, 'Wanda Maximoff', '2025-05-14', 333.33, 'Shipped'),
(24, 'Xander Harris', '2025-06-21', 140.75, 'Delivered'),
(25, 'Yelena Belova', '2025-07-10', 410.50, 'Shipped'),
(26, 'Zara Khan', '2023-03-03', 199.99, 'Cancelled'),
(27, 'Ben Tennyson', '2021-09-09', 88.88, 'Delivered'),
(28, 'Sam Winchester', '2022-05-16', 670.00, 'Shipped'),
(29, 'Dean Winchester', '2023-08-28', 210.10, 'Pending'),
(30, 'Luna Lovegood', '2024-11-11', 155.55, 'Delivered');

SELECT *
FROM Orders
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-12-31'

SELECT 
	CASE
		WHEN Status = 'Shipped' OR Status = 'Delivered' THEN 'Completed'
		WHEN Status = 'Pending' THEN 'Pending'
		WHEN Status = 'Cancelled' THEN 'Cancelled'
		END
	AS OrderStatus, COUNT(*) AS TotalOrders, SUM(TotalAmount) AS TotalRevenue
FROM Orders
GROUP BY CASE
		WHEN Status = 'Shipped' OR Status = 'Delivered' THEN 'Completed'
		WHEN Status = 'Pending' THEN 'Pending'
		WHEN Status = 'Cancelled' THEN 'Cancelled'
		END

SELECT Status
FROM Orders
WHERE TotalAmount > 5000

SELECT *
FROM Orders
ORDER BY TotalAmount DESC
