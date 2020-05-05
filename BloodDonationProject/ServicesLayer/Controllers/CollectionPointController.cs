using BusinessLayer;
using Model;
using System;
using System.Collections.Generic;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ServicesLayer.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class CollectionPointController : ApiController
    {
        private BLContext _bLContext = new BLContext();

        [HttpGet]
        public CollectionPoint GetByID(Guid id)
        {
            return _bLContext.CollectionPoints.ReadByUid(id);
        }
        [HttpGet]
        public List<CollectionPoint> ReadAll()
        {
            return _bLContext.CollectionPoints.ReadAll();
        }
        [HttpPost]
        public void DeleteById(Guid id)
        {
            _bLContext.CollectionPoints.DeleteById(id);
        }
        [HttpPost]
        public void Insert( [FromBody]CollectionPoint collectionPoint)
        {
            _bLContext.CollectionPoints.Add( collectionPoint);
        }
        [HttpPut]
        public void Update( [FromBody]CollectionPoint collectionPoint)
        {
            _bLContext.CollectionPoints.Update( collectionPoint);
        }
    }
}
