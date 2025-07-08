drop table Employees
create table Employees(
EmployeeID int,
Name varchar(50),
Department varchar(50),
Salary decimal(10, 2),
HireDate date)

INSERT INTO Employees (EmployeeID, Name, Department, Salary, HireDate)
VALUES 
(1, 'Alice Johnson',    'HR',      45000.00, '2018-03-15'),
(2, 'Bob Smith',        'IT',      60000.00, '2019-07-22'),
(3, 'Carol Davis',      'Sales',   52000.00, '2020-01-10'),
(4, 'David Brown',      'Finance', 73000.00, '2017-11-01'),
(5, 'Eva Martinez',     'HR',      45000.00, '2021-05-12'),
(6, 'Frank Wilson',     'IT',      67000.00, '2016-09-30'),
(7, 'Grace Lee',        'Sales',   51000.00, '2022-02-18'),
(8, 'Henry Kim',        'Finance', 69000.00, '2015-12-05'),
(9, 'Ivy Thompson',     'HR',      46000.00, '2020-06-08'),
(10,'Jack White',       'IT',      61000.00, '2019-10-25'),
(11,'Kara Nguyen',      'Sales',   46000.00, '2018-04-01'),
(12,'Leo Patel',        'Finance', 75000.00, '2017-08-14'),
(13,'Mia Chen',         'HR',      47000.00, '2021-11-09'),
(14,'Nathan Scott',     'IT',      64000.00, '2016-03-19'),
(15,'Olivia Green',     'Sales',   53000.00, '2020-12-31'),
(16,'Peter Adams',      'Finance', 70000.00, '2015-07-21'),
(17,'Quinn Baker',      'HR',      49000.00, '2018-01-27'),
(18,'Rita Young',       'IT',      66000.00, '2019-09-16'),
(19,'Sam Carter',       'Sales',   66000.00, '2022-03-03'),
(20,'Tina Evans',       'Finance', 75000.00, '2017-06-11');

--1. Assign a Unique Rank to Each Employee Based on Salary
select *, ROW_NUMBER() OVER(ORDER by Salary) as SalaryRank
from Employees

--2. Find Employees Who Have the Same Salary Rank
;with SalaryRanked as 
(select *, DENSE_RANK() over(order by Salary) as RankOrder
from Employees)
select * 
from SalaryRanked
where RankOrder in(
	select RankOrder
	from SalaryRanked
	group by RankOrder
	having count(*) > 1)

--3. Identify the Top 2 Highest Salaries in Each Department
;with DepartmentRank as (
select *, 
	row_number() over(partition by Department order by Salary desc) as HighestRank
from Employees
)
select *
from DepartmentRank
where HighestRank < 3

--4. Find the Lowest-Paid Employee in Each Department
;with DepartmentRank as (
select *, 
	row_number() over(partition by Department order by Salary asc) as LowestRank
from Employees
)
select *
from DepartmentRank
where LowestRank < 3

--5. Calculate the Running Total of Salaries in Each Department
select Department, sum(Salary) as DepartmentTotal
from Employees
group by Department

--6. Find the Total Salary of Each Department Without GROUP BY
select distinct(Department), sum(Salary) over(partition by Department) as DepartmentTotal
from Employees

--7. Calculate the Average Salary in Each Department Without GROUP BY
select distinct(Department), convert(decimal(10, 0), avg(Salary) over(partition by Department)) as DepartmentAvg
from Employees

--8. Find the Difference Between an Employee’s Salary and Their Department’s Average
select *, convert(decimal(10, 0), Salary - avg(Salary) over(partition by Department)) as DepDifference
from Employees

--9. Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)
select *, convert(decimal(10, 0), avg(Salary) over(
	order by EmployeeID
	rows between 1 preceding and 1 following
	)) as MovingAvg
from Employees

--10. Find the Sum of Salaries for the Last 3 Hired Employees
select sum(Salary) as Last3
from (
	select Salary
	from Employees
	order by HireDate desc
	offset 0 rows
	fetch next 3 rows only
	) t

--11. Calculate the Running Average of Salaries Over All Previous Employees
select *, convert(decimal(10,0), avg(Salary) over(order by EmployeeID)) as CumulativeAvg
from Employees

--12. Find the Maximum Salary Over a Sliding Window of 2 Employees Before and After
select EmployeeID, Name, Salary, max(Salary) over(
	order by EmployeeID
	rows between 2 preceding and 2 following
	) as MaxIn5Rows
from Employees

--13. Determine the Percentage Contribution of Each Employee’s Salary to Their Department’s Total Salary
;with DepSum as(
	select *, round(sum(Salary) over(partition by Department), 0) as DepSumColumn
	from Employees)
select EmployeeID, Name, Department, format(Salary/DepSumColumn, 'P2') as Contribution
from DepSum
order by EmployeeID
