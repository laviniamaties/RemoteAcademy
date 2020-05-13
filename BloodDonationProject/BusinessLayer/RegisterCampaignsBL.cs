using DataAccessLayer;
using Model;
using System;

namespace BusinessLayer
{
    public class RegisterCampaignsBL
    {
        private RegisterCampaignsDAL _registerCampaignsDAL;

        public RegisterCampaignsBL(RegisterCampaignsDAL registerCampaignsDAL)
        {
            _registerCampaignsDAL = registerCampaignsDAL;
        }

        public void Update(Guid idCampaign, Guid idPoint)
        {
            _registerCampaignsDAL.Update(idCampaign, idPoint);
        }

        public void Add(RegisterCampaign registerCampaign)
        {
            _registerCampaignsDAL.Add(registerCampaign);
        }
    }
}
