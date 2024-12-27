USE POPULATION;
SELECT P.Id AS Person_Id, P.Fname, P.Lname, c.Country_name
FROM Persons p
INNER JOIN Country c ON p.Country_Id = c.Id;
SELECT p.Id AS Person_Id, p.Fname, p.Lname, c.Country_name
FROM Persons p
LEFT JOIN Country c ON p.Country_Id = c.Id;
SELECT p.Id AS Person_Id, p.Fname, p.Lname, c.Country_name
FROM Persons p
RIGHT JOIN Country c ON p.Country_Id = c.Id;
SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons;
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;
SELECT Id, Fname, Lname, Population, ROUND(Rating) AS Rounded_Rating, Country_Id, Country_name
FROM Persons;