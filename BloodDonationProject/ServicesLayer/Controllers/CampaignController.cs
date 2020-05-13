using BusinessLayer;
using Model;
using System;
using System.Collections.Generic;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ServicesLayer.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class CampaignController : ApiController
    {
        private BLContext _bLContext = new BLContext();

        [HttpGet]
        public Campaign GetByID(Guid id)
        {
            return _bLContext.Campaigns.ReadByUid(id);
        }
        [HttpGet]
        public List<Campaign> ReadALL()
        {
            return _bLContext.Campaigns.ReadAll();
        }
        [HttpGet]
        public List<Campaign> ShowActiveCampaign()
        {
            return _bLContext.Campaigns.ShowActiveCampaigns();
        }

        [HttpPost]
        public void DeleteById(Guid id)
        {
            _bLContext.Campaigns.DeleteById(id);
        }
        [HttpPost]
        public void Insert([FromBody]Campaign campaign)
        {
            _bLContext.Campaigns.Add(campaign);
        }
        [HttpPut]
        public void Update([FromBody]Campaign campaign)
        {
            _bLContext.Campaigns.Update( campaign);
        }
    }
}
