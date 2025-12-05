--Notes: Aggregation Queries


-- Count how many employees were hired in 2023

select  count(hire_date) from employees
where hire_date >= '2023-01-01' and hire_date <= '2023-12-31'

--Department of the highest-paid employee
select top 1 department_name  from employees e
join departments d on d.department_id = e.department_id
order by salary desc

-- Apply 5% salary increase for department 2

update employees
set salary = (salary * 0.05) + salary
where department_id = 2 


--Employees hired in 2023
select * from employees
where year(hire_date) = 2023



--Average salary per department

select department_id , avg(salary) from employees
group by department_id

--Employee count per department
select count(*) as total_emp , department_id from employees
Group by department_id

--Employee count for departments 3 and 4
select count(*) as total_emp , department_id from employees
where department_id in (3,4)
Group by department_id


-- 19. Find employees hired in the same month and group them by month (use MONTH function and GROUP BY).
--(Monthly employee hiring count)

SELECT 
    MONTH(hire_date) AS HireMonth,
    COUNT(*) AS EmployeesHired
FROM Employees
GROUP BY MONTH(hire_date)
ORDER BY HireMonth

-- 16. Show the total number of departments and total number of employees in a single query (use aggregation).
SELECT 
    (SELECT COUNT(*) FROM Departments) AS TotalDepartments,  -- +null values
    (SELECT COUNT(*) FROM Employees) AS TotalEmployees;

    -- same result
    SELECT 
    COUNT(DISTINCT d.department_id) AS TotalDepartments,
    COUNT(e.employee_id) AS TotalEmployees
FROM Departments d
inner JOIN Employees e 
    ON d.department_id = e.department_id

    -- Exercise 1: Count the total number of employees
select count(*) as total_empl from employees

-- Exercise 2: Count the number of projects in the projects table
select count(*) as total_pro from projects

-- Exercise 3: Find the total salary paid to employees
select sum(salary) as total_salary from employees

-- Exercise 4: Find the average salary of employees
select avg(salary) as average_salary from employees

-- Exercise 5: Find the total number of employees in a specific department 

-- count how many employees per department
-- count how many employee where hired per year
-- show me which departments spend it total salaries above 200.000

--1)Total employees per department

select department_name , count(*) as empl_total from employees e
join departments d on d.department_id = e.department_id
group by department_name

--2)Employees hired per year

select year(hire_date) as 'year'  , count(*) as total_empl from employees
group by year(hire_date) 

--3)Departments with total salary above 200,000

select department_name , sum(salary) as total_sal from employees e
join departments d on d.department_id = e.department_id
group by department_name
having sum(salary) > 200000
