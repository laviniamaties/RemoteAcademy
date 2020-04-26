using System;

namespace Model
{
    public class RegisterCampaign
    {
        public Guid CampaignId { get; set; }
        public Guid CollectionPointId { get; set; }
        public virtual Campaign Campaign { set; get; }
        public virtual CollectionPoint CollectionPoint { get; set; }
        public RegisterCampaign() { }

    }
}
