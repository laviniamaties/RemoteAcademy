--creare baza de date Blood donation Tracker ---
CREATE DATABASE BloodDonation

--Tabel 1 : Donors 

CREATE TABLE [Donors](
	[DonorID] uniqueidentifier NOT NULL,
	[BloodTypeID] uniqueidentifier NOT NULL,
	[Sex] nvarchar(50) NOT NULL,
	[Type] nvarchar(50) NOT NULL,
	[FirstName] nvarchar(50) NOT NULL,
	[LastName] nvarchar(50) NOT NULL,
	[Address] nvarchar(150) NOT NULL,
	[City] nvarchar(50) NOT NULL,
	[Country] nvarchar(50) NOT NULL,
	[PhoneNumber] nvarchar(50),
	[EmailAddress] nvarchar(50),
	[BirthDay] date,
CONSTRAINT [PK_Donors] PRIMARY KEY ([DonorID]),
CONSTRAINT [FK_Donors_BloodTypes] FOREIGN KEY ([BloodTypeID])
    REFERENCES [BloodTypes]([BloodTypeID]));

--Tabel 2 : Blood_Types 

CREATE TABLE [BloodTypes](
	[BloodTypeID] uniqueidentifier NOT NULL,
	[BloodType] nvarchar(150) NOT NULL,
CONSTRAINT [PK_BloodTypes] PRIMARY KEY ([BloodTypeID] ));

--Tabel 3 : Colection_Points 
CREATE TABLE [CollectionPoints](
	[CollectionPointID] uniqueidentifier NOT NULL,
	[BloodBankID] uniqueidentifier NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[Address] nvarchar(150) NOT NULL,
	[City] nvarchar(50) NOT NULL,
	[Country] nvarchar(50) NOT NULL,
	[PhoneNumber] nvarchar(50),
	[EmailAddress] nvarchar(50),
CONSTRAINT [PK_Collection_Points] PRIMARY KEY ([CollectionPointID]),
CONSTRAINT [FK_CollectionPoints_BloodBanks] FOREIGN KEY ([BloodBankID])
    REFERENCES [BloodBanks]([BloodBankID]));

CREATE TABLE [Registers](
	[DonorID] uniqueidentifier NOT NULL,
	[CollectionPointID] uniqueidentifier NOT NULL,
CONSTRAINT [PK_Registers] PRIMARY KEY ([DonorID], [CollectionPointID]),
CONSTRAINT [FK_Registers_Donors] FOREIGN KEY ([DonorID])
    REFERENCES [Donors]([DonorID]),
CONSTRAINT [FK_Registers_CollectionPoints] FOREIGN KEY ([CollectionPointID])
    REFERENCES [CollectionPoints]([CollectionPointID]));

--Tabel 4 : Campaigns 
CREATE TABLE [Campaigns](
	[CampaignID] uniqueidentifier NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[Description] nvarchar(150) NOT NULL,
	[StartDate] date NOT NULL,
	[EndDate] date NOT NULL, 
CONSTRAINT [PK_Campaigns] PRIMARY KEY ([CampaignID]));

	CREATE TABLE [RegisterCampaigns](
	[CampaignID] uniqueidentifier NOT NULL,
	[CollectionPointID] uniqueidentifier NOT NULL,
CONSTRAINT [PK_RegisterCampaigns] PRIMARY KEY ([CampaignID], [CollectionPointID]),
CONSTRAINT [FK_RegisterCampaigns_Campaigns] FOREIGN KEY ([CampaignID])
    REFERENCES [Campaigns]([CampaignID]),
CONSTRAINT [FK_RegisterCampaigns_CollectionPoints] FOREIGN KEY ([CollectionPointID])
    REFERENCES [CollectionPoints]([CollectionPointID]));


--Tabel 5 : Blood_Bank 
CREATE TABLE [BloodBanks](
	[BloodBankID] uniqueidentifier NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[Address] nvarchar(150) NOT NULL,
	[City] nvarchar(50) NOT NULL,
	[Country] nvarchar(50) NOT NULL,
	[PhoneNumber] nvarchar(50),
	[EmailAddress] nvarchar(50),
CONSTRAINT [PK_Blood_Bank] PRIMARY KEY ([BloodBankID]));


--Tabel 6 : Orders 
/*
CREATE TABLE [Orders](
	[OrderID] uniqueidentifier NOT NULL,
	[BloodBankID] uniqueidentifier,
	[Description] nvarchar(150) NOT NULL,
CONSTRAINT [PK_Orders] PRIMARY KEY ([OrderID]),
CONSTRAINT [FK_Orders_Blood_Bank] FOREIGN KEY ([BloodBankID])
   REFERENCES [BloodBanks]([BloodBankID])  ON DELETE CASCADE );
   */

 SELECT *
 FROM BloodTypes
 
 INSERT INTO BloodTypes([BloodTypeID], [BloodType] ) VALUES ( NEWID(), '0 Negative');
 INSERT INTO BloodTypes([BloodTypeID] ,[BloodType] ) VALUES ( NEWID(), '0 Positive');
 INSERT INTO BloodTypes([BloodTypeID] ,[BloodType] ) VALUES ( NEWID(), 'A Negative');
 INSERT INTO BloodTypes([BloodTypeID], [BloodType] ) VALUES ( NEWID(), 'A Positive');
 INSERT INTO BloodTypes([BloodTypeID], [BloodType] ) VALUES ( NEWID(), 'B Positive');
 INSERT INTO BloodTypes([BloodTypeID], [BloodType] ) VALUES ( NEWID(), 'B Negative');
 INSERT INTO BloodTypes([BloodTypeID], [BloodType] ) VALUES ( NEWID(), 'AB Negative');
 INSERT INTO BloodTypes([BloodTypeID], [BloodType] ) VALUES ( NEWID(), 'AB Positive');
 
 SELECT *
 FROM BloodTypes

 SELECT *
 FROM Donors

 INSERT INTO Donors([DonorID],[BloodTypeID], [Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(), '4A7B84B9-0D1B-41C5-93B8-33BAF252F0B8',  'Female', 'Donor',   'Popescu',  'Flynn','5661 Turpis. St.','Mures',  'Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com','1998-05-10T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[BloodTypeID], [Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(), 'BCE929AF-6A30-46A1-B6BE-42DF6C77794E' , 'Male',   'Donor',   'Adam',     'Flynn','5662 Turpis. St.','Cluj',   'Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com','1996-05-10T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[BloodTypeID], [Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(), '4A7B84B9-0D1B-41C5-93B8-33BAF252F0B8',  'Male',   'Pacient', 'Marginean','Flynn','5661 Turpis. St.','Fallais','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com','1988-10-10T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[BloodTypeID], [Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(), 'BCE929AF-6A30-46A1-B6BE-42DF6C77794E',  'Male',   'Donor',   'Oroian',   'Flynn','61 Turpis. St.',  'Fallais','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com','1978-04-09T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[BloodTypeID], [Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(), '2AB06E57-4975-4A96-9349-4466464ABFE1',  'Male',   'Donor',   'Moldovan', 'Flynn','66 Turpis. St.',  'Fallais','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com','2000-05-04T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[BloodTypeID], [Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(), '2AB06E57-4975-4A96-9349-4466464ABFE1',  'Male',   'Pacinet', 'Negrescu', 'Flynn','56 Turpis. St.',  'Mures',  'Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com','2010-05-07T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[BloodTypeID], [Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(), '2AB06E57-4975-4A96-9349-4466464ABFE1',  'Female', 'Donor',   'Popescu',  'Flynn','5661 Turpis. St.','Mures',  'Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com','1993-05-08T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[BloodTypeID], [Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(), '6B8C7A77-BB7E-4D95-825D-AAB44FE2A205',  'Female', 'Pacient', 'Rafa',     'Flynn','51 Turpis. St.',  'Cluj',   'Romania','063-511-7196','felis.ullamcorper.viverra@Suspendissenonleo.edu','1987-05-10T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[BloodTypeID], [Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(), '6B8C7A77-BB7E-4D95-825D-AAB44FE2A205',  'Female', 'Donor',   'Enescu',   'Flynn','5 Turpis. St.',   'Fallais','Guinea','063-511-7196','felis.ullamcorper.viverra@Suspendissenonleo.edu','1998-03-10T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[BloodTypeID], [Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(), '06D8FC23-4CB9-4D5A-AE3A-F6E3C9D46D56',  'Female', 'Pacient', 'Calinescu','Flynn','6 Turpis. St.',   'Fallais','Guinea','063-511-7196','felis.ullamcorper.viverra@Suspendissenonleo.edu','1999-02-10T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[BloodTypeID], [Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(), '06D8FC23-4CB9-4D5A-AE3A-F6E3C9D46D56',  'Female', 'Donor',   'Popescu',  'Flynn','1 Turpis. St.',   'Mures',  'Romania','063-511-7196','felis.ullamcorper.viverra@Suspendissenonleo.edu','1967-01-10T13:23:38-07:00');


 SELECT *
 FROM BloodBanks

 INSERT INTO BloodBanks ([BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(),   'Bank1','56 Turpis. St.',  'Cluj',      'Romania', '063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO BloodBanks ([BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(),   'Bank2','61 Turpis. St.',  'Mures',     'Romania', '063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO BloodBanks ([BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(),   'Bank3','566 Turpis. St.', 'Oradea',    'Romania', '063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO BloodBanks ([BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(),   'Bank4','66 Turpis. St.',  'Mures',     'Romania', '063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO BloodBanks ([BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(),   'Bank5','61 Turpis. St.',  'Mehedinti', 'Romania', '063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO BloodBanks ([BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(),   'Bank6','561 Turpis. St.', 'Flynn',     'Guinea',  '063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO BloodBanks ([BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(),   'Bank7','661 Turpis. St.', 'Mures',     'Romania', '063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO BloodBanks ([BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(),   'Bank8','12 Turpis. St.',  'Pariss',    'Franta',  '063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO BloodBanks ([BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(),   'Bank9','61 Turpis. St.',  'Cluj',      'Romania', '063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO BloodBanks ([BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(),   'Bank10','51 Turpis. St.', 'Mures',     'Romania', '063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 

 SELECT * 
 FROM CollectionPoints

 SELECT * 
 fROM BloodBanks

 INSERT INTO CollectionPoints ( [CollectionPointID], [BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '45E90B70-7683-498F-8721-0C9EB924EFD2',  'Donation1','56 Turpis. St.','Cluj','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO CollectionPoints ( [CollectionPointID], [BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '45E90B70-7683-498F-8721-0C9EB924EFD2',  'Donation2','61 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO CollectionPoints ( [CollectionPointID], [BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '45E90B70-7683-498F-8721-0C9EB924EFD2',  'Donatio3','566 Turpis. St.','Oradea','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO CollectionPoints ( [CollectionPointID], [BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '45E90B70-7683-498F-8721-0C9EB924EFD2',  'Donation4','66 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO CollectionPoints ( [CollectionPointID], [BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'D7DEAB6B-D70F-412A-8073-52C3F95D8296',  'Donation5','61 Turpis. St.','Mehedinti','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO CollectionPoints ( [CollectionPointID], [BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'D7DEAB6B-D70F-412A-8073-52C3F95D8296',  'Donation6','561 Turpis. St.','Flynn','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO CollectionPoints ( [CollectionPointID], [BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '07779727-8F10-4FB9-8781-750FA891FC14',  'Donation7','661 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO CollectionPoints ( [CollectionPointID], [BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '07779727-8F10-4FB9-8781-750FA891FC14',  'Donation1','12 Turpis. St.','Pariss','Franta','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO CollectionPoints ( [CollectionPointID], [BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '07779727-8F10-4FB9-8781-750FA891FC14',  'Donation2','61 Turpis. St.','Cluj','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO CollectionPoints ( [CollectionPointID], [BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '07CFFAA5-EF6A-4EEB-AFCC-7A5B722EF369',  'Donation3','51 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO CollectionPoints ( [CollectionPointID], [BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '07CFFAA5-EF6A-4EEB-AFCC-7A5B722EF369',  'Donation4','531 Turpis. St.','Mures','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO CollectionPoints ( [CollectionPointID], [BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'F0D33CAD-FB1A-4CC4-8D4D-B650DB6E895B',  'Donation5','5561 Turpis. St.','Mures','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO CollectionPoints ( [CollectionPointID], [BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'F0D33CAD-FB1A-4CC4-8D4D-B650DB6E895B',  'Donation6','571 Turpis. St.','Mures','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO CollectionPoints ( [CollectionPointID], [BloodBankID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'F0D33CAD-FB1A-4CC4-8D4D-B650DB6E895B',  'Donation1','591 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 


 SELECT * 
 FROM Campaigns

 INSERT INTO Campaigns([CampaignID], [Name], [Description], [StartDate], [EndDate]) VALUES (NEWID(),  'Campaign1', 'Description1',  '2017-01-01',  '2017-01-11');
 INSERT INTO Campaigns([CampaignID], [Name], [Description], [StartDate], [EndDate]) VALUES (NEWID(),  'Campaign2', 'Description2',  '2018-01-02',  '2018-01-15');
 INSERT INTO Campaigns([CampaignID], [Name], [Description], [StartDate], [EndDate]) VALUES (NEWID(),  'Campaign3', 'Description3',  '2016-03-03',  '2016-03-03');
 INSERT INTO Campaigns([CampaignID], [Name], [Description], [StartDate], [EndDate]) VALUES (NEWID(),  'Campaign4', 'Description4',  '2020-01-01',  '2020-02-01');
 INSERT INTO Campaigns([CampaignID], [Name], [Description], [StartDate], [EndDate]) VALUES (NEWID(),  'Campaign5', 'Description5',  '2020-01-01',  '2020-11-01');
 INSERT INTO Campaigns([CampaignID], [Name], [Description], [StartDate], [EndDate]) VALUES (NEWID(),  'Campaign6', 'Description6',  '2017-07-01',  '2017-08-01');
 INSERT INTO Campaigns([CampaignID], [Name], [Description], [StartDate], [EndDate]) VALUES (NEWID(),  'Campaign7', 'Description7',  '2019-09-04',  '2019-12-01');
 INSERT INTO Campaigns([CampaignID], [Name], [Description], [StartDate], [EndDate]) VALUES (NEWID(),  'Campaign8', 'Description8',  '2020-01-10',  '2020-04-01');
 INSERT INTO Campaigns([CampaignID], [Name], [Description], [StartDate], [EndDate]) VALUES (NEWID(),  'Campaign9', 'Description9',  '2020-05-01',  '2020-07-01');
 INSERT INTO Campaigns([CampaignID], [Name], [Description], [StartDate], [EndDate]) VALUES (NEWID(),  'Campaign10','Description10', '2020-10-01',  '2020-08-15');

 SELECT *
 FROM Orders

 SELECT * 
 FROM BloodBanks
/*
INSERT INTO Orders([OrderID], [BloodBankID],[Description]) VALUES (NEWID(),  '45E90B70-7683-498F-8721-0C9EB924EFD2', 'Order1');
INSERT INTO Orders([OrderID], [BloodBankID],[Description]) VALUES (NEWID(),  '45E90B70-7683-498F-8721-0C9EB924EFD2', 'Order2');
INSERT INTO Orders([OrderID], [BloodBankID],[Description]) VALUES (NEWID(),  '45E90B70-7683-498F-8721-0C9EB924EFD2', 'Order3');
INSERT INTO Orders([OrderID], [BloodBankID],[Description]) VALUES (NEWID(),  'BD70ACCD-7D8D-4570-B12A-1D40C5014561', 'Order4');
INSERT INTO Orders([OrderID], [BloodBankID],[Description]) VALUES (NEWID(),  'BD70ACCD-7D8D-4570-B12A-1D40C5014561', 'Order5');
INSERT INTO Orders([OrderID], [BloodBankID],[Description]) VALUES (NEWID(),  'D7DEAB6B-D70F-412A-8073-52C3F95D8296', 'Order6');
INSERT INTO Orders([OrderID], [BloodBankID],[Description]) VALUES (NEWID(),  'D7DEAB6B-D70F-412A-8073-52C3F95D8296', 'Order7');
INSERT INTO Orders([OrderID], [BloodBankID],[Description]) VALUES (NEWID(),  'D7DEAB6B-D70F-412A-8073-52C3F95D8296', 'Order8');
*/

SELECT * 
FROM Registers

SELECT * 
FROM Donors
SELECT * 
FROM CollectionPoints

INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('8EE7A25D-88F5-4EBE-A1E1-076FDB31CFCB', 'A2376DF2-2447-4D9E-887E-050843D0D9EE');
INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('8EE7A25D-88F5-4EBE-A1E1-076FDB31CFCB', '15A56DB1-151B-4C9C-ADF5-2EC0FA6A8E78');
INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('8EE7A25D-88F5-4EBE-A1E1-076FDB31CFCB', '2E8E56C0-2CC8-4652-AA0C-493926883749');
INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('9BE6E102-679F-41E5-A208-6AB3DC930BC3', 'A2376DF2-2447-4D9E-887E-050843D0D9EE');
INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('9BE6E102-679F-41E5-A208-6AB3DC930BC3', '2E8E56C0-2CC8-4652-AA0C-493926883749');
INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('86C1C224-57B1-48A2-8E01-A9FE18FE5F5A', '79032308-EC7A-495F-BBE0-6396A7EAEDAD');
INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('86C1C224-57B1-48A2-8E01-A9FE18FE5F5A', '15A56DB1-151B-4C9C-ADF5-2EC0FA6A8E78');
INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('86C1C224-57B1-48A2-8E01-A9FE18FE5F5A', '4CB9D035-F9EF-4112-B432-59C009161C80');
INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('20B6C5CD-423D-4D2A-9182-B4E10EC020C3', '1770798E-B23E-4327-B63F-7C8ABAE268B6');
INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('20B6C5CD-423D-4D2A-9182-B4E10EC020C3', '689F5C8E-6333-4799-B0CF-CA1D78E751B3');
INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('6C89265A-0442-43FF-AEAA-D9AD1C8FA7C1', '1770798E-B23E-4327-B63F-7C8ABAE268B6');
INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('6C89265A-0442-43FF-AEAA-D9AD1C8FA7C1', '689F5C8E-6333-4799-B0CF-CA1D78E751B3');
INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('6C89265A-0442-43FF-AEAA-D9AD1C8FA7C1', 'A2376DF2-2447-4D9E-887E-050843D0D9EE');
INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('BFA4DF5E-9F8B-4A74-838D-7782978E6A67', '1770798E-B23E-4327-B63F-7C8ABAE268B6');
INSERT INTO Registers ([DonorID], [CollectionPointID]) VALUES ('BFA4DF5E-9F8B-4A74-838D-7782978E6A67', '689F5C8E-6333-4799-B0CF-CA1D78E751B3');


SELECT * 
FROM RegisterCampaigns

SELECT * 
FROM CollectionPoints
SELECT * 
FROM Campaigns
 
 INSERT INTO RegisterCampaigns ([CampaignID], [CollectionPointID]) VALUES ('A8A94419-17CF-4EB4-A13B-31EC4C2D62C2' , '6849AECD-8C43-40F9-8B8C-2EF8C3224C42');
 INSERT INTO RegisterCampaigns ([CampaignID], [CollectionPointID]) VALUES ('A8A94419-17CF-4EB4-A13B-31EC4C2D62C2' , '2E8E56C0-2CC8-4652-AA0C-493926883749');
 INSERT INTO RegisterCampaigns ([CampaignID], [CollectionPointID]) VALUES ('60BA1784-FA6E-4198-8332-4BBD1711AF5E' , '2E8E56C0-2CC8-4652-AA0C-493926883749');
 INSERT INTO RegisterCampaigns ([CampaignID], [CollectionPointID]) VALUES ('60BA1784-FA6E-4198-8332-4BBD1711AF5E' , '576193C2-61C0-4137-8DEB-549DAB5EB33E');
 INSERT INTO RegisterCampaigns ([CampaignID], [CollectionPointID]) VALUES ('89F9265A-E04C-4DC8-9664-6272A2EBC0E9' , 'A2376DF2-2447-4D9E-887E-050843D0D9EE');
 INSERT INTO RegisterCampaigns ([CampaignID], [CollectionPointID]) VALUES ('89F9265A-E04C-4DC8-9664-6272A2EBC0E9' , '15A56DB1-151B-4C9C-ADF5-2EC0FA6A8E78');
 INSERT INTO RegisterCampaigns ([CampaignID], [CollectionPointID]) VALUES ('89F9265A-E04C-4DC8-9664-6272A2EBC0E9' , '101AA81D-9619-4863-B24E-BD073BDC3A6B');
 INSERT INTO RegisterCampaigns ([CampaignID], [CollectionPointID]) VALUES ('C948309E-8B9B-46F7-A910-70BD22778A74' , '266BD326-CF99-43CE-B5C1-C6BB59AFD6AA');
 INSERT INTO RegisterCampaigns ([CampaignID], [CollectionPointID]) VALUES ('C948309E-8B9B-46F7-A910-70BD22778A74' , '689F5C8E-6333-4799-B0CF-CA1D78E751B3');
 INSERT INTO RegisterCampaigns ([CampaignID], [CollectionPointID]) VALUES ('C948309E-8B9B-46F7-A910-70BD22778A74' , '71B5867A-70D5-40F5-B657-CB0F662CFD00');
 INSERT INTO RegisterCampaigns ([CampaignID], [CollectionPointID]) VALUES ('8D8B6AA3-31F7-499B-879D-D4ACD0F980EA' , '15A56DB1-151B-4C9C-ADF5-2EC0FA6A8E78');
 INSERT INTO RegisterCampaigns ([CampaignID], [CollectionPointID]) VALUES ('8D8B6AA3-31F7-499B-879D-D4ACD0F980EA' , '6849AECD-8C43-40F9-8B8C-2EF8C3224C42');
 INSERT INTO RegisterCampaigns ([CampaignID], [CollectionPointID]) VALUES ('8D8B6AA3-31F7-499B-879D-D4ACD0F980EA' , '2E8E56C0-2CC8-4652-AA0C-493926883749');
