-- Wybierz nazwy projektów, daty rozpoczęcia, daty zakończenia oraz nazwy klientów dla projektów, które mają przypisanego klienta.

SELECT 
    P.ProjectName,
    P.StartDate,
    P.EndDate,
	PC.customername
FROM 
    Projects as P
JOIN 
    ProjectsCustomers as PC ON P.ProjectID = PC.ProjectID

-- Oblicz sumę wynagrodzeń dla każdego działu, uwzględniając tylko tych pracowników, którzy są przypisani do projektu.

SELECT E.Department, SUM(Salary) AS TotalSalary
FROM
	Employees AS E
JOIN
	Projects AS P ON E.EmployeeID = P.AssignedEmployeeID
GROUP BY
	E.Department;

-- Wybierz nazwy i daty rozpoczęcia projektów, które nie mają przypisanego klienta.

SELECT P.ProjectName, P.StartDate
FROM 
	Projects AS P
LEFT JOIN
	ProjectsCustomers AS PC ON P.ProjectID = PC.ProjectID
WHERE 
    PC.CustomerID IS NULL;