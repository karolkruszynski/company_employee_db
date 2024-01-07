-- POCZĄTKUJĄCE

-- Wybierz wszystkich pracowników z tabeli "Employees".
SELECT * FROM employees;

-- Wybierz imię i nazwisko pracownika, którego wynagrodzenie przekracza 60000 INR.
SELECT * FROM employees WHERE salary > 60000;

-- Wybierz wszystkich pracowników, którzy pracują w dziale IT.
SELECT * FROM employees WHERE department = 'IT';

-- Wybierz imiona, nazwiska i wynagrodzenia pracowników, których wynagrodzenie przekracza 60000 INR.
SELECT firstname, lastname, salary FROM employees WHERE salary > 60000;

-- Wybierz projekty, które zaczynają się po 2022-07-01.
SELECT * FROM projects WHERE startdate > '2022-07-01';

-- Wybierz pracowników z działu HR, których wynagrodzenie jest mniejsze niż 60000 INR.
SELECT * FROM employees WHERE department = 'HR' AND salary < 60000;

-- Wybierz wszystkich pracowników posortowanych malejąco według wynagrodzenia.
SELECT * FROM employees ORDER BY salary DESC;

-- Wybierz projekty posortowane alfabetycznie według nazwy.
SELECT * FROM projects ORDER BY projectname;

-- Oblicz średnie wynagrodzenie pracowników.
SELECT ROUND(AVG(salary),2) AS AverageSalary FROM employees;

-- Znajdź najwcześniejszą datę rozpoczęcia projektu.
SELECT * FROM projects ORDER BY startdate ASC LIMIT 1;
SELECT MIN(StartDate) AS EarliestStartDate FROM projects;

-- Wybierz imiona i nazwiska pracowników oraz nazwy projektów, do których są przypisani.
SELECT e.firstname, e.lastname, p.projectname FROM employees AS e
JOIN projects AS p ON e.employeeid = p.assignedemployeeid;

-- Wybierz projekty wraz z imionami i nazwiskami przypisanych pracowników, uwzględniając projekty bez przypisanego pracownika.
SELECT p.projectname, e.firstname, e.lastname FROM projects AS p
LEFT JOIN employees AS e
ON p.assignedemployeeid = e.employeeid;
