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

        public Campaign ReadByUid(Guid uid)
        {
            return _campaignsDAL.ReadByUid(uid);
        }

        public void Update(Guid id, Campaign campaign)
        {
            _campaignsDAL.Update(id, campaign);
        }

        public void Add(Guid id, Campaign campaign)
        {
            _campaignsDAL.AddCampaign(id, campaign);
        }
        public void DeleteById(Guid id)
        {
            _campaignsDAL.DeleteByUid(id);
        }
    }
}
