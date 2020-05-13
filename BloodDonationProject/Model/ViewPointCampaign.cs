using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class ViewPointCampaign
    {
        public Guid CampaignId { get; set; }
        public Guid CollectionPointId { get; set; }
        public string CampaignName { get; set; }
        public string Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string PointName { get; set; }

        public string Addresse { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public ViewPointCampaign() { }

        public ViewPointCampaign(Guid campaignId, Guid pointID, string campaignName, string description, 
               DateTime startDate, DateTime endDate , string pointName, string addresse, string city, string country)
        {
            CampaignId = campaignId;
            CollectionPointId = pointID;
            CampaignName = campaignName;
            Description = description;
            StartDate = startDate;
            EndDate = endDate;
            PointName = pointName;
            Addresse = addresse;
            City = city;
            Country = country;
        }
    }
}
