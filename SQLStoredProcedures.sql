-- Stored Procedures 
--CREATE 

CREATE PROCEDURE dbo.BloodDonation_BloodTypesCreate
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
	   @BirthDay nvarchar(50)
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


CREATE PROCEDURE dbo.BloodDonation_BloodBanksCreate
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

 CREATE PROCEDURE dbo.BloodDonation_CampaignsCreate
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


CREATE PROCEDURE dbo.BloodDonation_CollectionPointsCreate
	@ColectionpointID uniqueidentifier,
	@BloodBankID uniqueidentifier ,
	@Name nvarchar(50) ,
	@Address nvarchar(150) ,
	@City nvarchar(50) ,
	@Country nvarchar(50),
	@PhoneNumber nvarchar(50),
	@EmailAddress nvarchar(50)
AS
BEGIN
INSERT INTO ColectionPoints(
	ColectionpointID, 
	BloodBankID ,
	Name ,
	Address  ,
	City  ,
	Country ,
	PhoneNumber ,
	EmailAddress 
	   )
    VALUES (
	   @ColectionpointID, 
	   @BloodBankID  ,
	   @Name ,
	   @Address  ,
	   @City  ,
	   @Country ,
	   @PhoneNumber ,
	   @EmailAddress 
	  )
SET @ColectionpointID = NEWID()
	SELECT 
		BloodBankID = @BloodBankID, 
	    Name = @Name,
	    Address = @Address ,
	    City = @City ,
	    Country = @Country ,
	    PhoneNumber = @PhoneNumber,
	    EmailAddress = @EmailAddress 

	FROM ColectionPoints  
	WHERE  @ColectionpointID = @ColectionpointID
	END
GO

CREATE PROCEDURE dbo.BloodDonation_RegistersCreate
	@DonorID uniqueidentifier ,
	@ColectionPointID uniqueidentifier 
AS
BEGIN
INSERT INTO Registers(
	DonorID ,
	ColectionPointID
	   )
    VALUES (
	   @DonorID  ,
	   @ColectionPointID
	  )
 
	END
GO

CREATE PROCEDURE dbo.BloodDonation_RegisterCampaignsCreate
	  @CampaignID uniqueidentifier ,
	  @ColectionPointID uniqueidentifier 
AS
BEGIN
INSERT INTO RegisterCampaigns(
	 CampaignID ,
	 ColectionPointID
	   )
    VALUES (
	   @CampaignID ,
	   @ColectionPointID 
	  )
	END
GO

--UPDATE 
CREATE PROCEDURE dbo.BloodDonation_BloodTypesUpdate
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


CREATE PROCEDURE dbo.BloodDonation_DonorsUpdate 
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
	   @BirthDay nvarchar(50)
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

CREATE PROCEDURE dbo.BloodDonation_BloodBanksUpdate
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

CREATE PROCEDURE dbo.BloodDonation_CampaignsUpdate
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


CREATE PROCEDURE dbo.BloodDonation_CollectionPointsUpdate
	@ColectionpointID uniqueidentifier,
	@BloodBankID uniqueidentifier ,
	@Name nvarchar(50) ,
	@Address nvarchar(150) ,
	@City nvarchar(50) ,
	@Country nvarchar(50),
	@PhoneNumber nvarchar(50),
	@EmailAddress nvarchar(50)
AS
BEGIN
UPDATE  ColectionPoints
SET 
	ColectionpointID =  @ColectionpointID, 
	BloodBankID = @BloodBankID  ,
	Name = @Name ,
	Address  =  @Address  ,
	City  =  @City  ,
	Country  = @Country ,
	PhoneNumber =  @PhoneNumber ,
	EmailAddress = @EmailAddress 
	   
	WHERE  ColectionpointID = @ColectionpointID
	END
GO

CREATE PROCEDURE dbo.BloodDonation_RegistersUpdate
	@DonorID uniqueidentifier ,
	@ColectionPointID uniqueidentifier 
AS
BEGIN
UPDATE  Registers
SET 
	DonorID = @DonorID  ,
	ColectionPointID = @ColectionPointID
WHERE DonorID = @DonorID  --AND ColectionPointID = @ColectionPointID
END
GO

CREATE PROCEDURE dbo.BloodDonation_RegisterCampaignsUpdate
	@CampaignID uniqueidentifier ,
	@ColectionPointID uniqueidentifier 
	
AS
BEGIN
UPDATE  RegisterCampaigns
SET 
    CampaignID = @CampaignID  ,
	ColectionPointID = @ColectionPointID 
WHERE CampaignID = @CampaignID --AND ColectionPointID = @ColectionPointID 
END
GO

--READ BY ID
CREATE PROCEDURE dbo.BloodDonation_BloodTypes_ReadByID
(
	@BloodTypeID uniqueidentifier
)
AS
BEGIN
--	SELECT  t.BloodType, d.FirstName
	SELECT * 
	FROM BloodTypes t
		INNER JOIN Donors  d ON d.BloodTypeID = t.BloodTypeID
	WHERE t.BloodTypeID = @BloodTypeID
--	GROUP BY d.FirstName,  t.BloodType
	END
GO

---this procedure reads only the dates consisting Blood Types

CREATE PROCEDURE dbo.BloodDonation_BloodTypes_ReadByGUID
(
	@BloodTypeID uniqueidentifier
)
AS
BEGIN
	SELECT  * 
	FROM BloodTypes t
	WHERE BloodTypeID = @BloodTypeID
	END
GO

CREATE PROCEDURE dbo.BloodDonation_Donors_ReadByID
(
	@DonorID uniqueidentifier
)
AS
BEGIN
	--SELECT  d.DonorID, d.FirstName,  t.BloodType, r.DonorID
	SELECT *
	FROM Donors d 
		INNER JOIN BloodTypes t  ON t.BloodTypeID = d.BloodTypeID
		INNER JOIN Registers r ON r.DonorID = d.DonorID
		INNER JOIN ColectionPoints c ON c.ColectionPointID = r.ColectionPointID
	WHERE d.DonorID = @DonorID
	--GROUP BY d.DonorID, d.FirstName,  t.BloodType, r.DonorID, 
	END
GO

CREATE PROCEDURE dbo.BloodDonation_Donors_ReadByGUID
(
	@DonorID uniqueidentifier
)
AS
BEGIN
	SELECT *
	FROM Donors d 
	WHERE DonorID = @DonorID
	END
GO


CREATE PROCEDURE dbo.BloodDonation_CollectionPoints_ReadByID
(
	@ColectionPointID uniqueidentifier
)
AS
BEGIN
	SELECT p.ColectionPointID, d.FirstName,  b.Name as Bank, c.Name as Campaign
	FROM ColectionPoints p  
		INNER JOIN BloodBanks b  ON b.BloodBankID = p.BloodBankID
		INNER JOIN Registers r ON r.ColectionPointID = p.ColectionPointID
		INNER JOIN Donors d ON d.DonorID = r.DonorID 
		INNER JOIN RegisterCampaigns rc ON rc.ColectionPointID = p.ColectionPointID
		INNER JOIN Campaigns c ON rc.CampaignID  = c.CampaignID 
	WHERE p.ColectionPointID = @ColectionPointID
	GROUP BY p.ColectionPointID, d.FirstName,  b.Name , c.Name 
	END
GO

CREATE PROCEDURE dbo.BloodDonation_CollectionPoints_ReadByGUID
(
	@ColectionPointID uniqueidentifier
)
AS
BEGIN
	SELECT *
	FROM ColectionPoints p 
	WHERE ColectionPointID = @ColectionPointID
	END
GO


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

CREATE PROCEDURE dbo.BloodDonation_Campaigns_ReadByGUID
(
	@CampaignID uniqueidentifier
)
AS
BEGIN
	SELECT  *
	FROM Campaigns c 
	WHERE CampaignID = @CampaignID
	END
GO


CREATE PROCEDURE dbo.BloodDonation_BloodBank_ReadByID
(
	@BloodBankID uniqueidentifier
)
AS
BEGIN
	SELECT  b.Name as Bank ,p.Name as ColectionPoint 
	FROM BloodBanks b  
		INNER JOIN ColectionPoints p ON p.BloodBankID = b.BloodBankID 
	WHERE b.BloodBankID  =  @BloodBankID
	GROUP BY b.Name  ,p.Name 
	END
GO

CREATE PROCEDURE dbo.BloodDonation_BloodBank_ReadByGUID
(
	@BloodBankID uniqueidentifier
)
AS
BEGIN
	SELECT  *
	FROM BloodBanks b  
	WHERE BloodBankID = @BloodBankID
	END
GO


--DELETE 

CREATE PROCEDURE dbo.BloodDonation_ColectionPointsDelete
	   @ColectionPointID uniqueidentifier
AS
BEGIN
		
		DELETE 
		FROM   ColectionPoints 
		WHERE ColectionPoints.ColectionPointID= @ColectionPointID
END
GO

CREATE PROCEDURE dbo.BloodDonation_DonorsDelete
	   @DonorID uniqueidentifier
AS
BEGIN
		
		DELETE 
		FROM Donors
		WHERE Donors.DonorID  = @DonorID
END
GO

CREATE PROCEDURE dbo.BloodDonation_BloodTypes_Delete_ByID
	   @BloodTypeID uniqueidentifier
AS
BEGIN
	
		DELETE 
		FROM BloodTypes
		WHERE BloodTypeID  = @BloodTypeID
END
GO


CREATE PROCEDURE dbo.BloodDonation_CampaignsDelete
	   @CampaignID uniqueidentifier
AS
BEGIN
	
		DELETE
		FROM Campaigns
		WHERE Campaigns.CampaignID  = @CampaignID
END
GO

CREATE PROCEDURE dbo.BloodDonation_BloodBanksDelete
	   @BloodBankID uniqueidentifier
AS
BEGIN
		
		DELETE 
		FROM BloodBanks
		WHERE BloodBanks.BloodBankID  = @BloodBankID
END
GO

-- Read ALL

CREATE PROCEDURE dbo.BloodDonation_BloodTypes_ReadAll

AS
BEGIN
	SELECT * 
	FROM BloodTypes t
	END
GO


CREATE PROCEDURE dbo.BloodDonation_Donors_ReadAll

AS
BEGIN

	SELECT *
	FROM Donors 
	END
GO


CREATE PROCEDURE dbo.BloodDonation_CollectionPoints_ReadAll

AS
BEGIN
	SELECT *
	FROM ColectionPoints 
	END
GO


CREATE PROCEDURE dbo.BloodDonation_Campaigns_ReadAll

AS
BEGIN
	SELECT  * 
	FROM Campaigns  
	END
GO


CREATE PROCEDURE dbo.BloodDonation_BloodBank_ReadAll

AS
BEGIN
	SELECT *  
	FROM BloodBanks   
		
	END
GO

