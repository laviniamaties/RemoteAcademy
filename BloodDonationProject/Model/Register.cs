using System;

namespace Model
{
    public class Register
    {
        public Guid DonorId { get; set; }
        public Guid CollectionPointId { get; set; }
        public virtual Donor Donor { set; get; }
        public virtual CollectionPoint CollectionPoint { get; set; }

        public Register() { }
    }
}
