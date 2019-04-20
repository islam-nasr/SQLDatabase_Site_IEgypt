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
    public partial class Contributor : System.Web.UI.Page
    {
        protected void deletecontent(object sender, EventArgs e)
        {
            Response.Redirect("Delete_Content.aspx");
        }
        protected void uploadorg(object sender, EventArgs e)
        {
            Response.Redirect("Upload_Original_Content.aspx");
        }
        protected void uploadnew(object sender, EventArgs e)
        {
            Response.Redirect("Upload_New_Content.aspx");
        }
        protected void showmes(object sender, EventArgs e)
        {
            Response.Redirect("Show_Messages.aspx");
        }
        protected void sendmes(object sender, EventArgs e)
        {
            Response.Redirect("Send__Messages.aspx");
        }
        protected void recnew(object sender, EventArgs e)
        {
            Response.Redirect("Receive_New_Requests.aspx");
        }
        protected void noti(object sender, EventArgs e)
        {
            Response.Redirect("Show_Notification.aspx");
        }
        protected void eventt(object sender, EventArgs e)
        {
            Response.Redirect("Show_Event");
        }
        protected void ad(object sender, EventArgs e)
        {
            Response.Redirect("Show_Ads");
        }
        protected void respond(object sender, EventArgs e)
        {
            Response.Redirect("Respond_New_Request.aspx");
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