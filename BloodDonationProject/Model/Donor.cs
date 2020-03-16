using System;

namespace Model
{
    public  class Donor
    {
      
        public Guid ID { get; set; }
        public string Sex { get; set; }
        public string Type { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string PhoneNumber { get; set; }
        public string EmailAddress { get; set;}
        public DateTime Birthday { get; set; }

        public BloodType BloodType { get; set; }

        public Donor()
        {

        }


        public Donor(string sex , string type, string firstName, string lastName, string address, string city, 
            string country, string phoneNumber, string emailAddress, DateTime birthday , BloodType bloodType)
        {
            Sex = sex;
            Type = type;
            FirstName = firstName;
            LastName = lastName;
            Address = address;
            City = city;
            Country = country;
            PhoneNumber = phoneNumber;
            EmailAddress = emailAddress;
            Birthday = birthday;
            BloodType = bloodType;
        }

    }
}
