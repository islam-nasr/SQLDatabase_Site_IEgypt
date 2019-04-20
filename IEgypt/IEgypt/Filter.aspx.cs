using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace IEgypt
{
    public partial class Filter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string connetionString;
            SqlConnection cnn;
            string sql;
            SqlCommand command;
            SqlDataReader dataReader;
            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            cnn = new SqlConnection(connetionString);


            cnn.Open();


            sql = "select count(cm.ID) from Content_manager cm Where cm.ID=" + Session["ids"];
            command = new SqlCommand(sql, cnn);


            int x = (int)command.ExecuteScalar();



            if (x == 0)
            {

                Response.Redirect("Reviewer.aspx");

            }
            else
            {
                Response.Redirect("ContentManager.aspx");

            }







        }



        protected void RedirectToDefaule(object sender, EventArgs e)
        {
            Response.Redirect("Staff_Main.aspx");
        }
    }
    }
