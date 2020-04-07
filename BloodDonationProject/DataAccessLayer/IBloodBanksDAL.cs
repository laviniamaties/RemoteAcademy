using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public interface IBloodBanksDAL
    {

        BloodBank ReadByUid(Guid id);
        void Update(Guid id, BloodBank bloodBank);
        void AddBloodBank(Guid donorUid, BloodBank bloodBank);
    }
}
