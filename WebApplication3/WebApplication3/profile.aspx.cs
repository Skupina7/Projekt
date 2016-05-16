using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Cryptography;
using MySql.Data.MySqlClient;
using System.Text;
using System.IO;

namespace WebApplication3
{
    public partial class profile : System.Web.UI.Page
    {
        public string CalculateMD5Hash(string input)
        {
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("index.aspx");
            }
        }

        //sprememba gesla
        protected void Button2_Click(object sender, EventArgs e)
        {

            //Kriptira geslo in ga shrani
            var password = CalculateMD5Hash(TextBox3.Text);
            var newpassword = CalculateMD5Hash(TextBox5.Text);
            var username = Session["username"];
            //Poveže se na podatkovno bazo
            string constr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

            int id = 0;

            using (MySqlConnection con = new MySqlConnection(constr))
            {
                using (MySqlCommand cmd = new MySqlCommand("changepass"))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("newpass", newpassword);
                        cmd.Parameters.AddWithValue("oldpass", password);
                        cmd.Parameters.AddWithValue("username", username);
                        cmd.Connection = con;
                        con.Open();
                        id = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();

                    }
                }

                string message = string.Empty;

                if (id != 1)
                {
                    message = "Wrong password";
                }
                else if(id == 1)
                {
                    message = "Password changed successfully";

                }
                else
                {
                    message = "Something went wrong";
                }
                Label2.Visible = true;
                Label2.Text = message;
            }
        }
    }
}