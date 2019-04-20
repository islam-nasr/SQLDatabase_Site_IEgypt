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
    public partial class Viewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void buttonRVClicked(object sender, EventArgs args)
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
            string working_place;
            if (workingplace.Text == "")
                working_place = "";
            else
                working_place = workingplace.Text;

            string working_place_type;
            if (workingplacetype.Text == "")
                working_place_type = "";
            else
                working_place_type = workingplacetype.Text;
            string working_place_description;
            if (workingplacedescription.Text == "")
                working_place_description = "";
            else
                working_place_description = workingplacedescription.Text;
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand cmd = new SqlCommand("Register_User", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@usertype", "Viewer"));
            cmd.Parameters.Add(new SqlParameter("@email", email));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            cmd.Parameters.Add(new SqlParameter("@firstname", firstname));
            cmd.Parameters.Add(new SqlParameter("@middlename", middlename));
            cmd.Parameters.Add(new SqlParameter("@lastname", lastname));
            cmd.Parameters.Add(new SqlParameter("@birth_date", birthdate));
            cmd.Parameters.Add(new SqlParameter("@working_place_name", working_place));
            cmd.Parameters.Add(new SqlParameter("@working_place_type", working_place_type));
            cmd.Parameters.Add(new SqlParameter("@working_place_description", working_place_description));
            cmd.Parameters.Add(new SqlParameter("@specialization", ""));
            cmd.Parameters.Add(new SqlParameter("@portofolio_link", ""));
            cmd.Parameters.Add(new SqlParameter("@years_experience", ""));



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