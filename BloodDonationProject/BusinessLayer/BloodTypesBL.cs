using DataAccessLayer;
using Model;
using System;
using System.Collections.Generic;

namespace BusinessLayer
{
    public class BloodTypesBL: IBL
    {
        private BloodTypesDAL _bloodTypesDAL;

        public BloodTypesBL(BloodTypesDAL bloodTypesDAL)
        {
            _bloodTypesDAL = bloodTypesDAL;
        }

        public List<BloodType> ReadAll()
        {
            return _bloodTypesDAL.ReadAll();
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
        public void DeleteById(Guid id)
        {
            _bloodTypesDAL.DeleteByUid(id);
        }

    }
}
