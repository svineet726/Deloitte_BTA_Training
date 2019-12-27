-- 1
select * from jobs
where min_salary > 10000

--2
select first_name, hire_date
    from employees
    where to_char(hire_date,'yyyy') between 2002 and 2005 
    order by hire_date
    
--3
select first_name, hire_date from employees
where job_id in (select job_id from jobs where job_title = 'Programmer' or job_title = 'Sales Manager')
order by first_name

--4
select first_name,last_name, hire_date
    from employees
    where to_char(hire_date,'YY') > '8'
    order by hire_date
    
--5    
select * from employees
    where employee_id = 150 or employee_id = 160    
--6
select first_name, salary, commission_pct, hire_date
from employees 
where salary<10000
order by salary

--7
select job_title, max_salary - min_salary"Difference"
from jobs
where max_salary between 10000 and 20000 

--8 
select first_name,round(salary,-3) as salary_rounded_1000
from employees

--9
select * from jobs
order by job_title desc

--10
select * from employees
where first_name LIKE 'S%'
OR last_name LIKE 'S%'

--11
select first_name, last_name, hire_date from employees
where to_char(hire_date, 'mon')='may';

--12
select * from employees 
where commission_pct IS NULL and salary between 5000 and 1000 and department_id = 30

--13
    select first_name, hire_date, last_day(hire_date)"DATE_FIRST_SALARY" from employees
--14 
select e.first_name, floor((j.end_date - j.start_date)/365)"Years"
from employees e, job_history j
where e.employee_id = j.employee_id

--15
select first_name, hire_date from employees
where to_char(hire_date, 'YYYY') = 2001

--16
select initcap(first_name)"First name", initcap(last_name)"Last name" from employees

--17
select job_title, regexp_substr(job_title,'[A-z]*')"Only first word" from jobs
--18



--20
select * from employees 
WHERE TO_CHAR(HIRE_DATE,'YYYY')=TO_CHAR(SYSDATE, 'YYYY')
--21
    SELECT floor(SYSDATE - to_date('01-jan-2011'))"difference between sysdate and 1st Jan 2011 in days"
    FROM DUAL

--23
select manager_id, count(*) from employees 
group by manager_id

--24
select employee_id, max(end_date)"End date" from job_history 
group by employee_id

--25
select count(*) from employees
where to_char(hire_date,'dd') > 15

--26
select country_id, count(city)"Count of cities" from locations
group by country_id

--27
select avg(salary), department_id from employees
where commission_pct is not null
group by department_id

--28
select job_id, count(*), sum(salary), max(salary) - min(salary) 
from employees
group by job_id
order by max(salary) - min(salary)  desc

--29
select job_id, avg(salary)from employees
having avg(salary)>10000
group by job_id

--30
select extract(year from hire_date)"Year"
from employees
having count(employee_id)>10 
group by extract(year from hire_date)

--31
select department_id from employees
where commission_pct is not null  
group by department_id
having count(commission_pct) > 5

--32
select employee_id 
from job_history
group by employee_id 
having count(employee_id)>1

--33
select job_id from job_history
where end_date-start_date > 100
group by job_id
having count(employee_id) > 3

--34
select department_id, extract(year from hire_date)"Year", count(employee_id)
from employees
group by department_id, extract(year from hire_date)
order by department_id

--35
select department_id
from employees
where manager_id is not null
group by department_id
having count(employee_id) > 5


--36
update employees set salary = 8000 
where employee_id = 115 and salary < 6000
select employee_id, salary from employees

--37

--38
update employees set job_id = 'IT PROG'
where employee_id = 110 and department_id = 10 and not job_id like 'IT%'

--39
INSERT INTO DEPARTMENTS VALUES (999,'SPORTS',120,1200)
--40
select d.department_name, count(e.employee_id)"count" 
from departments d, employees e
where d.department_id=e.department_id
group by department_name

--41
SELECT EMPLOYEE_ID, JOB_TITLE, END_DATE-START_DATE "DAYS"
FROM JOB_HISTORY NATURAL JOIN JOBS 
WHERE DEPARTMENT_ID=30

--42
select d.department_name, e.first_name 
from departments d, employees e 
where d.manager_id = e.employee_id

--43
select d.department_name, e.first_name, c.city 
from departments d, employees e, locations c
where d.manager_id = e.employee_id and c.location_id = d.location_id

--44
select c.country_name,l.city, d.department_name
from countries c, locations l, departments d
where c.country_id = l.country_id and l.location_id = d.location_id

--45
select job_title, department_name, last_name
--46 
SELECT job_title, avg(salary) FROM EMPLOYEES NATURAL JOIN jobs GROUP BY job_title
-- 2nd method
select j.job_title, avg(e.salary)"Average salary" 
from jobs j, employees e
where j.job_id = e.job_id
group by job_title

--47 
select j.job_title, e.first_name, j.max_salary - e.salary"Difference"
from jobs j, employees e
where j.job_id = e.job_id

--48
select e.last_name, j.job_title
from jobs j, employees e
where j.job_id = e.job_id and e.department_id = 30 and e.commission_pct is not null

--49

