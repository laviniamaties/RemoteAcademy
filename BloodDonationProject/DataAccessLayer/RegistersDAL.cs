using Model;
using System;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class RegistersDAL
    {
        private  string _connectionString ;
        private const string REGISTERS_UPDATE_BY_ID = "dbo.BloodDonation_RegistersUpdate";
        private const string REGISTERS_CREATE_BY_ID = "dbo.BloodDonation_RegistersCreate";

        public RegistersDAL(string connectionString)
        {
            _connectionString = connectionString;
        }
        public void Update(Guid donorUid, Guid collectionPointUid )
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@DonorID", donorUid));
                    command.Parameters.Add(new SqlParameter("@ColectionPointID", collectionPointUid));
                    
                    
                    command.CommandText = REGISTERS_UPDATE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        public void Add(Register register)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@DonorID", register.DonorId));
                    command.Parameters.Add(new SqlParameter("@ColectionPointID", register.CollectionPointId));
      
                    command.CommandText = REGISTERS_CREATE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
