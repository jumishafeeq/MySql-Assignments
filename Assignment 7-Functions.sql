USE Population;

SELECT * FROM Country;
SELECT * FROM Persons;

-- Adding new column in Person table
ALTER TABLE Persons ADD COLUMN DOB DATE;

UPDATE Persons SET DOB = '1985-05-15' WHERE Id = 1;
UPDATE Persons SET DOB = '1990-03-22' WHERE Id = 2;
UPDATE Persons SET DOB = '1980-11-02' WHERE Id = 3;
UPDATE Persons SET DOB = '1995-07-14' WHERE Id = 5;
UPDATE Persons SET DOB = '1978-09-09' WHERE Id = 6;
UPDATE Persons SET DOB = '1992-12-30' WHERE Id = 7;
UPDATE Persons SET DOB = '1987-06-18' WHERE Id = 4;
UPDATE Persons SET DOB = '1998-01-25' WHERE Id = 8;
UPDATE Persons SET DOB = '1983-04-10' WHERE Id = 9;
UPDATE Persons SET DOB = '1996-08-20' WHERE Id = 10;
UPDATE Persons SET DOB = '1990-02-23' WHERE Id = 11;
UPDATE Persons SET DOB = '1997-08-14' WHERE Id = 12;

-- User Defined Function to calculate Age using DOB
DELIMITER //
CREATE FUNCTION Age(DOB DATE)
RETURNS INT 
DETERMINISTIC
NO SQL
BEGIN
DECLARE Age INT;
SET Age = floor(datediff(current_date(), DOB)/365.25);
RETURN Age;
END //
DELIMITER ;

-- Age of all Persons using the created function 'Age'
SELECT Id, CONCAT(Fname,' ',Lname) AS Full_Name, DOB, Age(DOB) AS Age FROM Persons;

-- Length of each country name in the Country table
SELECT Country_name, LENGTH(Country_name) AS Character_Length FROM Country;

-- First 3 Charecters of each country's name in the Country table
SELECT Country_name, SUBSTRING(Country_name,1,3) AS Short_Name FROM Country;

-- Converting all country names to uppercase and lowercase in the Country table
SELECT Country_name, UPPER(Country_name) AS Uppercase, LOWER(Country_name) AS Lowercase FROM Country;