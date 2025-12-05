
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

select * from employees               --den vgazei null dep id
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


select * FROM employees e
WHERE e.salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id <> e.department_id)


    -- to first name last name kai avg salary toy tmimatos tou kathenos
    
    select first_name , 
    last_name ,
    (select avg(salary) from employees e where d.department_id = e.department_id ) as avg_sal
    from employees d
    

