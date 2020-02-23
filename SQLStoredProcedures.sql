-- Stored Procedures 
--CREATE 

/*CREATE PROCEDURE dbo.BloodDonation_BloodTypesCreate
	   @BloodTypeID uniqueidentifier,  
	   @BloodType nvarchar(150)
	   	 
AS
BEGIN
INSERT INTO BloodTypes(
	   BloodTypeID,
	   BloodType)
    VALUES (
	  @BloodTypeID,
	  @BloodType)
SET @BloodTypeID = NEWID()
	SELECT 
		   BloodType = @BloodType
	FROM BloodTypes 
	WHERE  BloodTypeID = @BloodTypeID
	END
GO

DECLARE @BloodTypeID uniqueidentifier = NEWID(),
		 @BloodType nvarchar(150) = 'BIII Neagtive'
EXECUTE dbo.BloodDonation_BloodTypesCreate  @BloodTypeID, @BloodType 
*/

/*
CREATE PROCEDURE dbo.BloodDonation_DonorsCreate
	   @DonorID uniqueidentifier ,
	   @BloodTypeID uniqueidentifier,
	   @Sex nvarchar(50) ,
	   @Type nvarchar(50),
	   @FirstName nvarchar(50),
	   @LastName nvarchar(50) ,
	   @Address nvarchar(150) ,
	   @City nvarchar(50),
 	   @Country nvarchar(50),
 	   @PhoneNumber nvarchar(50),
	   @EmailAddress nvarchar(50),
	   @BirthDay date
AS
BEGIN
INSERT INTO Donors(
	   DonorID  ,
	   BloodTypeID ,
       Sex ,
	   Type ,
	   FirstName ,
	   LastName ,
	   Address ,
	   City ,
  	   Country ,
 	   PhoneNumber ,
	   EmailAddress,
	   BirthDay 
	   )
   VALUES (
	   @DonorID ,
	   @BloodTypeID ,
	   @Sex,
	   @Type ,
	   @FirstName ,
	   @LastName  ,
	   @Address  ,
	   @City ,
   	   @Country ,
 	   @PhoneNumber ,
	   @EmailAddress ,
	   @BirthDay 
	  )
SET @DonorID = NEWID()
	SELECT 
	   BloodTypeID  = @BloodTypeID, 
	   Sex = @Sex , 
	   Type = @Type , 
	   FirstName = @FirstName ,
	   LastName  = @LastName , 
	   Address = @Address , 
	   City = @City , 
  	   Country  = @Country , 
 	   PhoneNumber = @PhoneNumber , 
	   EmailAddress  = @EmailAddress ,  
	   BirthDay = @BirthDay
	FROM Donors  
	WHERE  @DonorID = @DonorID
END
GO
DECLARE 
		@DonorID uniqueidentifier = NEWID(),
	    @BloodTypeID uniqueidentifier  = '51F1EB5D-97AE-4E57-AD93-4F084C3F2FF2' , 
	   @Sex nvarchar(50) = 'Female',
	   @Type  nvarchar(50) = 'Donor', 
	   @FirstName nvarchar(50) = 'Maties', 
	   @LastName nvarchar(50) = 'Lavinia', 
	   @Address nvarchar(150) =' 58 D Cluj',  
	   @City nvarchar(50) = 'Cluj',
   	   @Country nvarchar(50) = 'Romania', 
 	   @PhoneNumber nvarchar(50)  = '0751040192', 
	   @EmailAddress  nvarchar(50) = 'maties.lavinia@gmail.com',
	   @BirthDay date = '1996-03-05';
  		
EXECUTE dbo.[BloodDonation_DonorsCreate]  @DonorID , @BloodTypeID ,  @Sex ,  @Type ,  @FirstName ,  @LastName  ,
	   @Address  , @City , @Country , @PhoneNumber , @EmailAddress , @BirthDay
*/


/*CREATE PROCEDURE dbo.BloodDonation_BloodBanksCreate
	@BloodBankID uniqueidentifier ,
	@Name nvarchar(50) ,
	@Address nvarchar(150) ,
	@City nvarchar(50) ,
	@Country nvarchar(50),
	@PhoneNumber nvarchar(50),
	@EmailAddress nvarchar(50)
AS
BEGIN
INSERT INTO BloodBanks(
	BloodBankID ,
	Name ,
	Address  ,
	City  ,
	Country ,
	PhoneNumber ,
	EmailAddress 
	   )
    VALUES (
	   @BloodBankID  ,
	   @Name ,
	   @Address  ,
	   @City  ,
	   @Country ,
	   @PhoneNumber ,
	   @EmailAddress 
	  )
SET @BloodBankID = NEWID()
	SELECT 
	   Name = @Name,
	   Address = @Address ,
	   City = @City ,
	   Country = @Country ,
	   PhoneNumber = @PhoneNumber,
	   EmailAddress = @EmailAddress 

	FROM BloodBanks  
	WHERE  @BloodBankID = @BloodBankID
	END
GO

DECLARE 
		@BloodBankID uniqueidentifier = NEWID(),
		@Name nvarchar(50) = 'Bank3',
		@Address nvarchar(150) = '566 Turpis. St.',
		@City nvarchar(50) = 'Oradea' ,
		@Country nvarchar(50) = 'Romania',
		@PhoneNumber nvarchar(50) = '063-511-7196',
		@EmailAddress nvarchar(50) = 'felis.ullamcorper.viverra@gmail.com'
	   		
EXECUTE dbo.[BloodDonation_BloodBanksCreate]  @BloodBankID  ,
	   @Name ,
	   @Address  ,
	   @City  ,
	   @Country ,
	   @PhoneNumber ,
	   @EmailAddress 
*/

/* CREATE PROCEDURE dbo.BloodDonation_CampaignsCreate
	@CampaignID uniqueidentifier ,
	@Name nvarchar(50),
	@Description nvarchar(150),
	@StartDate date,
	@EndDate date 
AS
BEGIN
INSERT INTO Campaigns(
	CampaignID ,
	Name ,
	Description,
	StartDate ,
	EndDate 
	   )
    VALUES (
	    @CampaignID ,
		@Name ,
		@Description ,
		@StartDate,
		@EndDate
	  )
SET @CampaignID = NEWID()
	SELECT 
	   Name =  @Name,
	   Description = @Description ,
	   StartDate = @StartDate,
	   EndDate = 	@EndDate

	FROM Campaigns  
	WHERE  @CampaignID = @CampaignID
	END
GO

DECLARE 
		@CampaignID uniqueidentifier = NEWID(),
		@Name nvarchar(50) = 'Campaign3',
		@Description nvarchar(150) = 'Description3',
		@StartDate date = '2020-02-22',
		@EndDate date = '2020-03-22' 
	   		
EXECUTE dbo.[BloodDonation_CampaignsCreate]  @CampaignID ,
		@Name ,
		@Description ,
		@StartDate,
		@EndDate
*/


/*CREATE PROCEDURE dbo.BloodDonation_CollectionPointsCreate
	@CollectionpointID uniqueidentifier,
	@BloodBankID uniqueidentifier ,
	@Name nvarchar(50) ,
	@Address nvarchar(150) ,
	@City nvarchar(50) ,
	@Country nvarchar(50),
	@PhoneNumber nvarchar(50),
	@EmailAddress nvarchar(50)
AS
BEGIN
INSERT INTO CollectionPoints(
	CollectionpointID, 
	BloodBankID ,
	Name ,
	Address  ,
	City  ,
	Country ,
	PhoneNumber ,
	EmailAddress 
	   )
    VALUES (
	   @CollectionpointID, 
	   @BloodBankID  ,
	   @Name ,
	   @Address  ,
	   @City  ,
	   @Country ,
	   @PhoneNumber ,
	   @EmailAddress 
	  )
SET @CollectionpointID = NEWID()
	SELECT 
		BloodBankID = @BloodBankID, 
	    Name = @Name,
	    Address = @Address ,
	    City = @City ,
	    Country = @Country ,
	    PhoneNumber = @PhoneNumber,
	    EmailAddress = @EmailAddress 

	FROM CollectionPoints  
	WHERE  @CollectionpointID = @CollectionpointID
	END
GO

DECLARE 
		@CollectionpointID  uniqueidentifier = NEWID(), 
		@BloodBankID uniqueidentifier = '07CFFAA5-EF6A-4EEB-AFCC-7A5B722EF369' ,
		@Name nvarchar(50) = 'Donation3',
		@Address nvarchar(150) = '55 Turpis. St.',
		@City nvarchar(50) = 'Oradea' ,
		@Country nvarchar(50) = 'Romania',
		@PhoneNumber nvarchar(50) = '063-511-7199',
		@EmailAddress nvarchar(50) = 'felis.ullamcorper@gmail.com'
	   		
EXECUTE dbo.[BloodDonation_CollectionPointsCreate]  @CollectionpointID, 
	   @BloodBankID  ,
	   @Name ,
	   @Address  ,
	   @City  ,
	   @Country ,
	   @PhoneNumber ,
	   @EmailAddress 
*/

/*CREATE PROCEDURE dbo.BloodDonation_RegistersCreate
	@DonorID uniqueidentifier ,
	@CollectionPointID uniqueidentifier 
AS
BEGIN
INSERT INTO Registers(
	DonorID ,
	CollectionPointID
	   )
    VALUES (
	   @DonorID  ,
	   @CollectionPointID
	  )
 
	END
GO

DECLARE 
		@DonorID uniqueidentifier = '08A53EA9-6FA8-4794-B833-318849721FEA',
		@CollectionPointID uniqueidentifier ='4BA1B967-AB8B-4BF7-AFDD-5D1D6F89CAAF'
	
EXECUTE dbo.[BloodDonation_RegistersCreate]   @DonorID  ,
	   @CollectionPointID
*/

/*CREATE PROCEDURE dbo.BloodDonation_RegisterCampaignsCreate
	  @CampaignID uniqueidentifier ,
	  @CollectionPointID uniqueidentifier 
AS
BEGIN
INSERT INTO RegisterCampaigns(
	 CampaignID ,
	 CollectionPointID
	   )
    VALUES (
	   @CampaignID ,
	   @CollectionPointID 
	  )
	END
GO

DECLARE 
		@CampaignID uniqueidentifier = 'D520C9D0-F194-4287-A8CD-31347FB70DEF',
	    @CollectionPointID uniqueidentifier  ='4BA1B967-AB8B-4BF7-AFDD-5D1D6F89CAAF'
	
EXECUTE dbo.[BloodDonation_RegisterCampaignsCreate]  @CampaignID ,
	    @CollectionPointID
*/

--UPDATE 
/*CREATE PROCEDURE dbo.BloodDonation_BloodTypesUpdate
	   @BloodTypeID uniqueidentifier,  
	   @BloodType nvarchar(150)
AS
BEGIN
UPDATE  BloodTypes
SET	    BloodTypeID = @BloodTypeID,
		BloodType =   @BloodType

WHERE   BloodTypeID = @BloodTypeID
END
GO

DECLARE @BloodTypeID uniqueidentifier = '51F1EB5D-97AE-4E57-AD93-4F084C3F2FF2',
		 @BloodType nvarchar(150) = 'BIII Positive'
EXECUTE dbo.BloodDonation_BloodTypesUpdate  @BloodTypeID, @BloodType 
*/

/*CREATE PROCEDURE dbo.BloodDonation_DonorsUpdate 
	   @DonorID uniqueidentifier ,
	   @BloodTypeID uniqueidentifier,
	   @Sex nvarchar(50) ,
	   @Type nvarchar(50),
       @FirstName nvarchar(50),
	   @LastName nvarchar(50) ,
	   @Address nvarchar(150) ,
	   @City nvarchar(50),
 	   @Country nvarchar(50),
 	   @PhoneNumber nvarchar(50),
	   @EmailAddress nvarchar(50),
	   @BirthDay date
AS
BEGIN
UPDATE  Donors
SET    DonorID = @DonorID, 
	   BloodTypeID  = @BloodTypeID, 
	   Sex = @Sex , 
	   Type = @Type , 
	   FirstName = @FirstName ,
	   LastName  = @LastName , 
	   Address = @Address , 
	   City = @City , 
  	   Country  = @Country , 
	   PhoneNumber = @PhoneNumber , 
	   EmailAddress  = @EmailAddress ,  
	   BirthDay = @BirthDay  

WHERE  DonorID = @DonorID
END
GO

DECLARE 
	   @DonorID uniqueidentifier = '08A53EA9-6FA8-4794-B833-318849721FEA',
       @BloodTypeID uniqueidentifier  = '51F1EB5D-97AE-4E57-AD93-4F084C3F2FF2' , 
	   @Sex nvarchar(50) = 'Female',
	   @Type  nvarchar(50) = 'Pacient', 
	   @FirstName nvarchar(50) = 'Maties', 
       @LastName nvarchar(50) = 'Lavinia Manuela', 
	   @Address nvarchar(150) =' 58 D Cluj',  
	   @City nvarchar(50) = 'Cluj',
   	   @Country nvarchar(50) = 'Romania', 
 	   @PhoneNumber nvarchar(50)  = '0751040192', 
	   @EmailAddress  nvarchar(50) = 'maties.lavinia@gmail.com',
	   @BirthDay date = '1996-03-05'
   		
EXECUTE dbo.BloodDonation_DonorsUpdate  @DonorID , @BloodTypeID ,  @Sex ,  @Type ,  @FirstName ,  @LastName  ,
	   @Address  , @City , @Country , @PhoneNumber , @EmailAddress , @BirthDay

	   select * from Donors
	   select * from Registers

*/

/*CREATE PROCEDURE dbo.BloodDonation_BloodBanksUpdate
	@BloodBankID uniqueidentifier ,
	@Name nvarchar(50) ,
	@Address nvarchar(150) ,
	@City nvarchar(50) ,
	@Country nvarchar(50),
	@PhoneNumber nvarchar(50),
	@EmailAddress nvarchar(50)
AS
BEGIN
 UPDATE BloodBanks
 SET  BloodBankID = @BloodBankID  ,
	Name = @Name ,
	Address =@Address  ,
	City = @City  ,
	Country =@Country ,
	PhoneNumber =@PhoneNumber , 
	EmailAddress =   @EmailAddress 

	WHERE  BloodBankID = @BloodBankID
	END
GO

DECLARE 
		@BloodBankID uniqueidentifier = '988DB2DC-B28F-41A4-A83E-16D3047999EA',
		@Name nvarchar(50) = 'Bank3',
		@Address nvarchar(150) = '28 Turpis. St.',
		@City nvarchar(50) = 'Oradea' ,
		@Country nvarchar(50) = 'Romania',
		@PhoneNumber nvarchar(50) = '0789654352',
		@EmailAddress nvarchar(50) = 'felis.ullamcorper@gmail.com'
	   		
EXECUTE dbo.[BloodDonation_BloodBanksUpdate]  @BloodBankID  ,
	   @Name ,
	   @Address  ,
	   @City  ,
	   @Country ,
	   @PhoneNumber ,
	   @EmailAddress 

*/
/* CREATE PROCEDURE dbo.BloodDonation_CampaignsUpdate
	@CampaignID uniqueidentifier ,
	@Name nvarchar(50),
	@Description nvarchar(150),
	@StartDate date,
	@EndDate date 
AS
BEGIN
UPDATE  Campaigns
SET 
	CampaignID = @CampaignID ,
	Name = @Name ,
	Description = @Description ,
	StartDate = @StartDate,
	EndDate = @EndDate
	WHERE  CampaignID = @CampaignID
	END
GO

DECLARE 
		@CampaignID uniqueidentifier = 'D520C9D0-F194-4287-A8CD-31347FB70DEF', 
		@Name nvarchar(50) = 'Campaign1',
		@Description nvarchar(150) = 'Description1',
		@StartDate date = '2020-02-22',
		@EndDate date = '2020-03-22' 
	   		
EXECUTE dbo.[BloodDonation_CampaignsUpdate]  @CampaignID ,
		@Name ,
		@Description ,
		@StartDate,
		@EndDate

*/

/*
CREATE PROCEDURE dbo.BloodDonation_CollectionPointsUpdate
	@CollectionpointID uniqueidentifier,
	@BloodBankID uniqueidentifier ,
	@Name nvarchar(50) ,
	@Address nvarchar(150) ,
	@City nvarchar(50) ,
	@Country nvarchar(50),
	@PhoneNumber nvarchar(50),
	@EmailAddress nvarchar(50)
AS
BEGIN
UPDATE  CollectionPoints
SET 
	CollectionpointID =  @CollectionpointID, 
	BloodBankID = @BloodBankID  ,
	Name = @Name ,
	Address  =  @Address  ,
	City  =  @City  ,
	Country  = @Country ,
	PhoneNumber =  @PhoneNumber ,
	EmailAddress = @EmailAddress 
	   
	WHERE  CollectionpointID = @CollectionpointID
	END
GO

DECLARE 
		@CollectionpointID  uniqueidentifier = '4BA1B967-AB8B-4BF7-AFDD-5D1D6F89CAAF', 
		@BloodBankID uniqueidentifier = '07CFFAA5-EF6A-4EEB-AFCC-7A5B722EF369' ,
		@Name nvarchar(50) = 'Donation11',
		@Address nvarchar(150) = '55 Turpis. St.',
		@City nvarchar(50) = 'Oradea' ,
		@Country nvarchar(50) = 'Romania',
		@PhoneNumber nvarchar(50) = '063-511-7199',
		@EmailAddress nvarchar(50) = 'felis.ullamcorper@gmail.com'
	   		
EXECUTE dbo.[BloodDonation_CollectionPointsUpdate]  @CollectionpointID, 
	   @BloodBankID  ,
	   @Name ,
	   @Address  ,
	   @City  ,
	   @Country ,
	   @PhoneNumber ,
	   @EmailAddress 
	   */
/* Pentru UPDATE-ul unui tabel de legatura, ar trebui sa fac o procedura care face UPDATE si pe 
tabelele principale automat, nu? 

CREATE PROCEDURE dbo.BloodDonation_RegistersUpdate
	@DonorID uniqueidentifier ,
	@CollectionPointID uniqueidentifier 
AS
BEGIN
UPDATE  Registers
SET 
	DonorID = @DonorID  ,
	CollectionPointID = @CollectionPointID
WHERE DonorID = @DonorID  AND CollectionPointID = @CollectionPointID
END
GO

DECLARE 
		@DonorID uniqueidentifier = '08A53EA9-6FA8-4794-B833-318849721FEA',
		@CollectionPointID uniqueidentifier ='4BA1B967-AB8B-4BF7-AFDD-5D1D6F89CAAF'
	
EXECUTE dbo.[BloodDonation_RegistersUpdate]   @DonorID  ,
	   @CollectionPointID
*/

--READ BY ID

/*
CREATE PROCEDURE dbo.BloodDonation_BloodTypes_ReadByID
(
	@BloodTypeID uniqueidentifier
)
AS
BEGIN
	SELECT  t.BloodType, 
			d.FirstName
			
	FROM BloodTypes t
		INNER JOIN Donors  d ON d.BloodTypeID = t.BloodTypeID
	WHERE t.BloodTypeID = @BloodTypeID
	GROUP BY d.FirstName,  t.BloodType
	END
GO

--declarations
DECLARE @BloodTypeID uniqueidentifier = '51F1EB5D-97AE-4E57-AD93-4F084C3F2FF2'
EXECUTE dbo.BloodDonation_BloodTypes_ReadByID @BloodTypeID
*/

/*
CREATE PROCEDURE dbo.BloodDonation_Donors_ReadByID
(
	@DonorID uniqueidentifier
)
AS
BEGIN
	SELECT  d.DonorID, d.FirstName,  t.BloodType, r.DonorID
	FROM Donors d 
		INNER JOIN BloodTypes t  ON t.BloodTypeID = d.BloodTypeID
		INNER JOIN Registers r ON r.DonorID = d.DonorID
		INNER JOIN CollectionPoints c ON c.CollectionPointID = r.CollectionPointID
	WHERE d.DonorID = @DonorID
	GROUP BY d.DonorID, d.FirstName,  t.BloodType, r.DonorID
	END
GO

--SELECT  d.DonorID, d.FirstName,  t.BloodType, r.DonorID
--	FROM Donors d 
--		INNER JOIN BloodTypes t  ON t.BloodTypeID = d.BloodTypeID
--		INNER JOIN Registers r ON r.DonorID = d.DonorID
--		INNER JOIN CollectionPoints c ON c.CollectionPointID = r.CollectionPointID
--	WHERE d.DonorID = '08A53EA9-6FA8-4794-B833-318849721FEA'
--	GROUP BY d.DonorID, d.FirstName,  t.BloodType, r.DonorID

--declarations
DECLARE @DonorID uniqueidentifier = '08A53EA9-6FA8-4794-B833-318849721FEA'
EXECUTE dbo.BloodDonation_Donors_ReadByID  @DonorID

*/

/*
CREATE PROCEDURE dbo.BloodDonation_CollectionPoints_ReadByID
(
	@CollectionPointID uniqueidentifier
)
AS
BEGIN
	SELECT p.CollectionPointID, d.FirstName,  b.Name as Bank, c.Name as Campaign
	FROM CollectionPoints p  
		INNER JOIN BloodBanks b  ON b.BloodBankID = p.BloodBankID
		INNER JOIN Registers r ON r.CollectionPointID = p.CollectionPointID
		INNER JOIN Donors d ON d.DonorID = r.DonorID 
		INNER JOIN RegisterCampaigns rc ON rc.CollectionPointID = p.CollectionPointID
		INNER JOIN Campaigns c ON rc.CampaignID  = c.CampaignID 
	WHERE p.CollectionPointID = @ColectionPointID
	GROUP BY p.CollectionPointID, d.FirstName,  b.Name , c.Name 
	END
GO


--declarations
DECLARE @CollectionPointID  uniqueidentifier = '2E8E56C0-2CC8-4652-AA0C-493926883749'
EXECUTE dbo.BloodDonation_CollectionPoints_ReadByID  @ColectionPointID
*/

/*
CREATE PROCEDURE dbo.BloodDonation_Campaigns_ReadByID
(
	@CampaignID uniqueidentifier
)
AS
BEGIN
	SELECT  c.Name as Campaign ,p.Name as ColectionPoint 
	FROM Campaigns c 
		INNER JOIN RegisterCampaigns rc  ON rc.CampaignID = c.CampaignID
		INNER JOIN CollectionPoints p ON p.CollectionPointID = rc.CollectionPointID
	WHERE c.CampaignID =  @CampaignID
	GROUP BY c.Name ,p.Name 
	END
GO

SELECT  c.Name as Campaign ,p.Name as CollectionPoint 
	FROM Campaigns c 
		INNER JOIN RegisterCampaigns rc  ON rc.CampaignID = c.CampaignID
		INNER JOIN CollectionPoints p ON p.CollectionPointID = rc.CollectionPointID
	WHERE c.CampaignID = 'A8A94419-17CF-4EB4-A13B-31EC4C2D62C2'
	GROUP BY c.Name ,p.Name 

--declarations
DECLARE @CampaignID uniqueidentifier = 'A8A94419-17CF-4EB4-A13B-31EC4C2D62C2'
EXECUTE dbo.BloodDonation_Campaigns_ReadByID  @CampaignID
*/

/*
CREATE PROCEDURE dbo.BloodDonation_BloodBank_ReadByID
(
	@BloodBankID uniqueidentifier
)
AS
BEGIN
	SELECT  b.Name as Bank ,p.Name as ColectionPoint 
	FROM BloodBanks b  
		INNER JOIN CollectionPoints p ON p.BloodBankID = b.BloodBankID 
	WHERE b.BloodBankID  =  @BloodBankID
	GROUP BY b.Name  ,p.Name 
	END
GO

SELECT  b.Name as Bank ,p.Name as CollectionPoint 
	FROM BloodBanks b  
		INNER JOIN CollectionPoints p ON p.BloodBankID = b.BloodBankID 
	WHERE b.BloodBankID  = '45E90B70-7683-498F-8721-0C9EB924EFD2'
	GROUP BY b.Name  ,p.Name  

--declarations
DECLARE @BloodBankID uniqueidentifier = '45E90B70-7683-498F-8721-0C9EB924EFD2'
EXECUTE dbo.BloodDonation_BloodBank_ReadByID  @BloodBankID
*/ 

--DELETE 

/*
CREATE PROCEDURE dbo.BloodDonation_CollectionPointsDelete
	   @CollectionPointID uniqueidentifier
AS
BEGIN
		DELETE FROM   CollectionPoints 
		WHERE CollectionPointID= @CollectionPointID
END
GO

DECLARE @CollectionPointID uniqueidentifier = '6A0594C2-E8FF-4D88-BD7D-2F0F4A1062BC'
EXECUTE dbo.BloodDonation_CollectionPointsDelete @CollectionPointID

*/

/*
delete  from  Donors 
where
	  ( select * 
		FROM BloodTypes a
		INNER JOIN Donors  b ON a.BloodTypeID = b.BloodTypeID
		WHERE b.BloodTypeID = '51F1EB5D-97AE-4E57-AD93-4F084C3F2FF2'
		and b.DonorID = '08A53EA9-6FA8-4794-B833-318849721FEA' );
		
		--WHERE b.BloodTypeID = @BloodTypeID
		*/
