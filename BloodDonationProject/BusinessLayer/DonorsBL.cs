using DataAccessLayer;
using Model;
using System;
using System.Collections.Generic;

namespace BusinessLayer
{
    public class DonorsBL: IBL
    {
        private DonorsDAL _donorsDAL;

        public DonorsBL(DonorsDAL donorsDAL)
        {
            _donorsDAL = donorsDAL;
        }

        public Donor ReadByUid(Guid uid)
        {
            return _donorsDAL.ReadByUid(uid);
        }
        public List<Donor> ReadAll()
        {
            return _donorsDAL.ReadAll();
        }
        public void Update(Guid id, Donor donor)
        {
            _donorsDAL.Update(id, donor);
        }
        public void Add(Guid id, Donor donor)
        {
            _donorsDAL.AddDonors(id, donor);
        }
        public void DeleteById(Guid id)
        {
            _donorsDAL.DeleteByUid(id);
        }
    }
}
