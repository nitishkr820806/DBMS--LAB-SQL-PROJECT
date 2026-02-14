-- ==========================================
-- COLLEGE DATABASE TABLE CREATION
-- ==========================================

-- Department Table
CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50) NOT NULL,
    Office_Location VARCHAR(50)
);

-- Student Table
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DOB DATE,
    Gender VARCHAR(10),
    Contact_No VARCHAR(15),
    City VARCHAR(50),
    Semester INT,
    Department_ID INT,
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
);

-- Faculty Table
CREATE TABLE Faculty (
    Faculty_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Designation VARCHAR(30),
    Email VARCHAR(50),
    Department_ID INT,
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
);

-- Course Table
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50) NOT NULL,
    Credits INT,
    Department_ID INT,
    Faculty_ID INT,
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID),
    FOREIGN KEY (Faculty_ID)
        REFERENCES Faculty(Faculty_ID)
);

-- Enrollment Table
CREATE TABLE Enrollment (
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Enroll_Semester VARCHAR(20),
    Grade VARCHAR(5),
    FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID)
        REFERENCES Course(Course_ID)
);

