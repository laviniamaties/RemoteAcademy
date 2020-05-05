using BusinessLayer;
using Model;
using System;
using System.Collections.Generic;
using System.Web.Http;
using System.Web.Http.Cors;



namespace ServicesLayer.Controllers
{
    [EnableCors(origins: "*",headers: "*",  methods: "*")]
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
        [HttpPost]
        public void DeleteById(Guid id)
        {
            _bLContext.BloodBanks.DeleteById(id);
        }
        [HttpPost]
        public void Insert( [FromBody]BloodBank bloodBank)
        {
            _bLContext.BloodBanks.Add( bloodBank);
        }
        [HttpPut]
        public void Update( [FromBody]BloodBank bloodBank)
        {
            _bLContext.BloodBanks.Update(bloodBank);
        }
    }
}
