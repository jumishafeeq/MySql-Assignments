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
(10, 'Bahrain', 1623662, 760);

SELECT * FROM Country;

-- Insert rows into the Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 67413000, 4.5, 7, 'France'),
(2, 'Jane', 'Smith', 331000000, 4.8, 1, 'USA'),
(3, 'Raj', 'Kumar', 1393409038, 4.0, 2, 'India'),
(4, 'Rose', 'Marry', 0, 4.3, NULL, NULL),
(5, 'Emily', 'Clark', 38008005, 4.7, 4, 'Canada'),
(6, 'Steve', 'Brown', 25687041, 4.2, 5, 'Australia'),
(7, 'Alice', 'Green', 83166711, 3.9, 8, 'Germany'),
(8, 'Roy', 'Thomas', 68207114, 4.6, 6, 'UK'),
(9, 'Sara', 'Jone', 331000000, 3.8, 1, 'USA'),
(10, 'Anna', 'Taylor', 38008005, 4.9, 4, 'Canada');

SELECT * FROM Persons;

-- The distinct country names from the Persons table
SELECT DISTINCT Country_Name FROM Persons;

-- First names and last names from the Persons table with aliases
SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;

-- All persons with a rating greater than 4.0
SELECT * FROM Persons WHERE Rating > 4.0;

-- Countries with a population greater than 10 lakhs
SELECT * FROM Country WHERE Population >1000000;

-- Persons who are from 'USA' or have a rating greater than 4.5
SELECT * FROM Persons WHERE Country_Name = 'USA' OR Rating > 4.5;

-- All persons where the country name is NULL
SELECT * FROM Persons WHERE Country_Name IS NULL;

-- All persons from the countries 'USA', 'Canada', and 'UK'
SELECT * FROM Persons WHERE Country_Name IN ('USA','UK','Canada');

-- All persons not from the countries 'India' and 'Australia'
SELECT * FROM Persons WHERE Country_Name NOT IN ('India','Australia');

-- All countries with a population between 5 lakhs and 20 lakhs
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

-- All countries whose names do not start with 'C'
SELECT * FROM Country WHERE Country_Name NOT LIKE 'C%';