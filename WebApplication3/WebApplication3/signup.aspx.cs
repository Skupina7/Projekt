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


namespace WebApplication3
{
    public partial class signup : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //ali session že obstaja, drugače preusmeritev na index.aspx
            if (Session["username"] != null)
            {
                Response.Redirect("index.aspx");
            }
        }

        public string CalculateMD5Hash(string input)
        {
            //MD5 dekodiranje (v bazi so gesla kodirana z MD5, pri preverjanju prijave potrebno dekodiranje MD5 v geslo)

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
        protected void reg_button_Click(object sender, EventArgs e)
        {

            //Shrani up_ime v username
            var username = username1.Text;
            var email = email1.Text;
            var Firstname = Firstname1.Text;
            var lastname = Lastname1.Text;

            //dekodiranje gesla, glej postopek zgoraj

            string password = CalculateMD5Hash(password1.Text);

            string userId;

            string constr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                //Stored Procedures Workbench
                using (MySqlCommand cmd = new MySqlCommand("Insertuser"))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("username1", username);
                        cmd.Parameters.AddWithValue("pass1", password);
                        cmd.Parameters.AddWithValue("email1", email);
                        cmd.Parameters.AddWithValue("Firstname1", Firstname);
                        cmd.Parameters.AddWithValue("Lastname1", lastname);
                        cmd.Connection = con;
                        con.Open();
                        userId = Convert.ToString(cmd.ExecuteScalar());
                        con.Close();
                    }
                }
                string message = string.Empty;
                if (userId == "SUCCESS")
                {
                    message = "Registration successful!";
                    Session["username"] = username;
                    Response.AddHeader("REFRESH", "1;URL=LoggedIn.aspx");

                }
                else if (userId == "ERROR")
                {
                    message = "User alredy exists";
                    Response.AddHeader("REFRESH", "1;URL=signup.aspx");
                }
                else
                {
                    message = "Something went wrong";
                    Response.AddHeader("REFRESH", "1;URL=signup.aspx");
                }

                Label3.Text = message;
            }
        }

    }
}