using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class ViewDonorPoint
    {
        public Guid DonorId { get; set; }
        public Guid CollectionPointId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Type { get; set; }
        public string Birthday { get; set; }
        public string PointName { get; set; }
        public string PointAddresse { get; set; }
        public string PointCity { get; set; }
        public string PointCountry { get; set; }
        public string PointEmail { get; set; }
        public string PointNumber { get; set; }
        public ViewDonorPoint() { }

        public ViewDonorPoint(Guid donorId, Guid pointID, string firstName, string lastName,
               string type , string birthday, string pointName, string addresse, string city, string country, 
               string email, string number)
        {
            DonorId = donorId;
            CollectionPointId = pointID;
            FirstName = firstName;
            LastName = lastName;
            Type = type;
            Birthday = birthday;
            PointName = pointName;
            PointAddresse = addresse;
            PointCity = city;
            PointCountry = country;
            PointEmail = email;
            PointNumber = number;
        }
    }
}
