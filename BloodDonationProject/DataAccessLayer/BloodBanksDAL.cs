using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class BloodBanksDAL
    {
        private const string _connectionString = "Server=LAVINIA-PC;Database=BloodDonation;Trusted_Connection=True;";
        private const string BLOOD_BANKS_READ_BY_GUID = "dbo.BloodDonation_BloodBank_ReadByID";
        private const string BLOOD_BANKS_DELETE_BY_ID = "dbo.BloodDonation_BloodBanksDelete";
        private const string BLOOD_BANKS_UPDATE_BY_ID = "dbo.BloodDonation_BloodBanksUpdate";
        private const string BLOOD_BANKS_CREATE_BY_ID = "dbo.BloodDonation_BloodBanksCreate";


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

        public void Update(Guid bloodBankUid, string name, string addresse, string city, string country,
            string phoneNumber, string emailAddresse)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@BloodBankID", bloodBankUid));
                    command.Parameters.Add(new SqlParameter("@Name", name));
                    command.Parameters.Add(new SqlParameter("@Address", addresse));
                    command.Parameters.Add(new SqlParameter("@City", city));
                    command.Parameters.Add(new SqlParameter("@Country", country));
                    command.Parameters.Add(new SqlParameter("@PhoneNumber", phoneNumber));
                    command.Parameters.Add(new SqlParameter("@EmailAddress", emailAddresse));
                    command.CommandText = BLOOD_BANKS_UPDATE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        public void AddBloodBank(Guid bloodBankUid, string name, string addresse, string city, string country, 
            string phoneNumber, string emailAddresse)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@BloodBankID", bloodBankUid));
                    command.Parameters.Add(new SqlParameter("@Name", name));
                    command.Parameters.Add(new SqlParameter("@Address", addresse));
                    command.Parameters.Add(new SqlParameter("@City",city));
                    command.Parameters.Add(new SqlParameter("@Country", country));
                    command.Parameters.Add(new SqlParameter("@PhoneNumber", phoneNumber));
                    command.Parameters.Add(new SqlParameter("@EmailAddress", emailAddresse));
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
