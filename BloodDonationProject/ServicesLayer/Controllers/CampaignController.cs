using BusinessLayer;
using Model;
using System;
using System.Collections.Generic;
using System.Web.Http;

namespace ServicesLayer.Controllers
{
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
        [HttpDelete]
        public void DeleteById(Guid id)
        {
            _bLContext.Campaigns.DeleteById(id);
        }
        [HttpPost]
        public void Insert(Guid id, [FromBody]Campaign campaign)
        {
            _bLContext.Campaigns.Add(id, campaign);
        }
        [HttpPut]
        public void Update(Guid id, [FromBody]Campaign campaign)
        {
            _bLContext.Campaigns.Update(id, campaign);
        }
    }
}
