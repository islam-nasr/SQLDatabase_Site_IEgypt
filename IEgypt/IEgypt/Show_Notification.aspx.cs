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
    public partial class Show_Notification : System.Web.UI.Page
    {
        protected void ShowNoti(object sender, EventArgs e)
        {
            String connectionString;
            SqlConnection cnn;

            connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connectionString);

            cnn.Open();

            //String ID = Id.Text;


            SqlCommand dbo = new SqlCommand("Show_Notification", cnn);
            dbo.CommandType = System.Data.CommandType.StoredProcedure;
            dbo.Parameters.Add(new SqlParameter("@user_id", Session["ids"]));

            GV2.DataSource = dbo.ExecuteReader();
            GV2.DataBind();



        }
        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("Contributor.aspx");
        }
    }
}