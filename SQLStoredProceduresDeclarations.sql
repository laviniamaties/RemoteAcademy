--declarations 
--1. CREATE BloodDonation_BloodTypesCreate
DECLARE @BloodTypeID uniqueidentifier = NEWID(),
		 @BloodType nvarchar(150) = 'BIII Neagtive'
EXECUTE dbo.BloodDonation_BloodTypesCreate  @BloodTypeID, @BloodType 

--2. CREATE [BloodDonation_DonorsCreate]
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

--3. CREATE [BloodDonation_BloodBanksCreate]
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

-- 4. CREATE [BloodDonation_CampaignsCreate]
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

-- 5. CREATE [BloodDonation_CollectionPointsCreate]
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

-- 6. CREATE [BloodDonation_RegistersCreate]

DECLARE 
		@DonorID uniqueidentifier = 'A38AE9F7-2D8E-46FB-A192-0960FD241154',
		@ColectionPointID uniqueidentifier ='4BA1B967-AB8B-4BF7-AFDD-5D1D6F89CAAF'
	
EXECUTE dbo.[BloodDonation_RegistersCreate]   @DonorID  ,
	   @ColectionPointID

-- 7. CREATE [BloodDonation_RegisterCampaignsCreate]
DECLARE 
		@ColectionPointID uniqueidentifier ='2E8E56C0-2CC8-4652-AA0C-493926883749' ,
		@CampaignID uniqueidentifier = 'C948309E-8B9B-46F7-A910-70BD22778A74' 
	
EXECUTE dbo.[BloodDonation_RegisterCampaignsCreate]  @CampaignID ,
	    @ColectionPointID

-- UPDATE 
--1. BloodDonation_BloodTypesUpdate

DECLARE @BloodTypeID uniqueidentifier = '51F1EB5D-97AE-4E57-AD93-4F084C3F2FF2',
		 @BloodType nvarchar(150) = 'BIII Positive'
EXECUTE dbo.BloodDonation_BloodTypesUpdate  @BloodTypeID, @BloodType 

-- 2. BloodDonation_DonorsUpdate
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

-- 3. [BloodDonation_BloodBanksUpdate]
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

-- 4. [BloodDonation_CampaignsUpdate]
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

-- 5. [BloodDonation_CollectionPointsUpdate]
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

-- 6. [BloodDonation_RegistersUpdate]

DECLARE 
		@DonorID uniqueidentifier = 'A38AE9F7-2D8E-46FB-A192-0960FD241154',
		@ColectionPointID uniqueidentifier ='2E8E56C0-2CC8-4652-AA0C-493926883749'
	
EXECUTE dbo.[BloodDonation_RegistersUpdate]   @DonorID  ,
	   @ColectionPointID

-- 7. [BloodDonation_RegisterCampaignsUpdate]
select * from Campaigns
select * from ColectionPoints where ColectionPointID = '266BD326-CF99-43CE-B5C1-C6BB59AFD6AA'
select * from RegisterCampaigns where ColectionPointID = '266BD326-CF99-43CE-B5C1-C6BB59AFD6AA'

DECLARE 
		@ColectionPointID uniqueidentifier ='101AA81D-9619-4863-B24E-BD073BDC3A6B' ,
		@CampaignID uniqueidentifier = 'C948309E-8B9B-46F7-A910-70BD22778A74' 
	
EXECUTE dbo.BloodDonation_RegisterCampaignsUpdate   
	   @CampaignID  , @ColectionPointID


-- READ BY ID 
-- 1. BloodDonation_BloodTypes_ReadByGUID
DECLARE @BloodTypeID uniqueidentifier = '51F1EB5D-97AE-4E57-AD93-4F084C3F2FF2'
EXECUTE dbo.BloodDonation_BloodTypes_ReadByID @BloodTypeID

DECLARE @BloodTypeID uniqueidentifier = '51F1EB5D-97AE-4E57-AD93-4F084C3F2FF2'
EXECUTE dbo.BloodDonation_BloodTypes_ReadByGUID @BloodTypeID

-- 2. BloodDonation_Donors_ReadByID

--SELECT  d.DonorID, d.FirstName,  t.BloodType, r.DonorID
--	FROM Donors d 
--		INNER JOIN BloodTypes t  ON t.BloodTypeID = d.BloodTypeID
--		INNER JOIN Registers r ON r.DonorID = d.DonorID
--		INNER JOIN ColectionPoints c ON c.ColectionPointID = r.ColectionPointID
--	WHERE d.DonorID = '08A53EA9-6FA8-4794-B833-318849721FEA'
--	GROUP BY d.DonorID, d.FirstName,  t.BloodType, r.DonorID

--declarations
DECLARE @DonorID uniqueidentifier = '52F23F8E-183A-43DB-ADA7-003C75AC93A6'
EXECUTE dbo.[BloodDonation_Donors_ReadByGUID]  @DonorID

select * from Donors
select * from BloodTypes

-- 3. BloodDonation_ColectionPoints_ReadByID
--declarations
DECLARE @ColectionPointID  uniqueidentifier = '2E8E56C0-2CC8-4652-AA0C-493926883749'
EXECUTE dbo.BloodDonation_ColectionPoints_ReadByID  @ColectionPointID

-- 4. BloodDonation_Campaigns_ReadByID
SELECT  c.Name as Campaign ,p.Name as CollectionPoint 
	FROM Campaigns c 
		INNER JOIN RegisterCampaigns rc  ON rc.CampaignID = c.CampaignID
		INNER JOIN CollectionPoints p ON p.CollectionPointID = rc.CollectionPointID
	WHERE c.CampaignID = 'A8A94419-17CF-4EB4-A13B-31EC4C2D62C2'
	GROUP BY c.Name ,p.Name 

--declarations
DECLARE @CampaignID uniqueidentifier = 'A8A94419-17CF-4EB4-A13B-31EC4C2D62C2'
EXECUTE dbo.BloodDonation_Campaigns_ReadByID  @CampaignID

-- 5. BloodDonation_BloodBank_ReadByID
	SELECT  *
	FROM BloodBanks b  
		INNER JOIN ColectionPoints p ON p.BloodBankID = b.BloodBankID 
	WHERE b.BloodBankID  = '45E90B70-7683-498F-8721-0C9EB924EFD2'
	
--declarations
DECLARE @BloodBankID uniqueidentifier = '45E90B70-7683-498F-8721-0C9EB924EFD2'
EXECUTE dbo.BloodDonation_BloodBank_ReadByID  @BloodBankID

-- DELETE 
-- 1. BloodDonation_ColectionPointsDelete
DECLARE @ColectionPointID uniqueidentifier = '15A56DB1-151B-4C9C-ADF5-2EC0FA6A8E78'
EXECUTE dbo.BloodDonation_ColectionPointsDelete @ColectionPointID

-- 2. BloodDonation_DonorsDelete
DECLARE @DonorID uniqueidentifier = '  '
EXECUTE dbo.BloodDonation_DonorsDelete @DonorID

-- 3. BloodDonation_BloodTypes_Delete_ByID
DECLARE @BloodTypeID uniqueidentifier = 'F17BBE93-25AE-4069-B873-733847C1DBEF'
EXECUTE dbo.BloodDonation_BloodTypes_Delete_ByID @BloodTypeID

-- 4. BloodDonation_CampaignsDelete
DECLARE @CampaignID uniqueidentifier = '  '
EXECUTE dbo.BloodDonation_CampaignsDelete @CampaignID

-- 5. BloodDonation_BloodBanksDelete
DECLARE @BloodBankID uniqueidentifier = '  '
EXECUTE dbo.BloodDonation_BloodBanksDelete @BloodBankID

-- READ ALL 
-- 1. BloodDonation_BloodTypes_ReadAll
EXECUTE dbo.BloodDonation_BloodTypes_ReadAll
-- 2. BloodDonation_Donors_ReadAll
EXECUTE dbo.BloodDonation_Donors_ReadAll
-- 3. BloodDonation_CollectionPoints_ReadAll
EXECUTE dbo.BloodDonation_CollectionPoints_ReadAll
-- 4. BloodDonation_Campaigns_ReadAll
EXECUTE dbo.BloodDonation_Campaigns_ReadAll
-- 5. BloodDonation_BloodBank_ReadAll
EXECUTE dbo.BloodDonation_BloodBank_ReadAll
