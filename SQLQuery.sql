--Query-uri : 
--1. Numarul donatorilor nascuti dupa  1994

SELECT FirstName, LastName,  BirthDay, Sex
FROM Donors
where Sex = 'Female'

SELECT  COUNT(DonorID), Sex, BirthDay 
FROM Donors
WHERE  BirthDay > '1994-01-01' AND Type = 'Donor'
GROUP BY Sex, BirthDay
HAVING COUNT(DonorID) > =  1


--2. Lista tuturor donatorilor care au participat la campania X

SELECT * 
FROM Donors

SELECT * 
FROM Colection_Points

SELECT * 
FROM Campains
WHERE Name = 'Campain1'

SELECT d.DonorID, p.Colection_PointID,  d.FirstName, d.LastName
FROM Donors d
INNER JOIN Colection_Points p ON d.DonorID = p.DonorID
INNER JOIN Campains c ON c.Colection_PointID = p.Colection_PointID
WHERE c.Name = 'Campain1'

--3. Numarul donatorilor pacienti

SELECT COUNT(DonorID) as nb_pacients
FROM Donors
WHERE Type LIKE 'Pac%'

--4. Numarul campaniilor efectuate de banca X
SELECT COUNT(c.CampainID) 
FROM Campains c
INNER JOIN Colection_Points p ON c.Colection_PointID = p.Colection_PointID
INNER JOIN Blood_Bank b ON b.Colection_PointID = c.Colection_PointID
WHERE b.Name = 'Bank1'

SELECT * 
FROM Blood_Bank
WHERE Name = 'Bank1'

SELECT * 
FROM Campains

--5. Donatorii cu grupa de sange BI pozitiv care au donat la un punct de colectare din Mures

SELECT d.FirstName, d.LastName, d.Type, t.Description, p.City
FROM Donors d
INNER JOIN Blood_Type t ON t.DonorID = d.DonorID
INNER JOIN Colection_Points p ON p.DonorID = d.DonorID
WHERE d.Type = 'Donor' AND t.Description  LIKE 'BI P%' AND p.City = 'Mures'

SELECT * 
FROM Blood_Type
WHERE Description LIKE 'BI P%'

SELECT * 
FROM Colection_Points
WHERE City = 'Mures'
ORDER BY Name, Address


--6. Numarul bancilor care au obtinut rezerve in urma campaniilor din ultimii 2 ani 
SELECT *
FROM Campains
WHERE Input_Date >= '2018-01-01'

SELECT  COUNT(b.Blood_BankID), b.Name AS Bank_Name, c.Name AS Companie_Name
FROM Blood_Bank b
INNER JOIN Colection_Points p ON b.Colection_PointID = p.Colection_PointID
INNER JOIN Campains c ON c.Colection_PointID = p.Colection_PointID
WHERE c.Input_Date >= '2018-01-01'
GROUP BY b.Name,  c.Name 

-- 7. La cate campanii a participat donatorul cu grupa de sange BIII ?

SELECT *
FROM Donors


SELECT
--COUNT(c.CampainID)
 d.FirstName, d.LastName, t.Description, c.Description AS Campain
FROM Campains c
INNER JOIN Colection_Points p ON p.Colection_PointID = c.Colection_PointID
INNER JOIN Donors d ON d.DonorID = p.DonorID
INNER JOIN Blood_Type t ON t.DonorID = d.DonorID 
WHERE t.Description LIKE 'BIII %' AND d.Type = 'Donor'

-- 8. Numarul comenzilor efectuate de banca X 

SELECT * 
FROM Orders
SELECT * 
FROM Blood_Bank

SELECT COUNT(o.OrderID)
-- o.Description
FROM Orders o 
INNER JOIN Blood_Bank b ON B.Blood_BankID = o.Blood_BankID
WHERE b.Name = 'Bank3'


-- 9. Lista donatorilor cu  grupa BI
SELECT * 
FROM Donors 
WHERE Type = 'Pacient'

SELECT *  
FROM Blood_Type 
WHERE Description LIKE 'BI %'

SELECT d.FirstName, t.Description, d.Type
FROM Donors d
INNER JOIN Blood_Type t ON t.DonorID = d.DonorID
WHERE t.Description LIKE 'BI %' AND d.Type = 'Donor'

-- 10. Numarul punctelor de colectare din fiecare tara

SELECT count(Colection_PointID), Country
FROM Colection_Points
GROUP BY Country
HAVING count(Colection_PointID) > 2
ORDER BY Country
