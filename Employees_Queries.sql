-- 1. Join salary data with employee data
select employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary 
from employees 
right join salaries 
on employees.emp_no = salaries.emp_no
order by salary; 

-- 2. List names and hire dates for employees hired in 1986.
select emp_no, first_name, last_name, hire_date
from employees
where date_part ('year', hire_date) = 1986
order by hire_date;

-- 3. List the manager of each dept. with dept_no, dept_name, emp_no, first_name, last_name
select employees.emp_no, employees.first_name, employees.last_name, dept_manager.dept_no, departments.dept_name
from employees
right join dept_manager
on employees.emp_no = dept_manager.emp_no
right join departments
on dept_manager.dept_no = departments.dept_no
order by dept_no;

-- 4. List department of each employee with emp_no, last_name. first_name, dept_name
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees 
right join dept_emp
on employees.emp_no = dept_emp.emp_no 
right join departments
on dept_emp.dept_no = departments.dept_no
order by dept_name;

-- 5. List first_name, last_name, sex for all employees with name Hercules and last name beginning with "B".
select employees.first_name, employees.last_name, employees.sex
from employees 
where first_name = 'Hercules' and last_name like 'B%';

-- 6. List employees in Sales and include emp_no, last_name, first_name, dept_name
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees
right join dept_emp
on employees.emp_no = dept_emp.emp_no
right join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'
order by emp_no;

-- 7. List all employees in sales and development departments include emp_no, last_name, first_name, dept_name
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees
right join dept_emp
on employees.emp_no = dept_emp.emp_no
right join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development'
order by emp_no;

-- 8. In descending order, list frequency count of employee last_name (ie how many share last names.)
select employees.last_name, count(employees.last_name)
from employees
group by last_name
order by count(last_name) desc;

