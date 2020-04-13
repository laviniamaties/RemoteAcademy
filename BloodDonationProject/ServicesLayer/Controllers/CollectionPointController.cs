using BusinessLayer;
using Model;
using System;
using System.Collections.Generic;
using System.Web.Http;

namespace ServicesLayer.Controllers
{
    public class CollectionPointController : ApiController
    {
        private BLContext _bLContext = new BLContext();

        [HttpGet]
        public CollectionPoint GetByID(Guid id)
        {
            return _bLContext.CollectionPointsBL.ReadByUid(id);
        }
        [HttpGet]
        public List<CollectionPoint> ReadAll()
        {
            return _bLContext.CollectionPointsBL.ReadAll();
        }
        [HttpDelete]
        public void Delete(Guid id)
        {
            _bLContext.CollectionPointsBL.Delete(id);
        }
        [HttpPost]
        public void Insert(Guid id, [FromBody]CollectionPoint collectionPoint)
        {
            _bLContext.CollectionPointsBL.Add(id, collectionPoint);
        }
        [HttpPut]
        public void Update(Guid id, [FromBody]CollectionPoint collectionPoint)
        {
            _bLContext.CollectionPointsBL.Update(id, collectionPoint);
        }
    }
}
