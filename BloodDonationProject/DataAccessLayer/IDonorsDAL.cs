using Model;
using System;

namespace DataAccessLayer
{
    public interface IDonorsDAL
    {
        Donor ReadByUid(Guid id);
        void Update(Guid id, Donor donor);
        void AddDonors(Guid donorUid, Donor donor);
    }
}
