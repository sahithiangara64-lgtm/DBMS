-- =========================================================
-- STUDENT MANAGEMENT SYSTEM - DBMS PROJECT
-- Database: StudentDB
-- =========================================================

-- 1. CREATE DATABASE
DROP DATABASE IF EXISTS StudentDB;
CREATE DATABASE StudentDB;
USE StudentDB;


-- =========================================================
-- 2. STUDENT TABLE
-- =========================================================

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(10),
    Date_of_Birth DATE,
    Age INT,
    Department VARCHAR(30),
    Year INT,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(150)
);


-- =========================================================
-- 3. DEPARTMENT TABLE
-- =========================================================

CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50) NOT NULL,
    HOD_Name VARCHAR(50)
);


-- =========================================================
-- 4. COURSE TABLE
-- =========================================================

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100) NOT NULL,
    Department_ID INT,
    Credits INT,
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
);


-- =========================================================
-- 5. FACULTY TABLE
-- =========================================================

CREATE TABLE Faculty (
    Faculty_ID INT PRIMARY KEY,
    Faculty_Name VARCHAR(50) NOT NULL,
    Department_ID INT,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
);


-- =========================================================
-- 6. ENROLLMENT TABLE
-- =========================================================

CREATE TABLE Enrollment (
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Enrollment_Date DATE,
    FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID)
        REFERENCES Course(Course_ID)
);


-- =========================================================
-- 7. MARKS TABLE
-- =========================================================

CREATE TABLE Marks (
    Mark_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Marks INT,
    Grade VARCHAR(2),
    FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID)
        REFERENCES Course(Course_ID)
);


-- =========================================================
-- 8. ATTENDANCE TABLE
-- =========================================================

CREATE TABLE Attendance (
    Attendance_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Total_Classes INT,
    Attended_Classes INT,
    FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID)
        REFERENCES Course(Course_ID)
);


-- =========================================================
-- 9. FEES TABLE
-- =========================================================

CREATE TABLE Fees (
    Fee_ID INT PRIMARY KEY,
    Student_ID INT,
    Total_Fees DECIMAL(10,2),
    Paid_Fees DECIMAL(10,2),
    Due_Fees DECIMAL(10,2),
    Payment_Status VARCHAR(20),
    FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID)
);


-- =========================================================
-- INSERT DATA INTO DEPARTMENT
-- =========================================================

INSERT INTO Department VALUES
(1, 'Computer Science Engineering', 'Dr. Ramesh'),
(2, 'Electronics and Communication', 'Dr. Suresh'),
(3, 'Electrical Engineering', 'Dr. Kumar'),
(4, 'Mechanical Engineering', 'Dr. Prasad'),
(5, 'Information Technology', 'Dr. Lakshmi'),
(6, 'Civil Engineering', 'Dr. Rao');


-- =========================================================
-- INSERT DATA INTO STUDENT
-- =========================================================

INSERT INTO Student VALUES
(101, 'Rahul Kumar', 'Male', '2007-05-12', 19,
 'Computer Science Engineering', 1, '9876543210',
 'rahul@gmail.com', 'Hyderabad'),

(102, 'Priya Sharma', 'Female', '2006-08-20', 20,
 'Electronics and Communication', 2, '9876543211',
 'priya@gmail.com', 'Vijayawada'),

(103, 'Arjun Reddy', 'Male', '2007-01-15', 19,
 'Computer Science Engineering', 1, '9876543212',
 'arjun@gmail.com', 'Guntur'),

(104, 'Sneha Rao', 'Female', '2005-11-10', 20,
 'Electrical Engineering', 3, '9876543213',
 'sneha@gmail.com', 'Visakhapatnam'),

(105, 'Kiran Kumar', 'Male', '2006-03-25', 20,
 'Mechanical Engineering', 2, '9876543214',
 'kiran@gmail.com', 'Rajahmundry'),

(106, 'Anjali Patel', 'Female', '2007-07-18', 19,
 'Information Technology', 1, '9876543215',
 'anjali@gmail.com', 'Hyderabad'),

(107, 'Rohit Singh', 'Male', '2005-09-05', 21,
 'Computer Science Engineering', 3, '9876543216',
 'rohit@gmail.com', 'Delhi'),

(108, 'Divya Reddy', 'Female', '2006-12-22', 19,
 'Electronics and Communication', 2, '9876543217',
 'divya@gmail.com', 'Kakinada'),

(109, 'Naveen Kumar', 'Male', '2004-06-14', 22,
 'Civil Engineering', 4, '9876543218',
 'naveen@gmail.com', 'Amaravati'),

(110, 'Pooja Devi', 'Female', '2005-10-30', 20,
 'Information Technology', 3, '9876543219',
 'pooja@gmail.com', 'Tirupati');


-- =========================================================
-- INSERT DATA INTO COURSE
-- =========================================================

INSERT INTO Course VALUES
(201, 'Database Management System', 1, 4),
(202, 'Data Structures', 1, 4),
(203, 'Computer Networks', 1, 3),
(204, 'Digital Electronics', 2, 4),
(205, 'Communication Systems', 2, 3),
(206, 'Electrical Machines', 3, 4),
(207, 'Thermodynamics', 4, 4),
(208, 'Web Technologies', 5, 3),
(209, 'Operating Systems', 1, 4),
(210, 'Engineering Mathematics', 1, 4);


-- =========================================================
-- INSERT DATA INTO FACULTY
-- =========================================================

INSERT INTO Faculty VALUES
(301, 'Dr. Ramesh', 1, '9000000001', 'ramesh@college.com'),
(302, 'Dr. Suresh', 2, '9000000002', 'suresh@college.com'),
(303, 'Dr. Kumar', 3, '9000000003', 'kumar@college.com'),
(304, 'Dr. Prasad', 4, '9000000004', 'prasad@college.com'),
(305, 'Dr. Lakshmi', 5, '9000000005', 'lakshmi@college.com'),
(306, 'Dr. Rao', 6, '9000000006', 'rao@college.com');


-- =========================================================
-- INSERT DATA INTO ENROLLMENT
-- =========================================================

INSERT INTO Enrollment VALUES
(401, 101, 201, '2026-06-10'),
(402, 101, 202, '2026-06-10'),
(403, 102, 204, '2026-06-10'),
(404, 102, 205, '2026-06-10'),
(405, 103, 201, '2026-06-11'),
(406, 103, 203, '2026-06-11'),
(407, 104, 206, '2026-06-11'),
(408, 105, 207, '2026-06-12'),
(409, 106, 208, '2026-06-12'),
(410, 107, 209, '2026-06-12');


-- =========================================================
-- INSERT DATA INTO MARKS
-- =========================================================

INSERT INTO Marks VALUES
(501, 101, 201, 85, 'A'),
(502, 101, 202, 90, 'A+'),
(503, 102, 204, 78, 'B+'),
(504, 102, 205, 82, 'A'),
(505, 103, 201, 92, 'A+'),
(506, 103, 203, 88, 'A'),
(507, 104, 206, 75, 'B+'),
(508, 105, 207, 80, 'A'),
(509, 106, 208, 95, 'A+'),
(510, 107, 209, 87, 'A');


-- =========================================================
-- INSERT DATA INTO ATTENDANCE
-- =========================================================

INSERT INTO Attendance VALUES
(601, 101, 201, 50, 45),
(602, 101, 202, 50, 48),
(603, 102, 204, 50, 42),
(604, 102, 205, 50, 45),
(605, 103, 201, 50, 47),
(606, 103, 203, 50, 44),
(607, 104, 206, 50, 40),
(608, 105, 207, 50, 43),
(609, 106, 208, 50, 49),
(610, 107, 209, 50, 46);


-- =========================================================
-- INSERT DATA INTO FEES
-- =========================================================

INSERT INTO Fees VALUES
(701, 101, 50000, 50000, 0, 'Paid'),
(702, 102, 50000, 40000, 10000, 'Pending'),
(703, 103, 50000, 50000, 0, 'Paid'),
(704, 104, 55000, 45000, 10000, 'Pending'),
(705, 105, 55000, 55000, 0, 'Paid'),
(706, 106, 50000, 30000, 20000, 'Pending'),
(707, 107, 50000, 50000, 0, 'Paid'),
(708, 108, 50000, 40000, 10000, 'Pending'),
(709, 109, 60000, 60000, 0, 'Paid'),
(710, 110, 50000, 50000, 0, 'Paid');


-- =========================================================
-- BASIC QUERIES
-- =========================================================

-- Display all students
SELECT * FROM Student;

-- Display all departments
SELECT * FROM Department;

-- Display all courses
SELECT * FROM Course;

-- Display all faculty
SELECT * FROM Faculty;

-- Display all marks
SELECT * FROM Marks;

-- Display all attendance
SELECT * FROM Attendance;

-- Display all fees
SELECT * FROM Fees;


-- =========================================================
-- SEARCH STUDENT
-- =========================================================

SELECT *
FROM Student
WHERE Student_ID = 101;


-- =========================================================
-- STUDENTS FROM CSE
-- =========================================================

SELECT *
FROM Student
WHERE Department = 'Computer Science Engineering';


-- =========================================================
-- STUDENTS WITH AGE GREATER THAN 19
-- =========================================================

SELECT *
FROM Student
WHERE Age > 19;


-- =========================================================
-- FEMALE STUDENTS
-- =========================================================

SELECT *
FROM Student
WHERE Gender = 'Female';


-- =========================================================
-- DISPLAY STUDENTS IN ASCENDING ORDER
-- =========================================================

SELECT *
FROM Student
ORDER BY Name ASC;


-- =========================================================
-- STUDENT + MARKS
-- =========================================================

SELECT
    S.Student_ID,
    S.Name,
    C.Course_Name,
    M.Marks,
    M.Grade
FROM Student S
JOIN Marks M
    ON S.Student_ID = M.Student_ID
JOIN Course C
    ON M.Course_ID = C.Course_ID;


-- =========================================================
-- STUDENT + COURSE
-- =========================================================

SELECT
    S.Student_ID,
    S.Name,
    C.Course_Name,
    E.Enrollment_Date
FROM Student S
JOIN Enrollment E
    ON S.Student_ID = E.Student_ID
JOIN Course C
    ON E.Course_ID = C.Course_ID;


-- =========================================================
-- STUDENT ATTENDANCE PERCENTAGE
-- =========================================================

SELECT
    S.Student_ID,
    S.Name,
    C.Course_Name,
    A.Total_Classes,
    A.Attended_Classes,
    ROUND(
        (A.Attended_Classes / A.Total_Classes) * 100,
        2
    ) AS Attendance_Percentage
FROM Student S
JOIN Attendance A
    ON S.Student_ID = A.Student_ID
JOIN Course C
    ON A.Course_ID = C.Course_ID;


-- =========================================================
-- STUDENT FEES DETAILS
-- =========================================================

SELECT
    S.Student_ID,
    S.Name,
    F.Total_Fees,
    F.Paid_Fees,
    F.Due_Fees,
    F.Payment_Status
FROM Student S
JOIN Fees F
    ON S.Student_ID = F.Student_ID;


-- =========================================================
-- STUDENTS WITH PENDING FEES
-- =========================================================

SELECT
    S.Student_ID,
    S.Name,
    F.Due_Fees,
    F.Payment_Status
FROM Student S
JOIN Fees F
    ON S.Student_ID = F.Student_ID
WHERE F.Payment_Status = 'Pending';


-- =========================================================
-- HIGHEST MARKS
-- =========================================================

SELECT
    S.Name,
    C.Course_Name,
    M.Marks,
    M.Grade
FROM Student S
JOIN Marks M
    ON S.Student_ID = M.Student_ID
JOIN Course C
    ON M.Course_ID = C.Course_ID
ORDER BY M.Marks DESC;


-- =========================================================
-- AVERAGE MARKS OF EACH STUDENT
-- =========================================================

SELECT
    S.Student_ID,
    S.Name,
    ROUND(AVG(M.Marks), 2) AS Average_Marks
FROM Student S
JOIN Marks M
    ON S.Student_ID = M.Student_ID
GROUP BY S.Student_ID, S.Name;


-- =========================================================
-- NUMBER OF STUDENTS IN EACH DEPARTMENT
-- =========================================================

SELECT
    Department,
    COUNT(*) AS Total_Students
FROM Student
GROUP BY Department;


-- =========================================================
-- UPDATE STUDENT PHONE NUMBER
-- =========================================================

UPDATE Student
SET Phone = '9999999999'
WHERE Student_ID = 101;


-- =========================================================
-- UPDATE STUDENT EMAIL
-- =========================================================

UPDATE Student
SET Email = 'rahul_updated@gmail.com'
WHERE Student_ID = 101;


-- =========================================================
-- UPDATE FEES
-- =========================================================

UPDATE Fees
SET Paid_Fees = 50000,
    Due_Fees = 0,
    Payment_Status = 'Paid'
WHERE Student_ID = 102;


-- =========================================================
-- DELETE A STUDENT
-- =========================================================
-- Use carefully because related records may exist.

-- DELETE FROM Student
-- WHERE Student_ID = 110;


-- =========================================================
-- FINAL STUDENT REPORT
-- =========================================================

SELECT
    S.Student_ID,
    S.Name,
    S.Gender,
    S.Department,
    S.Year,
    S.Phone,
    S.Email
FROM Student S
ORDER BY S.Student_ID;