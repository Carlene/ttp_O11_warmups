-- Read this article. Take a moment and reflect on the implications of how and week SQL
-- executes in the order that it does. Then look at the following examples, and
-- write out in order /explain what order the code runs. 
-- BONUS: after you've going through once and done either (write out/explain)
-- try to go back and do the other.

-- EXAMPLE:
SELECT film_id, title, actor_id
FROM film JOIN film_actor
WHERE language_id = 1 AND
	  rating = 'G'
ORDER BY film_id;

-- ANSWER:
1 - film JOIN film_actor
2 - FROM #1
3 - WHERE language_id = 1 AND rating = 'G'
4 - SELECT *
5 ORDER BY film_id;

-- Alternative answer:
-- We first take the film table and join it to the film_actor table as the base 
-- table for the query. That is then filtered by the WHERE clause to only rows 
-- that have both language_id #1 AND rated 'G'. From that, film_id, title, and 
-- actor_id are selected (/returned), and the results are ordered by film_id.
  
https://jvns.ca/blog/2019/10/03/sql-queries-don-t-start-with-select/
  
  

SELECT payment_date 
From payment
WHERE payment_date > '2007-05-01'
ORDER BY payment_date DESC;

-- ANSWER
-- FROM payment
-- knows we only need information from the payment table

-- WHERE payment_date > '2007-05-01'
-- filters out payment_dates more recent than May, 1 2007

-- SELECT payment_date
-- chooses those payment_dates to show

-- ORDER BY payment_date DESC
-- orders them by the latest date first



SELECT payment_id, payment_date
From payment
WHERE amount < 3;

-- ANSWER
-- FROM payment
-- fishes out information from the payment table

-- WHERE amount < 3
-- filters out where the payment amount is less than $3

-- SELECT payment_id, payment_date
-- shows the payment_ids and payment_dates that the where clause filters out


SELECT customer_id, email, active
From customer
WHERE store_id = 1 AND active = 0
ORDER BY last_update;

-- ANSWER
-- FROM customer
-- only information from the customer table

-- WHERE store_id = 1 AND active = 0
-- filters out only the store_ids that are equal to 1, and their active = 0

-- SELECT customer_id, email, active
-- shows the customer_id, email, and active status from the results from the where filter

-- ORDER BY last_update;
-- orders by the last_update ascending


-- THESE TWO ARE A BIT TRICKIER
SELECT c.name, COUNT(f.film_id) as total
FROM film as f
JOIN film_category AS fc  ON f.film_id=fc.film_id
JOIN category AS c ON fc.category_id=c.category_id
GROUP BY c.category_id
ORDER BY total DESC ;

-- ANSWER
-- FROM film as f
-- JOIN film_category AS fc  ON f.film_id=fc.film_id
-- JOIN category AS c ON fc.category_id=c.category_id

-- grabs information from the film table, joining it with the film category table on their primary/foreign key film_id. then it joins that joint table with the category table on their category_id key

-- GROUP BY c.category_id
-- groups all the returned information together by category_id

-- SELECT c.name, COUNT(f.film_id) as total
-- returns the name of the genre and the count of films of each genre

-- ORDER BY total DESC ;
-- orders by the amount of films in each genre


SELECT *
FROM payment
WHERE amount > (SELECT AVG(amount) FROM payment);

-- ANSWER
-- FROM payment
-- grabs information from the payment table

-- WHERE amount > (SELECT AVG(amount) FROM payment);
-- returns where the amount of payment is greater than the average amount of payment

-- SELECT *
-- select all columns from payment




