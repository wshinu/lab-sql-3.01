
SELECT COUNT(*) as no_of_copies
FROM inventory
JOIN film ON 
inventory.film_id = film.film_id
WHERE film.title = 'Hunchback Impossible';

SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film);


SELECT actor.first_name, actor.last_name
FROM actor
WHERE actor.actor_id IN (
    SELECT film_actor.actor_id
    FROM film_actor
    WHERE film_actor.film_id = (
        SELECT film.film_id
        FROM film
        WHERE film.title = 'Alone Trip'
    )
);


select film.title, category.name  from film 
join film_category
on film.film_id = film_category.film_id
join category 
on film_category.category_id = category.category_id
where category.name = "family";


SELECT first_name, last_name, email
FROM customer
WHERE address_id IN
    (SELECT address_id
     FROM address
     WHERE city_id IN
         (SELECT city_id
          FROM city
          WHERE country_id IN
              (SELECT country_id
               FROM country
               WHERE country = 'Canada')));
               
SELECT first_name, last_name, email
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Canada';

SELECT film.title
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN (
  SELECT actor_id, COUNT(*) AS film_count
  FROM film_actor
  GROUP BY actor_id
  ORDER BY film_count DESC
  LIMIT 1
) AS most_prolific_actor ON film_actor.actor_id = most_prolific_actor.actor_id
WHERE film_actor.actor_id = most_prolific_actor.actor_id;

SELECT film.title, COUNT(rental.rental_id) AS rentals
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN customer ON rental.customer_id = customer.customer_id
JOIN payment ON rental.rental_id = payment.rental_id
WHERE customer.customer_id = (
  SELECT customer_id
  FROM payment
  GROUP BY customer_id
  ORDER BY SUM(amount) DESC
  LIMIT 1
)
GROUP BY film.title
ORDER BY rentals DESC;

SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_payments
FROM customer as c
JOIN payment as p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING total_payments > (SELECT AVG(amount) FROM payment)
ORDER BY total_payments DESC;



               
