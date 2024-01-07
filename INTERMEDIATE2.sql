-- ŚREDNIO-ZAAWANSOWANE CZĘŚĆ 2

-- Znajdź projekty, które mają przypisanego pracownika z najniższym wynagrodzeniem.
SELECT * FROM Projects
WHERE AssignedEmployeeID = (SELECT EmployeeID FROM Employees ORDER BY Salary ASC LIMIT 1);

-- Wybierz imiona i nazwiska pracowników oraz nazwy projektów, do których są przypisani.
SELECT e.firstname, e.lastname, p.projectname FROM employees AS e
JOIN projects AS p ON e.employeeid = p.assignedemployeeid;

-- Oblicz średnie wynagrodzenie pracowników w każdym dziale.
SELECT department, ROUND(AVG(salary)) FROM employees
GROUP BY department;

-- Znajdź działy, w których średnie wynagrodzenie przekracza 50000 INR, posortowane malejąco według średniego wynagrodzenia.
SELECT Department, ROUND(AVG(Salary),0) AS AvgSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 50000
ORDER BY AvgSalary DESC;

-- Znajdź działy, w których liczba pracowników przekracza 5.
SELECT Department, COUNT(*) AS EmployeeCount FROM employees
GROUP BY Department
HAVING COUNT(*) > 5;

-- Przypisz numer porządkowy dla pracowników w każdym dziale, na podstawie wynagrodzenia malejąco.
SELECT Department, FirstName, LastName, Salary,
       ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS RankInDepartment
FROM Employees;

-- Oblicz sumy skumulowane wynagrodzeń pracowników w każdym dziale.
SELECT Department, FirstName, LastName, Salary,
	SUM(Salary) OVER (PARTITION BY Department ORDER BY Salary) AS CumulativeSalary
FROM Employees;

-- Znajdź pracowników, którzy pracują w tym samym dziale i mają podobne wynagrodzenie (różnica poniżej 2000).
SELECT E1.FirstName, E1.LastName, E1.Department, E1.Salary,
       E2.FirstName AS ColleagueFirstName, E2.LastName AS ColleagueLastName, E2.Salary AS ColleagueSalary
FROM Employees AS E1
JOIN Employees AS E2 ON E1.Department = E2.Department AND E1.EmployeeID <> E2.EmployeeID
WHERE ABS(E1.Salary - E2.Salary) < 2000;

-- Dodaj nową kolumnę "IsManager" do tabeli "Employees" i ustaw ją na true dla pracowników, którzy mają najwyższe wynagrodzenie w swoim dziale.
ALTER TABLE Employees
ADD COLUMN IsManager BOOLEAN;

UPDATE Employees
SET IsManager = true
WHERE (Department, Salary) IN (SELECT Department, MAX(Salary) FROM Employees GROUP BY Department);

SELECT * FROM Employees;

-- Usuń wszystkich pracowników, którzy nie są przypisani do żadnego projektu.
DELETE FROM Employees
WHERE EmployeeID NOT IN (SELECT DISTINCT AssignedEmployeeID FROM Projects WHERE AssignedEmployeeID IS NOT NULL);
