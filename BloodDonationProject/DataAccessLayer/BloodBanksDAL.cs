using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class BloodBanksDAL: IDAL
    {
        private  string _connectionString ;
        private const string BLOOD_BANKS_READ_BY_GUID = "dbo.BloodDonation_BloodBank_ReadByGUID";
        private const string BLOOD_BANK_READ_ALL = "dbo.BloodDonation_BloodBank_ReadAll";
        private const string BLOOD_BANKS_DELETE_BY_ID = "dbo.BloodDonation_BloodBanksDelete";
        private const string BLOOD_BANKS_UPDATE_BY_ID = "dbo.BloodDonation_BloodBanksUpdate";
        private const string BLOOD_BANKS_CREATE_BY_ID = "dbo.BloodDonation_BloodBanksCreate";

        public BloodBanksDAL(string connectionString)
        {
            _connectionString = connectionString;
        }

        public List<BloodBank> ReadAll()
        {
            List<BloodBank> bloodBanks = new List<BloodBank>();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = BLOOD_BANK_READ_ALL;
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            BloodBank bloodBank = new BloodBank();
                            bloodBank = ConvertToModel(dataReader);
                            bloodBanks.Add(bloodBank);
                        }
                    }
                }
            }

            return bloodBanks;
        }
        public BloodBank ReadByUid(Guid bloodBankUid)
        {
            BloodBank bloodBank = new BloodBank();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = BLOOD_BANKS_READ_BY_GUID;
                    command.Parameters.Add(new SqlParameter("@BloodBankID", bloodBankUid));
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        if (dataReader.Read())
                        {
                            bloodBank = ConvertToModel(dataReader);
                        }
                    }
                }
            }

            return bloodBank;
        }

        public void DeleteByUid(Guid bloodBankUid)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@BloodBankID", bloodBankUid));
                    command.CommandText = BLOOD_BANKS_DELETE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        public void Update(Guid bloodBankUid, BloodBank bloodBank)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@BloodBankID", bloodBankUid));
                    command.Parameters.Add(new SqlParameter("@Name", bloodBank.Name));
                    command.Parameters.Add(new SqlParameter("@Address", bloodBank.Addresse));
                    command.Parameters.Add(new SqlParameter("@City", bloodBank.City));
                    command.Parameters.Add(new SqlParameter("@Country", bloodBank.Country));
                    command.Parameters.Add(new SqlParameter("@PhoneNumber", bloodBank.PhoneNumber));
                    command.Parameters.Add(new SqlParameter("@EmailAddress", bloodBank.EmailAddresse));
                    command.CommandText = BLOOD_BANKS_UPDATE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        public void AddBloodBank(Guid bloodBankUid, BloodBank bloodBank)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@BloodBankID", bloodBankUid));
                    command.Parameters.Add(new SqlParameter("@Name", bloodBank.Name));
                    command.Parameters.Add(new SqlParameter("@Address", bloodBank.Addresse));
                    command.Parameters.Add(new SqlParameter("@City",bloodBank.City));
                    command.Parameters.Add(new SqlParameter("@Country", bloodBank.Country));
                    command.Parameters.Add(new SqlParameter("@PhoneNumber", bloodBank.PhoneNumber));
                    command.Parameters.Add(new SqlParameter("@EmailAddress", bloodBank.EmailAddresse));
                    command.CommandText = BLOOD_BANKS_CREATE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        private BloodBank ConvertToModel(SqlDataReader dataReader)
        {
            BloodBank bloodBank = new BloodBank();
            bloodBank.ID = dataReader.GetGuid(dataReader.GetOrdinal("BloodBankID"));
            bloodBank.Name = dataReader.GetString(dataReader.GetOrdinal("Name"));
            bloodBank.Addresse = dataReader.GetString(dataReader.GetOrdinal("Address"));
            bloodBank.City = dataReader.GetString(dataReader.GetOrdinal("City"));
            bloodBank.Country = dataReader.GetString(dataReader.GetOrdinal("Country"));
            bloodBank.PhoneNumber = dataReader.GetString(dataReader.GetOrdinal("PhoneNumber"));
            bloodBank.EmailAddresse = dataReader.GetString(dataReader.GetOrdinal("EmailAddress"));
                        
            return bloodBank;
        }
    }
}
