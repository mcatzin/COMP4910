CREATE DATABASE cinema_booking_system;

uSE cinema_booking_system;

CREATE TABLE IF NOT EXISTS  films(
	film_id INT Primary KEY AUTO_INCREMENT,
	name VARCHAR(45) NOT NULL UNIQUE,
	length_min INT NOT NULL

);

alter table films
add     check(length_min >=60);

CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(45),
	last_name VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL UNIQUE
);

select * from customers;

select * from rooms;
CREATE TABLE rooms(
	room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_name VARCHAR(45) NOT NULL,
    no_seats INT NOT NULL
);
delete from customers;
CREATE TABLE screenings (
	screening_id INT PRIMARY KEY AUTO_INCREMENT,
    film_id INT NOT NULL,
    room_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    FOREIGN KEY (film_id) REFERENCES films (film_id),
    FOREIGN KEY (room_id) REFERENCES rooms (room_id)
    );
select * from screenings;

CREATE TABLE seats (
	seat_id INT PRIMARY KEY AUTO_INCREMENT,
    seat_row CHAR(1) NOT NULL,
    number INT NOT NULL,
    room_id INT NOT NULL,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
    );
    
CREATE TABLE bookings (
	booking_id INT PRIMARY KEY AUTO_INCREMENT,
    screening_id INT NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (screening_id) REFERENCES screenings(screening_id),
   FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    );
    
    describe bookings;
    
CREATE TABLE reserved_seat (
	reserved_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    seat_id INT NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (seat_id) REFERENCES seats (seat_id)
    );
    
# count the number of screenings for "The Upside" in October 17

SELECT COUNT(*) FROM screenings s
JOIN films f ON s.film_id = f.film_id
WHERE f.NAME = 'The Upside';


SELECT COUNT(*) FROM bookings
WHERE customer_id = 10;

    SELECT * FROM films;
SELECT * FROM customers;
SELECT * FROM rooms;
SELECT * FROM screenings;
SELECT * FROM seats;
SELECT * FROM bookings;
SELECT * FROM reserved_seat;
# Count the number of unique customers who made a booking for October 2018

Select f.name, s.start_time, c.first_name, c.last_name, count(b.booking_id) from films f
join screenings s on f.film_id = s.film_id
join bookings b on s.screening_id = b.screening_id
join customers c on b.customer_id = c.customer_id
group by f.name, c.last_name, c.first_name, s.start_time
order by s.start_time;
    
    describe reserved_seat;
select * from films into outfile"//Users//mariocatzin/COMP4910//fims.csc "fields terminated by ',' terminated by'\n';