using System;
using System.Collections.Generic;

namespace Model
{
    public class CollectionPoint
    {
        public Guid ID { get; set; }
        public string Name { get; set; }
        public string Addresse { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string PhoneNumber { get; set; }
        public string EmailAddresse { get; set; }
        public Guid BloodBankID { get; set; }
        public BloodBank BloodBank { get; set; }
        public virtual ICollection<Register> Registers { set; get; }
        public virtual ICollection<RegisterCampaign> RegisterCampaigns { set; get; }

        public CollectionPoint()   {  }

        public CollectionPoint( string name, string addresse, string city, string country,
            string phoneNumber, string emailAddresse, Guid bloodBankID)
        {

            Name = name;
            Addresse = addresse;
            City = city;
            Country = country;
            PhoneNumber = phoneNumber;
            EmailAddresse = emailAddresse;
            BloodBankID = bloodBankID;

        }

    }
}
