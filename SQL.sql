
---1.	List the following details of each employee: employee number, last name, first name, sex, and salary.
Select count(*) FROM Employees;
Select count(*) FROM Salaries;

SELECT 
  T1.emp_no,
  T1.first_name,
  T1.last_name,
  T1.sex,
  T2.salary
FROM employees as T1
INNER JOIN salaries as T2
ON  T1.emp_no = T2.emp_no;

---2.	List first name, last name, and hire date for employees who were hired in 1986."
SELECT 
 first_name,
 last_name,
 hire_date
FROM employees U
WHERE hire_date LIKE '%1986';

---3.List the manager of each department with the following information: 
---department number, department name, the manager's employee number, last name, first name.
SELECT 
  T1.dept_no,
  T1.emp_no,
  T2.first_name,
  T2.last_name,
  T3.dept_name
FROM dept_manager as T1
INNER JOIN Employees as T2
ON  T1.emp_no = T2.emp_no
INNER JOIN department AS T3 
ON T1.dept_no = T3.dept_no

--4.List the department of each employee with the following information:
--employee number, last name, first name, and department name.
CREATE VIEW employee_dept_info AS
SELECT 
 T1.emp_no,
 T1.first_name,
 T1.last_name,
 T3.dept_name
FROM Employees as T1
INNER JOIN dept_emp as T2
ON T1.emp_no=T2.emp_no
INNER JOIN department AS T3 
ON T2.dept_no = T3.dept_no

--5.List first name, last name, and sex for employees whose first name is ""Hercules"" and last names begin with ""B."""									
SELECT
first_name,
last_name,
sex
FROM Employees
WHERE first_name= 'Hercules' and last_name LIKE 'B%'

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name."
SELECT *
FROM employee_dept_info
WHERE dept_name = 'Sales'

--7.List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT *
FROM employee_dept_info
WHERE dept_name = 'Sales' or dept_name = 'Development'

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(emp_no) AS "Total last names"
FROM Employees
GROUP BY last_name
ORDER BY "Total last names" DESC;
