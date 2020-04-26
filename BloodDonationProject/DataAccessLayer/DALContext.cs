﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DALContext
    {
        private const string _connectionString = "Server=LAVINIA-PC;Database=BloodDonation;Trusted_Connection=True;";
        private BloodBanksDAL _bloodBankDAL;
        private BloodTypesDAL _bloodTypeDAL;
        private CampaignsDAL  _campaignsDAL;
        private CollectionPointsDAL _collectionPointsDAL;
        private DonorsDAL _donorsDAL;
        private RegisterCampaignsDAL _registerCampaignsDAL;
        private RegistersDAL _registerDAL;
        
        public BloodBanksDAL BloodBanks
        {
            get
            {
                if (_bloodBankDAL == null)
                {
                    _bloodBankDAL = new BloodBanksDAL(_connectionString);
                }
                return _bloodBankDAL;
            }
        }

        public BloodTypesDAL BloodTypes
        {
            get
            {
                if (_bloodTypeDAL == null)
                {
                    _bloodTypeDAL = new BloodTypesDAL(_connectionString);
                }
                return _bloodTypeDAL;
            }
        }

        public CampaignsDAL Campaigns
        {
            get
            {
                if (_campaignsDAL == null)
                {
                    _campaignsDAL = new CampaignsDAL(_connectionString);
                }
                return _campaignsDAL;
            }
        }

        public CollectionPointsDAL CollectionPoints
        {
            get
            {
                if (_collectionPointsDAL == null)
                {
                    _collectionPointsDAL = new CollectionPointsDAL(_connectionString);
                }
                return _collectionPointsDAL;
            }
        }

        public DonorsDAL Donors
        {
            get
            {
                if (_donorsDAL == null)
                {
                    _donorsDAL = new DonorsDAL(_connectionString);
                }
                return _donorsDAL;
            }
        }

        public RegisterCampaignsDAL RegisterCampaigns
        {
            get
            {
                if (_registerCampaignsDAL == null)
                {
                    _registerCampaignsDAL = new RegisterCampaignsDAL(_connectionString);
                }
                return _registerCampaignsDAL;
            }
        }

        public RegistersDAL Registers
        {
            get
            {
                if (_registerDAL == null)
                {
                    _registerDAL = new RegistersDAL(_connectionString);
                }
                return _registerDAL;
            }
        }
    }
}
