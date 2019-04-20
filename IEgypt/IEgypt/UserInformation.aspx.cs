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
    public partial class ViewerInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { }
        public void buttonSDClicked(object sender, EventArgs args)
        {
            //pasid.Text = Server.UrlDecode(Request.QueryString["Parameter"].ToString());
            
            int user_id = (int)Session["ids"];

            String connetionString;
            SqlConnection cnn;
            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            SqlCommand c4 = new SqlCommand("Show_Profile", cnn);
            c4.CommandType = System.Data.CommandType.StoredProcedure;

            c4.Parameters.Add(new SqlParameter("@user_id", user_id));
            c4.Parameters.Add("@email", System.Data.SqlDbType.VarChar, 60).Direction = System.Data.ParameterDirection.Output;
            c4.Parameters.Add("@password", System.Data.SqlDbType.VarChar, 20).Direction = System.Data.ParameterDirection.Output;
            c4.Parameters.Add("@firstname", System.Data.SqlDbType.VarChar, 20).Direction = System.Data.ParameterDirection.Output;
            c4.Parameters.Add("@middlename", System.Data.SqlDbType.VarChar, 20).Direction = System.Data.ParameterDirection.Output;
            c4.Parameters.Add("@lastname", System.Data.SqlDbType.VarChar, 20).Direction = System.Data.ParameterDirection.Output;
            c4.Parameters.Add("@birth_date", System.Data.SqlDbType.DateTime).Direction = System.Data.ParameterDirection.Output;
            c4.Parameters.Add("@working_place_name", System.Data.SqlDbType.VarChar, 20).Direction = System.Data.ParameterDirection.Output;
            c4.Parameters.Add("@working_place_type", System.Data.SqlDbType.VarChar, 20).Direction = System.Data.ParameterDirection.Output;
            c4.Parameters.Add("@wokring_place_description", System.Data.SqlDbType.VarChar, 100).Direction = System.Data.ParameterDirection.Output;
            c4.Parameters.Add("@specilization", System.Data.SqlDbType.VarChar, 30).Direction = System.Data.ParameterDirection.Output;
            c4.Parameters.Add("@portofolio_link", System.Data.SqlDbType.VarChar, 60).Direction = System.Data.ParameterDirection.Output;
            c4.Parameters.Add("@years_experience", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
            c4.Parameters.Add("@hire_date", System.Data.SqlDbType.DateTime).Direction = System.Data.ParameterDirection.Output;
            c4.Parameters.Add("@working_hours", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
            c4.Parameters.Add("@payment_rate", System.Data.SqlDbType.Float).Direction = System.Data.ParameterDirection.Output;

            ////////////////////all users
            String email;
            String password;
            String firstname;
            String middlename;
            String lastname;
            DateTime birthdate;
            ////////////////////viewer only
            String workingplacename = "";
            String workingplacetype = "";
            String workingplacedescription = "";

            //////////////////////////contributor
            String specialization = "";
            String portofolio_link = "";
            int yearexperiance = -1;
            /////////////////////////staff
            DateTime hiredate = new DateTime(1, 1, 1);
            int workinghours = -1;
            Double paymentrate = -1;
            if (user_id < 1)
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + "login first to edit your information" + " ');", true);
            else
            {
                using (SqlDataReader rde = c4.ExecuteReader())
                {
                    email = (String)c4.Parameters["@email"].Value.ToString();
                    password = (String)c4.Parameters["@password"].Value.ToString();
                    firstname = (String)c4.Parameters["@firstname"].Value.ToString();
                    middlename = (String)c4.Parameters["@middlename"].Value.ToString();
                    lastname = (String)c4.Parameters["@lastname"].Value.ToString();
                    birthdate = Convert.ToDateTime(c4.Parameters["@birth_date"].Value);
                    if (Session["type"].ToString() == "V")
                    {
                        workingplacename = (String)c4.Parameters["@working_place_name"].Value.ToString();
                        workingplacetype = c4.Parameters["@working_place_type"].Value.ToString();
                        workingplacedescription = c4.Parameters["@wokring_place_description"].Value.ToString();
                    }
                    else
                    {
                        if (Session["type"].ToString() == "C")

                        {
                            specialization = (String)c4.Parameters["@specilization"].Value.ToString();
                            portofolio_link = (String)c4.Parameters["@portofolio_link"].Value.ToString();
                            if (c4.Parameters["@years_experience"].DbType.Equals(null))
                                yearexperiance = -1;
                            else
                                yearexperiance = Convert.ToInt32(c4.Parameters["@years_experience"].Value);

                        }
                        else
                        {
                            if (c4.Parameters["@hire_date"].DbType.Equals(null))
                                hiredate = new DateTime(1, 1, 1);
                            else
                                hiredate = Convert.ToDateTime(c4.Parameters["@hire_date"].Value);
                            if (c4.Parameters["@working_hours"].DbType.Equals(null))
                                workinghours = -1;
                            else
                                workinghours = Convert.ToInt32(c4.Parameters["@working_hours"].Value);
                            if (c4.Parameters["@payment_rate"].DbType.Equals(null))
                                paymentrate = -1;
                            else
                                paymentrate = Convert.ToDouble(c4.Parameters["@payment_rate"].Value);
                        }
                    }

                    //if (c4.Parameters["@years_experience"].Value != null)
                    //yearexperiance = Convert.ToInt32(c4.Parameters["@years_experience"].Value);
                    //else
                    //  yearexperiance = null;

                }
                userid.Visible = true;
                fname.Visible = true;
                lname.Visible = true;
                mname.Visible = true;
                uemail.Visible = true;
                upassword.Visible = true;
                bdate.Visible = true;
                userid1.Visible = true;
                fname1.Visible = true;
                lname1.Visible = true;
                mname1.Visible = true;
                uemail1.Visible = true;
                upassword1.Visible = true;
                bdate1.Visible = true;
                userid1.Text = "User ID:";
                fname1.Text = "First Name:";
                lname1.Text = "Last Name:";
                mname1.Text = "Middle Name:";
                uemail1.Text = "Email:";
                upassword1.Text = "Password:";
                bdate1.Text = "Birthdate:";
                userid.Text = user_id.ToString();
                fname.Text = firstname;
                lname.Text = lastname;
                mname.Text = middlename;
                uemail.Text = email;
                upassword.Text = password;
                bdate.Text = birthdate.ToShortDateString();
                if (Session["type"].ToString() == "V")
                {
                    workingp.Visible = true;
                    workingpt.Visible = true;
                    workingpd.Visible = true;
                    workingp1.Visible = true;
                    workingpt1.Visible = true;
                    workingpd1.Visible = true;
                    workingp1.Text = "Working Place Name:";
                    workingpt1.Text = "Working Place Type:";
                    workingpd1.Text = "Working Place Description";
                    workingp.Text = workingplacename;
                    workingpt.Text = workingplacetype;
                    workingpd.Text = workingplacedescription;
                }
                else
                {
                    if (Session["type"].ToString() == "C")
                    {
                        yearsof.Visible = true;
                        portlink.Visible = true;
                        spec.Visible = true;
                        yearsof1.Visible = true;
                        portlink1.Visible = true;
                        spec1.Visible = true;
                        yearsof1.Text = "Years Of Experiance";
                        portlink1.Text = "Portfolio Link";
                        spec1.Text = "Specialization";
                        portlink.Text = portofolio_link;
                        spec.Text = specialization;
                        if (yearexperiance == -1)
                            yearsof.Text = "";
                        else
                            yearsof.Text = yearexperiance.ToString();

                    }
                    else
                    {
                        hired.Visible = true;
                        workh.Visible = true;
                        payr.Visible = true;
                        hired1.Visible = true;
                        workh1.Visible = true;
                        payr1.Visible = true;
                        hired1.Text = "Hired Date:";
                        workh1.Text = "Working Hours:";
                        payr1.Text = "Payment Rate:";
                        if (hiredate.Equals(new DateTime(1, 1, 1)))
                            hired.Text = "";
                        else
                            hired.Text = hiredate.ToLongDateString();
                        if (workinghours == -1)
                            workh.Text = "";
                        else
                            workh.Text = workinghours + "";
                        if (paymentrate == -1)
                            payr.Text = "";
                        else
                            payr.Text = paymentrate + "";



                    }
                }
            }

        }

        public void buttonED1Clicked(object sender, EventArgs args)
        {
            buttonSDClicked(sender, args);
            int user_id = (int)Session["ids"];

            String connetionString;
            SqlConnection cnn;
            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            fname.BorderWidth = 1;
            mname.BorderWidth = 1;
            lname.BorderWidth = 1;
            uemail.BorderWidth = 1;
            upassword.BorderWidth = 1;
            bdate.BorderWidth = 1;
            fname.ReadOnly = false;
            mname.ReadOnly = false;
            lname.ReadOnly = false;
            uemail.ReadOnly = false;
            upassword.ReadOnly = false;
            bdate.ReadOnly = false;
            if (Session["type"].ToString() == "V")
            {
                workingp.BorderWidth = 1;
                workingpt.BorderWidth = 1;
                workingpd.BorderWidth = 1;
                workingp.ReadOnly = false;
                workingpt.ReadOnly = false;
                workingpd.ReadOnly = false;
            }
            else
            {
                if (Session["type"].ToString() == "C")
                {
                    yearsof.BorderWidth = 1;
                    portlink.BorderWidth = 1;
                    spec.BorderWidth = 1;
                    yearsof.ReadOnly = false;
                    portlink.ReadOnly = false;
                    spec.ReadOnly = false;

                }
                else
                {
                    hired.BorderWidth = 1;
                    workh.BorderWidth = 1;
                    payr.BorderWidth = 1;
                    hired.ReadOnly = false;
                    workh.ReadOnly = false;
                    payr.ReadOnly = false;

                }
            }
            
            cnn.Close();






        }

        public void buttonED2Clicked(object sender, EventArgs args)
        {
           
            int user_id = (int)Session["ids"];
            String email = uemail.Text;

            String password = upassword.Text;
            String firstname = fname.Text;
            String middlename = mname.Text;
            String lastname = lname.Text;
            DateTime birthdate = Convert.ToDateTime(bdate.Text);

            ////////////////////viewer only
            String workingplacename = "";
            String workingplacetype = "";
            String workingplacedescription = "";
            if (Session["type"].ToString() == "V")
            {
                workingplacename = workingp.Text;
                workingplacetype = workingpt.Text;
                workingplacedescription = workingpd.Text;
            }
            //////////////////////////contributor
            String specialization="";
            String portofolio_link="";
            int yearexperiance=-1;
            if (Session["type"].ToString() == "C")
            {
                specialization = spec.Text;
                portofolio_link = portlink.Text;
                yearexperiance = Convert.ToInt32(yearsof.Text);
            }
            /////////////////////////staff
            DateTime hiredate = new DateTime(1975, 11, 11);
            int workinghours=0;
            Double paymentrate=0;
            if (Session["type"].ToString() == "S")
            {
                hiredate =Convert.ToDateTime(hired.Text);
                workinghours = Convert.ToInt32(workh.Text);
                paymentrate = Convert.ToInt32(payr.Text);
            }
            String connetionString;
            SqlConnection cnn;
            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            SqlCommand c4 = new SqlCommand("Edit_Profile", cnn);
            c4.CommandType = System.Data.CommandType.StoredProcedure;

            c4.Parameters.Add(new SqlParameter("@user_id", user_id));
            c4.Parameters.Add(new SqlParameter("@email", email));
            c4.Parameters.Add(new SqlParameter("@password", password));
            c4.Parameters.Add(new SqlParameter("@firstname", firstname));
            c4.Parameters.Add(new SqlParameter("@middlename", middlename));
            c4.Parameters.Add(new SqlParameter("@lastname", lastname));
            c4.Parameters.Add(new SqlParameter("@birth_date", birthdate));
            if (Session["type"].ToString() == "V")
            {
                c4.Parameters.Add(new SqlParameter("@working_place_name", workingplacename));
                c4.Parameters.Add(new SqlParameter("@working_place_type", workingplacetype));
                c4.Parameters.Add(new SqlParameter("@wokring_place_description", workingplacedescription));
                c4.Parameters.Add(new SqlParameter("@specilization", ""));
                c4.Parameters.Add(new SqlParameter("@portofolio_link", ""));
                c4.Parameters.Add(new SqlParameter("@hire_date", ""));
                c4.Parameters.Add(new SqlParameter("@years_experience", ""));
                c4.Parameters.Add(new SqlParameter("@working_hours", ""));
                c4.Parameters.Add(new SqlParameter("@payment_rate", ""));
            }
            else
            {
                if (Session["type"].ToString() == "C")
                {
                    c4.Parameters.Add(new SqlParameter("@specilization", specialization));
                    c4.Parameters.Add(new SqlParameter("@portofolio_link", portofolio_link));
                    
                    c4.Parameters.Add(new SqlParameter("@hire_date", ""));
                    c4.Parameters.Add(new SqlParameter("@years_experience", yearexperiance));
                    c4.Parameters.Add(new SqlParameter("@working_hours", ""));
                    c4.Parameters.Add(new SqlParameter("@payment_rate", ""));
                    c4.Parameters.Add(new SqlParameter("@working_place_name", ""));
                    c4.Parameters.Add(new SqlParameter("@working_place_type", ""));
                    c4.Parameters.Add(new SqlParameter("@wokring_place_description", ""));
                }
                else
                {
                    c4.Parameters.Add(new SqlParameter("@working_place_name", ""));
                    c4.Parameters.Add(new SqlParameter("@working_place_type", ""));
                    c4.Parameters.Add(new SqlParameter("@wokring_place_description", ""));
                    c4.Parameters.Add(new SqlParameter("@specilization", ""));
                    c4.Parameters.Add(new SqlParameter("@portofolio_link", ""));
                    c4.Parameters.Add(new SqlParameter("@hire_date", hiredate));
                    c4.Parameters.Add(new SqlParameter("@years_experience", ""));
                    c4.Parameters.Add(new SqlParameter("@working_hours", workinghours));
                    c4.Parameters.Add(new SqlParameter("@payment_rate", paymentrate));
                }
            }
            fname.BorderWidth = 0;
            mname.BorderWidth = 0;
            lname.BorderWidth = 0;
            uemail.BorderWidth = 0;
            upassword.BorderWidth = 0;
            bdate.BorderWidth = 0;
            fname.ReadOnly = true;
            mname.ReadOnly = true;
            lname.ReadOnly = true;
            uemail.ReadOnly = true;
            upassword.ReadOnly = true;
            bdate.ReadOnly = true;
           // SqlDataReader rde = c4.ExecuteReader();
           
                if (Session["type"].ToString() == "V")
                {
                    workingp.BorderWidth = 0;
                    workingpt.BorderWidth = 0;
                    workingpd.BorderWidth = 0;
                    workingp.ReadOnly = true;
                    workingpt.ReadOnly = true;
                    workingpd.ReadOnly = true;
                }
                else
                {
                    if (Session["type"].ToString() == "C")
                    {
                        yearsof.BorderWidth = 0;
                        portlink.BorderWidth = 0;
                        spec.BorderWidth = 0;
                        yearsof.ReadOnly = true;
                        portlink.ReadOnly = true;
                        spec.ReadOnly = true;

                    }
                    else
                    {
                        hired.BorderWidth = 0;
                        workh.BorderWidth = 0;
                        payr.BorderWidth = 0;
                        hired.ReadOnly = true;
                        workh.ReadOnly = true;
                        payr.ReadOnly = true;

                    }
                }
            SqlDataReader rde = c4.ExecuteReader();
            cnn.Close();
        }
        public void buttonDAClicked(object sender, EventArgs args)
        {
            int user_id = (int)Session["ids"];
            String connetionString;
            SqlConnection cnn;
            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            SqlCommand c4 = new SqlCommand("Deactivate_Profile", cnn);
            c4.CommandType = System.Data.CommandType.StoredProcedure;

            c4.Parameters.Add(new SqlParameter("@user_id", user_id));
            SqlDataReader rde = c4.ExecuteReader();
            Session["ids"] = -1;
            Session["type"] = "";

            //Response.Redirect("IEgypt_Home.aspx");
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Deactivation Successful" +"');window.location.href = 'IEgypt_Home.aspx'",  true);

            cnn.Close();
        }
        public void buttonREClicked(object sender, EventArgs args)
        {
            if (Session["type"].ToString() == "V")
            {
                Response.Redirect("ViewerMain.aspx");

            }
            else
            {
                if(Session["type"].ToString() == "C")
                {
                    Response.Redirect("Contributor.aspx");
                }
                else
                {
                    Response.Redirect("Staff_Main.aspx");
                }
            }

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
    }
}