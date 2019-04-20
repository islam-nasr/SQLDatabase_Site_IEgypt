using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace IEgypt
{
    public partial class Show_Event : System.Web.UI.Page
    {
        String connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection cnn;


        //connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        ///cnn = new SqlConnection(connectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            cnn = new SqlConnection(connectionString);
            cnn.Open();
            SqlCommand DA = new SqlCommand("SELECT * FROM [EVENT] ", cnn);
            GV.DataSource = DA.ExecuteReader();
            GV.DataBind();
            cnn.Close();

        }
        protected void showall(object sender, EventArgs e)
        {
            //Response.Write(L1.Text);
            cnn = new SqlConnection(connectionString);
            cnn.Open();
            SqlCommand cmd = new SqlCommand("Show_Event", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            if (L1.Text.Equals(""))
            {
                cmd.Parameters.Add(new SqlParameter("@event_id", DBNull.Value));
            }
            else
            {
                cmd.Parameters.Add(new SqlParameter("@event_id", L1.Text));
            }
            GV1.DataSource = cmd.ExecuteReader();
            GV1.DataBind();
            cnn.Close();
        }

        protected void select_Clicked(object sender, EventArgs e)
        {
            L1.Text = (((LinkButton)sender).CommandArgument).ToString();
        }
        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("Contributor.aspx");
        }

    }
}