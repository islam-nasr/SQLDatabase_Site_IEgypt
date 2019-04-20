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
    public partial class CreateAds : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void button1Clicked(object sender, EventArgs e)
        {
            int vw_id;
            String description;
            String location;


            try
            {
                vw_id = Convert.ToInt32(Session["ids"]);
                if (Description.Text == "" || Location.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please enter all values" + " ');", true);
                }

                else
                {
                    description = Description.Text;

                    location = Location.Text;

                    string connetionString;
                    SqlConnection cnn;

                    connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                    cnn = new SqlConnection(connetionString);


                    cnn.Open();
                    SqlCommand cmd = new SqlCommand("Create_Ads", cnn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@viewer_id", vw_id));
                    cmd.Parameters.Add(new SqlParameter("@description", description));
                    cmd.Parameters.Add(new SqlParameter("@location", location));


                    SqlDataReader rdr = cmd.ExecuteReader();

                    cnn.Close();



                    String message = "Ad Created Successfully!";
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "'); window.location.href = 'CreateAds.aspx'", true);
                }

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please enter all values" + " ');", true);
            }




        }

        public void button2Clicked(object sender, EventArgs e)
        {
            Response.Redirect("ViewerMain.aspx");
        }
    }
}