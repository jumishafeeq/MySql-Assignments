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
(1, 'John', 'Doe', 0, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 0, 4.8, 1, 'USA'),
(3, 'Raj', 'Kumar', 0, 4.0, 2, 'India'),
(4, 'Rose', 'Marry', 0, 4.3, 3, 'China'),
(5, 'Emily', 'Clark', 0, 4.7, 4, 'Canada'),
(6, 'Steve', 'Brown', 0, 4.2, 5, 'Australia'),
(7, 'Alice', 'Green', 0, 3.9, NULL, NULL),
(8, 'Roy', 'Thomas', 0, 4.6, 6, 'UK'),
(9, 'Sara', 'Jone', 0, 3.8, 1, 'USA'),
(10, 'Anna', 'Taylor', 0, 4.9, 4, 'Canada');

SELECT * FROM Persons;

SELECT DISTINCT Country_Name FROM Persons;

SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;

SELECT * FROM Persons WHERE Rating >4.0;

SELECT * FROM Country WHERE Population >1000000;

SELECT * FROM Persons WHERE Country_Name = 'USA' OR Rating >4.5;

SELECT * FROM Persons WHERE Country_Name IS NULL;

SELECT * FROM Persons WHERE Country_Name IN ('USA','UK','Canada');

SELECT * FROM Persons WHERE Country_Name NOT IN ('India','Australia');

SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

SELECT * FROM Country WHERE Country_Name NOT LIKE 'C%';