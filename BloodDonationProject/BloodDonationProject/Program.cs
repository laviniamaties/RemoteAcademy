using Model;
using System;

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
            Console.WriteLine(donor.firstName);


            //Application.EnableVisualStyles();
            // Application.SetCompatibleTextRenderingDefault(false);
            // Application.Run(new Form1());
        }
    }
}
