# Baza Danych FirmaXYZ

## Baza Danych

### Baze danych można zaimplementować kopiując polecenia z pliku db.sql

## Tabele

### 1. Employees
Tabela zawierająca informacje o pracownikach w firmie XYZ.

#### Struktura Tabeli:
- **EmployeeID:** Unikalny identyfikator pracownika (typ danych: INTEGER).
- **FirstName:** Imię pracownika (typ danych: VARCHAR).
- **LastName:** Nazwisko pracownika (typ danych: VARCHAR).
- **Department:** Dział, w którym pracownik jest zatrudniony (typ danych: VARCHAR).
- **Salary:** Wynagrodzenie pracownika (typ danych: DECIMAL).

### 2. Projects
Tabela zawierająca informacje o projektach w firmie XYZ.

#### Struktura Tabeli:
- **ProjectID:** Unikalny identyfikator projektu (typ danych: INTEGER).
- **ProjectName:** Nazwa projektu (typ danych: VARCHAR).
- **StartDate:** Data rozpoczęcia projektu (typ danych: DATE).
- **EndDate:** Data zakończenia projektu (typ danych: DATE).
- **AssignedEmployeeID:** ID pracownika przypisanego do projektu (typ danych: INTEGER).

- ### 3. ProjectsCustomers
Tabela zawierająca informacje o klientach oraz przypisanych do nich projektach z naszej firmy XYZ.

#### Struktura Tabeli:
- **CustomerID:** Unikalny identyfikator projektu (typ danych: INTEGER).
- **ProjectID:** Klucz obcy połączony z takim samym kluczem głównym z tabeli 2. Projects (typ danych: INTEGER).
- **CustomerName:** Nazwa firmy klienta (typ danych: VARCHAR(255)).

## Zadania SQL
Zadania znajdują się w plikach odpowiednio:

BEGGINER.sql - Zadania i rozwiązania dla osób początkujących

INTERMEDIATE.sql - Zadania i rozwiązania dla osób średnio-zaawansowanych
