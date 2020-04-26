using BusinessLayer;
using DataAccessLayer;
using Model;
using System;
using System.Windows.Forms;

namespace BloodDonationProject
{
    static class Program
    {
        /// <summary>
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            DateTime dateTime = new DateTime(1996 - 05 - 03);
            BloodType bloodType = new BloodType();
            bloodType.ID = new Guid();
            Donor donor = new Donor(bloodType.ID, "femine", "pacient", "Lavinia", "Maties", "Cluj", "Cluj", "Romania",
                "0757769976", "maties.lavinia@gmail.com", "1234");
            CollectionPoint collectionPoint = new CollectionPoint();
            Console.WriteLine("Hello world");
            Console.WriteLine(donor.FirstName);
            Console.WriteLine(donor.LastName);
            Console.WriteLine(donor.Address);
            Console.WriteLine(donor.City);
            Console.WriteLine(donor.Country);
            Console.WriteLine(donor.PhoneNumber);
            Console.WriteLine(donor.EmailAddress);
            

            Guid collectionPointG = Guid.NewGuid();
            //CollectionPoint collectionPoint1 = new CollectionPoint(collectionPointG, "Abracadabra",
            //   "Mehedinti", "Cluj", "Romania", "07897544", "abracadabra@gmail.com"); 
            //Console.WriteLine(collectionPoint1.ID);
            /*

             DonorsDAL donorDal = new DonorsDAL();
            Guid donorG = new Guid("08A53EA9-6FA8-4794-B833-318849721FEA");
            //donorDal.ReadByUid(donorG);

            BloodTypesDAL blood = new DataAccessLayer.BloodTypesDAL();
            Guid bloodG = new Guid("00000000-0000-0000-0000-000000000000");
            //blood.ReadByUid(bloodG);
            blood.DeleteByUid(bloodG);
            blood.Update(bloodG, "A Positive");
            Guid addBloodID = Guid.NewGuid();
            blood.AddBloodType(addBloodID, "0 Negative");

            CampaignsDAL campaignsDAL = new CampaignsDAL();
            Guid campaignG = new Guid("8D8B6AA3-31F7-499B-879D-D4ACD0F980EA");
            campaignsDAL.DeleteByUid(campaignG);

            BloodBanksDAL bloodBanksDAL = new BloodBanksDAL();
            Guid bankG = Guid.NewGuid();
            BloodBank bloodBank2 = new BloodBank("Bank12", "Gruia 58", "Cluj-Napoca",
                "Romania", "078976339", "bank11@gmail.com");
            bloodBanksDAL.AddBloodBank(bankG, bloodBank2);

            //RegistersDAL registersDAL = new RegistersDAL();
            Guid donor3 = new Guid("FAC2D318-8B62-4779-8574-770355E165BB");
            Guid colPoint3 = new Guid("4CB9D035-F9EF-4112-B432-59C009161C80");
            //registersDAL.Add(donor3, colPoint3);
            */

            //RegisterCampaignsDAL registerCampDAL = new RegisterCampaignsDAL();
            DALContext dALContext = new DALContext();
            Guid campaign4 = new Guid("8DBFD977-6F18-4DD6-B611-F5EFDC5B37E3");
            Guid colPoint4 = new Guid("266BD326-CF99-43CE-B5C1-C6BB59AFD6AA");
           // registersDAL.Update( campaign4, colPoint4);
            dALContext.RegistersDAL.Update(campaign4, colPoint4);

            BLContext bLContext = new BLContext();
            Guid id1 = Guid.NewGuid();
            Guid id2 = new Guid("B87F2DED-A255-4638-8CB2-822CF3DDF000");
            Guid id3 = new Guid("00000000-0000-0000-0000-000000000000");
            Guid id4 = new Guid("52F23F8E-183A-43DB-ADA7-003C75AC93A6");
            BloodType bloodType1 = new BloodType(id2 , "BIII");
            DateTime dateTime1 = new DateTime(1996-05-03);
            Donor donor1 = new Donor( id2, "Femail", "pacient", "Maties", "Lavinia", "Cluj",
                "Cluj", "Romania", "07976554", "lavy@kk", "1996-03-04");
            //bLContext.DonorsBL.Add(id1, donor1);
            //bLContext.DonorsBL.Delete(id3);
            bLContext.DonorsBL.ReadByUid(id4);
            ///dALContext.DonorsDAL.ReadByUid(id4);


            

            Application.EnableVisualStyles();
             Application.SetCompatibleTextRenderingDefault(false);
             Application.Run(new Form1());
        }
    }
}
