--NOTES: EXCERCISES

 --1.List all employees along with their department names using an INNER JOIN.

 Select employee_id,first_name,last_name , department_name from employees e
 inner join departments d on d.department_id=e.department_id

-- 2. Show all employees and their department names, including employees who have no department assigned (LEFT JOIN).
select employee_id,first_name ,last_name ,department_name from employees e
left join departments d on d.department_id=e.department_id
-- 3. List all projects along with the department_name of the department managing each project.

select project_id,project_name , department_name from projects p
inner join departments d on d.department_id=p.department_id

-- 4. Find the total number of employees in each department and display department_name with the count.

select count(*),department_name from employees e
inner join departments d on d.department_id=e.department_id
group by department_name

-- 5. Show the average salary per department, sorted by highest average salary.
select avg(salary) , department_name from employees e
inner join departments d on d.department_id=e.department_id
group by department_name
order by avg(salary) desc

-- 6. Display all departments where the number of employees exceeds 10.

select department_name , count(*) as num_employees from employees e
inner join departments d on d.department_id=e.department_id
group by department_name
having count(*) > 10

-- 7. List all departments and the total salary paid to employees in each department.

select department_name , sum(salary) from employees e
inner join departments d on d.department_id= e.department_id
group by department_name
order by sum(salary) desc

-- 8. Find all employees who belong to a department that has more than 3 active projects.

select first_name,last_name,count(project_id) as projects ,p.department_id from employees e
join projects p on p.department_id=e.department_id 
group by p.department_id,first_name,last_name
having count(project_id) > 3

-- 9. Show each project and the highest-paid employee in that project’s department. --note prota ton highest paid tou kathe tmimatos , kai meta na vro oi highest paid se poia tmimata douleuoun

select project_name , max(salary) , employee_id , first_name , last_name  from employees e
join projects p on p.department_id=e.department_id
group by project_name , employee_id,first_name , last_name








-- 1. For each department, list the department name, number of employees,
--    number of projects, and the average project duration.
--    Include departments even if they have no employees or no projects.

/* select department_name ,
count(employee_id)  as NumOfEmp,
count(project_id)  as Num_Proj,
avg(datediff(day,start_date,end_date))  as avg_duration
from employees e
inner join departments d on d.department_id=e.employee_id
inner join projects p on p.department_id=d.department_id 
group by department_name */

select department_name , count(project_id) as Num_Proj ,count(employee_id)as NumOfEmp,avg(datediff(day,start_date,end_date))  as avg_duration from departments d 
left join projects p on p.department_id=d.department_id
left join employees e on e.department_id=d.department_id
group by department_name

-- 2. List employees whose salary is above the average salary of their own department,
--    using a JOIN with a grouped subquery.

Select * from employees e
join ( select department_id ,avg(salary) as avg_salary from employees group by department_id) d
on e.department_id = d.department_id
where salary > avg_salary
/*select * from employees d
where salary > (
select avg(salary) from employees e
where e.department_id=d.department_id)*/

-- 3. Show the top 3 departments with the highest total salary expenditure,
--    but only include departments that manage at least 2 projects.

select top 3 department_name , sum(salary) as total_salary from employees e
join departments d on d.department_id=e.department_id
join projects p on p.department_id=d.department_id
group by department_name
having count(project_id) >=2
order by sum(salary) desc



-- 5. List all employees who are in departments that have at least one project
--    ending in the year 2024, using JOINs and GROUP BY with HAVING.

select year(end_date),e.department_id,employee_id from employees e
join projects p on e.department_id = p.department_id
group by e.department_id,employee_id,year(end_date) 
having year(end_date) = 2024 
order by employee_id 

-- 6. For each project, show the project name and the total salary of all employees
--    in the project’s department; exclude projects whose department has no employees.

select project_name , sum(salary) as total_salary  from employees e
 join projects p on p.department_id=e.department_id
group by  project_name

-- 7. Find departments where the oldest hire date among employees is later
--    than the earliest start date of any of their projects.
select e.department_id , first_name , last_name from employees e
join departments d on d.department_id=e.department_id
join projects p on p.department_id=e.department_id
group by e.department_id, first_name , last_name
having min(hire_date) < min(start_date)

-- 8. List employees who belong to departments whose total number of projects
--    is greater than the number of projects handled by the IT department.
SELECT *                  --nooooo---------------
FROM employees e
WHERE (
    -- projects ôïõ department ôïõ employee
    SELECT COUNT(*)
    FROM projects p
    WHERE p.department_id = e.department_id
) > (
    -- projects ôïõ IT department
    SELECT COUNT(*)
    FROM projects p
    JOIN departments d 
        ON d.department_id = p.department_id
    WHERE d.department_name = 'IT'
);

-- VRES tmimata  se posa project p douleua

select * from employees e
inner join (
select department_name , count(*) as total_num, d.department_id from projects p
join departments d on d.department_id=p.department_id
group by department_name , d.department_id
having count(*) > (select count(*) from projects p
join departments d on d.department_id=p.department_id
where department_name = 'IT'
)
) d
on d.department_id = e.department_id


--vres posa project douleuei to depart IT 
select count(*) from projects p
join departments d on d.department_id=p.department_id
where department_name = 'IT'




-- 9. Show all departments whose average employee salary is higher than the
--    average salary across the entire company, using a subquery with aggregate functions.
SELECT 
    department_id,
    AVG(salary) AS avg_dept_salary
FROM employees e 
GROUP BY department_id
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM employees )



