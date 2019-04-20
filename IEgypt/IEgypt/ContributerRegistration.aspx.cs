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
    public partial class ContributerRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void buttonRCClicked(object sender, EventArgs args)
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
            Int32 years_of_experience;
            if (yearsofexperience.Text == "")
                years_of_experience = 0;
            else
            years_of_experience = Convert.ToInt32(yearsofexperience.Text);

            string portifolio_link;
            if (portifoliolink.Text == "")
                portifolio_link = "";
            else
                portifolio_link = portifoliolink.Text;
            string Specialization;
            if (con_specialization.Text == "")
                Specialization = "";
            else
                Specialization = con_specialization.Text;
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand cmd = new SqlCommand("Register_User", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@usertype", "Contributor"));
            cmd.Parameters.Add(new SqlParameter("@email", email));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            cmd.Parameters.Add(new SqlParameter("@firstname", firstname));
            cmd.Parameters.Add(new SqlParameter("@middlename", middlename));
            cmd.Parameters.Add(new SqlParameter("@lastname", lastname));
            cmd.Parameters.Add(new SqlParameter("@birth_date", birthdate));
            cmd.Parameters.Add(new SqlParameter("@working_place_name", ""));
            cmd.Parameters.Add(new SqlParameter("@working_place_type", ""));
            cmd.Parameters.Add(new SqlParameter("@working_place_description", ""));
            cmd.Parameters.Add(new SqlParameter("@specialization", Specialization));
            cmd.Parameters.Add(new SqlParameter("@portofolio_link", portifolio_link));
            cmd.Parameters.Add(new SqlParameter("@years_experience", years_of_experience));
          
            
            
            cmd.Parameters.Add(new SqlParameter("@hire_date", ""));
            cmd.Parameters.Add(new SqlParameter("@working_hours", ""));
            cmd.Parameters.Add(new SqlParameter("@payment_rate", ""));
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