
-- Create tables for PH-EmployeeDB
CREATE TABLE departments (
	dept_no varchar(4) NOT NULL,
	dept_name varchar(40) NOT NULL,
	primary key (dept_no),
	unique (dept_name)
);
CREATE TABLE employees (
	emp_no int NOT NULL,
	birth_date date NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	gender varchar NOT NULL,
	hire_date date NOT NULL,
	primary key (emp_no)
);
CREATE TABLE dept_managers (
	dept_no VARCHAR (4) NOT NULL,
	emp_no int NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
foreign key (emp_no) references employees (emp_no),
foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
);

create table salaries (
	emp_no int NOT NULL,
	salary int NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	foreign key (emp_no) references employees (emp_no),
	primary key (emp_no)
);

create table titles (
	emp_no int NOT NULL,
	title varchar NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	foreign key (emp_no) references employees (emp_no),
	
);
create table dept_emp(
	emp_no int NOT NULL,
	dept_no varchar NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
	);

