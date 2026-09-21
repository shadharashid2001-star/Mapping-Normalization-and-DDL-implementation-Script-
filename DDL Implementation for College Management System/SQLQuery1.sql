CREATE DATABASE UniversityDB;

USE UniversityDB;


-- =========================================
-- 1. DEPARTMENT TABLE


CREATE TABLE Department (
    Department_id INT PRIMARY KEY,
    D_name VARCHAR(100) NOT NULL
);


-- =========================================
-- 2. FACULTY TABLE

CREATE TABLE Faculty (
    E_id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Salary DECIMAL(10,2),
    Mobile_no VARCHAR(20),
    Department_id INT,

    FOREIGN KEY (Department_id)
        REFERENCES Department(Department_id)
);


-- =========================================
-- 3. HOSTEL TABLE


CREATE TABLE Hostel (
    Hostel_id INT PRIMARY KEY,
    Hostel_name VARCHAR(100) NOT NULL,
    No_of_seats INT,
    Address VARCHAR(200),
    City VARCHAR(100),
    State VARCHAR(100),
    Pin_code VARCHAR(20)
);


-- =========================================
-- 4. STUDENT TABLE


CREATE TABLE Student (
    S_id INT PRIMARY KEY,
    F_name VARCHAR(50) NOT NULL,
    L_name VARCHAR(50) NOT NULL,
    Phone_no VARCHAR(20),
    DOB DATE,
    Department_id INT,
    Hostel_id INT,

    FOREIGN KEY (Department_id)
        REFERENCES Department(Department_id),

    FOREIGN KEY (Hostel_id)
        REFERENCES Hostel(Hostel_id)
);


-- =========================================
-- 5. SUBJECT TABLE


CREATE TABLE Subject (
    Subject_id INT PRIMARY KEY,
    Subject_name VARCHAR(100) NOT NULL,
    E_id INT,

    FOREIGN KEY (E_id)
        REFERENCES Faculty(E_id)
);


-- =========================================
-- 6. COURSE TABLE


CREATE TABLE Course (
    Course_id INT PRIMARY KEY,
    Course_name VARCHAR(100) NOT NULL,
    Duration VARCHAR(50),
    Department_id INT,

    FOREIGN KEY (Department_id)
        REFERENCES Department(Department_id)
);


-- =========================================
-- 7. EXAM TABLE


CREATE TABLE Exam (
    Exam_code INT PRIMARY KEY,
    Exam_date DATE,
    Exam_time TIME,
    Room VARCHAR(50),
    Department_id INT,

    FOREIGN KEY (Department_id)
        REFERENCES Department(Department_id)
);


-- =========================================
-- 8. ENROLLS TABLE
-- Student ↔ Course


CREATE TABLE Enrolls (
    S_id INT,
    Course_id INT,

    PRIMARY KEY (S_id, Course_id),

    FOREIGN KEY (S_id)
        REFERENCES Student(S_id),

    FOREIGN KEY (Course_id)
        REFERENCES Course(Course_id)
);


-- =========================================
-- 9. TAKES TABLE
-- Student ↔ Subject


CREATE TABLE Takes (
    S_id INT,
    Subject_id INT,

    PRIMARY KEY (S_id, Subject_id),

    FOREIGN KEY (S_id)
        REFERENCES Student(S_id),

    FOREIGN KEY (Subject_id)
        REFERENCES Subject(Subject_id)
);


-- =========================================
-- 10. TAKES_EXAM TABLE
-- Student ↔ Exam


CREATE TABLE Takes_Exam (
    S_id INT,
    Exam_code INT,

    PRIMARY KEY (S_id, Exam_code),

    FOREIGN KEY (S_id)
        REFERENCES Student(S_id),

    FOREIGN KEY (Exam_code)
        REFERENCES Exam(Exam_code)
);