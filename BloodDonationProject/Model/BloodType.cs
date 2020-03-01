using System;

namespace Model
{
    public class BloodType
    {
        public Guid ID { get; set; }
        public string bloodType { get; set; }


        public BloodType()
        {

        }

        public BloodType(Guid id, string bloodType)
        {
            this.ID = id;
            this.bloodType = bloodType;
        }
    }
}
