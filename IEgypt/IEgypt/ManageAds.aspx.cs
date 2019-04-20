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
    public partial class ManageAds : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);
            cnn.Open();
            int vw_id = Convert.ToInt32(Session["ids"]);
            String sql1 = "Select id,description,location FROM Advertisement WHERE Viewer_id=" + "'" + vw_id + "'";
            SqlDataAdapter sda1 = new SqlDataAdapter(sql1, cnn);
            DataTable t1 = new DataTable();
            sda1.Fill(t1);
            Table2.DataSource = t1;
            Table2.DataBind();



            cnn.Close();

        }
        public void EditClicked(object sender, EventArgs e)
        {
            try
            {
                string connetionString;
                SqlConnection cnn;

                connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                cnn = new SqlConnection(connetionString);

                if (adid1.Text == "" || description.Text == "" || location.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please insert all values!" + " ');", true);
                }

                else
                {


                    cnn.Open();

                    SqlCommand cmd = new SqlCommand("Edit_Ad", cnn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@ad_id", adid1.Text));
                    cmd.Parameters.Add(new SqlParameter("@description", description.Text));
                    cmd.Parameters.Add(new SqlParameter("@location", location.Text));


                    SqlDataReader rdr = cmd.ExecuteReader();
                    cnn.Close();



                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Ad Edited Successfully!" + "'); window.location.href = 'ManageAds.aspx'", true);
                }

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Cannot edit ad. Please try again." + "'); window.location.href = 'ManageAds.aspx'", true);
            }

        }


        protected void DeleteCommand(object sender, GridViewCommandEventArgs e)
        {
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);

            try
            {

                cnn.Open();

                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = Table2.Rows[index];
                var id = row.Cells[0].Text;
                int adid = int.Parse(id);

                SqlCommand cmd = new SqlCommand("Delete_Ads", cnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@ad_id", adid));


                SqlDataReader rdr = cmd.ExecuteReader();
                cnn.Close();



                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Ad Deleted Successfully!" + "'); window.location.href = 'ManageAds.aspx'", true);
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Cannot delete Ad." + "'); window.location.href = 'ManageAds.aspx'", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewerMain.aspx");
        }
    }
}
