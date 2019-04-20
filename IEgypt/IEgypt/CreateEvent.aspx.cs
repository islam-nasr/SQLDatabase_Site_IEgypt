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
    public partial class CreateEvent : System.Web.UI.Page
    {
        public void button1Clicked(object sender, EventArgs e)
        {
            int id;
            String date;
            String city;
            String description;
            String entertainer;
            String location;


            try
            {



                if (PhotoLink.Text == "" && VideoLink.Text == "")
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Please Enter Photo and/or Video Link" + "');", true);

                }
                else
                {

                    id = Convert.ToInt32(Session["ids"]);
                    date = Date.Text;
                    city = City.Text;
                    description = Description.Text;
                    entertainer = Entertainer.Text;
                    location = Location.Text;

                    string connetionString;
                    SqlConnection cnn;

                    connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                    cnn = new SqlConnection(connetionString);


                    cnn.Open();
                    SqlCommand cmd = new SqlCommand("Viewer_Create_Event", cnn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@viewer_id", id));
                    cmd.Parameters.Add(new SqlParameter("@event_date_time", date));
                    cmd.Parameters.Add(new SqlParameter("@city", city));
                    cmd.Parameters.Add(new SqlParameter("@entartainer", entertainer));
                    cmd.Parameters.Add(new SqlParameter("@location", location));
                    cmd.Parameters.Add(new SqlParameter("@description", description));
                    cmd.Parameters.Add("@event_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
                    int event_id = 0;

                    // execute the command
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        event_id = Convert.ToInt32(cmd.Parameters["@event_id"].Value);
                        String msg = cmd.Parameters["@event_id"].Value.ToString();
                    }

                    cnn.Close();
                    Session["event_id"] = event_id;

                    if (PhotoLink.Text != "")
                    {
                        try
                        {
                            cnn.Open();
                            SqlCommand cmd1 = new SqlCommand("Viewer_Upload_Event_Photo", cnn);
                            cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                            cmd1.Parameters.Add(new SqlParameter("@event_id", event_id));
                            cmd1.Parameters.Add(new SqlParameter("@link", PhotoLink.Text));
                            SqlDataReader rdr = cmd1.ExecuteReader();
                            cnn.Close();
                        }
                        catch (Exception)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Can't Insert This Photo Link" + " ');", true);
                        }


                    }
                    if (VideoLink.Text != "")
                    {
                        try
                        {
                            cnn.Open();
                            SqlCommand cmd2 = new SqlCommand("Viewer_Upload_Event_Video", cnn);
                            cmd2.CommandType = System.Data.CommandType.StoredProcedure;
                            cmd2.Parameters.Add(new SqlParameter("@event_id", event_id));
                            cmd2.Parameters.Add(new SqlParameter("@link", VideoLink.Text));
                            SqlDataReader rdr = cmd2.ExecuteReader();
                            cnn.Close();
                        }
                        catch (Exception)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Can't Insert This Video Link" + " ');", true);
                        }

                    }


                    String message = "Event Created Successfully! Event Id=" + event_id;
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "'); window.location.href = 'EventDetails.aspx'", true);
                }

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Enter all values" + " ');", true);
            }



        }

        public void button2Clicked(object sender, EventArgs e)
        {
            Response.Redirect("ViewerMain.aspx");
        }


    }
}