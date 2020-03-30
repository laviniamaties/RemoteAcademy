using System;

namespace Model
{
     public class BloodBank
    {
        public Guid ID { get; set; }
        public string Name { get; set; }
        public string Addresse { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string PhoneNumber { get; set; }
        public string EmailAddresse { get; set; }


        public BloodBank()
        {

        }

        public BloodBank( string name, string addresse, string city, string country,
            string phoneNumber, string emailAddresse)
        {
            Name = name;
            Addresse = addresse;
            City = city;
            Country = country;
            PhoneNumber = phoneNumber;
            EmailAddresse = emailAddresse;

        }
    }
}
