using DataAccessLayer;
using Model;
using System;

namespace BusinessLayer
{
    public class CampaignsBL: IBL , ICampaignsBL
    {
        private CampaignsDAL _campaignsDAL;

        public CampaignsBL(CampaignsDAL campaignsDAL)
        {
            _campaignsDAL = campaignsDAL;
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
        public void Delete(Guid id)
        {
            _campaignsDAL.DeleteByUid(id);
        }
    }
}
