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
    public partial class Upload_Original_Content : System.Web.UI.Page
    {
        protected void Page_load(object sender, EventArgs e)
        {

        }
        protected void UploadOriginalContent(object sender, EventArgs e)
        {
            String connectionString;
            SqlConnection cnn;

            connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connectionString);

            cnn.Open();

            String type;
            type = TypeTB.Text;
            String subcategory;
            subcategory = Subcategory.Text;
            String category;
            category = Category.Text;

            String link;
            link = Link.Text;

            SqlCommand cmd = new SqlCommand("Upload_Original_Content", cnn);

            // 2. set the command object so it knows to execute a stored procedure
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            // 3. add parameter to command, which will be passed to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@type_id", type));
            cmd.Parameters.Add(new SqlParameter("@subcategory_name", subcategory));
            cmd.Parameters.Add(new SqlParameter("@category_id", category));
            cmd.Parameters.Add(new SqlParameter("@contributor_id", Session["ids"]));
            cmd.Parameters.Add(new SqlParameter("@link", link));


            SqlDataReader rdr = cmd.ExecuteReader();
            L1.Text = "Content has been added";
            cnn.Close();





        }
        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("Contributor.aspx");
        }

    }
}