-- ŚREDNIO-ZAAWANSOWANE

-- Wybierz pracowników, których wynagrodzenie jest wyższe niż średnie wynagrodzenie we wszystkich działach.
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees );

-- Znajdź projekty, które mają przypisanego pracownika z najniższym wynagrodzeniem.
SELECT * FROM projects
WHERE assignedemployeeid = (SELECT employeeid FROM employees ORDER BY salary ASC LIMIT 1);

-- Znajdź pracownika o nazwisku "Smith" bez używania klauzuli WHERE.
SELECT * FROM Employees
JOIN (SELECT 'Smith' AS TargetLastName) AS Target
ON Employees.LastName = Target.TargetLastName;


-- Znajdź pracowników z działu "IT" posortowanych malejąco według wynagrodzenia.
SELECT * FROM employees
WHERE department = 'IT'
ORDER BY salary DESC;

-- Zaktualizuj wynagrodzenie pracownika o ID = 1, o 10%, ale jednocześnie zapisz tę operację w transakcji.
BEGIN;
UPDATE Employees SET Salary = Salary * 1.1 WHERE EmployeeID = 1;
COMMIT;
SELECT salary FROM employees
WHERE employeeid = 1;

-- Wycofaj ostatnią transakcję (rollback).
ROLLBACK;
SELECT salary FROM employees
WHERE employeeid = 1;


-- Stwórz widok zawierający informacje o pracownikach z działu "Finance".
CREATE VIEW ViewFinanceEmployees AS
SELECT * FROM employees WHERE department = 'Finance';

-- Wybierz dane z widoku "ViewFinanceEmployees".
SELECT * FROM ViewFinanceEmployees;

-- Stwórz procedurę składowaną, która przyjmuje nazwę kolumny i zwraca unikalne wartości tej kolumny.
CREATE OR REPLACE PROCEDURE GetUniqueColumnValues(IN column_name VARCHAR)
AS $$
BEGIN
    EXECUTE 'SELECT DISTINCT ' || column_name || ' FROM employees;';
END;
$$ LANGUAGE plpgsql;

-- Wywołaj procedurę składowaną, aby uzyskać unikalne wartości w kolumnie "Department".
CALL GetUniqueColumnValues('department');



