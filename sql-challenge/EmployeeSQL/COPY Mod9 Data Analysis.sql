-- MODULE 9, DATA ANALYSIS
-- 1.List the employee Number, last, first, Sex, Salary

SELECT employees.emp_no,
     employees.last_name,
     employees.first_name,
     employees.sex,
     salaries.salary
FROM employees
INNER JOIN salaries 
ON employees.emp_no = salaries.emp_no;

-- 2.List the first name, last name, and hire date for employees 
--   hired in 1986

SELECT first_name,
     	last_name,
     	hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986;
 
 
-- 3.List the manager of each department, dept #, dept name, 
--   employee #, last name, first name

SELECT dept_manager.dept_no,
     departments.dept_name,
     dept_manager.emp_no,
     employees.first_name,
     employees.last_name
FROM dept_manager
LEFT JOIN departments 
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_manager.emp_no = employees.emp_no
ORDER BY emp_no;

-- 4.List the department # for each employee, employee #, last name, 
--    first name and department name

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	dept_emp.dept_no,
	departments.dept_name
FROM employees 
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no

-- 5.List the first name, last name and sex of employees whos name 
-- is Hercules and last name begins with letter B

SELECT first_name,
       last_name,
       sex
FROM employees
WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';

-- 6.List each employee in the Sales department along with their 
--   empolyee #, last name and first name

SELECT employees.emp_no, 
	   employees.last_name, 
	   employees.first_name,
	   dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales';
   
-- 7.List each employee in the Sales and Development departments, 
--   including their employee #, last name, first name and 
--   department name

SELECT employees.emp_no,
       employees.first_name,
	   employees.last_name,
       departments.dept_name
FROM employees
LEFT JOIN dept_emp 
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name 
IN ('Sales', 'Development');

-- 8.List the frequency counts, in descending order, of all the 
--   employee last names.how many employees share each last name. 

SELECT last_name,
     count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;
   
