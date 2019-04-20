using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Web;
using System.Web.UI;

using System.Data.SqlClient;
using System.Web.Configuration;

namespace IEgypt
{
    public partial class Staff_Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void button1Clicked(object sender, EventArgs args)
        {
            Response.Redirect("contents.aspx");
        }

        public void button2clicked(object sender, EventArgs args)
        {
            Response.Redirect("DeleteComment.aspx");
        }
        public void button3clicked(object sender, EventArgs args)
        {
            Response.Redirect("DeleteOriginalContent.aspx");
        }
        public void button4clicked(object sender, EventArgs args)
        {
            Response.Redirect("DeleteNewContent.aspx");
        }
        public void button5clicked(object sender, EventArgs args)
        {
            Response.Redirect("AssignContributorRequest.aspx");
        }

        public void button6Clicked(object sender, EventArgs args)
        {
            Response.Redirect("ShowNotification.aspx");
        }


       
        public void button8Clicked(object sender, EventArgs args)
        {
            Response.Redirect("CreateCategorySub.aspx");
        }
        public void button9Clicked(object sender, EventArgs args)
        {
            Response.Redirect("Filter.aspx");
        }
        public void button10Clicked(object sender, EventArgs args)
        {
            Response.Redirect("Show_Possible_Contributors.aspx");
        }
        public void button11Clicked(object sender, EventArgs args)
        {
            Response.Redirect("Request_Content.aspx");
        }

        public void button12Clicked(object sender, EventArgs args)
        {
            Response.Redirect("RequestContentPlace.aspx");
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