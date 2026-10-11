# MySQL Assignment 1: DDL Commands & Constraints

![MySQL](https://img.shields.io/badge/Database-MySQL-blue.svg)
![Tool](https://img.shields.io/badge/GUI-MySQL%20Workbench-orange.svg)
![Status](https://img.shields.io/badge/Status-Completed-success.svg)

A database project implementing fundamental Data Definition Language (DDL) operations, table alterations, cascading constraints, and integrity rules in MySQL. Completed as part of the **Entri Elevate** program.

---

## 📌 Project Overview

This assignment focuses on designing, restructuring, and constraining a relational database schema for an organizational workforce management system.

The database consists of three primary entities:
- **`departments`**: Department classifications.
- **`location`**: Geographic branch locations.
- **`employees`**: Personnel records linked via foreign keys to departments and branches.

---

## 📂 Repository Structure

```text
├── README.md                              # Project documentation
├── ENTRI SQL ASSIGNMENT 1.sql             # Complete SQL script
└── screenshots/                           # Execution logs from MySQL Workbench
    ├── screenshot_1_create_and_alter.jpg
    ├── screenshot_2_alter_and_truncate.jpg
    ├── screenshot_3_drop_and_recreate.jpg
    └── screenshot_4_constraints_applied.jpg
```

---

## 🛠️ Database Schema

### Entity Relationship & Attributes

```
[departments]
 ├── department_id   : INT (PK)
 └── department_name : VARCHAR(100) (UNIQUE, NOT NULL)

[location]
 ├── location_id     : INT (PK, AUTO_INCREMENT)
 └── location        : VARCHAR(30) (UNIQUE, NOT NULL)

[employees]
 ├── employee_id     : INT (PK)
 ├── employee_name   : VARCHAR(50) (NOT NULL)
 ├── gender          : ENUM('M', 'F') (NOT NULL)
 ├── age             : INT (CHECK: age >= 18)
 ├── hire_date       : DATE (DEFAULT: CURRENT_DATE)
 ├── designation     : VARCHAR(100)
 ├── department_id   : INT (FK -> departments.department_id)
 ├── location_id     : INT (FK -> location.location_id)
 └── salary          : DECIMAL(10, 2)
```

---

## 📝 Implementation Details

### Part 1: DDL Commands

1. **Database & Table Creation (`CREATE`)**
   - Created database `employee`.
   - Initialized `departments`, `location`, and `employees` tables with primary and foreign key constraints.

2. **Structural Alterations (`ALTER`)**
   - Added `email` column (`VARCHAR(100)`) to `employees`.
   - Expanded `designation` column data type to `VARCHAR(255)`.
   - Dropped the `age` column.
   - Renamed `hire_date` column to `date_of_joining`.

3. **Renaming Tables (`RENAME`)**
   - Renamed `departments` to `departments_info`.
   - Renamed `location` to `locations`.

4. **Table Truncation (`TRUNCATE`)**
   - Cleared all records from `employees` while preserving table structure.

5. **Dropping Entities (`DROP`)**
   - Dropped the `employees` table.
   - Dropped the entire `employee` database.

---

### Part 2: Database Recreation with Full Constraints

The database was re-instantiated with complete enterprise-level validation and constraint logic:

| Constraint Type | Target Field / Table | Business Logic |
| :--- | :--- | :--- |
| **Primary Key** | `departments.department_id`, `location.location_id`, `employees.employee_id` | Uniquely identifies each record. |
| **Auto Increment** | `location.location_id` | Sequentially generates identifiers automatically. |
| **Unique & Not Null** | `department_name`, `location`, `employee_name` | Prevents blank entries and duplicate values. |
| **Check Constraint** | `employees.age` | Enforces minimum hiring age (`age >= 18`). |
| **Enum Constraint** | `employees.gender` | Restricts values strictly to `'M'` or `'F'`. |
| **Default Constraint** | `employees.hire_date` | Automatically stamps system date (`CURRENT_DATE`) if omitted. |
| **Foreign Keys** | `department_id`, `location_id` | Enforces referential integrity with `ON UPDATE CASCADE ON DELETE SET NULL`. |

---

## 💻 SQL Script

```sql
-- PART 1: DDL COMMANDS
CREATE DATABASE employee;
USE employee;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE location (
    location_id INT PRIMARY KEY,
    location VARCHAR(30)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);

-- Alteration
ALTER TABLE employees ADD COLUMN email VARCHAR(100);
ALTER TABLE employees MODIFY COLUMN designation VARCHAR(255);
ALTER TABLE employees DROP COLUMN age;
ALTER TABLE employees CHANGE COLUMN hire_date date_of_joining DATE;

-- Renaming
RENAME TABLE departments TO departments_info;
RENAME TABLE location TO locations;

-- Truncation & Cleanup
TRUNCATE TABLE employees;
DROP TABLE employees;
DROP DATABASE employee;

-- PART 2: RECREATION WITH COMPLETE CONSTRAINTS
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10, 2),
    CONSTRAINT fk_department 
        FOREIGN KEY (department_id) REFERENCES departments(department_id)
        ON UPDATE CASCADE 
        ON DELETE SET NULL,
    CONSTRAINT fk_location 
        FOREIGN KEY (location_id) REFERENCES location(location_id)
        ON UPDATE CASCADE 
        ON DELETE SET NULL
);
```

---

## 🚀 How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   ```
2. Open **MySQL Workbench**.
3. Go to **File → Open SQL Script...** and select `ENTRI SQL ASSIGNMENT 1.sql`.
4. Run the statements sequentially using `Ctrl + Enter` (or `Cmd + Enter`) and review the results in the **Action Output** console.

---

## 👨‍💻 Author

- **Shahil Shalu TK**
- Entri Elevate Data Specialist / SQL Track