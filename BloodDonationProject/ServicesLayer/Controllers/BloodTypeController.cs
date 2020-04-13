using BusinessLayer;
using Model;
using System;
using System.Collections.Generic;
using System.Web.Http;

namespace ServicesLayer.Controllers
{
    public class BloodTypeController : ApiController
    {
        private BLContext _bLContext = new BLContext();
        [HttpGet]
        public BloodType GetByID(Guid id)
        {
            return _bLContext.BloodTypesBL.ReadByUid(id);
        }
        [HttpGet]
        public List<BloodType> ReadAll()
        {
            return _bLContext.BloodTypesBL.ReadAll();
        }
        [HttpDelete]
        public void Delete(Guid id)
        {
            _bLContext.BloodTypesBL.Delete(id);
        }
        [HttpPost]
        public void Insert(Guid id, [FromBody]BloodType bloodType)
        {
            _bLContext.BloodTypesBL.Add(id, bloodType);
        }
        [HttpPut]
        public void Update(Guid id, [FromBody]BloodType bloodType)
        {
            _bLContext.BloodTypesBL.Update(id, bloodType);
        }
    }
}
