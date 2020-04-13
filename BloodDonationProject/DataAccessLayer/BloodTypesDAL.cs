using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class BloodTypesDAL: IDAL
    {
        private  string _connectionString ;
        private const string BLOOD_TYPES_READ_BY_GUID = "dbo.BloodDonation_BloodTypes_ReadByGUID";
        private const string BLOOD_TYPES_READ_ALL = "dbo.BloodDonation_BloodTypes_ReadAll";
        private const string BLOOD_TYPES_DELETE_BY_ID = "dbo.BloodDonation_BloodTypesDelete";
        private const string BLOOD_TYPES_UPDATE_BY_ID = "dbo.BloodDonation_BloodTypesUpdate";
        private const string BLOOD_TYPES_CREATE_BY_ID = "dbo.BloodDonation_BloodTypesCreate";

        public BloodTypesDAL( string connectionString)
        {
            _connectionString = connectionString;
        }

        public List<BloodType> ReadAll()
        {
            List<BloodType> bloodTypes = new List<BloodType>();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = BLOOD_TYPES_READ_ALL;
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            BloodType bloodType = new BloodType();
                            bloodType = ConvertToModel(dataReader);
                            bloodTypes.Add(bloodType);
                        }
                    }
                }
            }

            return bloodTypes;
        }

        public BloodType ReadByUid(Guid bloodUid)
        {
            BloodType bloodType = new BloodType();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = BLOOD_TYPES_READ_BY_GUID;
                    command.Parameters.Add(new SqlParameter("@BloodTypeID", bloodUid));
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        if (dataReader.Read())
                        {
                            bloodType = ConvertToModel(dataReader);
                        }
                    }
                }
            }

            return bloodType;
        }

        public void DeleteByUid(Guid bloodUid)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@BloodTypeID", bloodUid));
                    command.CommandText = BLOOD_TYPES_DELETE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        public void Update(Guid bloodUid, BloodType bloodType)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@BloodTypeID", bloodUid));
                    command.Parameters.Add(new SqlParameter("@BloodType", bloodType.Type));
                    command.CommandText = BLOOD_TYPES_UPDATE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        public void AddBloodType(Guid bloodUid, BloodType bloodType)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@BloodTypeID", bloodUid));
                    command.Parameters.Add(new SqlParameter("@BloodType", bloodType.Type));
                    command.CommandText = BLOOD_TYPES_CREATE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        private BloodType ConvertToModel(SqlDataReader dataReader)
        {
            BloodType bloodType = new BloodType();
            bloodType.ID = dataReader.GetGuid(dataReader.GetOrdinal("BloodTypeID"));
            bloodType.Type = dataReader.GetString(dataReader.GetOrdinal("BloodType"));

            return bloodType;
        }
    }
}

