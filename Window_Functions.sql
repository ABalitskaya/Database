use hr;

-- Сформируйте поле delta которое содержит разницу между максимальной 
-- зарплатой в отделе и зарплатой сотрудника.
select 
 t1.first_name,
    t1.last_name,
    t1.department_id,
    t1.salary,
    t2.max_salary,
    t2.max_salary - t1.salary as delta
from employees t1
inner join (
 select 
  max(salary) as max_salary,
  department_id
 from employees
 group by department_id
) t2
on t1.department_id = t2.department_id;

SELECT
	first_name,
    last_name,
    max(salary) over(partition by department_id) - salary as delta
from employees;

SELECT
	department_id,
    max(salary) over(partition by department_id)
from employees;

select
 avg(salary)
from (
select null as salary
union all
select 0 as salary
union all
select 60 as salary
union all
select 60 as salary
) t1;

SELECT
	department_id,
    max(salary),
    job_id
FROM employees
GROUP BY department_id, job_id; -- Двойная группировка

select 
 department_id,
    max(salary)
from employees
group by department_id;


select 
distinct
	department_id,
	max(salary) over(partition by department_id)
from employees;

-- Среднее значение зарплаты среди профессий
select 
distinct
	job_id,
	avg(salary) over(partition by job_id) as avg_salary
from employees;