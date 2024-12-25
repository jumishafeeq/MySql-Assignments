CREATE DATABASE Population;
USE Population;

-- Create the Country table 
CREATE TABLE Country (
Id INT PRIMARY KEY,
Country_Name VARCHAR(100),
Population INT,
Area INT );

-- Create the Person table
CREATE TABLE Persons (
Id INT PRIMARY KEY,
Fname VARCHAR(30),
Lname VARCHAR(30),
Population int,
Rating DECIMAL(2,1),
Country_Id INT,
Country_Name VARCHAR(100),
FOREIGN KEY (Country_Id) REFERENCES Country(Id));

-- Insert rows into the Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9834000),
(2, 'India', 1393409038, 3287263),
(3, 'China', 1444216107, 9596961),
(4, 'Canada', 38008005, 9984670),
(5, 'Australia', 25687041, 7692024),
(6, 'UK', 68207114, 242495),
(7, 'France', 67413000, 551695),
(8, 'Germany', 83166711, 357022),
(9, 'Japan', 125960000, 377975),
(10, 'Brazil', 213993437, 8515770);

SELECT * FROM Country;

-- Insert rows into the Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 67413000, 4.5, 7, 'France'),
(2, 'Jane', 'Smith', 331000000, 4.8, 1, 'USA'),
(3, 'Raj', 'Kumar', 1393409038, 4.0, 2, 'India'),
(4, 'Rose', 'Marry', 1393409038, 4.3, 2, 'India'),
(5, 'Emily', 'Clark', 38008005, 4.7, 4, 'Canada'),
(6, 'Steve', 'Brown', 25687041, 4.2, 5, 'Australia'),
(7, 'Alice', 'Green', 83166711, 3.9, 8, 'Germany'),
(8, 'Roy', 'Thomas', 68207114, 4.6, 6, 'UK'),
(9, 'Sara', 'Jone', 331000000, 3.8, 1, 'USA'),
(10, 'Anna', 'Taylor', 38008005, 4.9, 4, 'Canada');

SELECT * FROM Persons;

-- First three characters of Country_name from the Country table
SELECT substring(Country_name, 1, 3) AS Short_name FROM Country;

-- Concatenate first name and last name from person table
SELECT CONCAT(Fname,' ', Lname) AS Full_name FROM Persons;

-- Count the no.of unique country names from person table
SELECT COUNT(DISTINCT(Country_name)) AS Unique_Country_count FROM Persons;

SELECT MAX(Population) AS Maximum_population FROM Country;

SELECT MIN(Population) AS Minimum_population FROM Persons;

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES 
(11, 'Rahul', NULL, 1393409038, 3.5, 2, 'India'),
(12, 'Toms', NULL, 331000000, 4.0, 1, 'USA');

SELECT COUNT(Lname) AS Count_LastNames FROM Persons WHERE Lname IS NOT NULL;

SELECT COUNT(*) AS Total_Rows FROM Persons;

SELECT Population FROM Persons LIMIT 3;

SELECT * FROM Country ORDER BY RAND() LIMIT 3;

SELECT * FROM Persons ORDER BY Rating DESC;

SELECT Country_name, SUM(Population) AS Total_Population From Persons GROUP BY Country_name;

SELECT Country_name, SUM(Population) AS Total_Population FROM Persons GROUP BY Country_name HAVING Total_Population > 50000;

SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Average_Rating FROM Persons GROUP BY Country_name HAVING Total_Persons > 2 ORDER BY Average_Rating ASC;
