SELECT * FROM departments;
SELECT * FROM dept_emp LIMIT 25;
SELECT * FROM dept_mgr LIMIT 25;
SELECT * FROM employees LIMIT 25;
SELECT * FROM salaries LIMIT 25;
SELECT * FROM titles  LIMIT 25;


-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
  employees.emp_no,
  employees.last_name,
  employees.first_name,
  employees.gender,
  salaries.salary
FROM employees
INNER JOIN salaries 
ON employees.emp_no = salaries.emp_no;


-- 2. List employees who were hired in 1986.
SELECT hire_date, last_name, first_name, emp_no
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
ORDER by hire_date ASC, last_name ASC, first_name ASC;


-- 3. List manager of each department with: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT 
  mgr.dept_no,
  d.dept_name,
  e.emp_no,
  e.last_name,
  e.first_name,
  e.hire_date, -- not sure which 'start' employment date we're looking for?? hire?
  mgr.from_date, -- ^^^ or start date as a manager?
  mgr.to_date
FROM employees e
INNER JOIN dept_mgr mgr 
ON e.emp_no = mgr.emp_no
INNER JOIN departments d 
ON mgr.dept_no = d.dept_no
ORDER BY dept_no ASC, last_name ASC, first_name ASC;


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
e.emp_no, 
e.last_name, 
e.first_name,
d.dept_name
FROM employees e
INNER JOIN dept_emp demp 
ON e.emp_no = demp.emp_no
INNER JOIN departments d 
ON demp.dept_no = d.dept_no
ORDER BY dept_name ASC, last_name ASC, first_name ASC;


-- 5. List all employees whose first name is 'Hercules' and last names begin with 'B'.
SELECT
last_name,
first_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name 
LIKE 'B%'
ORDER BY last_name ASC;


-- 6. List all employees in Sales, including their employee number, last name, first name, and department name.
SELECT
e.emp_no,
e.last_name, 
e.first_name, 
d.dept_name
FROM employees e
INNER JOIN dept_emp demp 
ON e.emp_no = demp.emp_no
INNER JOIN departments d 
ON demp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY last_name ASC, first_name ASC;


-- 7. List all employees in Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
e.emp_no,
e.last_name, 
e.first_name, 
d.dept_name
FROM employees e
INNER JOIN dept_emp demp 
ON e.emp_no = demp.emp_no
INNER JOIN departments d 
ON demp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'
ORDER BY dept_name ASC, last_name ASC, first_name ASC;


-- 8. In descending order, list the frequency count of employee last names.
SELECT last_name, COUNT(last_name) AS "Surname Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Surname Frequency" DESC;




-- EPILOGUE - Search your ID number...
SELECT
e.emp_no,
e.first_name, 
e.last_name, 
d.dept_name,
t.title,
s.salary
FROM employees e
INNER JOIN dept_emp demp 
ON e.emp_no = demp.emp_no
INNER JOIN departments d 
ON demp.dept_no = d.dept_no
INNER JOIN titles t
ON e.emp_no = t.emp_no
INNER JOIN salaries s
ON e.emp_no = s.emp_no
WHERE e.emp_no = '499942';
