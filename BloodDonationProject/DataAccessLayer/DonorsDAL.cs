﻿using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DonorsDAL
    {
        private const string _connectionString = "Server=LAVINIA-PC;Database=BloodDonation;Trusted_Connection=True;";
        private const string DONORS_READ_BY_GUID = "dbo.BloodDonation_Donors_ReadByID";
        private const string DONORS_DELETE_BY_GUID = "dbo.BloodDonation_DonorsDelete";



        public Donor ReadByUid(Guid donorUid)
        {
            Donor donor = new Donor();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = DONORS_READ_BY_GUID; 
                    command.Parameters.Add(new SqlParameter("@DonorID", donorUid));
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        if (dataReader.Read())
                        {
                            donor = ConvertToModel(dataReader);
                        }
                    }
                }
            }

            return donor;
        }

        public void DeleteByUid(Guid donorUid)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@DonorID", donorUid));
                    command.CommandText = DONORS_DELETE_BY_GUID;

                    command.ExecuteNonQuery();
                }
            }
        }

        private Donor ConvertToModel(SqlDataReader dataReader)
        {
            Donor donor = new Donor();
            donor.ID = dataReader.GetGuid(dataReader.GetOrdinal("DonorID"));
            donor.Sex = dataReader.GetString(dataReader.GetOrdinal("Sex"));
            donor.Type = dataReader.GetString(dataReader.GetOrdinal("Type"));
            donor.FirstName = dataReader.GetString(dataReader.GetOrdinal("FirstName"));
            donor.LastName = dataReader.GetString(dataReader.GetOrdinal("LastName"));
            donor.Address = dataReader.GetString(dataReader.GetOrdinal("Address"));
            donor.City = dataReader.GetString(dataReader.GetOrdinal("City"));
            donor.Country = dataReader.GetString(dataReader.GetOrdinal("Country"));
            donor.PhoneNumber = dataReader.GetString(dataReader.GetOrdinal("PhoneNumber"));
            donor.EmailAddress = dataReader.GetString(dataReader.GetOrdinal("EmailAddress"));
            donor.Birthday = dataReader.GetDateTime(dataReader.GetOrdinal("BirthDay"));

            return donor;
        }
    }
}

