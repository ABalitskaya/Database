use hr;
-- Выведите названия департаментов, в которых менеджеры зарабатывают больше 10000

SELECT 
	d.department_name
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
WHERE d.manager_id = e.employee_id and e.salary > 10000;

-- Вывести имя, фамилию, название департамента и название должности сотрудника

SELECT
	e.first_name,
    e.last_name,
    d.department_name,
    j.job_title
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN jobs j
ON e.job_id = j.job_id;

-- Вывести имя, фамилию и зарплату тех сотрудников, которые работают в городах Oxford и San Francisco

SELECT 
	e.first_name,
    e.last_name,
    e.salary
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l
ON d.location_id = l.location_id
WHERE l.city IN ('Oxford', 'South San Francisco');
-- самого округа San Francisco в таблице нет

-- Вывести имя, фамилию и город сотрудника
SELECT
	first_name,
    last_name,
    l.city
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id;

-- Вывести города и соответствующие городам страны
SELECT
	l.city,
    c.country_name
FROM locations l
INNER JOIN countries c
ON l.country_id = c.country_id;
