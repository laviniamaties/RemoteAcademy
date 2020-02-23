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
FROM CollectionPoints

SELECT * 
FROM Campaigns
WHERE Name = 'Campaign1'

SELECT d.DonorID, p.ColectionPointID,  d.FirstName, d.LastName, c.Name
FROM Donors d
INNER JOIN Registers r ON r.DonorID = d.DonorID
INNER JOIN CollectionPoints p ON p.CollectionPointID = r.CollectionPointID
INNER JOIN RegisterCampaigns rc ON rc.CollectionPointID = p.CollectionPointID
INNER JOIN Campaigns c ON c.CampaignID = rc.CampaignID
WHERE c.Name = 'Campaign1'

--3. Numarul donatorilor pacienti

SELECT COUNT(DonorID) as nb_pacients
FROM Donors
WHERE Type LIKE 'Pac%'

--4. Numarul campaniilor efectuate de banca X
SELECT COUNT(c.CampaignID) 
FROM Campaigns c
INNER JOIN RegisterCampaigns rc ON rc.CampaignID = c.CampaignID
INNER JOIN CollectionPoints p ON p.CollectionPointID = rc.CollectionPointID
INNER JOIN BloodBanks b ON b.BloodBankID = p.BloodBankID
WHERE b.Name = 'Bank3'

SELECT * 
FROM BloodBanks
WHERE Name = 'Bank3'

SELECT * 
FROM Campaigns

--5. Donatorii cu grupa de sange B pozitiv care au donat la un punct de colectare din Mures

SELECT d.FirstName, d.LastName, d.Type, t.BloodType, p.City
FROM Donors d
INNER JOIN BloodTypes t ON t.BloodTypeID = d.BloodTypeID
INNER JOIN Registers r ON r.DonorID = d.DonorID
INNER JOIN CollectionPoints p ON p.CollectionPointID = r.CollectionPointID
WHERE d.Type = 'Donor' AND t.BloodType  LIKE 'B P%' AND p.City = 'Mures'
ORDER BY d.FirstName, d.LastName,p.City 

SELECT * 
FROM BloodTypes
WHERE BloodType LIKE 'B P%'


--6. Numarul bancilor care au obtinut rezerve in urma campaniilor din ultimii 2 ani 
SELECT *
FROM Campaigns
WHERE StartDate >= '2018-01-01'
SELECT *
FROM BloodBanks

SELECT  COUNT(b.BloodBankID), b.Name AS Bank_Name, c.Name AS Companie_Name, c.StartDate
FROM BloodBanks b
INNER JOIN CollectionPoints p ON b.BloodBankID = p.BloodBankID
INNER JOIN RegisterCampaigns rc ON p.CollectionPointID = rc.CollectionPointID
INNER JOIN Campaigns c ON c.CampaignID = rc.CampaignID
WHERE c.StartDate >= '2018-01-01'
GROUP BY b.Name,  c.Name , c.StartDate

-- 7. La cate campanii a participat donatorul cu grupa de sange A ?

SELECT *
FROM Donors


SELECT
COUNT(DISTINCT c.CampaignID)
-- d.FirstName, d.LastName, t.BloodType, c.Name AS Campaign
FROM Campaigns c
INNER JOIN RegisterCampaigns rc ON  c.CampaignID = rc.CampaignID
INNER JOIN CollectionPoints p ON p.CollectionPointID = rc.CollectionPointID
INNER JOIN Registers r ON p.CollectionPointID = r.CollectionPointID
INNER JOIN Donors d ON d.DonorID = r.DonorID
INNER JOIN BloodTypes t ON t.BloodTypeID = d.BloodTypeID 
WHERE t.BloodType LIKE 'B %' AND d.Type = 'Donor'

-- 8. Numarul comenzilor efectuate de banca X 

SELECT * 
FROM Orders
SELECT * 
FROM BloodBanks

SELECT COUNT(o.OrderID)
-- o.Description
FROM Orders o 
INNER JOIN BloodBanks b ON b.BloodBankID = O.BloodBankID
WHERE b.Name = 'Bank1'


-- 9. Lista donatorilor cu  grupa AB

SELECT *  
FROM BloodTypes 
WHERE BloodType LIKE 'AB %'

SELECT d.FirstName, t.BloodType, d.Type
FROM Donors d
INNER JOIN BloodTypes t ON t.BloodTypeID = d.BloodTypeID
WHERE t.BloodType LIKE 'AB %' AND d.Type = 'Donor'


SELECT TOP 3 Name
FROM CollectionPoints

select distinct name 
from ColectionPoints

Select distinct FirstName
from Donors

SELECT TOP 50 PERCENT * FROM Donors;

-- 10. Numarul punctelor de colectare din fiecare tara in care avem cel putin 2 puncte de colectare

SELECT count(DISTINCT CollectionPointID), Country
FROM CollectionPoints
GROUP BY Country
HAVING count(DISTINCT CollectionPointID) >= 2
ORDER BY Country
