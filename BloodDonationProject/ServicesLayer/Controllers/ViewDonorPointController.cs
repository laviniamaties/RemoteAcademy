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
    public class ViewDonorPointController : ApiController
    {
        private BLContext _bLContext = new BLContext();

        [HttpGet]
        public List<ViewDonorPoint> ReadALL()
        {
            return _bLContext.ViewDonorPointBL.ReadAll();
        }
    }
}
