USE Population;

SELECT * FROM Country;
SELECT * FROM Persons;

-- Find the number of persons in each country.
SELECT Country_Name, COUNT(Id) AS No_of_persons FROM Persons GROUP BY Country_Name;

-- Find the number of persons in each country sorted from high to low.
SELECT Country_Name, COUNT(Id) AS No_of_persons FROM Persons GROUP BY Country_Name ORDER BY No_of_persons DESC;

-- Find an average rating for Persons in respective countries if the average is greater than 3.0
SELECT Country_Name, AVG(Rating) AS Average_Rating FROM Persons GROUP BY Country_Name HAVING Average_Rating > 3.0;

-- Find the countries with the same rating as the USA. (Use Subqueries)
SELECT Country_Name, AVG(Rating) AS Average_Rating FROM Persons GROUP BY Country_Name
HAVING AVG(Rating) = (SELECT AVG(Rating) FROM Persons WHERE Country_Name = 'USA');

-- Find all countries whose population is greater than the average population of all nations.
SELECT Country_Name, Population FROM Country WHERE Population > (SELECT AVG(Population) FROM Country);

-- Create the Product database
CREATE DATABASE Products;
USE Products;

-- Create the Customer table
CREATE TABLE Customer (
Customer_Id INT PRIMARY KEY,
First_Name VARCHAR(30),
Last_Name VARCHAR(30),
Email VARCHAR(100),
Phone_No VARCHAR(15),
Address VARCHAR(200), 
City VARCHAR(30),
State VARCHAR(30),
Zip_Code VARCHAR(10),
Country VARCHAR(30));

-- Insert values into the Customer table
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(1, 'John', 'Doe', 'johndoe@gmail.com', '123-456-7890', '123 Elm Street', 'Los Angeles', 'California', '90001', 'USA'),
(2, 'Jane', 'Smith', 'janesmith@gmail.com', '234-567-8901', '456 Oak Avenue', ' New York', 'New York', '10006', 'USA'),
(3, 'Alice', 'Johnson', 'alicejohnson@gmail.com', '345-678-9012', '789 Pine Road', 'New York', 'New York', '10001', 'USA'),
(4, 'James', 'Smith', 'jamessmith@gmail.com', '456-789-0123', '1725 Slough Avenue', 'New York', 'New York', '10002', 'USA'),
(5, 'Sophia', 'Johnson', 'sophiajohnson@gmail.com', '567-890-1234', 'Central Perk Cafe', 'New York', 'New York', '10004', 'USA'),
(6, 'Ethan', 'Brown', 'ethanbrown@gmail.com', '678-901-2345', '90 Bedford Street', 'New York', 'New York', '10005', 'USA'),
(7, 'Haruto', 'Tanaka', 'harutotanaka@gmail.com', '123-456-7891', '10 Sakura Street', 'Tokyo', 'Tokyo', '100-0001', 'Japan'),
(8, 'Yuki', 'Sato', 'yukisato@gmail.com', '234-567-8902', '20 Shibuya Crossing', 'Tokyo', 'Tokyo', '150-0001', 'Japan'),
(9, 'Alexander', 'Ivanov', 'alexanderivanov@gmail.com', '010-123-4567', '100 Red Square', 'Moscow', 'Moscow', '101000', 'Russia'),
(10, 'David', 'Garcia', 'davidgarcia@gmail.com', '012-345-6789', '456 Oak Avenue', 'New York', 'New York', '10003', 'USA'),
(11, 'Arjun', 'Sharma', 'arjunsharma@gmail.com', '9876543210', '12 MG Road', 'Mumbai', 'Maharashtra', '400001', 'India'),
(12, 'Emma', 'Jones', 'emmajones@gmail.com', '202-345-6789', '25 Kangaroo Street', 'Sydney', 'New South Wales', '2000', 'Australia'),
(13, 'Sarah', 'Taylor', 'sarahtaylor@gmail.com', '023-456-7890', '15 Berlin Platz', 'Moscow', 'Moscow', '101150', 'Germany'),
(14, 'Rohit', 'Shinde', 'rohitshinde@gmail.com', '9876543211', '12 Shivaji Park', 'Mumbai', 'Maharashtra', '400001', 'India'),
(15, 'Sneha', 'Kulkarni', 'snehakulkarni@gmail.com', '8765432108', '45 JM Road', 'Pune', 'Maharashtra', '411001', 'India'),
(16, 'Priya', 'Gupta', 'priyagupta@gmail.com', '9876543211', '56 Anna Salai', 'Chennai', 'Tamil Nadu', '600003', 'India'),
(17, 'Ravi', 'Kumar', 'ravikumar@gmail.com', '9876543212', '56 Anna Salai', 'Chennai', 'Tamil Nadu', '600002', 'India');
SELECT * FROM Customer;

-- Create a view named customer_info for the Customer table that displays Customer’s Full name and email address.
CREATE VIEW Customer_info AS SELECT CONCAT(First_Name, Last_Name) AS Full_Name, Email FROM Customer;

SELECT * FROM Customer_info;

-- Create a view named US_Customers that displays customers located in the US
CREATE VIEW US_Customers AS SELECT * FROM Customer WHERE Country = 'USA';

SELECT * FROM US_Customers;

-- Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.
CREATE VIEW Customer_details AS SELECT CONCAT(First_Name, Last_Name) AS Full_name, Email, Phone_No, State FROM Customer;

SELECT * FROM Customer_details;

--  Update phone numbers of customers who live in California for Customer_details view
SET SQL_SAFE_UPDATES = 0;

UPDATE Customer SET Phone_No = '123-456-7800' WHERE State = 'california';

SET SQL_SAFE_UPDATES = 1;

-- Count the number of customers in each state and show only states with more than 5 customers
SELECT State, COUNT(*) AS No_of_Customer FROM Customer GROUP BY State HAVING No_of_Customer >5;

-- Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view
SELECT State, COUNT(*) AS No_of_Customer FROM Customer_details GROUP BY State;

-- Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
SELECT * FROM Customer_details ORDER BY State ASC;


