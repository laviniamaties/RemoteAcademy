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
            return _bLContext.CollectionPoints.ReadByUid(id);
        }
        [HttpGet]
        public List<CollectionPoint> ReadAll()
        {
            return _bLContext.CollectionPoints.ReadAll();
        }
        [HttpDelete]
        public void DeleteById(Guid id)
        {
            _bLContext.CollectionPoints.DeleteById(id);
        }
        [HttpPost]
        public void Insert(Guid id, [FromBody]CollectionPoint collectionPoint)
        {
            _bLContext.CollectionPoints.Add(id, collectionPoint);
        }
        [HttpPut]
        public void Update(Guid id, [FromBody]CollectionPoint collectionPoint)
        {
            _bLContext.CollectionPoints.Update(id, collectionPoint);
        }
    }
}
