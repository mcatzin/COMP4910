CREATE DATABASE cinema_booking_system;

USE cinema_booking_system;

CREATE TABLE films(
id INT Primary KEY AUTO_INCREMENT,
name VARCHAR(45) NOT NULL UNIQUE,
length_min INT NOT NULL
);

CREATE TABLE customers (
id INT PRIMARY KEY AUTO_INCREMENT,
first_naem VARCHAR(45),
last_name VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE rooms(
	id INT PRIMARY KEY AUTO_INCREMENT,
    roomName VARCHAR(45) NOT NULL,
    no_seats INT NOT NULL
);