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
    public partial class Show_Messages : System.Web.UI.Page
    {
        protected void ShowMessages(object sender, EventArgs e)
        {
            String connectionString;
            SqlConnection cnn;

            connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connectionString);

            cnn.Open();

            String ID = Session["ids"].ToString();


            SqlCommand dbo = new SqlCommand("Show_Message", cnn);
            dbo.CommandType = System.Data.CommandType.StoredProcedure;
            dbo.Parameters.Add(new SqlParameter("@contributor_id", Convert.ToInt32(ID)));
            GV1.DataSource = dbo.ExecuteReader();
            GV1.DataBind();



        }
        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("Contributor.aspx");
        }
    }
}