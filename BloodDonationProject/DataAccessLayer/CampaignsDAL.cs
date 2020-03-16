using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class CampaignsDAL
    {
        private const string _connectionString = "Server=LAVINIA-PC;Database=BloodDonation;Trusted_Connection=True;";
        private const string CAMPAIGN_READ_BY_GUID = "dbo.BloodDonation_Campaigns_ReadByID";
        private const string CAMPAIGN_DELETE_BY_ID = "dbo.BloodDonation_CampaignsDelete";
        private const string CAMPAIGN_UPDATE_BY_ID = "dbo.BloodDonation_CampaignsUpdate";
        private const string CAMPAIGN_CREATE_BY_ID = "dbo.BloodDonation_CampaignsCreate";


        public Campaign  ReadByUid(Guid campaignUid)
        {
            Campaign campaign = new Campaign();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = CAMPAIGN_READ_BY_GUID;
                    command.Parameters.Add(new SqlParameter("@CampaignID", campaignUid));
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        if (dataReader.Read())
                        {
                            campaign = ConvertToModel(dataReader);
                        }
                    }
                }
            }

            return campaign;
        }

        public void DeleteByUid(Guid campaignUid)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@CampaignID", campaignUid));
                    command.CommandText = CAMPAIGN_DELETE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        public void Update(Guid campaignUid, string name, string description, DateTime startDate, DateTime endDate)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@CampaignID", campaignUid));
                    command.Parameters.Add(new SqlParameter("@Name", name));
                    command.Parameters.Add(new SqlParameter("@Description", description));
                    command.Parameters.Add(new SqlParameter("@StartDate", startDate));
                    command.Parameters.Add(new SqlParameter("@EndDate", endDate));
                    command.CommandText = CAMPAIGN_UPDATE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        public void AddCampaign(Guid campaignUid, string name, string description, DateTime startDate, DateTime endDate)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@CampaignID", campaignUid));
                    command.Parameters.Add(new SqlParameter("@Name", name));
                    command.Parameters.Add(new SqlParameter("@Description", description));
                    command.Parameters.Add(new SqlParameter("@StartDate", startDate));
                    command.Parameters.Add(new SqlParameter("@EndDate", endDate));
                    command.CommandText = CAMPAIGN_CREATE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        private Campaign ConvertToModel(SqlDataReader dataReader)
        {
            Campaign campaign = new Campaign();
            campaign.ID = dataReader.GetGuid(dataReader.GetOrdinal("CampaignID"));
            campaign.Name = dataReader.GetString(dataReader.GetOrdinal("Name"));
            campaign.Description = dataReader.GetString(dataReader.GetOrdinal("Description"));
            campaign.StartDate = dataReader.GetDateTime(dataReader.GetOrdinal("StartDate"));
            campaign.EndDate = dataReader.GetDateTime(dataReader.GetOrdinal("EndDate"));

            return campaign;
        }
    }
}
