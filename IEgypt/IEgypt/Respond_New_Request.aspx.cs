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
    public partial class Respond_New_Request : System.Web.UI.Page
    {
        String connectionString;
        SqlConnection cnn;
        protected void Page_Load(object sender, EventArgs e)
        {
            connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connectionString);

            cnn.Open();

            SqlCommand dbo = new SqlCommand("ResRequest", cnn);
            dbo.CommandType = System.Data.CommandType.StoredProcedure;
            dbo.Parameters.Add(new SqlParameter("@contributor", Convert.ToInt32(Session["ids"])));
            GV.DataSource = dbo.ExecuteReader();
            GV.DataBind();
        }
        protected void RespondNewRequest(object sender, EventArgs e)
        {
            //Response.Write(L.Text);

            connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connectionString);

            cnn.Open();


            String response = Reply.Text;
            int reply;
            if (response == "accept")
            {
                reply = 1;
            }
            else
            {
                reply = 0;
            }

            SqlCommand cmd = new SqlCommand("Respond_New_Request", cnn);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@contributor_id", Convert.ToInt32(Session["ids"])));
            cmd.Parameters.Add(new SqlParameter("@request_id", L.Text));
            cmd.Parameters.Add(new SqlParameter("@accept_status", reply));
            cmd.ExecuteReader();
            L1.Text = "Response Recorded";
            cnn.Close();


        }
        protected void Respond(object sender, EventArgs e)
        {
            L.Text = (((LinkButton)sender).CommandArgument).ToString();
        }
        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("Contributor.aspx");
        }
    }
}