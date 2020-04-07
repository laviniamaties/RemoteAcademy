using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class CollectionPointsDAL: IDAL, ICollectionPointsDAL
    {
        private  string _connectionString ;
        private const string COLLECTION_POINTS_READ_BY_GUID = "dbo.BloodDonation_ColectionPoints_ReadByGUID";
        private const string COLLECTION_POINTS_DELETE_BY_ID = "dbo.BloodDonation_ColectionPointsDelete";
        private const string COLLECTION_POINTS_UPDATE_BY_ID = "dbo.BloodDonation_CollectionPointsUpdate";
        private const string COLLECTION_POINTS_CREATE_BY_ID = "dbo.BloodDonation_CollectionPointsCreate";

        public CollectionPointsDAL(string connectionString)
        {
            _connectionString = connectionString;
        }

        public CollectionPoint ReadByUid(Guid collectionPointUid)
        {
            CollectionPoint collectionPoint = new CollectionPoint();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = COLLECTION_POINTS_READ_BY_GUID;
                    command.Parameters.Add(new SqlParameter("@ColectionPointID", collectionPointUid));
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        if (dataReader.Read())
                        {
                            collectionPoint = ConvertToModel(dataReader);
                        }
                    }
                }
            }

            return collectionPoint;
        }

        public void DeleteByUid(Guid collectionPointUid)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@ColectionPointID", collectionPointUid));
                    command.CommandText = COLLECTION_POINTS_DELETE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        public void Update(Guid collectionPointUid , CollectionPoint collectionPoint )
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@ColectionPointID", collectionPointUid));
                    command.Parameters.Add(new SqlParameter("@Name", collectionPoint.Name));
                    command.Parameters.Add(new SqlParameter("@Address", collectionPoint.Addresse));
                    command.Parameters.Add(new SqlParameter("@City", collectionPoint.City));
                    command.Parameters.Add(new SqlParameter("@Country", collectionPoint.Country));
                    command.Parameters.Add(new SqlParameter("@PhoneNumber", collectionPoint.PhoneNumber));
                    command.Parameters.Add(new SqlParameter("@EmailAddress", collectionPoint.EmailAddresse));
                    command.CommandText = COLLECTION_POINTS_UPDATE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        public void AddCollectionPoints(Guid collectionPointUid, CollectionPoint collectionPoint)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Connection = connection;
                    command.Parameters.Add(new SqlParameter("@ColectionPointID", collectionPointUid));
                    command.Parameters.Add(new SqlParameter("@Name", collectionPoint.Name));
                    command.Parameters.Add(new SqlParameter("@Address", collectionPoint.Addresse));
                    command.Parameters.Add(new SqlParameter("@City", collectionPoint.City));
                    command.Parameters.Add(new SqlParameter("@Country", collectionPoint.Country));
                    command.Parameters.Add(new SqlParameter("@PhoneNumber", collectionPoint.PhoneNumber));
                    command.Parameters.Add(new SqlParameter("@EmailAddress", collectionPoint.EmailAddresse));
                    command.CommandText = COLLECTION_POINTS_CREATE_BY_ID;

                    command.ExecuteNonQuery();
                }
            }
        }

        private CollectionPoint ConvertToModel(SqlDataReader dataReader)
        {
            CollectionPoint collectionPoint  = new CollectionPoint();
            collectionPoint.ID = dataReader.GetGuid(dataReader.GetOrdinal("BloodBankID"));
            collectionPoint.Name = dataReader.GetString(dataReader.GetOrdinal("Name"));
            collectionPoint.Addresse = dataReader.GetString(dataReader.GetOrdinal("Address"));
            collectionPoint.City = dataReader.GetString(dataReader.GetOrdinal("City"));
            collectionPoint.Country = dataReader.GetString(dataReader.GetOrdinal("Country"));
            collectionPoint.PhoneNumber = dataReader.GetString(dataReader.GetOrdinal("PhoneNumber"));
            collectionPoint.EmailAddresse = dataReader.GetString(dataReader.GetOrdinal("EmailAddress"));

            return collectionPoint;
        }

    }
}
