-- get birth date of employees between 1952 and 1955
select first_name, last_name 
FROM employees
where birth_date BETWEEN '1952-01-01' and '1955-12-31';

-- employees born in 1951 
select first_name, last_name
from employees
where birth_date between '1951-01-01' and '1951-12-31';

-- employees born in 1954
select first_name, last_name
from employees
where birth_date between '1954-01-01' and '1954-12-31';

-- employees born in 1955
select first_name, last_name
from employees
where birth_date between '1955-01-01' and '1955-12-31';

-- employees born between 1952 and 1955 and hired between 1985 and 1988
select first_name, last_name 
FROM employees
where (birth_date BETWEEN '1952-01-01' and '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' and '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring and save to table
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

select * from retirement_info

-- Create new table for retiring employees with emp_no column
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- joining department and dept_manager tables
SELECT d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- joining retirement_info and dept_emp tables
select ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.dept_no
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no; 

-- joining retirement info and dept_emp tables
select ri.emp_no,
	ri.first_name,
	ri.last_name,
de.to_date
	-- create new table to hold joint tables
INTO current_emp

FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999/01/01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- joining employees and salaries
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.gender,
	s.salary
FROM employees as e
LEFT JOIN salaries as s
ON e.emp_no = s.emp_no;

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

-- retiring sales employees
select ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
-- INTO sales_retire
FROM current_emp AS ce
INNER JOIN dept_emp AS de
	ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
	ON (de.dept_no = d.dept_no)
	WHERE d.dept_no = ('d007');

--  retiring sales and developent employees
select ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
-- INTO sales_dev_retire
FROM current_emp AS ce
INNER JOIN dept_emp AS de
	ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
	ON (de.dept_no = d.dept_no)
	WHERE d.dept_no IN ('d007', 'd005');
