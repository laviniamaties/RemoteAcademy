using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public interface IRegisterCampaignsDAL
    {
        void Update(Guid campaignID, Guid pointID);
        void Add(Guid campaignID, Guid pointID);
    }
}
