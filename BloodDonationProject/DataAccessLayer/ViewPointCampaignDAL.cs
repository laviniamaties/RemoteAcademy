using System;
using System.Collections.Generic;
using System.Linq;
using Model;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class ViewPointCampaignDAL
    {
        private string _connectionString;
        
        private const string CAMPAIGN_POINT = "dbo.BloodDonation_Campaigns_ShowPointCampaign";


        public ViewPointCampaignDAL(string connectionString)
        {
            _connectionString = connectionString;
        }
        public List<ViewPointCampaign> ReadAll()
        {
            List<ViewPointCampaign> viewPointCampaigns = new List<ViewPointCampaign>();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = CAMPAIGN_POINT;
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            ViewPointCampaign viewPointCampaign = new ViewPointCampaign();
                            viewPointCampaign = ConvertToModel(dataReader);
                            viewPointCampaigns.Add(viewPointCampaign);
                        }
                    }
                }
            }

            return viewPointCampaigns;
        }

        private ViewPointCampaign ConvertToModel(SqlDataReader dataReader)
        {
            ViewPointCampaign viewPointCampaign = new ViewPointCampaign();
            viewPointCampaign.CampaignId = dataReader.GetGuid(dataReader.GetOrdinal("CampaignID"));
            viewPointCampaign.CollectionPointId = dataReader.GetGuid(dataReader.GetOrdinal("ColectionPointID"));

            viewPointCampaign.CampaignName = dataReader.GetString(dataReader.GetOrdinal("CampaignName"));
            viewPointCampaign.Description = dataReader.GetString(dataReader.GetOrdinal("Description"));
            viewPointCampaign.StartDate = dataReader.GetDateTime(dataReader.GetOrdinal("StartDate"));
            viewPointCampaign.EndDate = dataReader.GetDateTime(dataReader.GetOrdinal("EndDate"));
            viewPointCampaign.PointName = dataReader.GetString(dataReader.GetOrdinal("PointName"));

            viewPointCampaign.Addresse = dataReader.GetString(dataReader.GetOrdinal("Address"));
            viewPointCampaign.City = dataReader.GetString(dataReader.GetOrdinal("City"));
            viewPointCampaign.Country = dataReader.GetString(dataReader.GetOrdinal("Country"));

            return viewPointCampaign;
        }

    }
}
