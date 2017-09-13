USE 'sakila-data'

select * from actor

/*
1. What query would you run to get all the customers inside city_id = 312? Your query should return customer first name,
 last name, email, and address.*/

select * from customer where address_id in( 517, 256)
#address_id
select * from address where city_id = 312
#address_id
select CONCAT_WS(' ',address.address, address.district, address.postal_code) AS addy from address where city_id = 312
#address_id

select  customer.first_name, customer.last_name, customer.email, 
CONCAT_WS(' ',address.address, address.district, address.postal_code) AS addy from customer join address
on customer.address_id=address.address_id where address.city_id = 312;


/* 2. What query would you run to get all comedy films? 
Your query should return film title, description, release year, rating, special features, and genre (category).*/
select * from film
/* film_id, title, descirtion*/ 

select title, description, release_year, rating, special_features, name from film 
join film_category on film.film_id = film_category.film_id 
join category on film_category.category_id=category.category_id where name = 'Comedy' ;


select * from film_category where category_id = 5
/* film_id, category_id*/

select * from category
/* category_id, name*/

/*3. What query would you run to get all the films joined by actor_id=5? 
Your query should return the actor id, actor name, film title, description, and release year.*/



select  fa.actor_id, CONCAT(a.first_name,' ',a.last_name) AS name, f.title, f.description, f.release_year from film f
join film_actor fa on f.film_id=fa.film_id join actor a on fa.actor_id=a.actor_id 
where fa.actor_id = 5;

select * from actor #john lolo
#actor_id = 5
select * from film_actor where actor_id = 5
#film_id -- actor_id = 5
select * from film
#film_id



/*4. What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)?
 Your query should return customer first name, last name, email, and address.*/

select* from staff
#store_ID = 1
select * from customer where store_id = 1
#address_id
select * from address where city_id in (1, 42, 312, 459)
#address_id, city_id
select * from city where city_id in (1, 42, 312, 459)
#city_id

/**********/
select c.first_name, c.last_name from customer c 
join address a on c.address_id = a.address_id 
join city on a.city_id=city.city_id where c.store_id = 1 and city.city_id in (1, 42, 312, 459)
/*****/
/**this also works below**/
select * from customer
join address on address.address_id=customer.address_id
where city_id in (1, 42, 312, 459) and store_id = 1

/*
5. What query would you run to get all the films with a "rating = G" and 
"special feature = behind the scenes", joined by actor_id = 15? 
Your query should return the film title, description, release year, ratifing, 
and special feature. Hint: You may use LIKE function in getting the 'behind the scenes' part. */

select * from film f 
join actor a on actor_id = a.actor_id
where a.actor_id = 15 and f.rating = 'G' and f.special_features LIKE '%Behind%'

select * from film_actor

/*****/ 
/*** 6. What query would you run to get all the actors that joined in the film_id = 369?
 Your query should return the film_id, title, actor_id, and actor_name. **/

select * from film where film_id = 369
select * from film_actor where film_id = 369

select f.film_id, f.title, fa.actor_id, CONCAT(a.first_name,' ',a.last_name) AS name  from film f
join film_actor fa on f.film_id=fa.film_id
join actor a on fa.actor_id=a.actor_id
where f.film_id=369;

/*7. What query would you run to get all drama films with a rental rate of 2.99? 
Your query should return film title, description, release year, rating, special features, and genre (category*/
select * from film;

select f.title, f.description, f.release_year, f.rating, f.special_features, c.name from film f 
join film_category fc on f.film_id=fc.film_id 
join category c on fc.category_id=c.category_id where f.rental_rate= 2.99;


/**8. What query would you run to get all the action films which are joined by SANDRA KILMER? 
Your query should return film title, description, release year, rating, special features, genre (category),
 and actor's first name and last name.*/
 
 select a.last_name, f.title, f.description, f.release_year, f.rating, f.special_features, c.name AS genre from film_category fc
 join film f on f.film_id=fc.film_id
 join category c on fc.category_id=c.category_id
 join film_actor fa on f.film_id=fa.film_id
 join actor a on fa.actor_id=a.actor_id
 where a.first_name = 'SANDRA' AND a.last_name = 'KILMER'
