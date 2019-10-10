CREATE SCHEMA EmployeeExercise
GO
DROP TABLE EmployeeExercise.EmpDetails;
DROP TABLE EmployeeExercise.Employee;
DROP TABLE EmployeeExercise.Department;
CREATE TABLE EmployeeExercise.Department (
	ID INT IDENTITY(1,1),
	Name NVARCHAR(100) NOT NULL,
	Location NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_Department_ID PRIMARY KEY (ID)
);
CREATE TABLE EmployeeExercise.Employee (
	ID INT IDENTITY(1,1),
	FirstName NVARCHAR(100) NOT NULL,
	LastName NVARCHAR(100) NOT NULL,
	SSN NVARCHAR(100) NOT NULL,
	DeptID INT,
	CONSTRAINT PK_Employee_ID PRIMARY KEY (ID),
	CONSTRAINT FK_Employee_DeptID FOREIGN KEY (DeptID) REFERENCES EmployeeExercise.Department(ID)
);
CREATE TABLE EmployeeExercise.EmpDetails (
	ID INT IDENTITY(1,1),
	EmployeeID INT,
	Salary MONEY NOT NULL,
	Address1 NVARCHAR(100) NOT NULL,
	Address2 NVARCHAR(100) NOT NULL,
	City NVARCHAR(100) NOT NULL,
	State NVARCHAR(100) NOT NULL,
	Country NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_EmpDetails_ID PRIMARY KEY (ID),
	CONSTRAINT FK_EmpDetails_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES EmployeeExercise.Employee(ID)
);

INSERT INTO EmployeeExercise.Department (Name, Location) VALUES
	('HR', 'Cupertino'),
	('Engineering', 'San Lucia'),
	('Business', 'Rancho Cucomonga');

SELECT * FROM EmployeeExercise.Department;

INSERT INTO EmployeeExercise.Employee (FirstName, LastName, SSN, DeptID) VALUES
	('Javon', 'Negahban', '457289457', 2),
	('Bob', 'Managee', '834573561', 1),
	('Sabrina', 'Uy', '967261527', 3),
	('Ojan', 'Negahba', '653236304', 2);

SELECT * FROM EmployeeExercise.Employee;

INSERT INTO EmployeeExercise.EmpDetails (EmployeeID, Salary, Address1, Address2, City, State, Country) VALUES
	(3, 50000, '17 Winding Road', '8 Managee Street', 'Rancho Cocoumonga', 'OH', 'USA'),
	(1, 200000, '83 Donte', '6 Main', 'Arlington', 'TX', 'USA'),
	(2, 65000, '2 Balo Street', '27 Mayan Street', 'Leferton', 'MN', 'USA'),
	(4, 90000, '6 Snow Lane', '3842 Cannonfodder', 'Silbid', 'WA', 'USA');

SELECT * FROM EmployeeExercise.EmpDetails;

INSERT INTO EmployeeExercise.Employee (FirstName, LastName, SSN, DeptID) VALUES
	('Tina', 'Smith', '625242576', 1)
INSERT INTO EmployeeExercise.EmpDetails (EmployeeID, Salary, Address1, Address2, City, State, Country) VALUES
	(5, 35000, '16 Gerol Lane', '3 Fallin Drive', 'Ulder', 'NY', 'USA')

SELECT * FROM EmployeeExercise.Employee;
SELECT * FROM EmployeeExercise.EmpDetails;

INSERT INTO EmployeeExercise.Department (Name, Location) VALUES
	('Marketing', 'Bilfider')
INSERT INTO EmployeeExercise.Employee (FirstName, LastName, SSN, DeptID) VALUES
	('Ron', 'Jeremy', '845626152', 4)
INSERT INTO EmployeeExercise.EmpDetails (EmployeeID, Salary, Address1, Address2, City, State, Country) VALUES
	(6, 95000, '3800 Billboard', '22 Cemetery', 'Yavar', 'NY', 'USA')
INSERT INTO EmployeeExercise.Employee (FirstName, LastName, SSN, DeptID) VALUES
	('Alfred', 'Huganza', '264567284', 4)
INSERT INTO EmployeeExercise.EmpDetails (EmployeeID, Salary, Address1, Address2, City, State, Country) VALUES
	(7, 55000, '16 Axis', '19 Dillweed', 'Joferen', 'NY', 'USA')

SELECT * FROM EmployeeExercise.Department;

SELECT emp.*
FROM EmployeeExercise.Employee emp
JOIN EmployeeExercise.Department dpt
ON emp.DeptId = dpt.ID
WHERE dpt.Name = 'Marketing';

SELECT SUM(empd.Salary)
FROM EmployeeExercise.EmpDetails empd
JOIN EmployeeExercise.Employee emp
ON empd.EmployeeID = emp.ID
JOIN EmployeeExercise.Department dpt
ON emp.DeptId = dpt.ID
WHERE dpt.Name = 'Marketing';

SELECT dpt.Name, COUNT(*) [Number of Employees]
FROM EmployeeExercise.Employee emp
JOIN EmployeeExercise.Department dpt
ON emp.DeptID = dpt.ID
GROUP BY dpt.Name;

UPDATE EmployeeExercise.EmpDetails
SET Salary = 90000
WHERE EmployeeID IN
(SELECT ID FROM EmployeeExercise.Employee WHERE FirstName = 'Tina' AND LastName = 'Smith');

SELECT *
FROM EmployeeExercise.Employee emp
JOIN EmployeeExercise.EmpDetails empd
ON empd.EmployeeID = emp.ID;