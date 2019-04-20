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
    public partial class Upload_New_Content : System.Web.UI.Page
    {
        String connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection cnn;
        String request = "";
        protected void Page_load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["ids"]);
            cnn = new SqlConnection(connectionString);
            cnn.Open();

            SqlCommand DA = new SqlCommand("MyRequests", cnn);
            DA.CommandType = System.Data.CommandType.StoredProcedure;
            DA.Parameters.Add(new SqlParameter("@contributor",Convert.ToInt32(Session["ids"])));
            //SqlCommand DA = new SqlCommand("SELECT * FROM New_Request WHERE coontributor_id = id ", cnn);
            GV.DataSource = DA.ExecuteReader();
            GV.DataBind();
            cnn.Close();
        }
        public void Button(object sender, EventArgs e)
        {
            String request = (((LinkButton)sender).CommandArgument).ToString();

            //Response.Write(request);

            cnn = new SqlConnection(connectionString);

            cnn.Open();


            String subcategory;
            subcategory = SC.Text;
            String category;
            category = C.Text;

            String link;
            link = Link.Text;





            SqlCommand cmd = new SqlCommand("Upload_New_Content", cnn);

            // 2. set the command object so it knows to execute a stored procedure
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            // 3. add parameter to command, which will be passed to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@new_request_id", request));
            cmd.Parameters.Add(new SqlParameter("@subcategory_name", subcategory));
            cmd.Parameters.Add(new SqlParameter("@category_id", category));
            cmd.Parameters.Add(new SqlParameter("@contributor_id", Convert.ToInt32(Session["ids"])));
            cmd.Parameters.Add(new SqlParameter("@link", link));

            cmd.ExecuteReader();
            L1.Text = "New Content has been added";
            cnn.Close();
            //Response.Redirect("Default.aspx"); 
        }
        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("Contributor.aspx");
        }

        /* protected void UploadNewContent(object sender, EventArgs e)
         {


             //connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
             cnn = new SqlConnection(connectionString);

             cnn.Open();


             String subcategory;
             subcategory = SC.Text;
             String category;
             category = C.Text;

             String link;
             link = Link.Text;





             SqlCommand cmd = new SqlCommand("Upload_New_Content", cnn);

             // 2. set the command object so it knows to execute a stored procedure
             cmd.CommandType = System.Data.CommandType.StoredProcedure;

             // 3. add parameter to command, which will be passed to the stored procedure
             cmd.Parameters.Add(new SqlParameter("@new_request_id", request));
             cmd.Parameters.Add(new SqlParameter("@subcategory_name", subcategory));
             cmd.Parameters.Add(new SqlParameter("@category_id", category));
             cmd.Parameters.Add(new SqlParameter("@contributor_id", 1));
             cmd.Parameters.Add(new SqlParameter("@link", link));

             //cmd.ExecuteReader();
             cnn.Close();
             //Response.Redirect("Default.aspx");

         }*/
    }
}