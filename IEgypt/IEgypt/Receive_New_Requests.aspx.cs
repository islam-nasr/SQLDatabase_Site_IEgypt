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
    public partial class Receive_New_Requests : System.Web.UI.Page
    {
        protected void RecieveNewRequest(object sender, EventArgs e)
        {
            String connectionString;
        SqlConnection cnn;

        connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        cnn = new SqlConnection(connectionString);

        cnn.Open();
       
  

        SqlCommand cmd = new SqlCommand("Receive_New_Request", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@contributor_id", 1));
       
        cmd.Parameters.Add("@can_receive", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

        SqlDataReader rdr = cmd.ExecuteReader();

        int can_receive = Convert.ToInt32(cmd.Parameters["@can_receive"].Value);
        rdr.Close();
        if (can_receive == 1)
        {
            SqlCommand dbo = new SqlCommand("Receive_New_Requests", cnn); //CommandType = System.Data
        dbo.CommandType = System.Data.CommandType.StoredProcedure;
            dbo.Parameters.Add(new SqlParameter("@contributor_id", 1));
            if (L.Text.Equals(""))
            {
                dbo.Parameters.Add(new SqlParameter("@request_id", DBNull.Value));
            }
            else
            {
                dbo.Parameters.Add(new SqlParameter("@request_id", L.Text));
            }
GV1.DataSource = dbo.ExecuteReader();
            GV1.DataBind();
           

        }
        else
        {
            label.Text = "No New Requests";


        }
        cnn.Close();
    }
    protected void record(object sender, EventArgs e)
{
    L.Text = (((LinkButton)sender).CommandArgument).ToString();
}
protected void home(object sender, EventArgs e)
{
    Response.Redirect("Contributor.aspx");
}
}

}