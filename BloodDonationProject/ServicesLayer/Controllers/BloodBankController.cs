using BusinessLayer;
using Model;
using System;
using System.Collections.Generic;
using System.Web.Http;

namespace ServicesLayer.Controllers
{
    public class BloodBankController : ApiController
    {
        private BLContext _bLContext = new BLContext();

        [HttpGet]
        public BloodBank GetByID(Guid id)
        {
            return _bLContext.BloodBanks.ReadByUid(id);
        }
        [HttpGet]
        public List<BloodBank> ReadAll()
        {
            return _bLContext.BloodBanks.ReadAll();
        }
        [HttpDelete]
        public void DeleteById(Guid id)
        {
            _bLContext.BloodBanks.DeleteById(id);
        }
        [HttpPost]
        public void Insert(Guid id, [FromBody]BloodBank bloodBank)
        {
            _bLContext.BloodBanks.Add(id, bloodBank);
        }
        [HttpPut]
        public void Update(Guid id, [FromBody]BloodBank bloodBank)
        {
            _bLContext.BloodBanks.Update(id, bloodBank);
        }
    }
}
