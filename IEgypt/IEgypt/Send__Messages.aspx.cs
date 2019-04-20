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
    public partial class Send__Messages : System.Web.UI.Page
    {
        protected void SendMessages(object sender, EventArgs e)
        {
            String connectionString;
            SqlConnection cnn;

            connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connectionString);

            cnn.Open();

            String textt = text.Text;
            //int ID = Convert.ToInt32(Session["ids"]);
            String Vid = VID.Text;

            SqlCommand dbo = new SqlCommand("email_id", cnn);
            dbo.CommandType = System.Data.CommandType.StoredProcedure;
            dbo.Parameters.Add(new SqlParameter("@email", Vid));
            dbo.Parameters.Add("@id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

            SqlDataReader rdr = dbo.ExecuteReader();
            rdr.Close();

            int VID1 = Convert.ToInt32(dbo.Parameters["@id"].Value);
            SqlCommand cmd = new SqlCommand("Send_Message", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@msg_text", textt));
            cmd.Parameters.Add(new SqlParameter("@contributor_id", Session["ids"]));
            cmd.Parameters.Add(new SqlParameter("@viewer_id", VID1));
            cmd.Parameters.Add(new SqlParameter("@sender_type", 1));

            rdr = cmd.ExecuteReader();
            L1.Text = "Message sent";
            cnn.Close();

        }
        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("Contributor.aspx");
        }
    }
}