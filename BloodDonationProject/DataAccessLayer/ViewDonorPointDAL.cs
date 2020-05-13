using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class ViewDonorPointDAL
    {
        private string _connectionString;

        private const string DONOR_POINT = "dbo.BloodDonation_ShowDonorPoint";


        public ViewDonorPointDAL(string connectionString)
        {
            _connectionString = connectionString;
        }
        public List<ViewDonorPoint> ReadAll()
        {
            List<ViewDonorPoint> viewDonorPoints = new List<ViewDonorPoint>();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = DONOR_POINT;
                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            ViewDonorPoint viewDonorPoint  = new ViewDonorPoint();
                            viewDonorPoint = ConvertToModel(dataReader);
                            viewDonorPoints.Add(viewDonorPoint);
                        }
                    }
                }
            }

            return viewDonorPoints;
        }

        private ViewDonorPoint ConvertToModel(SqlDataReader dataReader)
        {
            ViewDonorPoint viewDonorPoint  = new ViewDonorPoint();
            viewDonorPoint.DonorId = dataReader.GetGuid(dataReader.GetOrdinal("DonorID"));
            viewDonorPoint.CollectionPointId = dataReader.GetGuid(dataReader.GetOrdinal("ColectionPointID"));
            viewDonorPoint.FirstName = dataReader.GetString(dataReader.GetOrdinal("FirstName"));
            viewDonorPoint.LastName = dataReader.GetString(dataReader.GetOrdinal("LastName"));
            viewDonorPoint.Type = dataReader.GetString(dataReader.GetOrdinal("Type"));
            viewDonorPoint.Birthday = dataReader.GetString(dataReader.GetOrdinal("BirthDay"));
            viewDonorPoint.PointName = dataReader.GetString(dataReader.GetOrdinal("PointName"));
            viewDonorPoint.PointAddresse = dataReader.GetString(dataReader.GetOrdinal("PointAddresse"));
            viewDonorPoint.PointCity = dataReader.GetString(dataReader.GetOrdinal("PointCity"));
            viewDonorPoint.PointCountry = dataReader.GetString(dataReader.GetOrdinal("PointCountry"));
            viewDonorPoint.PointEmail= dataReader.GetString(dataReader.GetOrdinal("PointEmail"));
            viewDonorPoint.PointNumber = dataReader.GetString(dataReader.GetOrdinal("PointNumber"));
            
            return viewDonorPoint;
        }

    }
}
