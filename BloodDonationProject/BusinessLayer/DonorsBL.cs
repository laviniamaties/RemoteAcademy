using DataAccessLayer;
using Model;
using System;

namespace BusinessLayer
{
    public class DonorsBL: IBL, IDonorsBL
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
        public void Update(Guid id, Donor donor)
        {
            _donorsDAL.Update(id, donor);
        }
        public void Add(Guid id, Donor donor)
        {
            _donorsDAL.AddDonors(id, donor);
        }
        public void Delete(Guid id)
        {
            _donorsDAL.DeleteByUid(id);
        }
    }
}
