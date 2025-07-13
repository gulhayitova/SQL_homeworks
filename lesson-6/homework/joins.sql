--create database lesson6
use lesson6

create table Employees(
	EmployeeID int,
	Name varchar(30),
	DepartmentID int,
	Salary int)
insert into Employees
values (1, 'Alice',	101, 60000),
	(2,	'Bob', 102,	70000),
	(3,	'Charlie', 101,	65000),
	(4,	'David', 103, 72000),
	(5,	'Eva', NULL, 68000)

create table Departments(
	DepartmentID int,
	DepartmentName varchar(30))
insert into Departments
values (101, 'IT'), (102, 'HR'), (103, 'Finance'), (104, 'Marketing')

create table Projects(
	ProjectID int,
	ProjectName varchar(30),
	EmployeeID int)
insert into Projects
values (1, 'Alpha', 1),
	   (2, 'Beta', 2),
	   (3, 'Gamma', 1),
	   (4, 'Delta', 4),
	   (5, 'Omega', null);

-- inner join
select Employees.EmployeeID, Employees.Name, Departments.DepartmentName
from Employees
inner join Departments
on Departments.DepartmentID = Employees.DepartmentID

-- left join
select Employees.EmployeeID, Employees.Name, Departments.DepartmentName
from Employees
left join Departments
on Employees.DepartmentID = Departments.DepartmentID

-- right join
select Employees.Name, Employees.DepartmentID, Departments.DepartmentName
from Employees
right join Departments
on Employees.DepartmentID = Departments.DepartmentID

-- full outer join
select Employees.Name, Departments.DepartmentName
from Employees
full outer join Departments
on Employees.DepartmentID = Departments.DepartmentID

-- join with aggregation
select Departments.DepartmentName, sum(Employees.Salary) as SalarySum
from Employees
left join Departments
on Employees.DepartmentID = Departments.DepartmentID
group by Departments.DepartmentName

-- cross join
select Projects.ProjectID, Projects.ProjectName, Departments.DepartmentName
from Projects
cross join Departments
order by Projects.ProjectID

-- multiple joins
select Employees.Name, Departments.DepartmentName, Projects.ProjectName
from Employees
inner join Departments on Departments.DepartmentID = Employees.DepartmentID
left join Projects on Projects.EmployeeID = Employees.EmployeeID