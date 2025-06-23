
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate) VALUES
(1, 'Alice', 'Johnson', 'Engineering', 92000.00, '2019-03-15'),
(2, 'Bob', 'Smith', 'Engineering', 87000.00, '2020-06-10'),
(3, 'Charlie', 'Brown', 'Sales', 48000.00, '2021-01-25'),
(4, 'Diana', 'Prince', 'HR', 51000.00, '2018-11-01'),
(5, 'Ethan', 'Hunt', 'Security', 97000.00, '2017-05-22'),
(6, 'Fiona', 'Gallagher', 'Finance', 76000.00, '2020-02-14'),
(7, 'George', 'Bluth', 'Marketing', 66000.00, '2019-08-30'),
(8, 'Hannah', 'Montana', 'Engineering', 83000.00, '2022-04-12'),
(9, 'Ian', 'Curtis', 'Sales', 54000.00, '2021-09-03'),
(10, 'Jack', 'Reacher', 'Security', 85000.00, '2018-07-19'),
(11, 'Kara', 'Zor-El', 'HR', 60000.00, '2021-12-05'),
(12, 'Liam', 'Gallagher', 'Finance', 58000.00, '2020-10-21'),
(13, 'Mia', 'Wallace', 'Marketing', 49000.00, '2023-01-01'),
(14, 'Noah', 'Centineo', 'Engineering', 75000.00, '2019-04-04'),
(15, 'Olivia', 'Rodrigo', 'Sales', 52000.00, '2022-07-15'),
(16, 'Peter', 'Parker', 'Security', 99000.00, '2016-10-10'),
(17, 'Quinn', 'Fabray', 'HR', 47000.00, '2020-03-17'),
(18, 'Rachel', 'Green', 'Marketing', 55000.00, '2019-11-11'),
(19, 'Steve', 'Rogers', 'Engineering', 79000.00, '2021-06-06'),
(20, 'Tony', 'Stark', 'Finance', 110000.00, '2015-01-01'),
(21, 'Uma', 'Thurman', 'Sales', 61000.00, '2023-02-22'),
(22, 'Victor', 'Stone', 'Security', 58000.00, '2020-09-09'),
(23, 'Wanda', 'Maximoff', 'Engineering', 89000.00, '2022-12-12'),
(24, 'Xander', 'Harris', 'HR', 46000.00, '2021-08-08'),
(25, 'Yelena', 'Belova', 'Finance', 72000.00, '2022-05-05');

SELECT *
FROM Employees
ORDER BY Salary DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;

SELECT Department, AVG(Salary)
FROM Employees
GROUP BY Department

SELECT *, 
	CASE
		WHEN Salary > 80000 then 'High'
		WHEN Salary > 50000 then 'Medium'
		WHEN Salary > 0 then 'Low'
		END
	AS SalaryCategory
FROM Employees

SELECT Department, AVG(Salary)
FROM Employees
GROUP BY Department
ORDER BY AVG(Salary) DESC

SELECT*
FROM Employees
ORDER BY EmployeeID
OFFSET 2 ROWS
FETCH NEXT 5 ROWS ONLY