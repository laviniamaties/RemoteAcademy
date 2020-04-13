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
            return _bLContext.CampaignsBL.ReadByUid(id);
        }
        [HttpGet]
        public List<Campaign> ReadALL()
        {
            return _bLContext.CampaignsBL.ReadAll();
        }
        [HttpDelete]
        public void Delete(Guid id)
        {
            _bLContext.CampaignsBL.Delete(id);
        }
        [HttpPost]
        public void Insert(Guid id, [FromBody]Campaign campaign)
        {
            _bLContext.CampaignsBL.Add(id, campaign);
        }
        [HttpPut]
        public void Update(Guid id, [FromBody]Campaign campaign)
        {
            _bLContext.CampaignsBL.Update(id, campaign);
        }
    }
}
