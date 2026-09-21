CREATE DATABASE CompanyDB;
USE CompanyDB;
CREATE TABLE EMPLOYEE (
    SSN           VARCHAR(9) PRIMARY KEY,
    Fname         VARCHAR(50)  NOT NULL,
    Lname         VARCHAR(50)  NOT NULL,
    Gender        VARCHAR(1),
    BirthDate     DATE,
    Dnumber       INT     NOT NULL,   
    Super_SSN     VARCHAR(9)                 
);

CREATE TABLE DEPARTMENT (
    Dnumber       INT PRIMARY KEY,
    Dname         VARCHAR(50)  NOT NULL UNIQUE,
    Manager_SSN   VARCHAR(9) NOT NULL,  
    Manager_HireDate   DATE,
    CONSTRAINT fk_dept_manager
        FOREIGN KEY (Manager_SSN) 
        REFERENCES EMPLOYEE(SSN)
);

ALTER TABLE EMPLOYEE
    ADD CONSTRAINT fk_emp_dept
        FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber);

ALTER TABLE EMPLOYEE
    ADD CONSTRAINT fk_emp_supervisor
        FOREIGN KEY (Super_SSN) REFERENCES EMPLOYEE(SSN);

CREATE TABLE DEPT_LOCATIONS (
    Dnumber    INT          NOT NULL,
    Location   VARCHAR(50)  NOT NULL,
    PRIMARY KEY (Dnumber, Location),
    CONSTRAINT fk_deptloc_dept
        FOREIGN KEY (Dnumber) 
        REFERENCES DEPARTMENT(Dnumber)
);


CREATE TABLE PROJECT (
    Pnumber INT PRIMARY KEY,
    Pname  VARCHAR(50)  NOT NULL,
    Location VARCHAR(50),
    City VARCHAR(50),
    Dnumber INT   NOT NULL,
    CONSTRAINT fk_project_dept
        FOREIGN KEY (Dnumber) 
        REFERENCES DEPARTMENT(Dnumber)
);

CREATE TABLE WORKS_ON (
    SSN VARCHAR(9) NOT NULL,
    Pnumber INT NOT NULL,
    Hours INT NOT NULL,
    PRIMARY KEY (SSN, Pnumber),
    CONSTRAINT fk_workson_emp
        FOREIGN KEY (SSN) 
        REFERENCES EMPLOYEE(SSN),

    CONSTRAINT fk_workson_project
        FOREIGN KEY (Pnumber) 
        REFERENCES PROJECT(Pnumber)
);

CREATE TABLE DEPENDENT (
    SSN  VARCHAR(9) NOT NULL,
    Dependent_Name VARCHAR(50)  NOT NULL,
    Gender VARCHAR(1),
    BirthDate DATE,
    PRIMARY KEY (SSN, Dependent_Name),
    CONSTRAINT fk_dependent_emp
        FOREIGN KEY (SSN) 
        REFERENCES EMPLOYEE(SSN)
        
);

