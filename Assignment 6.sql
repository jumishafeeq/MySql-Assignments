USE POPULATION;

-- INNER JOIN
SELECT P.Id AS Person_Id, P.Fname AS First_Name, P.Lname AS Last_Name, C.Country_name FROM Persons P
INNER JOIN Country C ON P.Country_Id = C.Id;

-- LEFT JOIN
SELECT P.Id AS Person_Id, P.Fname AS First_Name, P.Lname AS Last_Name, C.Country_name FROM Persons P
LEFT JOIN Country C ON P.Country_Id = C.Id;

-- RIGHT JOIN
SELECT P.Id AS Person_Id, P.Fname AS First_Name, P.Lname AS Last_Name, C.Country_name FROM Persons P
RIGHT JOIN Country C ON P.Country_Id = C.Id;

-- All distinct country from both table
SELECT Country_name FROM Country
UNION
SELECT Country_name FROM Persons;

-- All country names from both tables (include duplicates)
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

-- Round the ratings of all persons to the nearest integer
SELECT Id, Fname AS First_Name, Lname AS Last_Name, Population, ROUND(Rating) AS Rounded_Rating, Country_Id, Country_name
FROM Persons;