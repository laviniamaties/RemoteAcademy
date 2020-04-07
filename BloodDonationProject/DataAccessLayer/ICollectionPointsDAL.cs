using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public interface ICollectionPointsDAL
    {
        CollectionPoint ReadByUid(Guid id);
        void Update(Guid id, CollectionPoint point);
        void AddCollectionPoints(Guid id, CollectionPoint point);
    }
}
