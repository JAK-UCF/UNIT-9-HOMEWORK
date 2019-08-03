DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments;

DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_mgr;

DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;



CREATE TABLE employees 
(
  emp_no INT NOT NULL,
  birth_date DATE DEFAULT now() NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  gender VARCHAR(10) NOT NULL,
  hire_date DATE NOT NULL, 
  PRIMARY KEY (emp_no)
);


CREATE TABLE departments 
(
  dept_no VARCHAR(5) NOT NULL,
  dept_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (dept_no)
);


CREATE TABLE dept_emp 
(
  emp_no INT NOT NULL,
  dept_no VARCHAR(5) NOT NULL,
  from_date DATE NOT NULL, 
  to_date DATE NOT NULL, 
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_mgr 
(
  dept_no VARCHAR(5) NOT NULL,
  emp_no INT NOT NULL,
  from_date DATE NOT NULL, 
  to_date DATE NOT NULL, 
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries 
(
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL, 
  to_date DATE NOT NULL, 
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles 
(
  emp_no INT NOT NULL,
  title VARCHAR(50) NOT NULL,
  from_date DATE NOT NULL, 
  to_date DATE NOT NULL, 
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);