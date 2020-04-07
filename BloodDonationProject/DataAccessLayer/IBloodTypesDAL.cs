using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public interface IBloodTypesDAL
    {
        BloodType ReadByUid(Guid id);
        void Update(Guid id, BloodType bloodType);
        void AddBloodType(Guid donorUid, BloodType bloodType);
    }
}
