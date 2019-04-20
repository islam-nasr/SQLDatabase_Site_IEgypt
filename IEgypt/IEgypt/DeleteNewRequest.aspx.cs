using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IEgypt
{
    public partial class DeleteNewRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);
            cnn.Open();
            int vw_id = Convert.ToInt32(Session["ids"]);


            String sql = "Select ID,information,contributor_id From New_Request WHERE viewer_id=" + "'" + vw_id + "'" + "AND accept_status IS NULL";
            SqlDataAdapter sda = new SqlDataAdapter(sql, cnn);
            DataTable t3 = new DataTable();
            sda.Fill(t3);
            Table3.DataSource = t3;
            Table3.DataBind();
            cnn.Close();


        }


        public void button2Clicked(object sender, EventArgs e)
        {
            Response.Redirect("ViewerMain.aspx");
        }

        protected void RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = Table3.Rows[index];
            var id = row.Cells[0].Text;
            int rid = int.Parse(id);

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);
            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand("Delete_New_Request", cnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@request_id", rid));

                SqlDataReader rdr = cmd.ExecuteReader();
                cnn.Close();



                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Request Deleted Successfully!" + "'); window.location.href = 'DeleteNewRequest.aspx'", true);
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Error Deleting Request." + "'); window.location.href = 'DeleteNewRequest.aspx'", true);
            }
        }
    }
}