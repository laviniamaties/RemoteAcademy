using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public interface IDonorsBL
    {
        Donor ReadByUid(Guid uid);
        void Update(Guid id, Donor donor);
        void Add(Guid id, Donor donor);
    }
}
