CREATE DATABASE employee;
USE employee;

CREATE TABLE departments ( department_id INT PRIMARY KEY,department_name VARCHAR(100));
CREATE TABLE location (location_id INT PRIMARY KEY,location VARCHAR(30));
CREATE TABLE employees ( employee_id INT PRIMARY KEY, employee_name VARCHAR(50), gender ENUM('M', 'F'),age INT,hire_date DATE,
designation VARCHAR(100),department_id INT,location_id INT,salary DECIMAL(10, 2),
FOREIGN KEY (department_id) REFERENCES departments(department_id),FOREIGN KEY (location_id) REFERENCES location(location_id));

#ALTERATION

ALTER TABLE employees ADD COLUMN email VARCHAR(100);
ALTER TABLE employees MODIFY COLUMN designation VARCHAR(255);
ALTER TABLE employees DROP COLUMN age;
ALTER TABLE employees CHANGE COLUMN hire_date date_of_joining DATE;
#RENAMING_TABLES
RENAME TABLE departments TO departments_info;
RENAME TABLE location TO locations;
#TABLE_TRUNCATION
TRUNCATE TABLE employees;

#Database_Table Dropping

DROP TABLE employees;
DROP DATABASE employee;

#Database Recreation with Full Constraints

DROP DATABASE IF EXISTS employee;

CREATE DATABASE employee;
USE employee;

CREATE TABLE departments (department_id INT PRIMARY KEY,department_name VARCHAR(100) NOT NULL UNIQUE);
CREATE TABLE location (location_id INT AUTO_INCREMENT PRIMARY KEY,location VARCHAR(30) NOT NULL UNIQUE);
CREATE TABLE employees (employee_id INT PRIMARY KEY,employee_name VARCHAR(50) NOT NULL,gender ENUM('M', 'F') NOT NULL,age INT CHECK (age >= 18),
hire_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,designation VARCHAR(100),department_id INT,location_id INT,salary DECIMAL(10, 2),
CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(department_id)ON UPDATE CASCADE ON DELETE SET NULL,
CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES location(location_id)ON  UPDATE CASCADE ON DELETE SET NULL);