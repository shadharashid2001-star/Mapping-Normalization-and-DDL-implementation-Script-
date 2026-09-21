


use CompanyDB


ALTER TABLE EMPLOYEE
DROP CONSTRAINT fk_emp_dept;

ALTER TABLE dbo.DEPARTMENT
ALTER COLUMN Manager_SSN VARCHAR(9) NULL;

INSERT INTO DEPARTMENT(Dnumber,Dname,Manager_SSN,Manager_HireDate)
VALUES
    (1, 'Headquarters', null,  '1981-06-19'),
    (2, 'Marketing',    null, '1998-01-01'),
    (3, 'Finance',      null, '2005-03-15'),
    (4, 'Administration', null, '1995-01-01'),
    (5, 'Research',     null, '1988-05-22');


    UPDATE DEPARTMENT
SET Manager_SSN =
    CASE Dnumber
        WHEN 1 THEN '888665555'
        WHEN 2 THEN '987654321'
        WHEN 3 THEN '999887777'
        WHEN 4 THEN '987654321'
        WHEN 5 THEN '333445555'
    END
WHERE Dnumber IN (1, 2, 3, 4, 5);
    select * from DEPARTMENT

INSERT INTO EMPLOYEE
    (SSN, Fname, Lname, Gender, BirthDate, Dnumber, Super_SSN)
VALUES
    ('888665555', 'James',    'Borg',    'M', '1937-11-10', 1, NULL),
    ('333445555', 'Franklin', 'Wong',    'M', '1955-12-08', 5, '888665555'),
    ('987654321', 'Jennifer', 'Wallace', 'F', '1941-06-20', 4, '888665555'),
    ('123456789', 'John',     'Smith',   'M', '1965-01-09', 5, '333445555'),
    ('999887777', 'Alicia',   'Zelaya',  'F', '1968-07-19', 4, '987654321');

SELECT * FROM EMPLOYEE;


SELECT SSN, Fname, Lname
FROM dbo.EMPLOYEE;

UPDATE dbo.DEPARTMENT
SET Manager_SSN =
    CASE Dnumber
        WHEN 1 THEN '888665555'
        WHEN 2 THEN '987654321'
        WHEN 3 THEN '999887777'
        WHEN 4 THEN '987654321'
        WHEN 5 THEN '333445555'
    END
WHERE Dnumber IN (1, 2, 3, 4, 5);

SELECT * FROM dbo.DEPARTMENT;

  INSERT INTO dbo.DEPT_LOCATIONS (Dnumber, Location)
VALUES
    (1, 'Muscat'),
    (2, 'Dubai'),
    (3, 'Riyadh'),
    (4, 'Manama'),
    (5, 'Doha');

SELECT * FROM dbo.DEPT_LOCATIONS;


INSERT INTO dbo.PROJECT
    (Pnumber, Pname, Location, Dnumber)
VALUES
    (1,  'ProductX',        'Muscat', 5),
    (2,  'ProductY',        'Dubai',  5),
    (3,  'ProductZ',        'Riyadh', 5),
    (10, 'Computerization','Manama', 4),
    (20, 'Reorganization', 'Doha',   1);

SELECT * FROM dbo.PROJECT;

ALTER TABLE dbo.WORKS_ON
ALTER COLUMN Hours DECIMAL(5,1) NOT NULL;

INSERT INTO dbo.WORKS_ON (SSN, Pnumber, Hours)
VALUES
    ('123456789', 1,  32.5),
    ('123456789', 2,   7.5),
    ('333445555', 2,  10.0),
    ('333445555', 3,  10.0),
    ('999887777', 10, 10.0);


ALTER TABLE dbo.DEPENDENT
ADD Relationship VARCHAR(50);
GO


INSERT INTO dbo.DEPENDENT
    (SSN, Dependent_Name, Gender, BirthDate, Relationship)
VALUES
    ('333445555', 'Alice',    'F', '1986-04-05', 'Daughter'),
    ('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
    ('333445555', 'Joy',      'F', '1958-05-03', 'Spouse'),
    ('987654321', 'Abner',    'M', '1942-02-28', 'Spouse'),
    ('123456789', 'Michael',  'M', '1988-01-04', 'Son');

SELECT * FROM dbo.WORKS_ON;
SELECT * FROM dbo.DEPENDENT;