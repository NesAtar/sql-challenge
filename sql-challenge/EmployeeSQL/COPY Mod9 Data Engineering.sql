-- MODULE 9, DATA ENGINEERING --
-- Create a table schema for each of the six CSV files.
-- Import each CSV file into its corresponding SQL table.

CREATE TABLE titles (
title_id VARCHAR PRIMARY KEY,
title VARCHAR (255) NOT NULL
);

CREATE TABLE salaries (
emp_no INT PRIMARY KEY,
salary INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE departments (
dept_no VARCHAR PRIMARY KEY,
dept_name VARCHAR(255) NOT NULL,	
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_emp (
emp_no INT,
dept_no VARCHAR(255) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)	
);

CREATE TABLE dept_manager (
dept_no VARCHAR (255) NOT NULL,
emp_no INT,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
);

CREATE TABLE employees (
emp_no INT PRIMARY KEY,
emp_title_id VARCHAR (255) NOT NULL REFERENCES titles (title_id),
birth_date DATE NOT NULL,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
sex VARCHAR(255) NOT NULL,
hire_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES salaries(dept_no)
);
-- Output for each table
SELECT * FROM titles
SELECT * FROM salaries
SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees

