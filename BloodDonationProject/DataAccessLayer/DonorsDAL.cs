using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class DonorsDAL:  IDAL
    {
        private  string _connectionString ;
        private const string DONORS_READ_BY_GUID = "dbo.BloodDonation_Donors_ReadByGUID";
        private const string DONORS_DELETE_BY_GUID = "dbo.BloodDonation_DonorsDelete";
        private const string DONORS_UPDATE_BY_ID = "dbo.BloodDonation_DonorsUpdate";
        private const string DONORS_CREATE_BY_ID = "dbo.BloodDonation_DonorsCreate";
        private const string DONORS_READ_ALL = "dbo.BloodDonation_Donors_ReadAll";

        public DonorsDAL(string connectionString)
        {
            _connectionString = connectionString;
        }

        public List<Donor> ReadAll()
        {
            List<Donor> donors = new List<Donor>();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = DONORS_READ_ALL;
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            Donor donor = new Donor();
                            donor = ConvertToModel(dataReader);
                            donors.Add(donor);
                        }
                    }
                }
            }

            return donors;
        }

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

        public void Update(Guid donorUid, Donor donor)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@DonorID", donorUid));
                    command.Parameters.Add(new SqlParameter("@BloodTypeID", donor.BloodTypeID));
                    command.Parameters.Add(new SqlParameter("@Sex", donor.Sex));
                    command.Parameters.Add(new SqlParameter("@Type", donor.Type));
                    command.Parameters.Add(new SqlParameter("@FirstName", donor.FirstName));
                    command.Parameters.Add(new SqlParameter("@LastName", donor.LastName));
                    command.Parameters.Add(new SqlParameter("@Address", donor.Address));
                    command.Parameters.Add(new SqlParameter("@City", donor.City));
                    command.Parameters.Add(new SqlParameter("@Country", donor.Country));
                    command.Parameters.Add(new SqlParameter("@PhoneNumber", donor.PhoneNumber));
                    command.Parameters.Add(new SqlParameter("@EmailAddress", donor.EmailAddress));
                    command.Parameters.Add(new SqlParameter("@Birthday", donor.Birthday));
                    command.CommandText = DONORS_UPDATE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        public void AddDonors(Guid donorUid, Donor donor )
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@DonorID", donorUid));
                    command.Parameters.Add(new SqlParameter("@BloodTypeID", donor.BloodTypeID));
                    command.Parameters.Add(new SqlParameter("@Sex", donor.Sex));
                    command.Parameters.Add(new SqlParameter("@Type", donor.Type));
                    command.Parameters.Add(new SqlParameter("@FirstName", donor.FirstName));
                    command.Parameters.Add(new SqlParameter("@LastName", donor.LastName));
                    command.Parameters.Add(new SqlParameter("@Address", donor.Address));
                    command.Parameters.Add(new SqlParameter("@City", donor.City));
                    command.Parameters.Add(new SqlParameter("@Country", donor.Country));
                    command.Parameters.Add(new SqlParameter("@PhoneNumber", donor.PhoneNumber));
                    command.Parameters.Add(new SqlParameter("@EmailAddress", donor.EmailAddress));
                    command.Parameters.Add(new SqlParameter("@Birthday", donor.Birthday));
                    command.CommandText = DONORS_CREATE_BY_ID;

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
            donor.Birthday = dataReader.GetString(dataReader.GetOrdinal("Birthday"));
            
            return donor;
        }
    }
}

