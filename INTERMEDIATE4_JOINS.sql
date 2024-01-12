
-- Wybierz imiona i nazwiska pracowników oraz nazwy projektów, do których są przypisani.

SELECT E.FirstName, E.LastName, P.ProjectName
FROM
	Employees AS E
JOIN
	Projects AS P ON E.EmployeeID = P.AssignedEmployeeID;
	
-- Wybierz nazwy projektów, daty rozpoczęcia, daty zakończenia oraz nazwy klientów dla projektów, które mają przypisanego klienta.

SELECT P.ProjectName, P.StartDate, P.EndDate, PC.CustomerName
FROM
	Projects AS P
JOIN
	ProjectsCustomerS AS PC ON P.ProjectId = PC.ProjectID;
	
-- Wybierz imiona i nazwiska pracowników, nazwy projektów oraz wynagrodzenia pracowników dla tych, którzy są przypisani do projektów
-- Oraz posortuj wyniki malejąco według wynagrodzenia.

SELECT 
    E.FirstName,
    E.LastName,
    P.ProjectName,
    E.Salary
FROM 
    Employees E
JOIN 
    Projects P ON E.EmployeeID = P.AssignedEmployeeID
ORDER BY Salary DESC;

-- Wybierz imiona i nazwiska pracowników oraz nazwy projektów, nawet jeśli nie są przypisani do żadnego projektu.
SELECT 
    E.FirstName,
    E.LastName,
    P.ProjectName
FROM
	Employees AS E
LEFT JOIN
	Projects AS P ON E.EmployeeID = P.AssignedEmployeeID;
	
-- Wybierz nazwy projektów, daty rozpoczęcia, daty zakończenia oraz nazwy klientów dla projektów, nawet jeśli nie mają przypisanego klienta.
SELECT 
    P.ProjectName,
    P.StartDate,
    P.EndDate,
    PC.CustomerName
FROM
	Projects AS P
LEFT JOIN
	ProjectsCustomers AS PC ON P.ProjectID = PC.ProjectID;
	
-- Wybierz nazwy działów i imiona pracowników, nawet jeśli nie są przypisani do żadnego działu.

SELECT 
    P.ProjectName,
    E.FirstName,
    E.LastName
FROM 
    Employees AS E
FULL OUTER JOIN 
	Projects AS P ON P.AssignedEmployeeID = E.EmployeeID;

