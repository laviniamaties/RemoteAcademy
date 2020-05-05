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
        public void Update( CollectionPoint collectionPoint)
        {
            _collectionPointsDAL.Update( collectionPoint);
        }
        public void Add( CollectionPoint collectionPoint)
        {
            _collectionPointsDAL.AddCollectionPoints(collectionPoint);
        }
        public void DeleteById(Guid id)
        {
            _collectionPointsDAL.DeleteByUid(id);
        }
    }
}
