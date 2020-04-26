using BusinessLayer;
using Model;
using System;
using System.Collections.Generic;
using System.Web.Http;

namespace ServicesLayer.Controllers
{
    public class DonorController : ApiController
    {
        private BLContext _bLContext = new BLContext();

        [HttpGet]
        public Donor  GetByID(Guid id)
        {
            return _bLContext.Donors.ReadByUid(id);
        }
        [HttpGet]
        public List<Donor> ReadAll()
        {
            return _bLContext.Donors.ReadAll();
        }

        [HttpDelete]
        public void DeleteByID(Guid id)
        {
            _bLContext.Donors.DeleteById(id);
        }
        [HttpPost]
        public void Insert(Guid id, [FromBody]Donor donor)
        {
            _bLContext.Donors.Add(id, donor);
        }
        [HttpPut]
        public void Update(Guid id, [FromBody]Donor donor)
        {
            _bLContext.Donors.Update(id, donor);
        }
    }
}
