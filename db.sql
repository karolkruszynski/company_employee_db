CREATE TABLE Employees (
    EmployeeID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (FirstName, LastName, Department, Salary)
VALUES ('John', 'Doe', 'IT', 60000.00),
       ('Jane', 'Smith', 'HR', 55000.00),
       ('Bob', 'Johnson', 'Finance', 70000.00),
       ('Alice', 'Williams', 'Marketing', 60000.00);

CREATE TABLE Projects (
    ProjectID SERIAL PRIMARY KEY,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    AssignedEmployeeID INT REFERENCES Employees(EmployeeID)
);

INSERT INTO Projects (ProjectName, StartDate, EndDate, AssignedEmployeeID)
VALUES ('Website Redesign', '2022-01-01', '2022-05-01', 1),
       ('Employee Training', '2022-02-15', '2022-04-15', 2),
       ('Financial Analysis', '2022-03-10', '2022-06-30', 3),
       ('Product Launch', '2022-04-01', '2022-08-01', 4);

-- Dodatkowe wiersze dla tabeli "Employees"
INSERT INTO Employees (FirstName, LastName, Department, Salary)
VALUES 
    ('Michael', 'Anderson', 'IT', 65000.00),
    ('Emily', 'Clark', 'Finance', 72000.00),
    ('David', 'White', 'Marketing', 58000.00),
    ('Olivia', 'Brown', 'HR', 60000.00),
    ('Daniel', 'Martin', 'IT', 67000.00),
    ('Sophia', 'Miller', 'Marketing', 62000.00),
    ('Matthew', 'Harris', 'HR', 58000.00),
    ('Emma', 'Taylor', 'Finance', 75000.00),
    ('Christopher', 'Moore', 'IT', 69000.00),
    ('Ava', 'Williams', 'Marketing', 60000.00),
    ('Nicholas', 'Jones', 'Finance', 71000.00),
    ('Amelia', 'Jackson', 'HR', 59000.00),
    ('Ethan', 'Hill', 'IT', 70000.00),
    ('Mia', 'Carter', 'Marketing', 63000.00),
    ('Logan', 'Baker', 'HR', 59000.00),
    ('Isabella', 'Green', 'IT', 66000.00),
    ('James', 'Cooper', 'Finance', 73000.00),
    ('Abigail', 'Roberts', 'Marketing', 61000.00),
    ('Benjamin', 'Reed', 'HR', 57000.00),
    ('Charlotte', 'Ward', 'IT', 68000.00);

-- Dodatkowe wiersze dla tabeli "Projects"
INSERT INTO Projects (ProjectName, StartDate, EndDate, AssignedEmployeeID)
VALUES
    ('Mobile App Development', '2022-05-15', '2022-10-01', 6),
    ('Customer Survey', '2022-06-01', '2022-08-31', 7),
    ('Budget Planning', '2022-07-10', '2022-12-15', 8),
    ('Product Enhancement', '2022-08-01', '2023-01-31', 9),
    ('Employee Recognition Program', '2022-09-15', '2022-11-30', 10),
    ('Data Analysis', '2022-10-01', '2023-03-31', 11),
    ('Quality Assurance', '2022-11-10', '2023-02-28', 12),
    ('Market Research', '2022-12-01', '2023-04-30', 13),
    ('Training Materials Development', '2023-01-15', '2023-06-30', 14),
    ('New Product Launch', '2023-02-01', '2023-08-31', 15),
    ('Employee Wellness Program', '2023-03-10', '2023-05-31', 16),
    ('Financial Forecasting', '2023-04-01', '2023-09-30', 17),
    ('Social Media Campaign', '2023-05-15', '2023-08-15', 18),
    ('IT Infrastructure Upgrade', '2023-06-01', '2023-11-30', 19),
    ('Employee Engagement Survey', '2023-07-10', '2023-09-30', 20),
    ('Corporate Social Responsibility', '2023-08-01', '2023-12-31', 1),
    ('New Market Expansion', '2023-09-15', '2024-02-29', 2),
    ('Performance Appraisal System', '2023-10-01', '2024-03-31', 3),
    ('Product Training Sessions', '2023-11-10', '2024-04-30', 4),
    ('Sustainability Initiative', '2023-12-01', '2024-05-31', 5);

-- Tworzenie tabeli ProjectsCustomers
CREATE TABLE ProjectsCustomers
(
    ProjectID INT,
    CustomerID INT,
    PRIMARY KEY (CustomerID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);
INSERT INTO ProjectsCustomers (ProjectID, CustomerID) VALUES
(1, 1),
(1, 2),
(2, 3),
(4, 4),
(5, 5),
(6, 6);

-- Dodanie kolumny CustomerName do tabeli ProjectsCustomers
ALTER TABLE ProjectsCustomers
ADD COLUMN CustomerName VARCHAR(255);

-- Wypełnienie nowej kolumny CustomerName przykładowymi danymi
UPDATE ProjectsCustomers
SET CustomerName = CASE 
    WHEN CustomerID = 1 THEN 'Mahindra'
    WHEN CustomerID = 2 THEN 'ABT Cupra'
    WHEN CustomerID = 3 THEN 'Mercedes-Benz'
    WHEN CustomerID = 4 THEN 'BMW'
    WHEN CustomerID = 5 THEN 'Samsung'
    WHEN CustomerID = 6 THEN 'Nokia'
    ELSE NULL
END;

-- -- Dodanie trzech rekordów do tabeli Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
(101, 'John', 'Doe', 'IT', 70000.00),
(102, 'Jane', 'Smith', 'HR', 60000.50),
(103, 'Bob', 'Johnson', 'Finance', 80000.75);
