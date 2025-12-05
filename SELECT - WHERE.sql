select * from employees

--ex2
select first_name , last_name from employees
--ex3
select department_name from departments
--ex4
select project_name ,start_date from projects 
--ex5
select * from employees
where salary >= 50000
--ex6
select * from employees
where hire_date >= '2020-01-01'
--ex7
select * from projects
where start_date>= ' 2022-01-01'
--ex8
select department_name from departments
where department_id >=2 

SELECT * FROM employees
WHERE salary BETWEEN 40000 AND 60000


SELECT * FROM employees
where first_name like 'A%'

select * from employees
where salary>70000
and hire_date >= '2023-01-01'

select * from employees
where first_name in ('Jack','John','Alice') -- thelw in jack,john,alice 

select * from employees
where first_name not in ('Jack','John','Alice')--kai den thelw not in

select * from employees
where first_name <> 'john' --ola ektos john