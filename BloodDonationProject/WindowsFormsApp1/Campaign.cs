using System;

namespace Model
{
    class Campaign
    {
        public Guid ID { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public DateTime startDate { get; set; }
        public DateTime endDate { get; set; }


        public Campaign()
        {

        }

        public Campaign(Guid id, string name, string description, DateTime startDate, DateTime endDate)
        {
            this.ID = id;
            this.name = name;
            this.description = description;
            this.startDate = startDate;
            this.endDate = endDate;

        }
    }
}
