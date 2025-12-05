 --NOTE: JOIN Queries
 
-- 1. Write a query to list all employees in the 'IT' department, ordered by salary in descending order.

select * from employees 
inner join departments
on  departments.department_id= employees.department_id
where department_name = 'IT'
order by salary desc

-- 2. Write a query to display employees hired in the year 2023 along with their department names.

select * from employees
inner join departments
on  departments.department_id= employees.department_id
where hire_date >= '2023-01-01' and hire_date <= '2023-12-31'

-- 3. Write a query to find all employees whose salary is between 70,000 and 80,000, including their department names.

select * from employees
inner join departments
on  departments.department_id= employees.department_id
where salary between 70000 and 80000

-- 4. Write a query to list employees whose last name starts with 'W', along with their department name.

select * from employees
inner join departments
on  departments.department_id= employees.department_id
where last_name LIKE 'W%'

-- 5. Write a query to show all employees who do not belong to any department, ordered by employee_id.

select * from employees
left join departments
on  departments.department_id= employees.department_id
where department_name is null
order by employee_id

-- 6. Write a query to list each department and the total number of employees in it, sorted by the count in descending order.

select department_name , count(*) AS total_num_empl from departments
inner join employees
on  departments.department_id= employees.department_id
 group by department_name
 order by total_num_empl desc

-- 7. Write a query to show employees from departments where the department name is NOT NULL, ordered alphabetically by department and then employee last name.

select * from employees
inner join departments
on  departments.department_id= employees.department_id
where department_name is not null
order by department_name  , last_name 

-- 8. Write a query to display employees hired between '2021-01-01' and '2022-12-31', including salary and department name.

select * from employees
inner join departments
on  departments.department_id= employees.department_id
where hire_date between '2021-01-01' and '2022-12-31' 

-- 9. Write a query to list the top 5 highest-paid employees, including their department names.

select top 5 * from employees
inner join departments
on  departments.department_id= employees.department_id
order by salary desc

-- 10. Write a query to show all departments that have more than 3 employees.

select department_name, count(employee_id) as total_empl from departments
inner join employees
on  departments.department_id= employees.department_id
group by department_name
having count(employee_id) > 3
order by total_empl

-- 11. Employees with their departments (LEFT JOIN)

select * from employees
left join departments
on employees.department_id = departments.department_id

--12.Employees without a department (LEFT JOIN with NULL filter)

select * from employees
left join departments
on employees.department_id = departments.department_id
where department_name is null

--13. Employees in HR or with last names containing ‘s’ (INNER JOIN)

select * from employees
inner join departments
on employees.department_id= departments.department_id
where department_name = 'HR' OR last_name like '%s%'


--14. Employees and the projects in their department

select * from employees
select first_name,last_name,project_name from employees
inner join projects
on employees.department_id=projects.department_id

-- 15.Employees in IT with their projects and department details (INNER JOIN)

select first_name , last_name , project_name , department_name from employees
inner join projects
on employees.department_id=projects.department_id
inner join departments
on employees.department_id=departments.department_id
where department_name = 'it'

--16. Employees in department 1 hired during 2022 (INNER JOIN)

select * from employees
inner join departments
on employees.department_id=departments.department_id
where employees.department_id = 1 and (hire_date >= '2022-01-01' and hire_date <= '2022-12-31')

--17.Count of employees working in IT or HR (INNER JOIN)

select count(*) from employees
inner join departments
on employees.department_id=departments.department_id
where department_name in ('it','hr')
 
 --End excercise 1



 --1. List all employees with their department names using an INNER JOIN.

select employee_id,first_name,last_name,department_name from employees
inner join departments
on employees.department_id=departments.department_id

-- 2. Show all employees, even if they don’t have a department (use LEFT JOIN).

select employee_id,first_name,last_name,department_name  from employees
left join departments
on employees.department_id=departments.department_id

-- 3. Show all departments, even if they currently have no employees (use RIGHT JOIN).

select department_name,first_name,last_name,employee_id from departments
right join employees
on departments.department_id=employees.department_id

-- 4. List all possible combinations of Employees and Departments (use CROSS JOIN).

select * from employees                
cross join departments

-- 5. Count how many employees are in each department.

select department_name , count(*) from departments
inner join employees
on employees.department_id=departments.department_id
group by department_name

-- 6. Find departments that have more than 1 employee.

select department_name , count(employee_id) from employees
inner join departments
on employees.department_id=departments.department_id
group by department_name
having count(employee_id) > 1

-- 7. Display the department with the most employees.

select top 1 department_name , count(employee_id) from employees
inner join departments
on employees.department_id = departments.department_id
group by department_name 
order by count(employee_id) desc 


-- 8. Find employees hired after May 2022 with their department names.

select department_name ,first_name,last_name , hire_date from employees
left join departments
on employees.department_id=departments.department_id
where hire_date >= '2022-05-01'                                            
order by hire_date

-- 9. Show each employee’s full name along with their department name, sorted by HireDate.

select first_name , last_name , department_name , hire_date from employees
left join departments
on departments.department_id=employees.department_id
order by hire_date

-- 10. List departments that have exactly 2 employees.

select department_name , count(employee_id) from departments
inner join employees
on employees.department_id=departments.department_id
group by department_name
having count(employee_id) = 2

-- 11. Find the earliest hire date of employees in each department.

select department_name , min(hire_date) from employees
inner join departments
on employees.department_id = departments.department_id
group by department_name
order by min(hire_date)

-- 12. Find the latest hire date of employees in each department.

select department_name , max(hire_date) from departments
join employees
on employees.department_id = departments.department_id
group by department_name
order by max(hire_date)

-- 13. Count total employees and display only those departments with at least 3 employees.

select count(employee_id) , department_name from employees
inner join departments
on employees.department_id= departments.department_id 
group by department_name
having count(employee_id) >=3


-- 14. Show employees who belong to IT or HR departments.

select first_name , last_name , department_name  from employees
inner join departments
on employees.department_id=departments.department_id
where department_name = 'IT' OR department_name = 'HR' 

-- 15. Display employees and departments, but include departments without employees (use FULL JOIN).

select first_name,last_name , department_name from employees
full join departments
on departments.department_id = employees.department_id

-- 17. Find employees whose department name contains the letter ‘a’ (case-insensitive).

select * from employees
inner join departments
on employees.department_id = departments.department_id
where department_name like '%a%'

-- 18. List the number of employees per department and order the result by EmployeeCount descending.

select count(*) as employeecount ,department_name from employees
join departments
on departments.department_id=employees.department_id
group by department_name
order by employeecount desc



--19. Maximum salary per department

select department_name , max(salary) as max_sal from employees e
join departments d on d.department_id=e.department_id
group by department_name
order by max(salary) desc

--20. Minimum salary per department 

select department_name , min(salary) as min_sal from employees e
join departments d on d.department_id=e.department_id
group by department_name 
order by min(salary)


--21. Total salary cost for departments with ID >= 2

select department_name , sum(salary) as sum_sal  from employees e
join departments d on d.department_id= e.department_id
where d.department_id >= 2
group by department_name


--22. Departments having more than 5 employees 

select department_name , count(employee_id) from employees e
join departments d on d.department_id=e.department_id
group by department_name
having count(employee_id) > 5

--23. Count projects for departments except department 4 

select department_name , count(*) from departments d
join projects p on p.department_id= d.department_id
where d.department_id <> 4
group by department_name

-- 24. Total number of IT projects (department_id = 3)
 
 select count(*) from projects
 where department_id =3

-- 25. Projects per start year, only years with more than 2 projects

select count(*) as proj_c , year(start_date) as 'year' from projects
group by year(start_date) 
having count(*) > 2


--26.Find the total salary of employees in the Marketing department.

select sum(salary) as sum_marketing from employees e
join departments d on d.department_id= e.department_id
where department_name = 'marketing'
