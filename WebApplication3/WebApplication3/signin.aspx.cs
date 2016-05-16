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
    public partial class signin : System.Web.UI.Page
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

        protected void signin_button_Click(object sender, EventArgs e)
        {

            //Shrani up_ime v username
            var username = username1.Text;

            //dekodiranje gesla, glej postopek zgoraj

            string password = CalculateMD5Hash(password1.Text);

            //povezava z bazo Web.config

            string constr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

            //deklaracija spremenljivke id

            string id;

            using (MySqlConnection con = new MySqlConnection(constr))
            {
                //Stored Procedures Workbench
                using (MySqlCommand cmd = new MySqlCommand("login"))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("pass1", password);
                        cmd.Parameters.AddWithValue("username1", username);
                        cmd.Connection = con;
                        con.Open();
                        id = Convert.ToString(cmd.ExecuteScalar());
                        con.Close();

                    }
                }

                string message = string.Empty;
                if (id != "ERROR")
                {
                    message = "Uspešna prijava! Čez nekaj trenutkov boste preusmerjeni na vašo stran.";
                    Session["username"] = username;
                    Response.AddHeader("REFRESH", "1;URL=LoggedIn.aspx");
                    //Response.Redirect("prijavljen.aspx");
                }
                else
                {
                    message = "Wrong username or password!";
                    Response.AddHeader("REFRESH", "1;URL=signin.aspx");
                }

                Label3.Text = message;
            }




        }



    }
}