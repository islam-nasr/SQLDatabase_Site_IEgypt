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
    public partial class AuthorizedReviewerRegisteration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void buttonRRClicked(object sender, EventArgs args)
        {
            string firstname;
            firstname = first_name.Text;
            string middlename;
            middlename = middle_name.Text;
            string lastname;
            lastname = last_name.Text;
            string email;
            email = user_email.Text;
            string password;
            password = user_password.Text;
            string birthdate;
            birthdate = user_birthdate.Text;
            string hire_date;
            if (hiredate.Text == "")
                hire_date = "";
            else
                hire_date = hiredate.Text;

            Int32 working_hours;
            if (workinghours.Text == "")
                working_hours = 0;
            else
                working_hours = Convert.ToInt32(workinghours.Text);
            Int32 payment_rate;
            if (paymentrate.Text == "")
                payment_rate = 0;
            else
                payment_rate = Convert.ToInt32(paymentrate.Text);
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand cmd = new SqlCommand("Register_User", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@usertype", "Authorized Reviewer"));
            cmd.Parameters.Add(new SqlParameter("@email", email));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            cmd.Parameters.Add(new SqlParameter("@firstname", firstname));
            cmd.Parameters.Add(new SqlParameter("@middlename", middlename));
            cmd.Parameters.Add(new SqlParameter("@lastname", lastname));
            cmd.Parameters.Add(new SqlParameter("@birth_date", birthdate));
            cmd.Parameters.Add(new SqlParameter("@working_place_name", ""));
            cmd.Parameters.Add(new SqlParameter("@working_place_type", ""));
            cmd.Parameters.Add(new SqlParameter("@working_place_description", ""));
            cmd.Parameters.Add(new SqlParameter("@specialization", ""));
            cmd.Parameters.Add(new SqlParameter("@portofolio_link", ""));
            cmd.Parameters.Add(new SqlParameter("@years_experience", ""));



            cmd.Parameters.Add(new SqlParameter("@hire_date", DateTime.Now));
            cmd.Parameters.Add(new SqlParameter("@working_hours", working_hours));
            cmd.Parameters.Add(new SqlParameter("@payment_rate", payment_rate));
            cmd.Parameters.Add("@user_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;


            int user_id = 0;
            // execute the command
            try
            {
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    user_id = Convert.ToInt32(cmd.Parameters["@user_id"].Value);
                }

                //command.dispose();

                cnn.Close();

                Response.Redirect("IEgypt_Home");
                Session["ID"] = user_id;
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Email used or one or more values are missing" + " ');", true);
            }


        }
    }
}