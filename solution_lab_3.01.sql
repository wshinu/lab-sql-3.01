ALTER TABLE staff
DROP COLUMN picture;
-- column picture droped


INSERT INTO staff(staff_id,first_name, last_name, email, address_id, active, last_update,store_id,username)
VALUES (3,'Tammy', 'Sanders', 'TAMMY.SANDERS@sakilacustomer.org', 1, 1, NOW(),2,'Tammy');
-- tammy sanders data is added into staff table


-- gathering all the information needed for the update 
select* from rental; -- renatl_id, rental_date, inventory_id, customer_id ,return_date , staff_id, last_update
-- have to provide new rental_id  16050

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- customer_id is 130

select * from staff;
-- staff_id is 1

select * from film
where title = "Academy Dinosaur";
-- film_id is 1 

select * from inventory
where film_id =1 ; 
 -- inventory_id is 1
 
 insert into rental(rental_id, rental_date, inventory_id, customer_id ,return_date , staff_id, last_update)
 values(16050,now(),1,130,null,1,now())
