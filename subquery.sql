--Subquery   SCALAR

--osoi legontai alice 

select * from employees
where first_name in
(select first_name  from employees
where first_name = 'alice' )

--first name , last name , pou exei proslifthei pio prosfata

select first_name , last_name from employees
where hire_date=(
select max(hire_date) from employees)

--vres auton p pairnei ta pio polla lefta

select * from employees
where salary =
(select max(salary) from employees)

--vres ayton p pairnei ta ligotero
select * from employees
where salary =
(select min(salary) from employees)

--to athroisma ton misthon gia employees p doyleyon sto IT


select sum(salary) from employees
where department_id = 
(select department_id from departments
where department_name = 'IT')

-- osous amoivontai pano apo meso oro misthoy
select * from employees
where salary > 
(
select avg(salary) from employees)
order by salary desc

-- metrise empl p douleoun sto finance
select count(*) from employees
where department_id = (
select department_id from departments
where department_name = 'finance')


-- first name , last name , kai max timi mesa ston pinaka employees (ayto deixnei tin max timi enos alla to deixnei s olous)
select first_name , last_name , (select max(salary) from employees) from employees


-- ton employee poy exei erthei pio prosfata sto kathe tmima
select * from employees m 
where hire_date = (
select  max(hire_date)  from employees e 
where e.department_id = m.department_id
)

-- na vreis ta ligotera lefta stous employees (subquery)
select * from employees
where salary = (
select min(salary) from employees)

--fere auton p exei proslifthei pio prosfata

select * from employees 
where hire_date = (
select max(hire_date) from employees )

-- na metriseis posous doyleuoun sto hr
select count(*) from employees
Where department_id = (
select department_id from departments
where department_name = 'hr' )

--íá ìåôñhseis posoi den douleuoun sto finance kai ksekinaei to apo 'a' (AND)
select count(*) from employees
where department_id in (
select department_id from departments
where department_name <> 'finance') 
and first_name  like 'A%'