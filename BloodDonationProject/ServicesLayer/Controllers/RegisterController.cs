using BusinessLayer;
using Model;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ServicesLayer.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class RegisterController : ApiController
    {
      
            private BLContext _bLContext = new BLContext();

            [HttpPost]
            public void Insert([FromBody] Register register)
            {
                _bLContext.Registers.Add(register);
            }
        

    }
}
