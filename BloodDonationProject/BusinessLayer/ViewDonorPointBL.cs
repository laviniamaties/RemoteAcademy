using DataAccessLayer;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class ViewDonorPointBL
    {
        private ViewDonorPointDAL _viewDonorPointDAL ;

        public ViewDonorPointBL(ViewDonorPointDAL viewDonorPointDAL )
        {
            _viewDonorPointDAL = viewDonorPointDAL;
        }

        public List<ViewDonorPoint> ReadAll()
        {
            return _viewDonorPointDAL.ReadAll();
        }
    }
}
