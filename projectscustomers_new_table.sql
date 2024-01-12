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

