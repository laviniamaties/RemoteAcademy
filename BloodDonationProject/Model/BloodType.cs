using System;

namespace Model
{
    public class BloodType
    {
        public Guid ID { get; set; }
        public string Type { get; set; }


        public BloodType() {}

        public BloodType(Guid id, string type)
        {
            ID = id;
            Type = type;
        }
    }
}
