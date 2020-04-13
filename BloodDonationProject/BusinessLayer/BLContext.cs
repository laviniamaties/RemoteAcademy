using DataAccessLayer;

namespace BusinessLayer
{
    public class BLContext
    {
        private DALContext _dalContext = new DALContext();
        private BloodBanksBL _bloodBankBL;
        private BloodTypesBL _bloodTypeBL;
        private CampaignsBL _campaignsBL;
        private CollectionPointsBL _collectionPointsBL;
        private DonorsBL _donorsBL;
        private RegisterCampaignsBL _registerCampaignsBL;
        private RegistersBL _registersBL;

        public BloodBanksBL BloodBanksBL
        {
            get
            {
                if (_bloodBankBL == null)
                {
                    _bloodBankBL = new BloodBanksBL(_dalContext.BloodBanksDAL);
                }
                return _bloodBankBL;
            }
        }

        public BloodTypesBL BloodTypesBL
        {
            get
            {
                if (_bloodTypeBL == null)
                {
                    _bloodTypeBL = new BloodTypesBL(_dalContext.BloodTypesDAL);
                }
                return _bloodTypeBL;
            }
        }

        public CampaignsBL CampaignsBL
        {
            get
            {
                if (_campaignsBL == null)
                {
                    _campaignsBL = new CampaignsBL(_dalContext.CampaignsDAL);
                }
                return _campaignsBL;
            }
        }

        public CollectionPointsBL CollectionPointsBL
        {
            get
            {
                if (_collectionPointsBL == null)
                {
                    _collectionPointsBL = new CollectionPointsBL(_dalContext.CollectionPointsDAL);
                }
                return _collectionPointsBL;
            }
        }

        public DonorsBL DonorsBL
        {
            get
            {
                if (_donorsBL == null)
                {
                    _donorsBL = new DonorsBL(_dalContext.DonorsDAL);
                }
                return _donorsBL;
            }
        }
        public RegisterCampaignsBL RegisterCampaignsBL
        {
            get
            {
                if (_registerCampaignsBL == null)
                {
                    _registerCampaignsBL = new RegisterCampaignsBL(_dalContext.RegisterCampaignsDAL);
                }
                return _registerCampaignsBL;
            }
        }

        public RegistersBL RegistersBL
        {
            get
            {
                if (_registersBL == null)
                {
                    _registersBL = new RegistersBL(_dalContext.RegistersDAL);
                }
                return _registersBL;
            }
        }
    }
}
