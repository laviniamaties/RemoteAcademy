﻿using DataAccessLayer;
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

        public List<Donor> ReadAllDonors()
        {
            return _donorsDAL.ReadAllDonors();
        }

        public List<Donor> ReadAllPacients()
        {
            return _donorsDAL.ReadAllPacients();
        }
        public void Update( Donor donor)
        {
            _donorsDAL.Update(  donor);
        }
        public void Add( Donor donor)
        {
            _donorsDAL.AddDonors( donor);
        }
        public void DeleteById(Guid id)
        {
            _donorsDAL.DeleteByUid(id);
        }
    }
}
