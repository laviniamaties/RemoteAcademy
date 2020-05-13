using BusinessLayer;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ServicesLayer.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class RegisterCampaignsController : ApiController
    {
        private BLContext _bLContext = new BLContext();

        [HttpPost]
        public void Insert([FromBody] RegisterCampaign registerCampaign)
        {
            _bLContext.RegisterCampaigns.Add(registerCampaign);
        }
    }
}
