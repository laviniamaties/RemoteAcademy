﻿using System;

namespace Model
{
    class CollectionPoint
    {
        public Guid ID { get; set; }
        public string name { get; set; }
        public string adresse { get; set; }

        public string city { get; set; }
        public string country { get; set; }
        public string phoneNumber { get; set; }
        public string emailAdresse { get; set; }


        public BloodBank bloodBankID;

        public CollectionPoint()
        {

        }

        public CollectionPoint(Guid id, string name, string adresse, string city, string country,
            string phoneNumber, string emailAdresse)
        {
            this.ID = id;
            this.name = name;
            this.adresse = adresse;
            this.city = city;
            this.country = country;
            this.phoneNumber = phoneNumber;
            this.emailAdresse = emailAdresse;

        }

    }
}
