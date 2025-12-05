--Notes: Simple SQL Queries

--Select all employees

select * from employees

--Select all employees’ first and last names

select first_name , last_name from employees

-- Select all department name

select department_name from departments

-- Select all project name

select project_name ,start_date from projects 

-- Employees with salary greater than or equal to 50,000

select * from employees
where salary >= 50000

-- Employees hired on or after January 1,2020
select * from employees
where hire_date >= '2020-01-01'

-- Projects starting on or after January 1, 2022

select * from projects
where start_date>= ' 2022-01-01'

-- Departments with ID greater than or equal to 2

select department_name from departments
where department_id >=2 

-- Employees with salary between 40,000 and 60,000

select * from employees
where salary between 40000 and 60000

--Employees whose first name starts with ‘A’

select * FROM employees
where first_name like 'A%'

--Employees with salary above 70,000 and hired on or after January 1, 2023

select * from employees
where salary>70000
and hire_date >= '2023-01-01'

--Employees whose first name is Jack, John, or Alice

select * from employees
where first_name in ('Jack','John','Alice') 

--Employees whose first name isn't Jack, John, or Alice
select * from employees
where first_name not in ('Jack','John','Alice')

--Employees whose first name isn't John

select * from employees
where first_name <> 'john' 