using System;
using System.Collections.Generic;

namespace Model
{
    public class BloodType
    {
        public Guid ID { get; set; }
        public string Type { get; set; }
        public virtual Donor Donor { get; set; }

        public BloodType() {}
        public BloodType(Guid id, string type)
        {
            ID = id;
            Type = type;
        }
    }
}
