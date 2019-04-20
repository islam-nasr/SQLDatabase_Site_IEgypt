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
    public partial class NewRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);

            cnn.Open();
            String sql = "Select C.ID,U.first_name, U.middle_name, U.last_name,C.years_of_experience,C.portifolio_link,C.specialization From Contributor C INNER JOIN [User] U ON C.ID=U.ID";
            SqlDataAdapter sda = new SqlDataAdapter(sql, cnn);
            DataTable t2 = new DataTable();
            sda.Fill(t2);
            Table2.DataSource = t2;
            Table2.DataBind();
            cnn.Close();

        }

        public void ApplyClicked(object sender, EventArgs e)
        {
            int viewer_id;
            String information;
            int contributor_id;




            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);
            try
            {
                if (Info.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please enter information" + " ');", true);

                }
                else
                {
                    viewer_id = Convert.ToInt32(Session["ids"]);
                    information = Info.Text;

                    if (CID.Text == "")


                    {
                        cnn.Open();
                        SqlCommand cmd = new SqlCommand("Apply_New_Request", cnn);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@information", information));
                        cmd.Parameters.Add(new SqlParameter("@contributor_id", DBNull.Value));
                        cmd.Parameters.Add(new SqlParameter("@viewer_id", viewer_id));

                        SqlDataReader rdr = cmd.ExecuteReader();
                        cnn.Close();

                    }
                    else
                    {
                        cnn.Open();
                        contributor_id = int.Parse(CID.Text);
                        SqlCommand cmd = new SqlCommand("Apply_New_Request", cnn);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@information", information));
                        cmd.Parameters.Add(new SqlParameter("@contributor_id", contributor_id));
                        cmd.Parameters.Add(new SqlParameter("@viewer_id", viewer_id));

                        SqlDataReader rdr = cmd.ExecuteReader();


                        cnn.Close();

                    }


                }

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "New Request Applied For Successfully!" + "'); window.location.href = 'NewRequest.aspx'", true);
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "New Request Applied For Successfully!" + "');", true);
            }
        }






        public void button2Clicked(object sender, EventArgs e)
        {
            Response.Redirect("ViewerMain.aspx");
        }


    }
}