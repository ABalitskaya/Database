use hr;
-- Найти максимальную зарплату в каждом департаменте. Вывести departmentid и maxsalary

SELECT
	d.department_id,
    max(e.salary) as max_salary
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id;
        
-- Найти сотрудников, у которых наибольшая зарплата в их департаменте 

SELECT
	e1.first_name,
    e1.last_name,
    e2.max_salary,
    e1.department_id
FROM employees e1
INNER JOIN (
	SELECT
    department_id,
    max(salary) as max_salary
    FROM employees
    GROUP BY department_id
) e2
ON e1.department_id = e2.department_id
AND e1.salary = e2.max_salary;

-- Найти департамент с наибольшим кол-вом сотрудников

SELECT 
    d.department_id,
    count(e.employee_id) as max_count    
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY e.department_id
ORDER BY max_count DESC
LIMIT 1;

-- считает количество сотрудников

/*SELECT 
    count(e.employee_id) as total_count
FROM employees e
GROUP BY e.department_id;*/


-- Найти департаменты, в которых больше 10 сотрудников 

SELECT
	d.department_name,
    count(e.employee_id) as empl_count
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING count(e.employee_id) > 10;

-- Выведите название отделов с кол-вом сотрудников больше среднего
SELECT
	d.department_name,
    count(e.employee_id) empl_count
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING count(e.employee_id) > 
	(SELECT avg(total_count) FROM (SELECT 
		count(e.employee_id) as total_count
	FROM employees e
	GROUP BY e.department_id) as avg_count);
    
    -- считает среднее кол-во сотрудников
    SELECT avg(total_count) FROM (SELECT 
		count(e.employee_id) as total_count
	FROM employees e
	GROUP BY e.department_id) as avg_count;


