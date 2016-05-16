using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;
using MySql.Data.MySqlClient;
using System.Text;
using System.Windows;

namespace Projekt
{
    public partial class registracija : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string CalculateMD5Hash(string input)
        {
            //MD5 kodiranje

            // step 1, calculate MD5 hash from input
            MD5 md5 = System.Security.Cryptography.MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hash = md5.ComputeHash(inputBytes);

            // step 2, convert byte array to hex string
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("X2"));
            }
            return sb.ToString();
        }

        protected void Button_Submit_Click1(object sender, EventArgs e)
        {
            Label1.Text = string.Empty;
            string uporabniskoime = upime.Text;
            string enaslov = email.Text;
            string pass1 = CalculateMD5Hash(geslo1.Text);
            string pass2 = CalculateMD5Hash(geslo2.Text);

            string vrnjeno;

            if(pass1!=pass2)
            {
                Label1.Text = "Gesli se ne ujemata!";
            }

            else
            { 

            string constr = ConfigurationManager.ConnectionStrings["baza"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(constr))
            {
                //Stored Procedures Workbench
                using (MySqlCommand cmd = new MySqlCommand("user_register"))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("uporabniskoime", uporabniskoime);
                        cmd.Parameters.AddWithValue("enaslov", enaslov);
                        cmd.Parameters.AddWithValue("pass1", pass1);
                        cmd.Connection = con;
                        con.Open();
                        vrnjeno = Convert.ToString(cmd.ExecuteScalar());
                        con.Close();

                    }
                }

                if (vrnjeno == "napaka")
                {
                    Label1.Text = "Up.ime ali email že obstaja.";
                }

                }
            }
        }
    }
}