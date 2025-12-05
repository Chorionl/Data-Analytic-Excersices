
--Note: analyze data using subqueries


-- 1. Find employees whose first name is 'Alice'

select * from employees
where first_name in
(select first_name  from employees
where first_name = 'alice' )

-- 2. First and last name of the most recently hired employee(s)

select first_name , last_name from employees
where hire_date=(
select max(hire_date) from employees)

-- 3. Employee(s) with the highest salary

select * from employees
where salary =
(select max(salary) from employees)

-- 4. Employee(s) with the lowest salary

select * from employees
where salary =
(select min(salary) from employees)

-- 5. Total salary for employees in the IT department

select sum(salary) from employees
where department_id = 
(select department_id from departments
where department_name = 'IT')

-- Employees earning above the average salary
select * from employees
where salary > (
select avg(salary) from employees)
order by salary desc

--Count employees working in the Finance department

select count(*) from employees
where department_id = (
select department_id from departments
where department_name = 'finance')


-- First name, last name, and the maximum salary in the employees table

select first_name , 
last_name , 
(select max(salary) from employees) 
from employees


-- Most recently hired employee in each department
select * from employees m 
where hire_date = (
select  max(hire_date)  from employees e 
where e.department_id = m.department_id
)

-- Find the lowest salary among employees
select * from employees
where salary = (
select min(salary) from employees)

-- Find the most recently hired employee

select * from employees 
where hire_date = (
select max(hire_date) from employees )

--Count the number of employees working in HR
select count(*) from employees
Where department_id = (
select department_id from departments
where department_name = 'hr' )

-- Count employees not in Finance and whose name starts with 'A'
select count(*) from employees
where department_id in (
select department_id from departments
where department_name <> 'finance') 
and first_name  like 'A%'





--NOTE : Correlated subqueries




/* 1. Employees whose salary is above the average salary of their department */
select * from employees e
where salary >
(select avg(salary)from employees d
where d.department_id=e.department_id)
order by salary

/* 2. Employees who earn more than the lowest salary in their department */
select * from employees e
where salary > (
select min(salary) from employees d
where d.department_id=e.department_id)
order by salary

/* 3. Employees whose salary equals the highest salary in their department */
select * from employees e 
where salary = (
select max(salary) from employees d
where d.department_id = e.department_id)


/* 4. Employees whose hire date is the earliest in their department */
select * from employees e
where hire_date = 
(select min(hire_date) from employees d
where d.department_id= e.department_id)

/* 5. Employees whose salary is below the average salary in their department */

select * from employees e 
where salary < ( 
select avg(salary) from employees d 
where d.department_id=e.department_id)
order by salary desc

/* 6. Employees whose salary is above the salary of at least one coworker */

select * from employees               
where salary > (
select min(salary) from employees )

/* 7. Employees who earn equal to the minimum salary in their department */
select * from employees e      
where salary = (
select min(salary) from employees d 
where d.department_id = e.department_id)

/* 8. Employees who earn more than the average salary of all employees hired in the same year */
select * from employees e 
where salary > 
( select avg(salary) from employees d
where year(d.hire_date) = year(e.hire_date)) 


/* 9. Employees whose last name is alphabetically the first in their department */
select * from employees e 
where last_name IN ( 
select  last_name  from employees d
where d.department_id=e.department_id)
order by last_name



/* 10. Employees whose salary is in the top 1 of their department */ --max

select * from employees e
where salary =(
select max(salary) from employees d
where d.department_id=e.department_id)
order by department_id

/* 11. Employees hired after all other employees in their department */
select * from employees e
where hire_date = (
select max(hire_date ) from employees d
where d.department_id = e.department_id )
order by department_id

/* 12. Employees whose first_name length is longer than the average first_name length in their departments */
select * from employees e
where len(first_name) > (
select avg(len(first_name)) from employees d
where d.department_id = e.department_id)


/* 13. Employees who earn more than the highest salary in all other departments except their departments */

select * from employees e
where e.salary > (
select MAX(salary)
from employees
where department_id <> e.department_id)


/* 14. First name, last name, and department average salary for each employee */
    
    select first_name , 
    last_name ,
    (select avg(salary) from employees e where d.department_id = e.department_id ) as avg_sal
    from employees d
    