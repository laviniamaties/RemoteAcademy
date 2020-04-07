using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public interface ICampaignsDAL
    {
        Campaign ReadByUid(Guid id);
        void Update(Guid id, Campaign campaign);
        void AddCampaign(Guid id, Campaign campaign);
    }
}
