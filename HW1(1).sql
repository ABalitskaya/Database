/*Найти всех сотрудников, работающих в департаменте с id 90*/
SELECT first_name, last_name, employee_id FROM hr.employees WHERE employee_id = 90;

/*Найти всех сотрудников, зарабатывающих больше 5000*/
SELECT first_name, last_name, salary FROM hr.employees WHERE salary > 5000;

/*Вывести всех сотрудников с job_id ‘FI_ACCOUNT’ и зарабатывающих меньше 8000*/
SELECT first_name, last_name, job_id, salary FROM hr.employees WHERE salary < 8000 AND job_id = 'FI_ACCOUNT';

/*Вывести сотрудников, у которых в фамилии в середине слова встречаются сочетания ‘kk’ или ‘ll’*/
SELECT first_name, last_name FROM hr.employees WHERE last_name LIKE '%kk%' OR last_name LIKE '%ll%';

/*Вывести сотрудников с commission_pct NULL*/
SELECT first_name, last_name, commission_pct FROM hr.employees WHERE commission_pct IS NULL;

/*Вывести всех сотрудников кроме тех, кто работает в департаментах 80 и 110*/
SELECT first_name, last_name, department_id FROM hr.employees WHERE department_id <> 80 AND department_id <> 110;

/*Вывести сотрудников зарабатывающих от 5000 до 7000 (включая концы)*/
SELECT first_name, last_name, salary FROM hr.employees WHERE salary BETWEEN 5000 AND 7000;