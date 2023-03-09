use qa32e_readonly;

-- How many products in each product line? 


SELECT 
	CONCAT_WS(" ", p2.productLine, COUNT(productName)) 
FROM products p 
INNER JOIN productlines p2 
ON p.productLine = p2.productLine 
WHERE p2.productLine = 'Classic Cars'
UNION 
SELECT 
	CONCAT_WS(" ", p2.productLine, COUNT(productName))
FROM products p 
INNER JOIN productlines p2 
ON p.productLine = p2.productLine 
WHERE p2.productLine = 'Motorcycles' 
UNION 
SELECT 
	CONCAT_WS(" ", p2.productLine, COUNT(productName))
FROM products p 
INNER JOIN productlines p2 
ON p.productLine = p2.productLine 
WHERE p2.productLine = 'Ships'
UNION 
SELECT 
	CONCAT_WS(" ", p2.productLine, COUNT(productName))
FROM products p 
INNER JOIN productlines p2 
ON p.productLine = p2.productLine 
WHERE p2.productLine = 'Trains'
UNION 
SELECT 
	CONCAT_WS(" ", p2.productLine, COUNT(productName))
FROM products p 
INNER JOIN productlines p2 
ON p.productLine = p2.productLine 
WHERE p2.productLine = 'Trucks and Buses'
UNION 
SELECT 
	CONCAT_WS(" ", p2.productLine, COUNT(productName))
FROM products p 
INNER JOIN productlines p2 
ON p.productLine = p2.productLine 
WHERE p2.productLine = 'Vintage Cars';


-- What is the minimum payment received? 
SELECT 
	min(amount)
FROM payments p ;

-- List all payments greater than twice the average payment.

SELECT 	
	amount
FROM payments 
WHERE amount > (SELECT avg(amount)*2 FROM payments p);

-- What is the average percentage markup of the MSRP on buyPrice? 

SELECT 	
	AVG((p.MSRP - p.buyPrice)/p.buyPrice *100) 
FROM products p; 

-- OR

SELECT 	
	AVG((p.MSRP/p.buyPrice-1)*100) 
FROM products p;

-- How many distinct products does ClassicModels sell? 

SELECT 
	COUNT(DISTINCT p.productName) as unique_prod
FROM products p 
INNER JOIN productlines p2 
ON p.productLine = p2.productLine 
WHERE p2.productLine = 'Classic Cars';

-- Report the name and city of customers who don't have sales representatives?

	SELECT 
		customerName ,
		city
	FROM customers
	WHERE salesRepEmployeeNumber IS NULL;

-- What are the names of executives with VP or Manager in their title? Use the CONCAT function
-- to combine the employee's first name and last name into a single field for reporting. 


SELECT
	CONCAT_WS(' ', firstName, lastName) as full_name
	FROM employees e 
WHERE jobTitle LIKE '%VP%' or jobTitle LIKE '%Manager%';

-- Which orders have a value greater than $5,000? 

SELECT 
	o.orderNumber,
	p.amount
FROM orders o 
INNER JOIN customers c 
ON o.customerNumber = c.customerNumber 
INNER JOIN payments p 
ON p.customerNumber = c.customerNumber 
WHERE p.amount > 5000;
