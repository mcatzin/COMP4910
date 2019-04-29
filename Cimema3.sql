use cinema_booking_system;

select * from customers;

select count(*) from customers
where first_name is null;

select sum(no_seats) from rooms;

select sum(no_seats) from rooms
where room_id > 1;

select max(length_min) from films;

select min(length_min) from films;

select avg(length_min) from films
where length_min >120;

# how many bookings did customer id 10 make in october 2017
SELECT COUNT(*) FROM bookings
WHERE customer_id = 10;

# count the number of screenings for Blade Runner 2049 in October 17
SELECT COUNT(*) FROM screenings s
join films f on s.film_id = f.film_id
where f.name = 'Blade Runner 2049';

#count the number of unique customers who made a booking for october 2017
select count(distinct(customer_id)) from bookings;

select customer_id, count(booking_id) from bookings
group by customer_id;

Select f.name, s.start_time, c.first_name, c.last_name, count(b.booking_id) from films f
join screenings s on f.film_id = s.film_id
join bookings b on s.screening_id = b.screening_id
join customers c on b.customer_id = c.customer_id
group by f.name, c.last_name, c.first_name, s.start_time
order by s.start_time;



