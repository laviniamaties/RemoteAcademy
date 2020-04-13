using DataAccessLayer;
using Model;
using System;
using System.Collections.Generic;

namespace BusinessLayer
{
    public class CollectionPointsBL: IBL
    {
        private CollectionPointsDAL _collectionPointsDAL;

        public CollectionPointsBL(CollectionPointsDAL collectionPointsDAL)
        {
            _collectionPointsDAL = collectionPointsDAL;
        }

        public List<CollectionPoint> ReadAll()
        {
            return _collectionPointsDAL.ReadAll();
        }
        public CollectionPoint ReadByUid(Guid uid)
        {
            return _collectionPointsDAL.ReadByUid(uid);
        }
        public void Update(Guid id, CollectionPoint collectionPoint)
        {
            _collectionPointsDAL.Update(id, collectionPoint);
        }
        public void Add(Guid id, CollectionPoint collectionPoint)
        {
            _collectionPointsDAL.AddCollectionPoints(id, collectionPoint);
        }
        public void Delete(Guid id)
        {
            _collectionPointsDAL.DeleteByUid(id);
        }
    }
}
