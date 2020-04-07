using DataAccessLayer;
using Model;
using System;

namespace BusinessLayer
{
    public class BloodTypesBL: IBL, IBloodTypesBL
    {
        private BloodTypesDAL _bloodTypesDAL;

        public BloodTypesBL(BloodTypesDAL bloodTypesDAL)
        {
            _bloodTypesDAL = bloodTypesDAL;
        }

        public BloodType ReadByUid(Guid uid)
        {
            return _bloodTypesDAL.ReadByUid(uid);
        }
        public void Update(Guid id, BloodType bloodType)
        {
            _bloodTypesDAL.Update(id, bloodType);
        }
        public void Add(Guid id, BloodType bloodType)
        {
            _bloodTypesDAL.AddBloodType(id, bloodType);
        }
        public void Delete(Guid id)
        {
            _bloodTypesDAL.DeleteByUid(id);

        }

    }
}
