CREATE DATABASE School;
USE School;


CREATE TABLE Teachers (
   Id INT PRIMARY KEY AUTO_INCREMENT,
   Name VARCHAR(50),
   Subject VARCHAR(30),
   Experience INT,
   Salary DECIMAL(10,2)
);

INSERT INTO Teachers (Name, Subject, Experience, Salary)
VALUES
  ('Alice', 'Mathematics', 8, 4500.00),
  ('Bob', 'Science', 12, 5000.00),
  ('Charlie', 'History', 6, 4000.00),
  ('Diana', 'Geography', 3, 3500.00),
  ('Eve', 'Physics', 15, 5500.00),
  ('Frank', 'Chemistry', 9, 4800.00),
  ('Grace', 'Biology', 10, 4700.00),
  ('Hank', 'English', 4, 3700.00);

DELIMITER //
CREATE TRIGGER Before_Insert_Teacher
BEFORE INSERT ON Teachers
FOR EACH ROW
BEGIN
  IF NEW.Salary < 0 THEN
     SIGNAL SQLSTATE '45000'
     SET MESSAGE_TEXT = 'Slary cannot be negative';
  END IF;
END //
DELIMITER ;

CREATE TABLE Teacher_log (
   Id INT PRIMARY KEY AUTO_INCREMENT,
   Teacher_Id INT,
   Action VARCHAR(50),
   Timestamp DATETIME
);

DELIMITER //
CREATE TRIGGER After_Insert_Teacher
AFTER INSERT ON Teachers
FOR EACH ROW
BEGIN
   INSERT INTO Teacher_log (Teacher_Id, Action, Timestamp)
   VALUES 
      (NEW.Id, 'INSERT', NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_Delete_Teacher
BEFORE DELETE ON Teachers
FOR EACH ROW
BEGIN
   IF OLD.Experience > 10 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Cannot delete a teacher with experience more than 10 years';
   END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER After_Delete_Teacher
AFTER DELETE ON Teachers
FOR EACH ROW
BEGIN
   INSERT INTO Teacher_Log (Teacher_Id, Action, Timestamp)
   VALUES
      (OLD.Id, 'DELETE', NOW());
END //
DELIMITER ;

      



