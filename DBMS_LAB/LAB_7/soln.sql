-- ======================================================
-- 🔥 LAB-7: SUBQUERIES (FINAL CLEAN FILE)
-- ======================================================

SET PAGESIZE 100;
SET LINESIZE 200;
SET FEEDBACK OFF;
SET VERIFY OFF;

-- ======================================================
-- 🔹 DATA UPDATE SECTION
-- ======================================================

-- Priyanshu → Priya (Female)
UPDATE Student
SET Name = 'Priya',
    Gender = 'Female'
WHERE Name = 'Priyanshu';

-- Rahul → Riya (Female)
UPDATE Student
SET Name = 'Riya',
    Gender = 'Female'
WHERE Name = 'Rahul';

-- Insert new student
INSERT INTO Student VALUES (711, 'Rahul Kumar', TO_DATE('2004-02-22','YYYY-MM-DD'), 'Male', '8279002345', 1);
INSERT INTO Student VALUES (712, 'Monu Kumar', TO_DATE('2004-05-25','YYYY-MM-DD'), 'Male', '9279002344', 1);
INSERT INTO Student VALUES (713, 'Sneha Sharma', TO_DATE('2004-08-15','YYYY-MM-DD'), 'Female', '7279002346', 7);

INSERT INTO Enrollment VALUES (811, 701, 606, '5th Semester', 'A');
INSERT INTO Enrollment VALUES (811, 703, 604, '5th Semester', 'A');


COMMIT;

-- ======================================================
-- 🔹 PART A: BASIC SUBQUERIES
-- ======================================================

-- Q1
SELECT Name
FROM Student
WHERE Department_ID = (
    SELECT Department_ID
    FROM Student
    WHERE Student_ID = 701
);

-- Q2
SELECT Name
FROM Student
WHERE Gender = (
    SELECT Gender
    FROM Student
    WHERE Student_ID = 702
);

-- Q3
SELECT Name
FROM Student
WHERE Department_ID = (
    SELECT Department_ID
    FROM Student
    WHERE Student_ID = 703
);

-- ======================================================
-- 🔹 PART B: SUBQUERIES WITH IN
-- ======================================================

-- Q4
SELECT Name
FROM Student
WHERE Department_ID IN (
    SELECT Department_ID
    FROM Student
    WHERE Gender = 'Female'
);

-- Q5
SELECT Name
FROM Student
WHERE Student_ID IN (
    SELECT Student_ID
    FROM Enrollment
);

-- Q6
SELECT Name
FROM Student
WHERE Student_ID IN (
    SELECT Student_ID
    FROM Enrollment
);

-- ======================================================
-- 🔹 PART C: AGGREGATE SUBQUERIES
-- ======================================================

-- Q7
SELECT Course_Name
FROM Course
WHERE Credits > (
    SELECT AVG(Credits)
    FROM Course
);

-- Q8
SELECT Name
FROM Student
WHERE Student_ID > (
    SELECT AVG(Student_ID)
    FROM Student
);

-- Q9
SELECT Department_ID
FROM Student
GROUP BY Department_ID
HAVING COUNT(*) > (
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM Student
        GROUP BY Department_ID
    ) temp
);

-- ======================================================
-- 🔹 PART D: SUBQUERIES WITHOUT JOIN
-- ======================================================

-- Q10
SELECT Name
FROM Student S
WHERE EXISTS (
    SELECT 1
    FROM Enrollment E
    WHERE S.Student_ID = E.Student_ID
);

-- Q11
SELECT Name
FROM Student
WHERE Department_ID IS NOT NULL;

-- Q12
SELECT Course_Name
FROM Course
WHERE Course_ID IN (
    SELECT Course_ID
    FROM Enrollment
);

-- ======================================================
-- 🔹 PART E: ANALYTICAL SUBQUERIES
-- ======================================================

-- Q13
SELECT Course_Name
FROM Course
WHERE Credits = (
    SELECT MAX(Credits)
    FROM Course
);

-- Q14
SELECT Name
FROM Student
WHERE Student_ID IN (
    SELECT Student_ID
    FROM Enrollment
    GROUP BY Student_ID
    HAVING COUNT(*) > 1
);

-- Q15
SELECT Department_ID
FROM Student
GROUP BY Department_ID
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM Student
        GROUP BY Department_ID
    ) temp
);

-- ======================================================
-- 🔹 PART F: CHALLENGING QUERIES
-- ======================================================

-- Q16
SELECT Name
FROM Student
WHERE Student_ID IN (
    SELECT Student_ID
    FROM Enrollment
    WHERE Course_ID IN (
        SELECT Course_ID
        FROM Enrollment
        WHERE Student_ID = 701
    )
);

-- Q17
SELECT Name
FROM Student S
WHERE NOT EXISTS (
    SELECT 1
    FROM Enrollment E
    WHERE S.Student_ID = E.Student_ID
);

-- Q18
SELECT Course_Name
FROM Course C
WHERE NOT EXISTS (
    SELECT 1
    FROM Enrollment E
    WHERE C.Course_ID = E.Course_ID
);

-- ======================================================
-- ✅ END OF LAB-7
-- ======================================================
