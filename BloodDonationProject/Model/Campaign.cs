using System;
using System.Collections.Generic;

namespace Model
{
    public class Campaign
    {
        public Guid ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        public ICollection<CollectionPoint> CollectionPoint { get; set; }

        public Campaign()
        {

        }

        public Campaign( string name, string description, DateTime startDate, DateTime endDate)
        {
            Name = name;
            Description = description;
            StartDate = startDate;
            EndDate = endDate;

        }
    }
}
