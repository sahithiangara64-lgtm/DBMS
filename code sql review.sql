/* ============================================================
   DBMS PROJECT
   SOFTWARE MANAGEMENT SYSTEM
   Complete SQL Code
   ============================================================ */


/* ============================================================
   1. CREATE DATABASE
   ============================================================ */

DROP DATABASE IF EXISTS Software_Management_System;

CREATE DATABASE Software_Management_System;

USE Software_Management_System;


/* ============================================================
   2. DDL COMMANDS
   CREATE TABLES
   ============================================================ */


/* -------------------------
   ADMIN TABLE
   ------------------------- */

CREATE TABLE Admin (
    Admin_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Phone VARCHAR(15)
);


/* -------------------------
   USER TABLE
   ------------------------- */

CREATE TABLE User (
    User_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Department VARCHAR(100),
    Phone VARCHAR(15)
);


/* -------------------------
   SOFTWARE TABLE
   ------------------------- */

CREATE TABLE Software (
    Software_ID INT PRIMARY KEY AUTO_INCREMENT,
    Software_Name VARCHAR(150) NOT NULL,
    Version VARCHAR(50) NOT NULL,
    Category VARCHAR(100),
    Size DECIMAL(10,2),
    Release_Date DATE,
    Status VARCHAR(30) DEFAULT 'Active'
);


/* -------------------------
   LICENSE TABLE
   ------------------------- */

CREATE TABLE License (
    License_ID INT PRIMARY KEY AUTO_INCREMENT,
    Software_ID INT NOT NULL,
    License_Key VARCHAR(255) UNIQUE NOT NULL,
    Expiry_Date DATE,
    License_Type VARCHAR(50),

    CONSTRAINT fk_license_software
        FOREIGN KEY (Software_ID)
        REFERENCES Software(Software_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


/* -------------------------
   REQUEST TABLE
   ------------------------- */

CREATE TABLE Request (
    Request_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT NOT NULL,
    Software_ID INT NOT NULL,
    Request_Date DATE NOT NULL,
    Status VARCHAR(30) DEFAULT 'Pending',

    CONSTRAINT fk_request_user
        FOREIGN KEY (User_ID)
        REFERENCES User(User_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_request_software
        FOREIGN KEY (Software_ID)
        REFERENCES Software(Software_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


/* -------------------------
   INSTALLATION TABLE
   ------------------------- */

CREATE TABLE Installation (
    Install_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT NOT NULL,
    Software_ID INT NOT NULL,
    Install_Date DATE NOT NULL,
    Version VARCHAR(50),

    CONSTRAINT fk_installation_user
        FOREIGN KEY (User_ID)
        REFERENCES User(User_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_installation_software
        FOREIGN KEY (Software_ID)
        REFERENCES Software(Software_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


/* -------------------------
   PRE-REGISTRATION TABLE
   ------------------------- */

CREATE TABLE Pre_Registration (
    PreReg_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT NOT NULL,
    Software_ID INT NOT NULL,
    Registration_Date DATE NOT NULL,
    Status VARCHAR(30) DEFAULT 'Pending',

    CONSTRAINT fk_prereg_user
        FOREIGN KEY (User_ID)
        REFERENCES User(User_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_prereg_software
        FOREIGN KEY (Software_ID)
        REFERENCES Software(Software_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


/* -------------------------
   NOTIFICATION TABLE
   ------------------------- */

CREATE TABLE Notification (
    Notification_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT NOT NULL,
    Message VARCHAR(500) NOT NULL,
    Date DATE NOT NULL,

    CONSTRAINT fk_notification_user
        FOREIGN KEY (User_ID)
        REFERENCES User(User_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


/* ============================================================
   3. ALTER TABLE EXAMPLES
   ============================================================ */

/* Add a column */

ALTER TABLE Software
ADD COLUMN Description VARCHAR(500);


/* Modify a column */

ALTER TABLE Software
MODIFY COLUMN Status VARCHAR(50) DEFAULT 'Active';


/* ============================================================
   4. DML COMMANDS
   INSERT DATA
   ============================================================ */


/* -------------------------
   INSERT ADMIN DATA
   ------------------------- */

INSERT INTO Admin
(Name, Email, Password, Phone)
VALUES
('Admin One', 'admin1@gmail.com', 'admin123', '9876543210'),
('Admin Two', 'admin2@gmail.com', 'admin456', '9876543211');


/* -------------------------
   INSERT USER DATA
   ------------------------- */

INSERT INTO User
(Name, Email, Password, Department, Phone)
VALUES
('Rahul', 'rahul@gmail.com', 'rahul123', 'CSE', '9000000001'),
('Priya', 'priya@gmail.com', 'priya123', 'AIML', '9000000002'),
('Arjun', 'arjun@gmail.com', 'arjun123', 'ECE', '9000000003'),
('Sneha', 'sneha@gmail.com', 'sneha123', 'CSE', '9000000004'),
('Kiran', 'kiran@gmail.com', 'kiran123', 'IT', '9000000005');


/* -------------------------
   INSERT SOFTWARE DATA
   ------------------------- */

INSERT INTO Software
(Software_Name, Version, Category, Size, Release_Date, Status, Description)
VALUES
('Microsoft Office', '2024', 'Productivity', 2500.00,
 '2024-01-15', 'Active',
 'Office productivity software'),

('Visual Studio Code', '1.95', 'Development', 350.00,
 '2024-10-10', 'Active',
 'Source code editor'),

('MySQL', '8.4', 'Database', 450.00,
 '2024-04-01', 'Active',
 'Relational database management system'),

('Adobe Photoshop', '2025', 'Design', 3200.00,
 '2025-01-20', 'Active',
 'Image editing software'),

('Google Chrome', '130', 'Browser', 200.00,
 '2024-09-15', 'Active',
 'Web browser'),

('Python', '3.13', 'Programming', 120.00,
 '2024-10-07', 'Active',
 'Programming language');


/* -------------------------
   INSERT LICENSE DATA
   ------------------------- */

INSERT INTO License
(Software_ID, License_Key, Expiry_Date, License_Type)
VALUES
(1, 'MS-OFFICE-2025-001', '2026-12-31', 'Annual'),
(2, 'VSC-FREE-001', '2030-12-31', 'Free'),
(3, 'MYSQL-COMMUNITY-001', '2030-12-31', 'Open Source'),
(4, 'ADOBE-PS-2025-001', '2026-06-30', 'Annual'),
(5, 'CHROME-FREE-001', '2030-12-31', 'Free'),
(6, 'PYTHON-FREE-001', '2030-12-31', 'Open Source');


/* -------------------------
   INSERT REQUEST DATA
   ------------------------- */

INSERT INTO Request
(User_ID, Software_ID, Request_Date, Status)
VALUES
(1, 1, '2026-01-10', 'Approved'),
(2, 2, '2026-01-11', 'Approved'),
(3, 3, '2026-01-12', 'Pending'),
(4, 4, '2026-01-13', 'Approved'),
(5, 5, '2026-01-14', 'Rejected'),
(1, 6, '2026-01-15', 'Approved');


/* -------------------------
   INSERT INSTALLATION DATA
   ------------------------- */

INSERT INTO Installation
(User_ID, Software_ID, Install_Date, Version)
VALUES
(1, 1, '2026-01-11', '2024'),
(2, 2, '2026-01-12', '1.95'),
(3, 3, '2026-01-13', '8.4'),
(4, 4, '2026-01-14', '2025'),
(1, 6, '2026-01-16', '3.13');


/* -------------------------
   INSERT PRE-REGISTRATION DATA
   ------------------------- */

INSERT INTO Pre_Registration
(User_ID, Software_ID, Registration_Date, Status)
VALUES
(1, 3, '2026-01-05', 'Completed'),
(2, 4, '2026-01-06', 'Pending'),
(3, 1, '2026-01-07', 'Completed'),
(4, 6, '2026-01-08', 'Pending'),
(5, 2, '2026-01-09', 'Completed');


/* -------------------------
   INSERT NOTIFICATION DATA
   ------------------------- */

INSERT INTO Notification
(User_ID, Message, Date)
VALUES
(1, 'Your software request has been approved.', '2026-01-11'),
(2, 'Visual Studio Code installation completed.', '2026-01-12'),
(3, 'Your MySQL request is pending.', '2026-01-13'),
(4, 'Adobe Photoshop license is active.', '2026-01-14'),
(5, 'Your software request was rejected.', '2026-01-15');


/* ============================================================
   5. DQL COMMANDS
   SELECT QUERIES
   ============================================================ */


/* 1. Display all software details */

SELECT *
FROM Software;


/* 2. Display active software */

SELECT Software_Name, Version
FROM Software
WHERE Status = 'Active';


/* 3. Display software by category */

SELECT Software_Name, Category
FROM Software
ORDER BY Category;


/* 4. Count software by category */

SELECT Category, COUNT(*) AS Total_Software
FROM Software
GROUP BY Category;


/* 5. Find software requested by users */

SELECT User_ID, Software_ID, Request_Date
FROM Request
WHERE Status = 'Approved';


/* 6. Display valid licenses */

SELECT Software_ID, License_Key, Expiry_Date
FROM License
WHERE Expiry_Date >= CURRENT_DATE;


/* 7. Display installed software */

SELECT User_ID, Software_ID, Install_Date
FROM Installation;


/* ============================================================
   6. ADDITIONAL DQL QUERIES
   ============================================================ */


/* Display all users */

SELECT *
FROM User;


/* Display all administrators */

SELECT *
FROM Admin;


/* Display all licenses */

SELECT *
FROM License;


/* Display all requests */

SELECT *
FROM Request;


/* Display all installations */

SELECT *
FROM Installation;


/* Display all pre-registrations */

SELECT *
FROM Pre_Registration;


/* Display all notifications */

SELECT *
FROM Notification;


/* Find software in Development category */

SELECT *
FROM Software
WHERE Category = 'Development';


/* Find software released after 2024 */

SELECT Software_Name, Release_Date
FROM Software
WHERE Release_Date > '2024-12-31';


/* Find pending requests */

SELECT *
FROM Request
WHERE Status = 'Pending';


/* Find approved requests */

SELECT *
FROM Request
WHERE Status = 'Approved';


/* Find rejected requests */

SELECT *
FROM Request
WHERE Status = 'Rejected';


/* Count total software */

SELECT COUNT(*) AS Total_Software
FROM Software;


/* Count total users */

SELECT COUNT(*) AS Total_Users
FROM User;


/* Count total licenses */

SELECT COUNT(*) AS Total_Licenses
FROM License;


/* Find software with size greater than 500 MB */

SELECT Software_Name, Size
FROM Software
WHERE Size > 500;


/* Find software with names starting with 'M' */

SELECT *
FROM Software
WHERE Software_Name LIKE 'M%';


/* Find software between two sizes */

SELECT Software_Name, Size
FROM Software
WHERE Size BETWEEN 100 AND 1000;


/* ============================================================
   7. UPDATE COMMANDS
   ============================================================ */


/* Update software status */

UPDATE Software
SET Status = 'Inactive'
WHERE Software_ID = 5;


/* Update request status */

UPDATE Request
SET Status = 'Approved'
WHERE Request_ID = 3;


/* Update user department */

UPDATE User
SET Department = 'Computer Science'
WHERE User_ID = 1;


/* ============================================================
   8. DELETE COMMANDS
   ============================================================ */

/*
   Example DELETE commands.
   Run only when required because foreign keys may
   remove related records.
*/


/*
DELETE FROM Notification
WHERE Notification_ID = 5;
*/


/*
DELETE FROM Request
WHERE Request_ID = 5;
*/


/* ============================================================
   9. JOINS
   ============================================================ */


/* -------------------------
   INNER JOIN
   Display users and requested software
   ------------------------- */

SELECT
    u.User_ID,
    u.Name AS User_Name,
    s.Software_Name,
    r.Request_Date,
    r.Status
FROM User u
INNER JOIN Request r
    ON u.User_ID = r.User_ID
INNER JOIN Software s
    ON r.Software_ID = s.Software_ID;


/* -------------------------
   INNER JOIN
   Display software and licenses
   ------------------------- */

SELECT
    s.Software_ID,
    s.Software_Name,
    s.Version,
    l.License_Key,
    l.Expiry_Date,
    l.License_Type
FROM Software s
INNER JOIN License l
    ON s.Software_ID = l.Software_ID;


/* -------------------------
   INNER JOIN
   Display installed software and users
   ------------------------- */

SELECT
    u.Name AS User_Name,
    s.Software_Name,
    i.Version,
    i.Install_Date
FROM Installation i
INNER JOIN User u
    ON i.User_ID = u.User_ID
INNER JOIN Software s
    ON i.Software_ID = s.Software_ID;


/* -------------------------
   LEFT JOIN
   Display all software and their licenses
   ------------------------- */

SELECT
    s.Software_Name,
    l.License_Key,
    l.Expiry_Date
FROM Software s
LEFT JOIN License l
    ON s.Software_ID = l.Software_ID;


/* -------------------------
   RIGHT JOIN
   Display all licenses and software
   ------------------------- */

SELECT
    s.Software_Name,
    l.License_Key,
    l.Expiry_Date
FROM Software s
RIGHT JOIN License l
    ON s.Software_ID = l.Software_ID;


/* -------------------------
   THREE TABLE JOIN
   Users + Requests + Software
   ------------------------- */

SELECT
    u.Name AS User_Name,
    u.Department,
    s.Software_Name,
    s.Category,
    r.Request_Date,
    r.Status
FROM User u
JOIN Request r
    ON u.User_ID = r.User_ID
JOIN Software s
    ON r.Software_ID = s.Software_ID;


/* ============================================================
   10. RELATIONSHIP QUERIES
   ============================================================ */


/* Users who have installed software */

SELECT DISTINCT
    u.User_ID,
    u.Name,
    u.Department
FROM User u
JOIN Installation i
    ON u.User_ID = i.User_ID;


/* Software installed by each user */

SELECT
    u.Name AS User_Name,
    s.Software_Name,
    i.Install_Date,
    i.Version
FROM User u
JOIN Installation i
    ON u.User_ID = i.User_ID
JOIN Software s
    ON i.Software_ID = s.Software_ID
ORDER BY u.Name;


/* Users who requested software */

SELECT
    u.Name AS User_Name,
    s.Software_Name,
    r.Status
FROM User u
JOIN Request r
    ON u.User_ID = r.User_ID
JOIN Software s
    ON r.Software_ID = s.Software_ID;


/* Software with number of requests */

SELECT
    s.Software_Name,
    COUNT(r.Request_ID) AS Total_Requests
FROM Software s
LEFT JOIN Request r
    ON s.Software_ID = r.Software_ID
GROUP BY s.Software_ID, s.Software_Name;


/* Software with number of installations */

SELECT
    s.Software_Name,
    COUNT(i.Install_ID) AS Total_Installations
FROM Software s
LEFT JOIN Installation i
    ON s.Software_ID = i.Software_ID
GROUP BY s.Software_ID, s.Software_Name;


/* ============================================================
   11. SUBQUERIES
   ============================================================ */


/* Software that has at least one request */

SELECT Software_Name
FROM Software
WHERE Software_ID IN
(
    SELECT Software_ID
    FROM Request
);


/* Users who have made requests */

SELECT Name
FROM User
WHERE User_ID IN
(
    SELECT User_ID
    FROM Request
);


/* Software with size greater than average size */

SELECT Software_Name, Size
FROM Software
WHERE Size >
(
    SELECT AVG(Size)
    FROM Software
);


/* ============================================================
   12. AGGREGATE FUNCTIONS
   ============================================================ */


/* Maximum software size */

SELECT MAX(Size) AS Maximum_Size
FROM Software;


/* Minimum software size */

SELECT MIN(Size) AS Minimum_Size
FROM Software;


/* Average software size */

SELECT AVG(Size) AS Average_Size
FROM Software;


/* Total software size */

SELECT SUM(Size) AS Total_Size
FROM Software;


/* Count software */

SELECT COUNT(*) AS Software_Count
FROM Software;


/* ============================================================
   13. GROUP BY AND HAVING
   ============================================================ */


/* Number of software in each category */

SELECT
    Category,
    COUNT(*) AS Total
FROM Software
GROUP BY Category;


/* Categories having more than one software */

SELECT
    Category,
    COUNT(*) AS Total
FROM Software
GROUP BY Category
HAVING COUNT(*) > 1;


/* Number of requests for each software */

SELECT
    Software_ID,
    COUNT(*) AS Total_Requests
FROM Request
GROUP BY Software_ID;


/* ============================================================
   14. VIEWS
   ============================================================ */


/* -------------------------
   View 1: Active Software
   ------------------------- */

CREATE OR REPLACE VIEW Active_Software AS
SELECT
    Software_ID,
    Software_Name,
    Version,
    Category,
    Size,
    Release_Date,
    Status
FROM Software
WHERE Status = 'Active';


/* Display View */

SELECT *
FROM Active_Software;


/* -------------------------
   View 2: User Requests
   ------------------------- */

CREATE OR REPLACE VIEW User_Requests AS
SELECT
    u.User_ID,
    u.Name AS User_Name,
    s.Software_Name,
    r.Request_Date,
    r.Status
FROM User u
JOIN Request r
    ON u.User_ID = r.User_ID
JOIN Software s
    ON r.Software_ID = s.Software_ID;


/* Display View */

SELECT *
FROM User_Requests;


/* -------------------------
   View 3: Installed Software
   ------------------------- */

CREATE OR REPLACE VIEW Installed_Software AS
SELECT
    u.User_ID,
    u.Name AS User_Name,
    s.Software_Name,
    i.Version,
    i.Install_Date
FROM User u
JOIN Installation i
    ON u.User_ID = i.User_ID
JOIN Software s
    ON i.Software_ID = s.Software_ID;


/* Display View */

SELECT *
FROM Installed_Software;


/* -------------------------
   View 4: Software Licenses
   ------------------------- */

CREATE OR REPLACE VIEW Software_Licenses AS
SELECT
    s.Software_Name,
    s.Version,
    l.License_Key,
    l.Expiry_Date,
    l.License_Type
FROM Software s
JOIN License l
    ON s.Software_ID = l.Software_ID;


/* Display View */

SELECT *
FROM Software_Licenses;


/* ============================================================
   15. STORED PROCEDURE
   ============================================================ */

DELIMITER //

CREATE PROCEDURE GetSoftwareByCategory(
    IN category_name VARCHAR(100)
)
BEGIN
    SELECT
        Software_ID,
        Software_Name,
        Version,
        Category,
        Size,
        Release_Date,
        Status
    FROM Software
    WHERE Category = category_name;
END //

DELIMITER ;


/* Call procedure */

CALL GetSoftwareByCategory('Development');


/* ============================================================
   16. STORED PROCEDURE FOR USER REQUESTS
   ============================================================ */

DELIMITER //

CREATE PROCEDURE GetUserRequests(
    IN input_user_id INT
)
BEGIN
    SELECT
        u.Name AS User_Name,
        s.Software_Name,
        r.Request_Date,
        r.Status
    FROM User u
    JOIN Request r
        ON u.User_ID = r.User_ID
    JOIN Software s
        ON r.Software_ID = s.Software_ID
    WHERE u.User_ID = input_user_id;
END //

DELIMITER ;


/* Call procedure */

CALL GetUserRequests(1);


/* ============================================================
   17. FUNCTION
   ============================================================ */

DELIMITER //

CREATE FUNCTION SoftwareCountByCategory(
    category_name VARCHAR(100)
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(*)
    INTO total
    FROM Software
    WHERE Category = category_name;

    RETURN total;
END //

DELIMITER ;


/* Use function */

SELECT SoftwareCountByCategory('Development')
AS Total_Software;


/* ============================================================
   18. TRIGGER
   Automatically create notification after request
   ============================================================ */

DELIMITER //

CREATE TRIGGER after_req