-- Question 1: List all customers who live in Texas (use JOINs)
select CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME, CUSTOMER.address_id
from CUSTOMER
full join ADDRESS
on CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
where DISTRICT = 'Texas';

-- Question 2: Get all payments above $6.99 with the customers full name
select CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME, AMOUNT
from customer
full join payment
on CUSTOMER.CUSTOMER_ID = PAYMENT.customer_id
where AMOUNT > 6.99;

-- Question 3: Show all customers names who have made payments over $175 (use subqueries)
SELECT *
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);

-- Question 4: List all customers that live in Nepal (use the city table)
select CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME, COUNTRY
FROM customer
full join address
on CUSTOMER.ADDRESS_ID = ADDRESS.address_id
full join city
on ADDRESS.CITY_ID = CITY.city_id
full join country
on CITY.COUNTRY_ID = COUNTRY.country_id
where COUNTRY = 'Nepal';

-- Question 5: Which staff members had the most transactions?
select COUNT(PAYMENT_ID), STAFF.STAFF_ID
from staff
left join payment
on STAFF.STAFF_ID = PAYMENT.STAFF_ID
group by STAFF.STAFF_ID;

-- Question 6: How many movies of each rating are there?
select COUNT(FILM_ID), FILM.RATING
from FILM
group by FILM.RATING;

-- Question 7: Show all customers who have made a single payment above $6.99 (use subqueries)
SELECT *
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 6.99
);

-- Question 8: How many free rentals did our stores give away?
select * from rental;

select *
from RENTAL
where CUSTOMER_ID IN(
	select customer_id
	from PAYMENT
	group by customer_id
	having SUM(AMOUNT) = 0
);

