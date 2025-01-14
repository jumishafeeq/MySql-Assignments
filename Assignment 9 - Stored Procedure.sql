CREATE DATABASE Company;
USE Company;

CREATE TABLE Worker (
     Worker_Id INT PRIMARY KEY, 
     First_Name CHAR(25),
     Last_Name CHAR(25),
     Salary INT(15),
     Joining_Date DATETIME,
     Department CHAR(25));

DESC Worker;

INSERT INTO Worker (Worker_Id, First_Name, Last_Name, Salary, Joining_Date, Department)
VALUES
    (1, 'John', 'Doe', 50000, '2023-01-01 09:00:00', 'HR'),
    (2, 'Jane', 'Smith', 60000, '2023-02-01 09:00:00', 'Finance'),
    (3, 'Emily', 'Johnson', 55000, '2023-03-01 09:00:00', 'IT'),
    (4, 'Michael', 'Brown', 70000, '2023-04-01 09:00:00', 'HR'),
    (5, 'Rose', 'Marry', 80000, '2023-05-01 09:00:00', 'Finance'),
    (6, 'David', 'Clark', 48000, '2023-07-01 09:00:00', 'Marketing'),
    (7, 'Sophia', 'Harris', 62000, '2023-08-01 09:00:00', 'IT'),
    (8, 'Daniel', 'Martinez', 54000, '2023-09-01 09:00:00', 'HR'),
    (9, 'Olivia', 'Garcia', 70000, '2023-10-01 09:00:00', 'Finance'),
    (10, 'James', 'Lee', 52000, '2023-11-01 09:00:00', 'Engineering');
    
    SELECT * FROM Worker;
    
-- stored procedure for adds a new record to the table and then invokes the procedure call.
DELIMITER //
CREATE PROCEDURE Add_Record(
     IN WorkerId INT, 
     IN FName CHAR(25), 
     IN LName CHAR(25), 
     IN Slry INT(15), 
     IN JoinDate DATETIME, 
     IN Dprtmt CHAR(25))
BEGIN
INSERT INTO Worker(Worker_Id, First_name, Last_Name, Salary, Joining_Date, Department)
VALUES(WorkerId, FName, LName, Slry, JoinDate, Dprtmt);
END //
DELIMITER ;

CALL Add_Record(11, 'Sarah','Wilson', 60000, '2023-12-01 09:00:00', 'Engineering');

SELECT * FROM Worker;

--  stored procedure for retrieve the salary of the worker with the given ID and returns it in the p_salary parameter.
DELIMITER //
CREATE PROCEDURE Workers_Salary(IN P_WorkerId INT, OUT P_Salary INT)
BEGIN
SELECT Salary INTO P_Salary FROM Worker WHERE Worker_Id = P_WorkerId;
END //
DELIMITER ;

SET @P_Salary = 0;
CALL Workers_Salary(11, @P_Salary);
SELECT @P_Salary AS Salary;
     
-- Stored Procedure for update the department of the worker with the given ID.
DELIMITER //
CREATE PROCEDURE Update_Department(IN P_WorkerId INT, IN P_Department CHAR(25))
BEGIN
Update Worker SET Department = P_Department WHERE Worker_Id = P_WorkerId;
END //
DELIMITER ;

CALL Update_Department(1,'Admin');
SELECT * FROM Worker;

-- Stored Procedure for retrieve the number of workers in the given department and returns it in the p_workerCount parameter.
DELIMITER //
CREATE PROCEDURE Workers_Count(IN P_Department CHAR(25), OUT P_WorkerCount INT)
BEGIN
SELECT COUNT(*) INTO P_WorkerCount FROM Worker WHERE Department = P_Department;
END //
DELIMITER ;

SET @P_WorkerCount = 0;
CALL Workers_Count('Finance', @P_WorkerCount);
SELECT @P_WorkerCount AS No_of_workers;

-- Stored Procedure for retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter 
DELIMITER //
CREATE PROCEDURE Average_Salary(IN P_Department CHAR(25), OUT P_AvgSalary DECIMAL(10,2))
BEGIN
SELECT AVG(Salary) INTO P_AvgSalary FROM Worker WHERE Department = P_Department;
END //
DELIMITER ;

SET @P_AvgSalary = 0;
CALL Average_Salary('Finance', @P_AvgSalary);
SELECT @P_AvgSalary AS Average_Salary;
