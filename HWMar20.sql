use issues;

-- вывести фамилию, имя и роли по отделам всех сотрудников

SELECT 
	us.firstName,
    us.lastName,
    'developer' as role
FROM userscategories u
INNER JOIN users us
ON u.user_id = us.ID
INNER JOIN categories cat
ON u.cat_id = cat.ID
WHERE cat.ID = 1 or cat.parent_id = 1
group by us.ID
UNION
SELECT
	us.firstName,
    us.lastName,
    'manager' as role
FROM userscategories u
INNER JOIN users us
ON u.user_id = us.ID
INNER JOIN categories cat
ON u.cat_id = cat.ID
WHERE cat.ID = 2 or cat.parent_id = 2
group by us.ID;

-- Заполнить таблицу tasks

INSERT INTO tasks (taskName, creationDate, deadline, creator_id, assignee_id, category_id)
VALUES  ('Add menu on the main page', now(), default, 3, 3, 3),
		('Adapt footer for mobile version', now(), '2023-05-26 10:30:00', 3, 4, 3 ),
		('Сreate a credit card form', '2023-02-04 17:30:00', default, 3, 4, 1 ),
        ('Сhange the corporate color in accordance with the new specification version 3.1.1', now(), default, 4, 4, 3 ),
        ('Fix a bug ID144', now(), '2023-04-02 08:00:00', 4, 3, 1),
        ('Fix a bug ID046', now(), default, 4, 3, 1);

INSERT INTO tasks (taskName, creationDate, deadline, creator_id, assignee_id, category_id)
VALUES  ('Provide a report on the average check for January 2022 by city', now(), default, 3, 5, 5),
		('Fix a bug ID078', now(), '2023-05-26 10:30:00', 5, 5, 4 ),
		('Fix a bug ID132', '2023-06-04 22:30:00', default, 4, 3, 1 ),
        ('configure caching', now(), default, 4, 4, 4 ),
        ('salary indexation method in accordance with blablabla', now(), '2023-04-06 08:00:00', 5, 4, 4),
        ('Fix a bug ID946', now(), default, 3, 3, 1);
        
INSERT INTO tasks (taskName, creationDate, deadline, creator_id, assignee_id, category_id)
VALUES  ('create statistics of changes in the salaries of front-end developers over the past 5 years in percentage (USD)', now(), default, 1, 5, 5),
		('Annual report for investors', now(), '2024-05-26 10:30:00', 1, 6, 7 ),
		('Company profit plan for 2024', '2023-07-01 22:30:00', default, 6, 1, 2 ),
        ('tax report', now(), default, 1, 6, 7 ),
        ('Сreate an internship plan for the development department for 2024', now(), '2023-11-11 08:00:00', 2, 2, 6),
        ('Approve the system of remuneration and labor standards for personnel', now(), default, 2, 2, 6);
        
INSERT INTO tasks (taskName, creationDate, deadline, creator_id, assignee_id, category_id)
VALUES  ('test1', '2020-11-11 08:00:00', '2021-11-11 08:00:00', 1, 5, 5),
		('test2', '2020-11-11 08:00:00', '2021-11-11 08:00:00', 2, 2, 6),
        ('test3', '2020-11-11 08:00:00', '2021-11-11 08:00:00', 6, 1, 2),
        ('test4', '2020-11-11 08:00:00', '2021-11-11 08:00:00', 6, 1, 2);
        
-- Вывести количество просроченных заданий на каждого человека

SELECT
	u.firstName,
    u.lastName,
    t2.oldTasks
FROM users u
LEFT JOIN (SELECT
	t.assignee_id,
	count(t.ID) as oldTasks
	FROM users u
	INNER JOIN 
		(SELECT -- выбирает прошедшие дедлайны
		ID,
		assignee_id
		FROM tasks
		WHERE tasks.deadline < current_time()) t 
	ON u.ID = t.assignee_id
	GROUP BY t.assignee_id) t2
ON u.ID = t2.assignee_id 
;