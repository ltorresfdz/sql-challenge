DROP TABLE Employees
CREATE TABLE Employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR(5),
  birth_date VARCHAR,
  first_name VARCHAR,
  last_name VARCHAR,
  sex VARCHAR(1),
  hire_date VARCHAR
);
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Salaries (
  emp_no INT PRIMARY KEY,
  salary INTEGER
);
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE titles (
  title_id VARCHAR PRIMARY KEY,
  title VARCHAR
);
---------------------------------------------------------------------------------------------------------------------
CREATE TABLE department(
  dept_no VARCHAR(4) PRIMARY KEY,
  dept_name VARCHAR
);
----------------------------------------------------------------------------------------------------------------------
CREATE TABLE dept_emp(
  emp_no INT PRIMARY KEY,
  dept_no VARCHAR(4)
  );
----------------------------------------------------------------------------------------------------------------------
---COMPOSITE KEY
CREATE TABLE dept_emp
(
  emp_no INT ,
  dept_no VARCHAR(4) ,
  PRIMARY KEY (emp_no,dept_no)
);
-----------------------------------------------------------------------------------------------------------------------
CREATE TABLE dept_manager
(
 dept_no VARCHAR (4),
 emp_no INT PRIMARY KEY
 );
-----------------------------------------------------------------------------------------------------------------------
SELECT * FROM Employees;
SELECT * FROM Salaries;
SELECT * FROM titles;
SELECT * FROM department;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
----------------------------------------------------------------------------------------------------------------------
---Join all data from 6 tables

SELECT 
Employees.*,
titles.title as Employee_Title,
dept_emp.dept_no as Dept_No,
department.dept_name as Dept_Name,
dept_manager.emp_no as Manager,
Salaries.Salary
FROM Employees
LEFT JOIN dept_emp ON dept_emp.emp_no= Employees.emp_no
LEFT JOIN dept_manager ON dept_manager.dept_no = dept_emp.dept_no
JOIN Salaries ON Employees.emp_no = Salaries.emp_no
LEFT JOIN department ON department.dept_no=dept_emp.dept_no
LEFT JOIN titles ON titles.title_id= Employees.emp_title_id

