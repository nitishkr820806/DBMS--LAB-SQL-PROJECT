-- =====================================================
-- DB LAB-4 : Data Retrieval (FINAL - DOB Version)
-- Compatible with Your Lab-3 Data (Oracle)
-- =====================================================


-- ===============================
-- PART A : BASIC DATA DISPLAY
-- ===============================

-- Q1
SELECT 
    STUDENT_ID AS Roll_No,
    NAME AS Student_Name,
    DOB AS Date_Of_Birth,
    GENDER AS Gender,
    CONTACT_NO AS Mobile_No,
    DEPARTMENT_ID AS Dept_ID
FROM STUDENT;

-- Q2
SELECT 
    STUDENT_ID AS Roll_No,
    NAME AS Student_Name,
    DEPARTMENT_ID AS Dept_ID
FROM STUDENT;

-- Q3
SELECT 
    FACULTY_ID AS Faculty_Code,
    NAME AS Faculty_Name,
    DESIGNATION AS Job_Title,
    EMAIL AS Email_Address
FROM FACULTY;

-- Q4
SELECT 
    COURSE_ID AS Course_Code,
    COURSE_NAME AS Course_Title,
    CREDITS,
    DEPARTMENT_ID,
    FACULTY_ID
FROM COURSE;

-- Q5
SELECT 
    ENROLLMENT_ID AS Enroll_No,
    STUDENT_ID,
    COURSE_ID,
    SEMESTER,
    GRADE
FROM ENROLLMENT;



-- ===============================
-- PART B : WHERE CONDITIONS
-- ===============================

-- Q6
SELECT * FROM STUDENT
WHERE DEPARTMENT_ID = 1;

-- Q7
SELECT * FROM STUDENT
WHERE GENDER = 'Female';

-- Q8
SELECT * FROM FACULTY
WHERE DESIGNATION LIKE '%Assistant Professor%';

-- Q9
SELECT * FROM FACULTY
WHERE DEPARTMENT_ID = 8;

-- Q10
SELECT * FROM COURSE
WHERE CREDITS >= 4;

-- Q11
SELECT * FROM STUDENT
WHERE DOB > TO_DATE('2003-01-01','YYYY-MM-DD');

-- Q12
SELECT * FROM ENROLLMENT
WHERE SEMESTER = '5th Semester';



-- ===============================
-- PART C : SORTING & LIMITING
-- ===============================

-- Q13
SELECT * FROM STUDENT
ORDER BY NAME ASC;

-- Q14
SELECT * FROM STUDENT
ORDER BY DOB DESC;

-- Q15
SELECT * FROM FACULTY
ORDER BY DESIGNATION ASC;

-- Q16
SELECT * FROM COURSE
ORDER BY CREDITS DESC;

-- Q17 (Limit 3 rows - Oracle)
SELECT * FROM STUDENT
WHERE ROWNUM <= 3;

-- Q18 (Limit 5 rows - Oracle)
SELECT * FROM COURSE
WHERE ROWNUM <= 5;



-- ===============================
-- PART D : DERIVED OUTPUT
-- ===============================

-- Q19 Age Calculation
SELECT 
    NAME,
    TRUNC(MONTHS_BETWEEN(SYSDATE, DOB)/12) AS AGE
FROM STUDENT;

-- Q20
SELECT 
    COURSE_NAME,
    CREDITS + 1 AS UPDATED_CREDITS
FROM COURSE;

-- Q21
SELECT 
    ENROLLMENT_ID,
    STUDENT_ID,
    COURSE_ID,
    SEMESTER,
    GRADE AS FINAL_GRADE
FROM ENROLLMENT;

-- Q22
SELECT 
    NAME,
    EXTRACT(YEAR FROM DOB) AS BIRTH_YEAR
FROM STUDENT;

-- Q23 Email Domain Extraction
SELECT 
    NAME,
    SUBSTR(EMAIL, INSTR(EMAIL,'@')+1) AS EMAIL_DOMAIN
FROM FACULTY;


-- =====================================================
-- END OF LAB-4 (FINAL CLEAN VERSION)
-- =====================================================


