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
    public partial class ReviewOriginalContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);

            cnn.Open();
            String sql = "Select  C.*,O.rating From Original_Content O INNER JOIN Content C ON O.ID=C.ID";
            SqlDataAdapter sda = new SqlDataAdapter(sql, cnn);
            DataTable t1 = new DataTable();
            sda.Fill(t1);
            Table.DataSource = t1;
            Table.DataBind();
            cnn.Close();
        }

        public void RateClicked(object sender, EventArgs e)
        {

            try
            {
                if (OC.Text == "" || Rating.Text == "")
                {
                    String message1 = "Please Insert All Values";
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message1 + "'); window.location.href = 'ReviewOriginalContent.aspx'", true);

                }
                else
                {
                    int oc_id = int.Parse(OC.Text);
                    int vw_id = Convert.ToInt32(Session["ids"]);
                    decimal rate = decimal.Parse(Rating.Text);

                    string connetionString;
                    SqlConnection cnn;
                    connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                    cnn = new SqlConnection(connetionString);

                    cnn.Open();
                    SqlCommand cmd = new SqlCommand("Rating_Original_Content", cnn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@orignal_content_id", oc_id));
                    cmd.Parameters.Add(new SqlParameter("@rating_value", rate));
                    cmd.Parameters.Add(new SqlParameter("@viewer_id", vw_id));
                    SqlDataReader rdr = cmd.ExecuteReader();
                    cnn.Close();

                    String message2 = "Original Content Rated Successfully!";
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message2 + "'); window.location.href = 'ReviewOriginalContent.aspx'", true);
                }

            }


            catch (Exception)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Cannot rate this content. Already rated before." + "'); window.location.href = 'ReviewOriginalContent.aspx'", true);
            }

        }

        public void button2Clicked(object sender, EventArgs e)
        {
            Response.Redirect("ViewerMain.aspx");
        }


    }
}