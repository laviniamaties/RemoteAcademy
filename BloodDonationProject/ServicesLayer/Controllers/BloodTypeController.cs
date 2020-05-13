using BusinessLayer;
using Model;
using System;
using System.Collections.Generic;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ServicesLayer.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class BloodTypeController : ApiController
    {
        private BLContext _bLContext = new BLContext();
        [HttpGet]
        public BloodType GetByID(Guid id)
        {
            return _bLContext.BloodTypes.ReadByUid(id);
        }
        [HttpGet]
        public List<BloodType> ReadAll()
        {
            return _bLContext.BloodTypes.ReadAll();
        }
        [HttpDelete]
        public void DeleteById(Guid id)
        {
            _bLContext.BloodTypes.DeleteById(id);
        }
        [HttpPost]
        public void Insert(Guid id, [FromBody]BloodType bloodType)
        {
            _bLContext.BloodTypes.Add(id, bloodType);
        }
        [HttpPut]
        public void Update(Guid id, [FromBody]BloodType bloodType)
        {
            _bLContext.BloodTypes.Update(id, bloodType);
        }
    }
}
