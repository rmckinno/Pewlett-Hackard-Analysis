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