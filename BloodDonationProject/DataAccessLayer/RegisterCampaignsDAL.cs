﻿using System;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class RegisterCampaignsDAL
    {
        private const string _connectionString = "Server=LAVINIA-PC;Database=BloodDonation;Trusted_Connection=True;";
        private const string REGISTER_CAMPAIGNS_UPDATE_BY_ID = "dbo.BloodDonation_RegisterCampaignsUpdate";
        private const string REGISTER_CAMPAIGNS_CREATE_BY_ID = "dbo.BloodDonation_RegisterCampaignsCreate";

        public void Update( Guid campaignUid, Guid collectionPointUid)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@ColectionPointID", collectionPointUid));
                    command.Parameters.Add(new SqlParameter("@CampaignID", campaignUid));


                    command.CommandText = REGISTER_CAMPAIGNS_UPDATE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        public void Add(Guid campaignUid , Guid collectionPointUid)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@ColectionPointID", collectionPointUid));
                    command.Parameters.Add(new SqlParameter("@CampaignID", campaignUid));

                    command.CommandText = REGISTER_CAMPAIGNS_CREATE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
