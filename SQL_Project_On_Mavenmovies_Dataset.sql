USE mavenmovies;

/*
--- Title :-       Mavenmovies Dataset SQL Project
--- Created by :-   Prasanna Kumar
--- Date :-         03-01-2023
--- Tool used:-     MySQL

/*
Description :- 
		• This is a Mavenmovies Dataset SQL Project. This database contains 19 tables.
		• Retail table has 1000 rows.
		• Project is prepared by Prasanna Kumar.
		
Approach :- 
		• Understanding the dataset
		• Creating business questions
		• Analysing through SQL queries
*/
#Question 1: Can you get all data about movies?
select * from actor;
select * from actor_award;
select * from address;
select * from advisor;
select * from category;
select * from city;
select * from country;
select * from customer;
select * from film;
select * from film_actor;
select * from film_category;
select * from inventory;
select * from investor;
select * from language;
select * from investor;
select * from payment;
select * from rental;
select * from staff;
select * from store;

#Question 2: Check how many movies are present in mavenmovies.Give the count based on category.
SELECT count(*) FROM film;
SELECT c.name,count(film_id) AS Number_of_films FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

#Question 3: write a sql query to find the actors who were casted in movie'Annie Hall'.Return first_name,last_name and role.alter

select * from actors;
select * from movie;
select * from director;
select * from genres;
select * from movie_cast;
select * from movie_direction;
select * from movie_genres;


select a.act_fname,a.act_lname,mc.role 
from actors a 
inner join movie_cast mc on a.act_id=mc.act_id
inner join movie m on mc.mov_id=m.mov_id 
where mov_title='Annie Hall';

#Question 4:Write a query to find the director who directed a movie that casted a role for 'eyes wide shut'.Return director first_name, last_name, and movie title.

select * from movie;
select * from director;
select * from movie_cast;
select * from movie_direction;

select d.dir_fname,d.dir_lname,mov_title 
from director d 
inner join movie_direction md on d.dir_id=md.dir_id
inner join movie_cast  mc on md.mov_id=mc.mov_id
inner join movie m on m.mov_id=mc.mov_id 
where mov_title='Eyes wide shut';

#Question 5:Write a query to find who directed movie that casted a role as' sean magquire'.Return director first_name,last_name and movie_title.

select * from movie;
select * from director;
select * from movie_cast;
select * from movie_direction;


select d.dir_fname,d.dir_lname, m.mov_title 
from director d left join movie_direction md on d.dir_id=md.dir_id
join movie_cast mc on mc.mov_id=md.mov_id 
inner join movie m  on m.mov_id=mc.mov_id 
where role = 'sean maguire' ;




#Question 6:Write a sql query to find the actors who have not acted in any movie between 1990 and 2000.Return actor first_name,last_name,movie _title,release year.

select * from movie;
select * from director;
select * from movie_cast;
select * from movie_direction;
select * from actors;

Select a.act_fname,a.act_lname,m.mov_title,m.mov_year 
from actors a 
join movie_cast mc on a.act_id=mc.act_id
join movie m on mc.mov_id=m.mov_id 
where mov_year not between '1990' and '2000';



#Question 7:Write a sql query to find the directors with the number of genres of movies.Group the result set on directors first_name,last_name and genric title.Sort the result set in ascending order by directors first_name, last_name.Return directors first_name,last_name and numbers of genres of movies.


select * from movie;
select * from director;
select * from movie_cast;
select * from movie_direction;
select * from actors;
select * from movie_genres;
select * from genres;

Select d.dir_fname,d.dir_lname,g.gen_title,count(g.gen_title)
from director d 
join movie_direction md on  d.dir_id=md.dir_id
join movie_genres mg on md.mov_id=mg.mov_id
join genres g on mg.gen_id=g.gen_id
group by dir_fname,dir_lname,g.gen_title
order by dir_fname,dir_lname asc;





