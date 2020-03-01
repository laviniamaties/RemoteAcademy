using Model;
using System;
using System.Windows.Forms;

namespace BloodDonationProject
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {

            Donor donor = new Donor("Lavinia", "Maties", "Cluj", "Cluj", "Romania",
                "0757769976", "maties.lavinia@gmail.com");
            CollectionPoint collectionPoint = new CollectionPoint();
            Console.WriteLine("Hello world");
            Console.WriteLine(donor.firstName);
            Console.WriteLine(donor.lastName);
            Console.WriteLine(donor.adresse);
            Console.WriteLine(donor.city);
            Console.WriteLine(donor.country);
            Console.WriteLine(donor.phoneNumber);
            Console.WriteLine(donor.emailAdresse);

            Guid collectionPointG = Guid.NewGuid();
            CollectionPoint collectionPoint1 = new CollectionPoint(collectionPointG, "Abracadabra",
                "Mehedinti", "Cluj", "Romania", "07897544", "abracadabra@gmail.com"); 
            Console.WriteLine(collectionPoint1.ID);
            





            Application.EnableVisualStyles();
             Application.SetCompatibleTextRenderingDefault(false);
             Application.Run(new Form1());
        }
    }
}
