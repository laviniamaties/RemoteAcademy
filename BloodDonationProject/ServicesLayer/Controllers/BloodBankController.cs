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
            return _bLContext.BloodBanksBL.ReadByUid(id);
        }
        [HttpGet]
        public List<BloodBank> ReadAll()
        {
            return _bLContext.BloodBanksBL.ReadAll();
        }
        [HttpDelete]
        public void Delete(Guid id)
        {
            _bLContext.BloodBanksBL.Delete(id);
        }
        [HttpPost]
        public void Insert(Guid id, [FromBody]BloodBank bloodBank)
        {
            _bLContext.BloodBanksBL.Add(id, bloodBank);
        }
        [HttpPut]
        public void Update(Guid id, [FromBody]BloodBank bloodBank)
        {
            _bLContext.BloodBanksBL.Update(id, bloodBank);
        }
    }
}
