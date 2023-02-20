use hr;
-- заполнить таблицу пользователей

INSERT INTO users(
id,
user_name,
first_name,
last_name,
phone,
email,
address,
user_age
) values (
1,
"Ilia1837",
"Ilia",
"Chavchavadze",
"+995595000000",
"ilia1837@gmail.com",
"Tbilisi, Chavchavadzis gamziri, 1",
39
);

INSERT INTO users(
id,
user_name,
first_name,
last_name,
phone,
email,
address,
user_age
) values (
2,
"Rezo1936",
"Rezo",
"Gabriadze",
"+995595111111",
"rezo1836@gmail.com",
"Kutaisi",
42
);

INSERT INTO users(
id,
user_name,
first_name,
last_name,
phone,
email,
address,
user_age
) values (
3,
"Akaki1840",
"Akaki",
"Tsereteli",
"+995595222222",
"akaki1840@gmail.com",
"Sachhere",
18
);

INSERT INTO users(
id,
user_name,
first_name,
last_name,
phone,
email,
address,
user_age
) values (
4,
"Vakhtang440",
"Vakhtang",
"Gorgasali",
"+995595333333",
"vakhtang440@gmail.com",
"Georgia",
22
);

INSERT INTO users(
id,
user_name,
first_name,
last_name,
phone,
email,
address,
user_age
) values (
5,
"Tamar1166",
"Tamar",
"Mafe",
"+995595444444",
"tamarmefe1166@gmail.com",
"Uplestcikhe",
42
);

INSERT INTO users(
id,
user_name,
first_name,
last_name,
phone,
email,
address,
user_age
) values (
6,
"Mikhail1932",
"Mikhail",
"Khergiani",
"+995595555555",
"misha1932@gmail.com",
"Svaneti",
31
);

-- заполнить таблицу товаров
INSERT INTO goods(
id, 
good_name, 
price,
qty
) VALUES (
5,
'Tent The North Face',
16000,
7
);

INSERT INTO goods(
id, 
good_name, 
price,
qty
) VALUES (
6,
'Ice ax',
12000,
3
);

INSERT INTO goods(
id, 
good_name, 
price,
qty
) VALUES (
7,
'Sleeping bag',
20000,
70
);

INSERT INTO goods(
id, 
good_name, 
price,
qty
) VALUES (
8,
'GPS navigator',
63000,
19
);

INSERT INTO goods(
id, 
good_name, 
price,
qty
) VALUES (
9,
'Helmet',
9000,
43
);

-- заполнить таблицу заказов
INSERT INTO orders(
id,
clientId,
delivery_status,
totalPrice
) VALUES (
01,
2,
false,
22000
);

INSERT INTO orders(
id,
clientId,
delivery_status,
totalPrice
) VALUES (
02,
1,
true,
120000
);

INSERT INTO orders(
id,
clientId,
delivery_status,
totalPrice
) VALUES (
03,
3,
true,
40000
);

INSERT INTO orders(
id,
clientId,
delivery_status,
totalPrice
) VALUES (
04,
4,
false,
9000
);

INSERT INTO orders(
id,
clientId,
delivery_status,
totalPrice
) VALUES (
05,
5,
false,
50000
);

-- опционально заполнить таблицы скидок

INSERT INTO goods_discount(
discount,
discount_status,
good_id,
dateEnd
) values (
10,
true,
4,
29
);

INSERT INTO goods_discount(
discount,
discount_status,
good_id,
dateEnd
) values (
5,
true,
6,
1
);
INSERT INTO goods_discount(
discount,
discount_status,
good_id,
dateEnd
) values (
20,
true,
5,
2
);

INSERT INTO orderedGoods(
order_id,
good_id,
qty)
values(
1,
5,
1
);

INSERT INTO orderedGoods(
order_id,
good_id,
qty)
values(
2,
5,
1
);

INSERT INTO discounts_dated(
	discount,
    last_date,
    good_id
    ) values (
    10,
    5,
    6
);
INSERT INTO discounts_dated(
	discount,
    last_date,
    good_id
    ) values (
    5,
    1,
    3
);
INSERT INTO discounts_dated(
	discount,
    last_date,
    good_id
    ) values (
    15,
    5,
    1
);
INSERT INTO discounts_dated(
	discount,
    last_date,
    good_id
    ) values (
    20,
    23,
    8
);

-- Вывести идентификаторы(id) товаров в КОНКРЕТНОМ заказе
SELECT good_id FROM orderedgoods WHERE order_id = 1;

-- Вывести ВСЕ скидкы (discountsdated) на КОНКРЕТНЫЙ товар
SELECT discount FROM discounts_dated WHERE good_id = 6;

-- Вывести ВСЕ скидкы (discountspersonal) на КОНКРЕТНЫЙ товар
SELECT discount FROM discount_personal WHERE good_id = 1;

-- Вывести ВСЕ скидкы (discountspersonal) для КОНКРЕТНОГО пользователя
SELECT discount FROM discount_personal WHERE user_id = 4;


