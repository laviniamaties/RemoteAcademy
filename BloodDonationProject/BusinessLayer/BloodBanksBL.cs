using DataAccessLayer;
using Model;
using System;
using System.Collections.Generic;

namespace BusinessLayer
{
    public class BloodBanksBL: IBL
    {
        private BloodBanksDAL _bloodBanksDAL;

        public BloodBanksBL(BloodBanksDAL bloodBanksDAL)
        {
            _bloodBanksDAL = bloodBanksDAL;
        }

        public BloodBank ReadByUid(Guid uid)
        {
            return _bloodBanksDAL.ReadByUid(uid);
        }

        public List<BloodBank> ReadAll()
        {
            return _bloodBanksDAL.ReadAll();
        }

        public void Update(Guid id, BloodBank bloodBank)
        {
            _bloodBanksDAL.Update(id, bloodBank);
        }

        public void Add(Guid id, BloodBank bloodBank)
        {
            _bloodBanksDAL.AddBloodBank(id, bloodBank);
        }
        public void Delete(Guid id)
        {
            _bloodBanksDAL.DeleteByUid(id);

        }
    }
}
