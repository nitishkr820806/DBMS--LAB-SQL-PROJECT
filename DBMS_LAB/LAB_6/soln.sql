-- ======================================================
-- LAB-6 : DATA AGGREGATION USING GROUP BY AND HAVING
-- ======================================================

SET FEEDBACK OFF;
SET VERIFY OFF;

PROMPT ==========================================
PROMPT PART A : BASIC AGGREGATE FUNCTIONS
PROMPT ==========================================

-- 1 Total number of students
SELECT COUNT(*) AS TOTAL_STUDENTS
FROM Student;

-- 2 Total number of faculty
SELECT COUNT(*) AS TOTAL_FACULTY
FROM Faculty;

-- 3 Total number of courses
SELECT COUNT(*) AS TOTAL_COURSES
FROM Course;

-- 4 Maximum credits among courses
SELECT MAX(Credits) AS MAX_CREDITS
FROM Course;

-- 5 Minimum credits among courses
SELECT MIN(Credits) AS MIN_CREDITS
FROM Course;


PROMPT ==========================================
PROMPT PART B : GROUP BY ON SINGLE TABLES
PROMPT ==========================================

-- 6 Students in each department
SELECT Department_ID, COUNT(*) AS STUDENTS
FROM Student
GROUP BY Department_ID;

-- 7 Faculty members in each department
SELECT Department_ID, COUNT(*) AS FACULTY_COUNT
FROM Faculty
GROUP BY Department_ID;

-- 8 Courses offered by each department
SELECT Department_ID, COUNT(*) AS COURSE_COUNT
FROM Course
GROUP BY Department_ID;

-- 9 Enrollments in each semester
SELECT Semester, COUNT(*) AS ENROLLMENTS
FROM Enrollment
GROUP BY Semester;

-- 10 Students for each grade
SELECT Grade, COUNT(*) AS STUDENT_COUNT
FROM Enrollment
GROUP BY Grade;


PROMPT ==========================================
PROMPT PART C : GROUP BY WITH HAVING
PROMPT ==========================================

-- 11 Departments having more than 1 student
SELECT Department_ID, COUNT(*) AS TOTAL_STUDENTS
FROM Student
GROUP BY Department_ID
HAVING COUNT(*) > 1;

-- 12 Semesters where more than 2 enrollments exist
SELECT Semester, COUNT(*) AS TOTAL_ENROLLMENTS
FROM Enrollment
GROUP BY Semester
HAVING COUNT(*) > 2;

-- 13 Grades assigned to more than one student
SELECT Grade, COUNT(*) AS TOTAL_STUDENTS
FROM Enrollment
GROUP BY Grade
HAVING COUNT(*) > 1;

-- 14 Departments where more than one course is offered
SELECT Department_ID, COUNT(*) AS TOTAL_COURSES
FROM Course
GROUP BY Department_ID
HAVING COUNT(*) > 1;


PROMPT ==========================================
PROMPT PART D : AGGREGATION WITH JOIN
PROMPT ==========================================

-- 15 Number of students enrolled in each course
SELECT Course_ID, COUNT(Student_ID) AS ENROLLED_STUDENTS
FROM Enrollment
GROUP BY Course_ID;

-- 16 Course name and number of students enrolled
SELECT C.Course_Name, COUNT(E.Student_ID) AS STUDENTS
FROM Course C
JOIN Enrollment E
ON C.Course_ID = E.Course_ID
GROUP BY C.Course_Name;

-- 17 Department name and number of students
SELECT D.Department_Name, COUNT(S.Student_ID) AS STUDENTS
FROM Department D
JOIN Student S
ON D.Department_ID = S.Department_ID
GROUP BY D.Department_Name;

-- 18 Faculty name and number of courses taught
SELECT F.Name, COUNT(C.Course_ID) AS COURSES_TAUGHT
FROM Faculty F
JOIN Course C
ON F.Faculty_ID = C.Faculty_ID
GROUP BY F.Name;




PROMPT ==========================================
PROMPT PART E : ANALYTICAL QUERIES
PROMPT ==========================================

-- 19 Course name and maximum grade obtained
SELECT C.Course_Name, MAX(E.Grade) AS MAX_GRADE
FROM Course C
JOIN Enrollment E
ON C.Course_ID = E.Course_ID
GROUP BY C.Course_Name;

-- 20 Department and total courses offered
SELECT Department_ID, COUNT(*) AS TOTAL_COURSES
FROM Course
GROUP BY Department_ID;

-- 21 Semester and total students enrolled
SELECT Semester, COUNT(Student_ID) AS TOTAL_STUDENTS
FROM Enrollment
GROUP BY Semester;

-- 22 Courses having more than 1 student enrolled
SELECT Course_ID, COUNT(Student_ID) AS TOTAL_STUDENTS
FROM Enrollment
GROUP BY Course_ID
HAVING COUNT(Student_ID) > 1;


PROMPT ==========================================
PROMPT LAB-6 COMPLETED SUCCESSFULLY
PROMPT ==========================================

SET FEEDBACK ON;
