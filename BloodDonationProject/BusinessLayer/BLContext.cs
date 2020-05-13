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
        private ViewPointCampaignBL _viewPointCampaignBL ;
        private ViewDonorPointBL _viewDonorPointBL;



        public BloodBanksBL BloodBanks
        {
            get
            {
                if (_bloodBankBL == null)
                {
                    _bloodBankBL = new BloodBanksBL(_dalContext.BloodBanks);
                }
                return _bloodBankBL;
            }
        }

        public BloodTypesBL BloodTypes
        {
            get
            {
                if (_bloodTypeBL == null)
                {
                    _bloodTypeBL = new BloodTypesBL(_dalContext.BloodTypes);
                }
                return _bloodTypeBL;
            }
        }

        public CampaignsBL Campaigns
        {
            get
            {
                if (_campaignsBL == null)
                {
                    _campaignsBL = new CampaignsBL(_dalContext.Campaigns);
                }
                return _campaignsBL;
            }
        }

        public CollectionPointsBL CollectionPoints
        {
            get
            {
                if (_collectionPointsBL == null)
                {
                    _collectionPointsBL = new CollectionPointsBL(_dalContext.CollectionPoints);
                }
                return _collectionPointsBL;
            }
        }

        public DonorsBL Donors
        {
            get
            {
                if (_donorsBL == null)
                {
                    _donorsBL = new DonorsBL(_dalContext.Donors);
                }
                return _donorsBL;
            }
        }
        public RegisterCampaignsBL RegisterCampaigns
        {
            get
            {
                if (_registerCampaignsBL == null)
                {
                    _registerCampaignsBL = new RegisterCampaignsBL(_dalContext.RegisterCampaigns);
                }
                return _registerCampaignsBL;
            }
        }

        public RegistersBL Registers
        {
            get
            {
                if (_registersBL == null)
                {
                    _registersBL = new RegistersBL(_dalContext.Registers);
                }
                return _registersBL;
            }
        }

        public ViewPointCampaignBL ViewPointCampaign
        {
            get
            {
                if (_viewPointCampaignBL == null)
                {
                    _viewPointCampaignBL = new ViewPointCampaignBL(_dalContext.ViewPointCampaign);
                }
                return _viewPointCampaignBL;
            }
        }

        public ViewDonorPointBL ViewDonorPointBL
        {
            get
            {
                if(_viewDonorPointBL == null)
                {
                    _viewDonorPointBL = new ViewDonorPointBL(_dalContext.ViewDonorPointDAL);
                }
                return _viewDonorPointBL;
            }
        }

    }
}
