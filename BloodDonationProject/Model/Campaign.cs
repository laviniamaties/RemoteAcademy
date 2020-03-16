using System;

namespace Model
{
    public class Campaign
    {
        public Guid ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }


        public Campaign()
        {

        }

        public Campaign(Guid id, string name, string description, DateTime startDate, DateTime endDate)
        {
            ID = id;
            Name = name;
            Description = description;
            StartDate = startDate;
            EndDate = endDate;

        }
    }
}
