# 📘 DB-Lab-7: Subqueries (Nested Queries)

![SQL](https://img.shields.io/badge/SQL-Subqueries-blue)
![Oracle](https://img.shields.io/badge/Database-Oracle-red)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

## 🎯 Objective

To understand and apply **subqueries (nested queries)** for retrieving and analyzing data from relational tables using conditions, filtering, and aggregate functions.

## 🗂 Tables Used

* Student
* Enrollment
* Course
* Faculty
* Department

## 🧠 Concepts Covered

Subqueries • Single-Row Subquery • Multi-Row Subquery (IN) • EXISTS • Aggregate Functions • Nested Queries • Filtering Without JOIN

## 📌 Parts Covered

**Part A:** Basic Subqueries
**Part B:** Subqueries using IN
**Part C:** Subqueries with Aggregate Functions
**Part D:** Subqueries instead of JOIN
**Part E:** Analytical Subqueries
**Part F:** Challenging Queries

## ▶ How to Run

1. Create `DB-Lab-7.sql`
2. Paste all subquery-based SQL queries
3. Run using SQL*Plus / Oracle SQL Developer / VS Code SQL Extension

## 📂 Structure

DB-Lab-7/
├── DB-Lab-7.sql
└── README.md

---

## 📊 Sample Queries

### 🔹 Single-Row Subquery

```sql
SELECT Name
FROM Student
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Student
    WHERE StudentID = 'S401'
);
```

### 🔹 Multi-Row Subquery (IN)

```sql
SELECT Name
FROM Student
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Student
    WHERE Gender = 'Female'
);
```

### 🔹 Subquery with EXISTS

```sql
SELECT Name
FROM Student S
WHERE EXISTS (
    SELECT *
    FROM Enrollment E
    WHERE S.StudentID = E.StudentID
);
```

---

## 📌 Conclusion

This lab helps in understanding how to use subqueries effectively for data filtering and analysis.
It builds a strong foundation for writing advanced SQL queries without always relying on JOIN operations.

---

## ⭐ Support

If you found this useful, consider giving a ⭐ to the repository.
