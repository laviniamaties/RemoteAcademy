using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public interface IBloodTypesBL
    {
        BloodType ReadByUid(Guid id);
        void Update(Guid id, BloodType bloodType);
        void Add(Guid id, BloodType bloodType);
    }
}
