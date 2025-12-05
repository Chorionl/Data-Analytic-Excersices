
select * from employees

--create new column named salary status

ALTER TABLE employees ADD salary_status NVARCHAR(50)

-- create a conditional Flag Column based on salary

update employees 
set salary_status = 
case when salary>80000 then 'highest paid'
when salary between 65000 and 80000 then 'medium paid'
else 'low paid'end 

--fill null values the word '0'

update employees
set department_id = 0
where department_id is null

--move the employee Dylan Ward to the department id 3

update employees
set department_id = 3
where employee_id = 32