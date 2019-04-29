CREATE DATABASE cinema_booking_system;

USE cinema_booking_system;

CREATE TABLE films(
	film_id INT Primary KEY AUTO_INCREMENT,
	name VARCHAR(45) NOT NULL UNIQUE,
	length_min INT NOT NULL
);
show tables;
CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(45),
	last_name VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE rooms(
	room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_name VARCHAR(45) NOT NULL,
    no_seats INT NOT NULL
);

CREATE TABLE screenings (
	screening_id INT PRIMARY KEY AUTO_INCREMENT,
    film_id INT NOT NULL,
    room_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    FOREIGN KEY (film_id) REFERENCES films (film_id),
    FOREIGN KEY (room_id) REFERENCES rooms (room_id)
    );
drop table screenings;

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
    
    describe reserved_seat;

INSERT INTO films (name, length_min)
VALUES ('Blade Runner 2049',153),
('Dunkirk',106),
('Geostorm',121),
('Thor: Ragnarok',107),
('Jigsaw',116),
('The Death of Stalin',98),
('The Lego Ninjago Movie',101),
('Murder on the Orient Express',135),
('Paddington 2',88),
('Breathe',117),
('Blade Runner',127),
('Victoria and Abdul',112);
    
SELECT * FROM films;
SELECT * FROM customers;
SELECT * FROM rooms;
SELECT * FROM screenings;
SELECT * FROM seats;
SELECT * FROM bookings;
SELECT * FROM reserved_seat;
INSERT INTO rooms (room_name, no_seats) 
VALUES ('Chaplin',72),
('Kubrick',36),
('Coppola',36);
    
    
    
    