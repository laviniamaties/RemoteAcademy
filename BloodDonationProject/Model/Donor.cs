using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

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
        public string Birthday { get; set; }
        public Guid BloodTypeID { get; set; }
        public string BloodType { get; set; }

        public virtual BloodType BloodTypes { get; set; }
        //public IList<BloodType> BloodTypes { get; set; }
        //public virtual ICollection<BloodType> BloodTypes { get; set; }
        //public virtual ICollection<Register> Registers { set; get; }

        public Donor(){
   
        }

        public Donor(Guid id, BloodType bloodTypeID,  string sex , string type, string firstName, string lastName, string address, string city, 
            string country, string phoneNumber, string emailAddress, string birthDay, string bloodType)
        {
            ID = id;
            BloodTypes =  bloodTypeID;
            Sex = sex;
            Type = type;
            FirstName = firstName;
            LastName = lastName;
            Address = address;
            City = city;
            Country = country;
            PhoneNumber = phoneNumber;
            EmailAddress = emailAddress;
            Birthday = birthDay;
            BloodType = bloodType;


        }

    }
}
