--creare baza de date Blood donation Tracker ---
create database BloodDonationTracker

--DROP TABLE 

--Tabel 1 : Donors 

CREATE TABLE [Donors](
	[DonorID] uniqueidentifier NOT NULL,
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
CONSTRAINT [PK_Donors] PRIMARY KEY ([DonorID]));

--Tabel 2 : Blood_Types 

CREATE TABLE [Blood_Type](
	[Blood_TypeID] uniqueidentifier NOT NULL,
	[DonorID] uniqueidentifier NOT NULL,
	[Description] nvarchar(150) NOT NULL,
CONSTRAINT [PK_Blood_Type] PRIMARY KEY ([Blood_TypeID]),
CONSTRAINT [FK_Blood_Type_Donors] FOREIGN KEY ([DonorID])
    REFERENCES [Donors]([DonorID]));

	DROP TABLE Blood_Type

--Tabel 3 : Colection_Points 
CREATE TABLE [Colection_Points](
	[Colection_PointID] uniqueidentifier NOT NULL,
	[DonorID] uniqueidentifier,
	[Name] nvarchar(50) NOT NULL,
	[Address] nvarchar(150) NOT NULL,
	[City] nvarchar(50) NOT NULL,
	[Country] nvarchar(50) NOT NULL,
	[PhoneNumber] nvarchar(50),
	[EmailAddress] nvarchar(50),
CONSTRAINT [PK_Colection_Points] PRIMARY KEY ([Colection_PointID]),
CONSTRAINT [FK_Colection_Points_Donors] FOREIGN KEY ([DonorID])
    REFERENCES [Donors]([DonorID]));

--Tabel 4 : Campains 
CREATE TABLE [Campains](
	[CampainID] uniqueidentifier NOT NULL,
	[Colection_PointID] uniqueidentifier ,
	[Name] nvarchar(50) NOT NULL,
	[Description] nvarchar(150) NOT NULL,
	[Input_Date] date NOT NULL,
	[Days] nvarchar(10) NOT NULL ,
CONSTRAINT [PK_Campains] PRIMARY KEY ([CampainID]),
CONSTRAINT [FK_Campain_Colection_Points] FOREIGN KEY ([Colection_PointID])
    REFERENCES [Colection_Points]([Colection_PointID])
	);

drop table Campains;

--Tabel 5 : Blood_Bank 
CREATE TABLE [Blood_Bank](
	[Blood_BankID] uniqueidentifier NOT NULL,
	[Colection_PointID] uniqueidentifier ,
	[Name] nvarchar(50) NOT NULL,
	[Address] nvarchar(150) NOT NULL,
	[City] nvarchar(50) NOT NULL,
	[Country] nvarchar(50) NOT NULL,
	[PhoneNumber] nvarchar(50),
	[EmailAddress] nvarchar(50),
CONSTRAINT [PK_Blood_Bank] PRIMARY KEY ([Blood_BankID], [Colection_PointID]),
CONSTRAINT [FK_Blood_Bank_Colection_Points] FOREIGN KEY ([Colection_PointID])
    REFERENCES [Colection_Points]([Colection_PointID]));



--Tabel 6 : Orders 
--CREATE TABLE [Orders](
--	[OrdersID] uniqueidentifier NOT NULL,
--	[Blood_BankID] uniqueidentifier NOT NULL,
--	[Description] nvarchar(150) NOT NULL,
--CONSTRAINT [PK_Orders] PRIMARY KEY ([OrdersID]),
--CONSTRAINT [FK_Orders_Blood_Bank] FOREIGN KEY ([Blood_BankID])
 --   REFERENCES [Blood_Bank]([Blood_BankID]));

 SELECT *
 FROM Donors

 INSERT INTO Donors([DonorID],[Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(),'Female', 'Donor', 'Popescu','Flynn','5661 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com','1998-05-10T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(),'Male', 'Donor', 'Adam','Flynn','5662 Turpis. St.','Cluj','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com','1996-05-10T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(),'Male', 'Pacient', 'Marginean','Flynn','5661 Turpis. St.','Fallais','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com','1988-10-10T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(),'Male', 'Donor', 'Oroian','Flynn','61 Turpis. St.','Fallais','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com','1978-04-09T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(),'Male', 'Donor', 'Moldovan','Flynn','66 Turpis. St.','Fallais','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com','2000-05-04T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(),'Male', 'Pacinet', 'Negrescu','Flynn','56 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com','2010-05-07T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(),'Female', 'Donor', 'Popescu','Flynn','5661 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com','1993-05-08T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(),'Female', 'Pacient', 'Rafa','Flynn','51 Turpis. St.','Cluj','Romania','063-511-7196','felis.ullamcorper.viverra@Suspendissenonleo.edu','1987-05-10T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(),'Female', 'Donor', 'Enescu','Flynn','5 Turpis. St.','Fallais','Guinea','063-511-7196','felis.ullamcorper.viverra@Suspendissenonleo.edu','1998-03-10T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(),'Female', 'Pacient', 'Calinescu','Flynn','6 Turpis. St.','Fallais','Guinea','063-511-7196','felis.ullamcorper.viverra@Suspendissenonleo.edu','1999-02-10T13:23:38-07:00');
 INSERT INTO Donors([DonorID],[Sex], [Type], [FirstName],[LastName],[Address],[City],[Country],[PhoneNumber],[EmailAddress],[BirthDay]) VALUES(NEWID(),'Female', 'Donor', 'Popescu','Flynn','1 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@Suspendissenonleo.edu','1967-01-10T13:23:38-07:00');


 SELECT *
 FROM Blood_Type

  SELECT * 
 FROM Donors
 
 INSERT INTO Blood_Type([Blood_TypeID], [DonorID], [Description] ) VALUES (NEWID(), '7C9ADF58-2C0F-4471-9483-03296CDEBD8E', 'BI Negative');
 INSERT INTO Blood_Type([Blood_TypeID], [DonorID], [Description] ) VALUES (NEWID(), 'A8E61FD8-013E-4618-A522-0FD61DC11863', 'BI Positive');
 INSERT INTO Blood_Type([Blood_TypeID], [DonorID], [Description] ) VALUES (NEWID(), 'F7730A8A-9464-4EA9-9DCD-135AE4795ED3', '0 Negative');
 INSERT INTO Blood_Type([Blood_TypeID], [DonorID], [Description] ) VALUES (NEWID(), '1D77070D-5EA0-4FB7-BD95-229337B8A794', '0 Positive');
 INSERT INTO Blood_Type([Blood_TypeID], [DonorID], [Description] ) VALUES (NEWID(), 'A787074D-6BF4-4B78-8380-499E86CADC09', 'BII Negative');
 INSERT INTO Blood_Type([Blood_TypeID], [DonorID], [Description] ) VALUES (NEWID(), '46816FDC-318D-492C-A6D4-507927FF7B02', 'BIII Negative');
 INSERT INTO Blood_Type([Blood_TypeID], [DonorID], [Description] ) VALUES (NEWID(), 'C11956E7-B7F9-437F-B5F1-60A677756999', 'AB Negative');
 INSERT INTO Blood_Type([Blood_TypeID], [DonorID], [Description] ) VALUES (NEWID(), '6DFC5B96-30BE-4D7A-B76B-A1444D7F9FF4', 'AI Negative');
 INSERT INTO Blood_Type([Blood_TypeID], [DonorID], [Description] ) VALUES (NEWID(), '1C5404B7-0E60-45D7-BDCB-B672E40291E7', 'AII Negative');
 INSERT INTO Blood_Type([Blood_TypeID], [DonorID], [Description] ) VALUES (NEWID(), '0A1A5732-DC60-440B-B34F-D1CD412F946A', 'ABIV Positive');
 INSERT INTO Blood_Type([Blood_TypeID], [DonorID], [Description] ) VALUES (NEWID(), 'C367660F-DC4A-477A-B363-FB112EFF7855', 'BI Positive');

 SELECT * 
 FROM Colection_Points

 SELECT * 
 fROM Donors

 INSERT INTO Colection_Points ( [Colection_PointID], [DonorID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '7C9ADF58-2C0F-4471-9483-03296CDEBD8E',  'Donation1','56 Turpis. St.','Cluj','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Colection_Points ( [Colection_PointID], [DonorID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '7C9ADF58-2C0F-4471-9483-03296CDEBD8E',  'Donation2','61 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Colection_Points ( [Colection_PointID], [DonorID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'A8E61FD8-013E-4618-A522-0FD61DC11863',  'Donatio3','566 Turpis. St.','Oradea','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Colection_Points ( [Colection_PointID], [DonorID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '7C9ADF58-2C0F-4471-9483-03296CDEBD8E',  'Donation4','66 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Colection_Points ( [Colection_PointID], [DonorID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '6DFC5B96-30BE-4D7A-B76B-A1444D7F9FF4',  'Donation5','61 Turpis. St.','Mehedinti','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Colection_Points ( [Colection_PointID], [DonorID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'A8E61FD8-013E-4618-A522-0FD61DC11863',  'Donation6','561 Turpis. St.','Flynn','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Colection_Points ( [Colection_PointID], [DonorID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '7C9ADF58-2C0F-4471-9483-03296CDEBD8E',  'Donation7','661 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Colection_Points ( [Colection_PointID], [DonorID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '6DFC5B96-30BE-4D7A-B76B-A1444D7F9FF4',  'Donation1','12 Turpis. St.','Pariss','Franta','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Colection_Points ( [Colection_PointID], [DonorID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '7C9ADF58-2C0F-4471-9483-03296CDEBD8E',  'Donation2','61 Turpis. St.','Cluj','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Colection_Points ( [Colection_PointID], [DonorID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'A8E61FD8-013E-4618-A522-0FD61DC11863',  'Donation3','51 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Colection_Points ( [Colection_PointID], [DonorID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '7C9ADF58-2C0F-4471-9483-03296CDEBD8E',  'Donation4','531 Turpis. St.','Mures','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Colection_Points ( [Colection_PointID], [DonorID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '46816FDC-318D-492C-A6D4-507927FF7B02',  'Donation5','5561 Turpis. St.','Mures','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Colection_Points ( [Colection_PointID], [DonorID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '7C9ADF58-2C0F-4471-9483-03296CDEBD8E',  'Donation6','571 Turpis. St.','Mures','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Colection_Points ( [Colection_PointID], [DonorID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '46816FDC-318D-492C-A6D4-507927FF7B02',  'Donation1','591 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 


 SELECT * 
 FROM Campains
 SELECT * 
 FROM Colection_Points
 
 INSERT INTO Campains([CampainID], [Colection_PointID], [Name], [Description], [Input_Date], [Days]) VALUES (NEWID(), '3267F4D2-1302-479E-9534-25F968670528', 'Campain1', 'Description1', '2017-01-01', '4');
 INSERT INTO Campains([CampainID], [Colection_PointID], [Name], [Description], [Input_Date], [Days]) VALUES (NEWID(), '3267F4D2-1302-479E-9534-25F968670528', 'Campain2', 'Description2', '2018-01-02', '5');
 INSERT INTO Campains([CampainID], [Colection_PointID], [Name], [Description], [Input_Date], [Days]) VALUES (NEWID(), '3267F4D2-1302-479E-9534-25F968670528', 'Campain3', 'Description3', '2016-01-03', '10');
 INSERT INTO Campains([CampainID], [Colection_PointID], [Name], [Description], [Input_Date], [Days]) VALUES (NEWID(), '298E49D6-45C5-4E07-AD5E-5F1303E17F54', 'Campain1', 'Description4', '2020-01-01', '12');
 INSERT INTO Campains([CampainID], [Colection_PointID], [Name], [Description], [Input_Date], [Days]) VALUES (NEWID(), '116ECECA-FFD8-42E4-970F-731A82524E87', 'Campain2', 'Description5', '2020-01-01', '3');
 INSERT INTO Campains([CampainID], [Colection_PointID], [Name], [Description], [Input_Date], [Days]) VALUES (NEWID(), '298E49D6-45C5-4E07-AD5E-5F1303E17F54', 'Campain3', 'Description6', '2017-01-01', '14');
 INSERT INTO Campains([CampainID], [Colection_PointID], [Name], [Description], [Input_Date], [Days]) VALUES (NEWID(), '116ECECA-FFD8-42E4-970F-731A82524E87', 'Campain1', 'Description7', '2019-01-04', '20');
 INSERT INTO Campains([CampainID], [Colection_PointID], [Name], [Description], [Input_Date], [Days]) VALUES (NEWID(), '3267F4D2-1302-479E-9534-25F968670528', 'Campain2', 'Description8', '2018-01-10', '24');
 INSERT INTO Campains([CampainID], [Colection_PointID], [Name], [Description], [Input_Date], [Days]) VALUES (NEWID(), '3267F4D2-1302-479E-9534-25F968670528', 'Campain3', 'Description9', '2018-01-01', '4');
 INSERT INTO Campains([CampainID], [Colection_PointID], [Name], [Description], [Input_Date], [Days]) VALUES (NEWID(), 'AD80C85C-FE9C-4682-8022-8D25BBFB3C1E', 'Campain3', 'Description10', '2019-01-01', '4');


 SELECT * 
 FROM Blood_Bank
 SELECT * 
 FROM Colection_Points

 INSERT INTO Blood_Bank( [Blood_BankID], [Colection_PointID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '3267F4D2-1302-479E-9534-25F968670528',  'Bank1','56 Turpis. St.','Cluj','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Blood_Bank ([Blood_BankID], [Colection_PointID], [Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '3267F4D2-1302-479E-9534-25F968670528',  'Bank2','61 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Blood_Bank ([Blood_BankID], [Colection_PointID], [Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'C0746EE0-A9E1-4113-B98F-3D5108B18912',  'Bank3','566 Turpis. St.','Oradea','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Blood_Bank ([Blood_BankID], [Colection_PointID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'C0746EE0-A9E1-4113-B98F-3D5108B18912',  'Bank4','66 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Blood_Bank ( [Blood_BankID],[Colection_PointID],[Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'C0746EE0-A9E1-4113-B98F-3D5108B18912',  'Bank5','61 Turpis. St.','Mehedinti','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Blood_Bank ([Blood_BankID], [Colection_PointID], [Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '869A0667-A84E-49B0-B7A3-44C8DD8E7066',  'Bank6','561 Turpis. St.','Flynn','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Blood_Bank ( [Blood_BankID],[Colection_PointID], [Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '298E49D6-45C5-4E07-AD5E-5F1303E17F54',  'Bank7','661 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Blood_Bank ( [Blood_BankID],[Colection_PointID], [Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '298E49D6-45C5-4E07-AD5E-5F1303E17F54',  'Bank1','12 Turpis. St.','Pariss','Franta','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Blood_Bank ( [Blood_BankID],[Colection_PointID], [Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'F7DFAD97-642C-4BD2-B143-70ADF0F74FA8',  'Bank2','61 Turpis. St.','Cluj','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Blood_Bank ( [Blood_BankID],[Colection_PointID], [Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '116ECECA-FFD8-42E4-970F-731A82524E87',  'Bank','51 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Blood_Bank ([Blood_BankID], [Colection_PointID], [Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), '116ECECA-FFD8-42E4-970F-731A82524E87',  'Bank4','531 Turpis. St.','Mures','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Blood_Bank ( [Blood_BankID],[Colection_PointID], [Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'AD80C85C-FE9C-4682-8022-8D25BBFB3C1E',  'Bank5','5561 Turpis. St.','Mures','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Blood_Bank ([Blood_BankID], [Colection_PointID], [Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'FEF237E4-A318-4DCE-89EF-9D2FB6C8D059',  'Bank6','571 Turpis. St.','Mures','Guinea','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 
 INSERT INTO Blood_Bank ( [Blood_BankID],[Colection_PointID], [Name], [Address], [City], [Country], [PhoneNumber], [EmailAddress]) VALUES (NEWID(), 'A855463B-C8E6-4DBC-A273-E3D68BAA969D',  'Bank1','591 Turpis. St.','Mures','Romania','063-511-7196','felis.ullamcorper.viverra@gmail.com'); 


SELECT * FROM Donors
WHERE  DonorID= '1C5404B7-0E60-45D7-BDCB-B672E40291E7'

UPDATE Donors
 SET BirthDay = '1998-03-10'
 WHERE DonorID = '1C5404B7-0E60-45D7-BDCB-B672E40291E7'

 DELETE 
 FROM Campains