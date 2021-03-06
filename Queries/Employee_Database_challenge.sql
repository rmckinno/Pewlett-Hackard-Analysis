--Deliverable 1
-- Create table of retirees with titles
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Order By to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Create a table with number of employess retiring per title
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

-- Deliverable 2
--Mentoship Eligibility TABLE
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- Additinal queries for analysis 

-- Join unique_titles with departments and dept_emp
SELECT u.emp_no, u.first_name, u.last_name, u.title, d.dept_name, de.to_date
into unique_dept
FROM unique_titles as u
Left JOIN dept_emp as de
ON u.emp_no = de.emp_no
INNER JOIN  departments as d
ON de.dept_no = d.dept_no
-- Filter for current employees only
where de.to_date = ('9999-01-01');

-- Create table for emp by dept and title
SELECT dept_name as Department, title, count(*)
INTO perDeptperTitle
FROM unique_dept
GROUP BY dept_name, title
ORDER BY dept_name, title;

-- Count of employess per dept
SELECT COUNT(emp_no) as cnt, dept_name 
FROM unique_dept 
GROUP BY dept_name 
ORDER BY cnt DESC;