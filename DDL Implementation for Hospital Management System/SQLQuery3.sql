
-- Q3 - HOSPITAL / CLINIC SYSTEM


CREATE DATABASE HospitalDB;

USE HospitalDB;



-- 1. PATIENT


CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    f_name VARCHAR(50) NOT NULL,
    l_name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    gender VARCHAR(10),
    blood_group VARCHAR(10)
);


-- 2. PATIENT_PHONE


CREATE TABLE Patient_Phone (
    patient_id INT,
    phone VARCHAR(20),

    PRIMARY KEY (patient_id, phone),

    FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id)
);



-- 3. DEPARTMENT


CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);



-- 4. DOCTOR


CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    professional_details VARCHAR(255),
    department_id INT,

    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);


-- HEADS RELATIONSHIP
-- One Doctor can head a Department


ALTER TABLE Department
ADD head_doctor_id INT;

ALTER TABLE Department
ADD CONSTRAINT fk_department_head
FOREIGN KEY (head_doctor_id)
REFERENCES Doctor(doctor_id);



-- 5. APPOINTMENT


CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status VARCHAR(30),
    type VARCHAR(50),
    patient_id INT,
    doctor_id INT,

    FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES Doctor(doctor_id)
);



-- 6. SERVICE


CREATE TABLE Service (
    service_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    current_price DECIMAL(10,2)
);



-- 7. APPOINTMENT_SERVICE
-- M:N relationship between
-- APPOINTMENT and SERVICE


CREATE TABLE Appointment_Service (
    appointment_id INT,
    service_id INT,
    quantity INT,
    unit_price_at_time DECIMAL(10,2),

    PRIMARY KEY (appointment_id, service_id),

    FOREIGN KEY (appointment_id)
        REFERENCES Appointment(appointment_id),

    FOREIGN KEY (service_id)
        REFERENCES Service(service_id)
);



-- 8. SERVICE_PRICE_HISTORY

CREATE TABLE Service_Price_History (
    price_history_id INT PRIMARY KEY,
    price DECIMAL(10,2) NOT NULL,
    effective_from DATE NOT NULL,
    effective_to DATE,
    service_id INT,

    FOREIGN KEY (service_id)
        REFERENCES Service(service_id)
);



-- 9. MEDICAL_RECORD


CREATE TABLE Medical_Record (
    record_id INT PRIMARY KEY,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    patient_id INT,
    appointment_id INT,
    doctor_id INT,

    FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id),

    FOREIGN KEY (appointment_id)
        REFERENCES Appointment(appointment_id),

    FOREIGN KEY (doctor_id)
        REFERENCES Doctor(doctor_id)
);



-- 10. BILLING


CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(30),
    appointment_id INT,

    FOREIGN KEY (appointment_id)
        REFERENCES Appointment(appointment_id)
);



-- 11. PAYMENT


CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE,
    method VARCHAR(50),
    bill_id INT,

    FOREIGN KEY (bill_id)
        REFERENCES Billing(bill_id)
);