CREATE DATABASE AirlineDB;

USE AirlineDB;

-- 1. CUSTOMER


CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20)
);


-- 2. AIRPORT


CREATE TABLE Airport (
    airport_code VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(100),
    State VARCHAR(100)
);


-- 3. AIRPLANE TYPE


CREATE TABLE Airplane_Type (
    type_name VARCHAR(50) PRIMARY KEY,
    company VARCHAR(100),
    max_seats INT
);



-- 4. FLIGHT


CREATE TABLE Flight (
    flight_id INT PRIMARY KEY,
    Airline VARCHAR(100),
    Weekdays VARCHAR(100)
);



-- 5. FARE


CREATE TABLE Fare (
    Code VARCHAR(20) PRIMARY KEY,
    Amount DECIMAL(10,2),
    Restrictions VARCHAR(255),
    flight_id INT,

    FOREIGN KEY (flight_id)
        REFERENCES Flight(flight_id)
);


-- 6. AIRPLANE


CREATE TABLE Airplane (
    airplane_id INT PRIMARY KEY,
    total_seats INT,
    type_name VARCHAR(50),

    FOREIGN KEY (type_name)
        REFERENCES Airplane_Type(type_name)
);


-- 7. FLIGHT LEG


CREATE TABLE Flight_Leg (
    flight_id INT,
    leg_no INT,
    scheduled_dep_time TIME,
    scheduled_arr_time TIME,
    departure_airport_code VARCHAR(10),
    arrival_airport_code VARCHAR(10),

    PRIMARY KEY (flight_id, leg_no),

    FOREIGN KEY (flight_id)
        REFERENCES Flight(flight_id),

    FOREIGN KEY (departure_airport_code)
        REFERENCES Airport(airport_code),

    FOREIGN KEY (arrival_airport_code)
        REFERENCES Airport(airport_code)
);


-- 8. LEG INSTANCE


CREATE TABLE Leg_Instance (
    flight_id INT,
    leg_no INT,
    instance_date DATE,
    Arrival_time TIME,
    Departure_time TIME,
    No_of_available_seats INT,
    airplane_id INT,

    PRIMARY KEY (flight_id, leg_no, instance_date),

    FOREIGN KEY (flight_id, leg_no)
        REFERENCES Flight_Leg(flight_id, leg_no),

    FOREIGN KEY (airplane_id)
        REFERENCES Airplane(airplane_id)
);


-- 9. RESERVATION

CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY,
    seat_no VARCHAR(10),
    customer_id INT,
    flight_id INT,
    leg_no INT,
    instance_date DATE,

    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id),

    FOREIGN KEY (flight_id, leg_no, instance_date)
        REFERENCES Leg_Instance
        (flight_id, leg_no, instance_date)
);


-- 10. CAN LAND AT


CREATE TABLE Can_Land_At (
    type_name VARCHAR(50),
    airport_code VARCHAR(10),

    PRIMARY KEY (type_name, airport_code),

    FOREIGN KEY (type_name)
        REFERENCES Airplane_Type(type_name),

    FOREIGN KEY (airport_code)
        REFERENCES Airport(airport_code)
);