using DataAccessLayer;
using Model;
using System;

namespace BusinessLayer
{
    public class CollectionPointsBL: IBL, ICollectionPointsBL
    {
        private CollectionPointsDAL _collectionPointsDAL;

        public CollectionPointsBL(CollectionPointsDAL collectionPointsDAL)
        {
            _collectionPointsDAL = collectionPointsDAL;
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
