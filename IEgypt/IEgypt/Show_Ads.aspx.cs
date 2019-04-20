using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace IEgypt
{
    public partial class Show_Ads : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void showaad(object sender, EventArgs e)
        {
            String connectionString;
            SqlConnection cnn;

            connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connectionString);

            cnn.Open();

            //String ID = Id.Text;


            SqlCommand dbo = new SqlCommand("SELECT * FROM Advertisement", cnn);
            //dbo.CommandType = System.Data.CommandType.StoredProcedure;
            //dbo.Parameters.Add(new SqlParameter("@user_id", 1));

            GV.DataSource = dbo.ExecuteReader();
            GV.DataBind();

        }
        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("Contributor.aspx");
        }
    }
}