-- 1. Create departments table and import data
create table departments(
	dept_no varchar primary key,
	dept_name varchar
);

select * from departments

--2. Create titles table and import data
create table titles(
	title_id varchar primary key,
	titles varchar
);

select * from titles

-- 3. Create employees table and import data
create table employees (
	emp_no int,
	emp_title_id varchar,
	birth_date varchar,
	first_name varchar,
	last_name varchar,
	sex char(1),
	hire_date varchar,
	primary key (emp_no),
	foreign key (emp_title_id) references titles(title_id));
	
select * from employees

alter table employees 
alter column hire_date type date
using hire_date::date;

-- 4. Create dept_manager table and import data
create table dept_manager(
	dept_no varchar,
	emp_no int,
	foreign key (dept_no) references departments(dept_no),
	primary key (emp_no, dept_no));
	
select * from dept_manager

--5. Create dept_emp table and import data
create table dept_emp(
	emp_no int,
	dept_no varchar,
	foreign key (dept_no) references departments(dept_no),
	primary key (emp_no, dept_no)); 
	
select * from dept_emp
	
--6. Create salaries table and import data
create table salaries(
	emp_no int,
	salary int,
	foreign key (emp_no) references employees(emp_no),
	primary key (emp_no)); 
	
select * from salaries
