using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public interface ICampaignsBL
    {
        Campaign ReadByUid(Guid uid);
        void Update(Guid id, Campaign campaign);
        void Add(Guid id, Campaign campaign);

    }
}
