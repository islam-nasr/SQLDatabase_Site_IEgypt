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
    public partial class ShowNewContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);

            cnn.Open();
            int vw_id = Convert.ToInt32(Session["ids"]);
            SqlCommand cmd = new SqlCommand("Show_New_Content", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;


            SqlDataAdapter sda = new SqlDataAdapter("Show_New_Content", cnn);
            sda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@viewer_id", vw_id));
            cmd.Parameters.Add(new SqlParameter("@content_id", DBNull.Value));
            sda.SelectCommand.Parameters.Add(new SqlParameter("@viewer_id", vw_id));
            sda.SelectCommand.Parameters.Add(new SqlParameter("@content_id", DBNull.Value));

            DataTable t1 = new DataTable();
            sda.Fill(t1);
            Table1.DataSource = t1;
            Table1.DataBind();
            cnn.Close();





        }

        protected void NameClicked(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = Table1.Rows[index];
            var id = row.Cells[2].Text;
            int cid = int.Parse(id);

            Session.Add("cids", cid);

            Response.Redirect("ContributorProfile.aspx");


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewerMain.aspx");
        }
    }
}