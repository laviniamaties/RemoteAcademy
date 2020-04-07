using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public interface ICollectionPointsBL
    {
        CollectionPoint ReadByUid(Guid uid);
        void Update(Guid id, CollectionPoint collectionPoint);
        void Add(Guid id, CollectionPoint collectionPoint);

    }
}
