using BusinessLayer;
using Model;
using System;
using System.Collections.Generic;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ServicesLayer.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
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
        [HttpGet]
        public List<Donor> ReadAllDonors()
        {
            return _bLContext.Donors.ReadAllDonors();
        }
        [HttpGet]
        public List<Donor> ReadAllPacients()
        {
            return _bLContext.Donors.ReadAllPacients();
        }

        [HttpPost]
        public void DeleteByID(Guid id)
        {
            _bLContext.Donors.DeleteById(id);
        }
        [HttpPost]
        public void Insert([FromBody]Donor donor)
        {
            _bLContext.Donors.Add( donor);
        }
        [HttpPut]
        public void Update( [FromBody]Donor donor)
        {
            _bLContext.Donors.Update( donor);
        }
    }
}
