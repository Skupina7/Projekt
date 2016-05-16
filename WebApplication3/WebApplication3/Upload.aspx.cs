using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;
using MySql.Data.MySqlClient;

namespace WebApplication3
{
    public partial class Upload : System.Web.UI.Page
    {
        string username;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("index.aspx");
            }
            else
            {
                username = Session["username"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string mapa = (Path.Combine(HttpContext.Current.Server.MapPath("~/Content/" + Session["username"].ToString() + "/")));
            //  + Session["username"].ToString() + "/"
            // string userid = (string)(Session["username"]);
            if (!Directory.Exists(mapa))
            {
                Directory.CreateDirectory(mapa);
            }
            if (FileUpload1.HasFile)
            {

                if ((Convert.ToInt64(FileUpload1.PostedFile.ContentLength) < 8500000) == false)
                {
                    Label1.Visible = true;
                    Label1.Text = "Datoteka mora biti manjša od 8 MB";

                }
                else
                {
                    if ((File.Exists(Server.MapPath("~/Content/" + Session["username"].ToString() + "/") + FileUpload1.PostedFile.FileName)) == true)
                    {
                        Label1.Visible = true;
                        Label1.Text = "File with that name alredy exists";
                    }
                    else
                    {
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Content/" + Session["username"].ToString() + "/") + FileUpload1.FileName);

                        Label1.Visible = false;
                        DataTable dt = new DataTable();
                        dt.Columns.Add("File", typeof(string));
                        dt.Columns.Add("Size", typeof(string));
                        dt.Columns.Add("Type", typeof(string));

                        foreach (string strFile in Directory.GetFiles(Server.MapPath("~/Content/" + Session["username"].ToString() + "/")))
                        {
                            FileInfo fi = new FileInfo(strFile);
                            dt.Rows.Add(fi.Name, fi.Length, fi.Extension);

                        }
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        
                        
                        string userId;
                        /*
                        string filename = FileUpload1.FileName;
                        
                        string constr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
                        using (MySqlConnection con = new MySqlConnection(constr))
                        {
                            //Stored Procedures Workbench
                            using (MySqlCommand cmd = new MySqlCommand("Insertimage"))
                            {
                                using (MySqlDataAdapter sda = new MySqlDataAdapter())
                                {
                                    cmd.CommandType = CommandType.StoredProcedure;
                                    cmd.Parameters.AddWithValue("username1", username);
                                    cmd.Parameters.AddWithValue("address", filename);
                                   // cmd.Parameters.AddWithValue("type", filetype);
                                    cmd.Connection = con;
                                    con.Open();
                                    userId = Convert.ToString(cmd.ExecuteScalar());
                                    con.Close();
                                }
                            }
                        }
                        */
                    }
                }
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/Content/" + Session["username"].ToString() + "/") + e.CommandArgument);
                Response.End();
            }
            if (e.CommandName == "Delete")
            {

                File.Delete(Server.MapPath("~/Content/" + Session["username"].ToString() + "/") + e.CommandArgument);
                Label1.Visible = false;
                DataTable dt = new DataTable();
                dt.Columns.Add("File", typeof(string));
                dt.Columns.Add("Size", typeof(string));
                dt.Columns.Add("Type", typeof(string));

                foreach (string strFile in Directory.GetFiles(Server.MapPath("~/Content/" + Session["username"].ToString() + "/")))
                {
                    FileInfo fi = new FileInfo(strFile);
                    dt.Rows.Add(fi.Name, fi.Length, fi.Extension);

                }
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string mapa = (Path.Combine(HttpContext.Current.Server.MapPath("~/Content/" + Session["username"].ToString() + "/")));
            //  + Session["username"].ToString() + "/"
            // string userid = (string)(Session["username"]);
            if (!Directory.Exists(mapa))
            {
                Directory.CreateDirectory(mapa);
            }
            Label1.Visible = false;
            DataTable dt = new DataTable();
            dt.Columns.Add("File", typeof(string));
            dt.Columns.Add("Size", typeof(string));
            dt.Columns.Add("Type", typeof(string));

            foreach (string strFile in Directory.GetFiles(Server.MapPath("~/Content/" + Session["username"].ToString() + "/")))
            {
                FileInfo fi = new FileInfo(strFile);
                dt.Rows.Add(fi.Name, fi.Length, fi.Extension);

            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}