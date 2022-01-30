SELECT Office.officeID, AVG(salary) FROM Employee
	JOIN Secretary ON Secretary.Employee_employeeID = Employee.employeeID
    JOIN Office ON Office.officeID = Employee.Office_officeID
WHERE Office.city = 'Thessaloniki'