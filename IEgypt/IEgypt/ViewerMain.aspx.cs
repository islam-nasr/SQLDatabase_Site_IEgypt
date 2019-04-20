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
    public partial class ViewerMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void button1Clicked(object sender, EventArgs e)
        {
            Response.Redirect("CreateEvent.aspx");
        }
        public void button2Clicked(object sender, EventArgs e)
        {
            Response.Redirect("ExistingRequest.aspx");
        }
        public void button3Clicked(object sender, EventArgs e)
        {
            Response.Redirect("NewRequest.aspx");
        }
        public void button4Clicked(object sender, EventArgs e)
        {
            Response.Redirect("DeleteNewRequest.aspx");
        }
        public void button5Clicked(object sender, EventArgs e)
        {
            Response.Redirect("ReviewOriginalContent.aspx");
        }
        public void button6Clicked(object sender, EventArgs e)
        {
            Response.Redirect("Comment.aspx");
        }
        public void button7Clicked(object sender, EventArgs e)
        {
            Response.Redirect("CreateAds.aspx");
        }
        public void button8Clicked(object sender, EventArgs e)
        {
            Response.Redirect("ManageAds.aspx");
        }
       

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowNewContent.aspx");
        }
        public void buttonLClicked(object sender, EventArgs args)
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            Session["ids"] = -1;
            Session["type"] = "";
            Response.Redirect("IEgypt_Home.aspx");
            cnn.Close();
        }

        public void buttonZClicked(object sender, EventArgs args)
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            Response.Redirect("UserInformation.aspx");
            cnn.Close();
        }
        public void buttonRHClicked(object sender, EventArgs args)
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            Response.Redirect("lEgypt_Home.aspx");
            cnn.Close();

        }
    }
}