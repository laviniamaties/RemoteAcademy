using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    interface IRegistersDAL
    {
        void Update(Guid donorID, Guid pointID);
        void Add(Guid donorID, Guid pointID);
    }
}
