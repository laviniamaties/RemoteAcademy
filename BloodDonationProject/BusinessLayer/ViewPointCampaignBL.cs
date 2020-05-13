using DataAccessLayer;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class ViewPointCampaignBL
    {
        private ViewPointCampaignDAL _viewPointCampaignDAL ;

        public ViewPointCampaignBL(ViewPointCampaignDAL viewPointCampaignDAL )
        {
            _viewPointCampaignDAL = viewPointCampaignDAL;
        }

        public List<ViewPointCampaign> ReadAll()
        {
            return _viewPointCampaignDAL.ReadAll();
        }

    }
}
