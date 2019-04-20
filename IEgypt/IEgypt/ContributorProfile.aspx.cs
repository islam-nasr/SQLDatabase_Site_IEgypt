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
    public partial class ContributorProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int user_id = (int)Session["cids"];

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

            String email;

            String firstname;
            String middlename;
            String lastname;
            DateTime birthdate;

            String specialization;
            String portofolio_link;
            String years_of_experience;


            using (SqlDataReader rde = c4.ExecuteReader())
            {
                email = (String)c4.Parameters["@email"].Value.ToString();
                firstname = (String)c4.Parameters["@firstname"].Value.ToString();
                middlename = (String)c4.Parameters["@middlename"].Value.ToString();
                lastname = (String)c4.Parameters["@lastname"].Value.ToString();
                birthdate = Convert.ToDateTime(c4.Parameters["@birth_date"].Value);

                specialization = (String)c4.Parameters["@specilization"].Value.ToString();
                portofolio_link = (String)c4.Parameters["@portofolio_link"].Value.ToString();

                if (c4.Parameters["@years_experience"].DbType.Equals(null))
                    years_of_experience = "-1";
                else
                    years_of_experience = c4.Parameters["@years_experience"].Value.ToString();


            }

            userid.Text = user_id.ToString();

            fname.Text = firstname;
            lname.Text = lastname;
            mname.Text = middlename;
            uemail.Text = email;

            bdate.Text = birthdate.ToShortDateString();
            portlink.Text = portofolio_link;
            spec.Text = specialization;

            if (years_of_experience == "-1")
                yearsof.Text = "--";
            else
                yearsof.Text = years_of_experience.ToString();


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewerMain.aspx");
        }
    }
}