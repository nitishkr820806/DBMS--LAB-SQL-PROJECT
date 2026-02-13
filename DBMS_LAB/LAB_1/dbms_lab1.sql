-- Create Students table
CREATE TABLE Students (
    Roll_no INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Phone_no VARCHAR(10),
    Dept VARCHAR(30)
);

-- Create Courses table
CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Credits INT
);

-- Add columns to Students
ALTER TABLE Students ADD City VARCHAR(30);
ALTER TABLE Students ADD Semester INT;

-- Note: Column rename removed for compatibility
-- ALTER TABLE Students CHANGE Phone_no Mobile_No VARCHAR(10);

-- Drop Courses table
DROP TABLE Courses;

-- Insert data into Students (use Phone_no)
INSERT INTO Students
(Roll_no, Name, Age, Phone_no, Dept, City, Semester)
VALUES
(1, 'Ayush', 20, '6206320477', 'CSE', 'Gaya', 4);

INSERT INTO Students
(Roll_no, Name, Age, Phone_no, Dept, City, Semester)
VALUES
(2, 'Arnav', 21, '8223456780', 'CE', 'Patna', 4);

INSERT INTO Students
(Roll_no, Name, Age, Phone_no, Dept, City, Semester)
VALUES
(3, 'Niraj', 19, '9988776655', 'ECE', 'Delhi', 3);

INSERT INTO Students
(Roll_no, Name, Age, Phone_no, Dept, City, Semester)
VALUES
(4, 'Priyanshu', 22, '9180959010', 'IT', 'Mumbai', 3);

INSERT INTO Students
(Roll_no, Name, Age, Phone_no, Dept, City, Semester)
VALUES
(5, 'Ravi', 23, '8899776655', 'ME', 'Bhopal', 6);

-- Select queries
SELECT * FROM Students;

SELECT Roll_no, Name FROM Students;

SELECT * FROM Students WHERE Dept = 'CSE';

SELECT * FROM Students WHERE Age > 20;

-- Update queries
UPDATE Students
SET Dept = 'ECE'
WHERE Roll_no = 1;

UPDATE Students
SET City = 'Patna'
WHERE Name = 'Rahul';

UPDATE Students
SET Age = Age + 1;

-- Delete query
DELETE FROM Students
WHERE Roll_no = 5;
