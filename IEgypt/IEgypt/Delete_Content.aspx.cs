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
    public partial class Delete_Content : System.Web.UI.Page
    {
       
            String connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            SqlConnection cnn;
            String ID = "";

            protected void Page_load(object sender, EventArgs e)
            {
                int id = Convert.ToInt32(Session["ids"]);
                cnn = new SqlConnection(connectionString);
                cnn.Open();

                SqlCommand DA = new SqlCommand("Mycontent", cnn);
                DA.CommandType = System.Data.CommandType.StoredProcedure;
                DA.Parameters.Add(new SqlParameter("@contributor", 1));
                //SqlCommand DA = new SqlCommand("SELECT * FROM New_Request WHERE coontributor_id = id ", cnn);
                GV.DataSource = DA.ExecuteReader();
                GV.DataBind();
                cnn.Close();
            }

            protected void DeleteContent(object sender, EventArgs e)
            {

                //connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                //cnn = new SqlConnection(connectionString);

                cnn.Open();
                String ID = (((LinkButton)sender).CommandArgument).ToString();

                SqlCommand cmd = new SqlCommand("Delete_Content", cnn);
                //2. set the command object so it knows to execute a stored procedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                // 3. add parameter to command, which will be passed to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@content_id", ID));
                cmd.ExecuteReader();
                L1.Text = "Content Deleted";
                cnn.Close();

            }
            protected void home(object sender, EventArgs e)
            {
                Response.Redirect("Contributor.aspx");
            }
        } }
    