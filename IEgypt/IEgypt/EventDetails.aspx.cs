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
    public partial class EventDetails : System.Web.UI.Page
    {
        public void button2Clicked(object sender, EventArgs e)

        {



            int event_id = Convert.ToInt32(Session["event_id"]);


            String photolink;

            photolink = PhotoLink.Text;

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);


            try
            {
                if (photolink == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please enter a photo link" + " ');", true);

                }

                else
                {
                    cnn.Open();
                    SqlCommand cmd = new SqlCommand("Viewer_Upload_Event_Photo", cnn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@event_id", event_id));
                    cmd.Parameters.Add(new SqlParameter("@link", photolink));
                    SqlDataReader rdr = cmd.ExecuteReader();
                    cnn.Close();

                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Photo Link Uploaded Successfully!" + "'); window.location.href = 'EventDetails.aspx'", true);
                }

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Can't insert this photo link!" + "'); window.location.href = 'EventDetails.aspx'", true);
            }


        }




        public void button3Clicked(object sender, EventArgs e)
        {
            int event_id = Convert.ToInt32(Session["event_id"]);
            String videolink;
            string connetionString;
            SqlConnection cnn;

            videolink = VideoLink.Text;


            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);


            try
            {
                if (videolink == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please enter a video link" + " ');", true);
                }

                else
                {
                    cnn.Open();
                    SqlCommand cmd = new SqlCommand("Viewer_Upload_Event_Video", cnn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@event_id", event_id));
                    cmd.Parameters.Add(new SqlParameter("@link", videolink));
                    SqlDataReader rdr = cmd.ExecuteReader();
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Video Link Uploaded Successfully!" + "'); window.location.href = 'EventDetails.aspx'", true);

                }




                cnn.Close();
            }

            catch (Exception)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Can't insert this video link!" + "'); window.location.href = 'EventDetails.aspx'", true);
            }




        }

        public void button4Clicked(object sender, EventArgs e)
        {
            int event_id = Convert.ToInt32(Session["event_id"]);

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand("Viewer_Create_Ad_From_Event", cnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@event_id", event_id));

                SqlDataReader rdr = cmd.ExecuteReader();
                String message = "Ad Created Successfully!";

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "'); window.location.href = 'EventDetails.aspx'", true);
                cnn.Close();
            }

            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error" + " ');", true);
            }





        }
        public void button5Clicked(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "No Ad Created For This Event" + "'); window.location.href = 'EventDetails.aspx'", true);
        }

        public void button6Clicked(object sender, EventArgs e)
        {
            Response.Redirect("ViewerMain.aspx");
        }

    }

}



