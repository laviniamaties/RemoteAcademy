using DataAccessLayer;
using Model;
using System;
using System.Collections.Generic;

namespace BusinessLayer
{
    public class CampaignsBL: IBL 
    {
        private CampaignsDAL _campaignsDAL;

        public CampaignsBL(CampaignsDAL campaignsDAL)
        {
            _campaignsDAL = campaignsDAL;
        }

        public List<Campaign> ReadAll()
        {
            return _campaignsDAL.ReadAll();
        }

        public List<Campaign> ShowActiveCampaigns()
        {
            return _campaignsDAL.ShowActiveCampaigns();
        }


        public Campaign ReadByUid(Guid uid)
        {
            return _campaignsDAL.ReadByUid(uid);
        }

        public void Update( Campaign campaign)
        {
            _campaignsDAL.Update( campaign);
        }

        public void Add( Campaign campaign)
        {
            _campaignsDAL.AddCampaign(campaign);
        }
        public void DeleteById(Guid id)
        {
            _campaignsDAL.DeleteByUid(id);
        }
    }
}
