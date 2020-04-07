using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public interface IBloodBanksBL
    {
        BloodBank ReadByUid(Guid uid);
        void Update(Guid id, BloodBank bloodBank);
        void Add(Guid donorUid, BloodBank bloodBank);
    }
}
