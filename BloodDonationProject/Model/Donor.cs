using System;

namespace Model
{
    public  class Donor
    {
      
        public Guid ID { get; set; }
        private string sex { get; set; }
        private string type { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string adresse { get; set; }
        public string city { get; set; }
        public string country { get; set; }
        public string phoneNumber { get; set; }
        public string emailAdresse { get; set;}
        private DateTime birthday { get; set; }

        public BloodType bloodType;

        public Donor()
        {

        }


        public Donor(string firstName, string lastName, string adresse, string city, string country, 
            string phoneNumber, string emailAdresse)
        {
            this.firstName = firstName;
            this.lastName = lastName;
            this.adresse = adresse;
            this.city = city;
            this.country = country;
            this.phoneNumber = phoneNumber;
            this.emailAdresse = emailAdresse;

        }

      

    }
}
