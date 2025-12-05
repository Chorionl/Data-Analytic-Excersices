-- kainouria stili salary status ean <65000 low , medium 65-80 , high
select *,
case when salary < 65000 then 'low'
when salary between 65000 and 80000 then 'medium'
else 'high' end as salary_status
from employees

--bonus kai osoi douleuoub IT na paroun 10%, hr 5% , 3% oloi oi alloi

select * ,
case 
when department_name ='it' then salary *0.1
when department_name = 'hr' then salary *0.05
else salary * 0.03
end as bonus
from employees e 
join departments d on d.department_id = e.department_id

-- hire > 2022 new emp, old 

select * ,
case when hire_date >= '2022-01-01' then 'new_employee'
else 'old_employee' end as seniority
from employees

-- dhmiourgeis stili(mporeis na valeis oti sto where)
select first_name , last_name,
case when first_name like 'a%' then 'start with a'
else 'dont start with a' end start_name

from employees

select first_name , last_name ,
case when salary > 90000 then 'high'
when salary > 80000 and salary <=90000 then 'medium'
else 'low' end status
from employees
-- update(update..set...where)
update employees
set first_name = 'Jack'
where first_name = 'John'

/* 26. For each customer, show:
       'A–M' if their name starts with A–M,
       'N–Z' if their name starts with N–Z. */

select * ,
case when LEFT(customer_name,1) between 'a' and 'm' then 'a-m'
else 'n-z' end from customers



/* 27. Create a column that shows 'Old Customer' if signup_date < '2022-07-01',
       otherwise 'New Customer'. */
       select * ,
       case when signup_date < '2022-07-01' then 'old customer'
       else 'new customer' end from customers



/* 28. Show customers and use CASE WHEN to classify email provider:
       'Gmail' if email LIKE '%gmail%',
       'Yahoo' if email LIKE '%yahoo%',
       'Other Provider' otherwise. */

    select * ,
    case when  email LIKE '%gmail%' then 'gmail'
    when  email LIKE '%yahoo%' then 'yahoo'
    else 'other provider' end name_email from customers


/* 29. Create a discount label for sales:
       '10% Discount' if amount > 300,
       '5% Discount' if amount between 150–300,
       'No Discount' otherwise. */

       select * , 
       case when amount > 300 then amount*0.1
       when amount between 150 and 300 then amount*0.05
       else 0 end as discount_label from sales


/* 30. Classify customers as:
       'High Spender' if their total spending  > 1000,
       'Medium Spender' if between 500 and 1000 
       'low spender' otherwise */

select customer_name , sum(amount) as totalspending ,
case when sum(amount) >1000 then 'high spender'
when sum(amount) between 500 and 1000 then 'medium spender'
else 'low spender' end as spendcat
from sales s
inner join customers c on c.customer_id=s.customer_id
group by customer_name



/* 21. Show each customer and label them as 'Early Sign-Up' if signup_date < '2023-01-01', otherwise 'Recent Sign-Up'. */

select * ,
case when signup_date<'2023-01-01' then 'early sign-up'
else 'recent sign-up' end 
from customers


/* 22. Show each sale and classify it as 'High', 'Medium', or 'Low' based on amount:
       High > 400, Medium between 200–400, Low < 200. */

       select * ,
       case when amount > 400 then 'high'
       when amount between 200 and 400 then 'medium'
       else 'low' end  from sales
      

/* 23. Show customers and display 'Has Email' if email is not NULL, otherwise 'Missing Email'. */

select * ,
case when email is not null then 'has email'
else 'missing email' end as email_file from customers


/* 24. For each customer, display 'Lives in Major City' if city is
       ('New York', 'Chicago', 'Los Angeles'), otherwise 'Other City'. */

       select * ,
       case when city in ('new york ' , 'chicago','los angeles') then 'lives in major city'
       else 'lives in other city' end  from customers


       
select * ,
case when amount > 200 then amount*0.2
else amount * 0.1 end as amount_tax
from customers c
inner join sales s on s.customer_id = c.customer_id

 --1️⃣ Όνομα τμήματος
--2️⃣ Πόσους υπαλλήλους έχει
---3️⃣ Μέσο μισθό (average salary)
--4-️⃣ Κατηγορία τμήματος με βάση το πόσους υπαλλήλους έχει:
-- Μόνο τμήματα με Μέσο μισθό > 2000
--6️⃣ Ταξινόμηση κατά μέσο μισθό φθίνουσα (DESC)

select d.department_name , count(*) as emp_num , avg(salary) as avg_sal ,
case when count(*) > 12 then ' large'
when count(*) between 10 and 11  then ' medium '
else 'low'
end as empl_meg
from employees e
join departments d on d.department_id = e.department_id
group by d.department_name
having avg(salary) > 78000
order by avg(salary) desc 


--department_name count of employees CASE: 10 → ‘Big Team’ 5–10 → ‘Medium Team’ < 5 → ‘Small Team’

select department_name , count(*) as employees_num ,
case when count(*) > 15 then 'big team '
when count(*) between 9 and 14 then ' medium team '
else 'small team '
end as megethos_team
from employees e
join departments d on d.department_id = e.department_id
group by department_name

--first_name department_name salary category (High/Medium/Low) Μόνο υπάλληλοι από Sales Και μόνο όσοι έχουν salary >= 75000
select first_name , department_name , salary ,
case when salary > 85000 then 'High'
when salary between 80000 and 84000 then 'medium'
else 'low'
end as salary_category
from employees e
join departments d on d.department_id = e.department_id
where salary >=80000

--department_name avg salary ανά department Μέσος Μισθός	Κατηγορία High Medium Low ΜΟΝΟ departments poy periexoyn a

select d.department_name , avg(salary) as average_salary ,
case when avg(salary) > 78000 then ' high'
when avg(salary) between 70000 and 76500 then ' medium ' 
else 'low'
end as salary_category 
from employees e
join departments d on d.department_id = e.department_id
where d.department_name like '%a%'
group by d.department_name

-- kainouria stili salary status ean <65000 low , medium 65-80 , high
select *,
case when salary < 65000 then 'low'
when salary between 65000 and 80000 then 'medium'
else 'high' end as salary_status
from employees

--bonus kai osoi douleuoub IT na paroun 10%, hr 5% , 3% oloi oi alloi

select * ,
case 
when department_name ='it' then salary *0.1
when department_name = 'hr' then salary *0.05
else salary * 0.03
end as bonus
from employees e 
join departments d on d.department_id = e.department_id
