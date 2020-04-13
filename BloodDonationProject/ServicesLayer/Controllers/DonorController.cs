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
            return _bLContext.DonorsBL.ReadByUid(id);
        }
        [HttpGet]
        public List<Donor> ReadAll()
        {
            return _bLContext.DonorsBL.ReadAll();
        }

        [HttpDelete]
        public void DeleteByID(Guid id)
        {
            _bLContext.DonorsBL.Delete(id);
        }
        [HttpPost]
        public void Insert(Guid id, [FromBody]Donor donor)
        {
            _bLContext.DonorsBL.Add(id, donor);
        }
        [HttpPut]
        public void Update(Guid id, [FromBody]Donor donor)
        {
            _bLContext.DonorsBL.Update(id, donor);
        }
    }
}
