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
    public partial class ExistingRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);

            cnn.Open();
            String sql = "Select  C.*,O.rating From Original_Content O INNER JOIN Content C ON O.ID=C.ID WHERE O.rating=4 OR O.rating=5";
            SqlDataAdapter sda = new SqlDataAdapter(sql, cnn);
            DataTable t1 = new DataTable();
            sda.Fill(t1);
            Table1.DataSource = t1;
            Table1.DataBind();
            cnn.Close();



        }




        public void button2Clicked(object sender, EventArgs e)
        {
            Response.Redirect("ViewerMain.aspx");
        }





        protected void RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = Table1.Rows[index];
            var id = row.Cells[0].Text;

            int oc_id = int.Parse(id);
            int vw_id = Convert.ToInt32(Session["ids"]);

            string connetionString;
            SqlConnection cnn;
            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);
            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand("Apply_Existing_Request", cnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@viewer_id", vw_id));
                cmd.Parameters.Add(new SqlParameter("@original_content_id", oc_id));
                SqlDataReader rdr = cmd.ExecuteReader();
                cnn.Close();



                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Existing Request Applied For Successfully!" + "'); window.location.href = 'ExistingRequest.aspx'", true);
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error" + " ');", true);
            }

        }
    }
}