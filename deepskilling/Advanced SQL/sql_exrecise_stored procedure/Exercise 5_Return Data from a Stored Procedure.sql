USE CompanyDB;
GO

CREATE OR ALTER PROCEDURE sp_GetEmployeeCountByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT COUNT(*) AS TotalEmployees
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO
EXEC sp_GetEmployeeCountByDepartment @DepartmentID = 1;
GO

EXEC sp_GetEmployeeCountByDepartment @DepartmentID = 2;
GO

EXEC sp_GetEmployeeCountByDepartment @DepartmentID = 3;
GO