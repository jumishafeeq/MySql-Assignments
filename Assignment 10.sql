CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    subject VARCHAR(100),
    experience INT,
    salary DECIMAL(10, 2)
);

INSERT INTO teachers (name, subject, experience, salary)
VALUES
('Alice', 'Mathematics', 8, 4500.00),
('Bob', 'Science', 12, 5000.00),
('Charlie', 'History', 6, 4000.00),
('Diana', 'Geography', 3, 3500.00),
('Eve', 'Physics', 15, 5500.00),
('Frank', 'Chemistry', 9, 4800.00),
('Grace', 'Biology', 10, 4700.00),
('Hank', 'English', 4, 3700.00);

DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END $$

DELIMITER ;

CREATE TABLE teacher_log (
    id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END $$

DELIMITER ;