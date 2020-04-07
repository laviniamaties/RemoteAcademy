﻿using DataAccessLayer;
using System;

namespace BusinessLayer
{
    public class RegistersBL
    {
        private RegistersDAL _registersDAL;

        public RegistersBL(RegistersDAL registersDAL)
        {
            _registersDAL = registersDAL;
        }

        public void Update(Guid idDonor, Guid idPoint)
        {
            _registersDAL.Update(idDonor, idPoint);
        }

        public void Add(Guid idDonor, Guid idPoint)
        {
            _registersDAL.Update(idDonor, idPoint);
        }
    }
}
