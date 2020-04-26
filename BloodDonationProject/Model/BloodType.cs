using System;
using System.Collections.Generic;

namespace Model
{
    public class BloodType
    {
        public Guid ID { get; set; }
        public string Type { get; set; }
        public List<Donor> Donors { get; set; }

        public BloodType() {}
        public BloodType(Guid id, string type)
        {
            ID = id;
            Type = type;
        }
    }
}
