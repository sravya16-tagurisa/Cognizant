USE CompanyDB;
GO


CREATE OR ALTER PROCEDURE sp_GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT *
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO
EXEC sp_GetEmployeesByDepartment @DepartmentID = 1;
GO

CREATE OR ALTER PROCEDURE sp_InsertEmployee
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN
    INSERT INTO Employees
        (FirstName, LastName, DepartmentID, Salary, JoinDate)
    VALUES
        (@FirstName, @LastName, @DepartmentID, @Salary, @JoinDate);
END;
GO
EXEC sp_InsertEmployee
    @FirstName = 'Sophia',
    @LastName = 'Taylor',
    @DepartmentID = 3,
    @Salary = 72000.00,
    @JoinDate = '2024-06-15';
GO
SELECT * FROM Employees;
GO