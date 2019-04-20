using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IEgypt
{
    public partial class IEgypt_Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void buttonOClicked(object sender, EventArgs args)
        {
            string contentname;
            string contenttype;

            contentname = original_content_name.Text;
            contenttype = original_content_type.Text;
            if (original_content_name.Text == "")
                contentname = "";
            if (original_content_type.Text == "")
                contenttype = "";

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            //connetionString = @"Data Source=localhost;Initial Catalog=continuems3";

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand cmd = new SqlCommand("Original_Content_Search", cnn);
            SqlDataAdapter c = new SqlDataAdapter("Original_Content_Search", cnn);
            c.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;

            // 2. set the command object so it knows to execute a stored procedure
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            // 3. add parameter to command, which will be passed to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@typename", contenttype));
            cmd.Parameters.Add(new SqlParameter("@categoryname", contentname));
            c.SelectCommand.Parameters.Add(new SqlParameter("@typename", contenttype));
            c.SelectCommand.Parameters.Add(new SqlParameter("@categoryname", contentname));

            DataTable tab = new DataTable();

            c.Fill(tab);
            Table1.DataSource = tab;
            Table1.DataBind();
            SqlDataReader rd;
            rd = cmd.ExecuteReader();
            


            rd.Close();


            // using (var da = new SqlDataAdapter(cmd))
            //{
            //   cmd.CommandType = CommandType.StoredProcedure;
            //  da.Fill(table1);
            // }

            //cmd.Parameters.Add("@e_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

            //int e_id = 0;
            // execute the command
            // using (SqlDataReader rdr = cmd.ExecuteReader())
            //{
            //    e_id = Convert.ToInt32(cmd.Parameters["@e_id"].Value);
            // }

            //command.dispose();
            cnn.Close();

            // Session["ID"] = e_id;

            //Response.Redirect("Default.aspx");


        }
        public void buttonSClicked(object sender, EventArgs args)
        {
            string contributername;
            contributername = contributer_name.Text;
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            // SqlCommand cmd = new SqlCommand("Contributor_Search", cnn);
            SqlDataAdapter c1 = new SqlDataAdapter("Contributor_Search", cnn);
            c1.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            //cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //cmd.Parameters.Add(new SqlParameter("@fullname", contributername));
            //SqlDataReader rd;
            //rd = cmd.ExecuteReader();
            //cmd.Parameters.Add(new SqlParameter("@fullname", contributername));

            c1.SelectCommand.Parameters.Add(new SqlParameter("@fullname", contributername));

            DataTable tab = new DataTable();

            c1.Fill(tab);
            Table2.DataSource = tab;
            Table2.DataBind();


            //rd.Close();
            cnn.Close();
        }

        public void buttonUClicked(object sender, EventArgs args)
        {
            string usertype;
            usertype = Request.Form["User_type1"];
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            if (usertype == "Contributer" || usertype == "contributer")
                Response.Redirect("ContributerRegistration.aspx");
            else
                if (usertype == "Viewer" || usertype == "viewer")
                Response.Redirect("ViewerRegisteration.aspx");
            else
                if (usertype == "Authorized Reviewer" || usertype == "authorized reviewer")
                Response.Redirect("AuthorizedReviewerRegisteration.aspx");
            else
              if (usertype == "Content Manager" || usertype == "content manager")
                Response.Redirect("ContentManagerRegisteration.aspx");
            else
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "User type entered is not available" + " ');", true);


        }
        public void buttonCOClicked(object sender, EventArgs args)
        {

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();


            SqlDataAdapter c1 = new SqlDataAdapter("Order_Contributor", cnn);
            c1.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;



            DataTable tab = new DataTable();

            c1.Fill(tab);
            Table3.DataSource = tab;
            Table3.DataBind();


            cnn.Close();
        }

        public void buttonAOClicked(object sender, EventArgs args)
        {

            string connetionString;
            SqlConnection cnn;
            string fullname;
            fullname = contributername1.Text;
            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            SqlDataAdapter c3 = new SqlDataAdapter("Show_Original_Content1", cnn);
            c3.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            try
            {
                c3.SelectCommand.Parameters.Add(new SqlParameter("@full_name", fullname));



                DataTable tab = new DataTable();

                c3.Fill(tab);
                TableO.DataSource = tab;
                TableO.DataBind();
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Invalid Contributor" + " ');", true);

            }


            cnn.Close();
        }


        public void buttonLClicked(object sender, EventArgs args)
        {

            string connetionString;
            SqlConnection cnn;
            string email;
            string password;

            email = email_login1.Text;
            password = password_login1.Text;
            if (email == "" || password == "")
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Email or password not written" + " ');", true);
            else
            {
                connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

                cnn = new SqlConnection(connetionString);

                cnn.Open();
                SqlCommand c4 = new SqlCommand("User_login", cnn);
                c4.CommandType = System.Data.CommandType.StoredProcedure;

                c4.Parameters.Add(new SqlParameter("@email", email));
                c4.Parameters.Add(new SqlParameter("@password", password));
                c4.Parameters.Add("@user_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;


                int user_id = 0;
                // execute the command
                try
                {
                    using (SqlDataReader rdr = c4.ExecuteReader())
                    {
                        user_id = Convert.ToInt32(c4.Parameters["@user_id"].Value);
                    }

                    //command.dispose();
                    // Console.WriteLine(user_id);
                    //   SqlConnection cnc = new SqlConnection(connetionString);
                    //   cnc.Open();

                    SqlCommand c5 = new SqlCommand("checktype", cnn);
                    c5.CommandType = System.Data.CommandType.StoredProcedure;
                    c5.Parameters.Add(new SqlParameter("@user_id", user_id));
                    c5.Parameters.Add("@checking", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
                    int flag = 0;
                    using (SqlDataReader rde = c5.ExecuteReader())
                    { flag = Convert.ToInt32(c5.Parameters["@checking"].Value); }
                    if (flag == 1)
                    {
                        Session.Add("ids", user_id);
                        Session.Add("type", "C");
                        Response.Redirect("UserInformation.aspx");
                    }
                    else
                    {
                        if (flag == 2)
                        {
                            Session.Add("ids", user_id);
                            Session.Add("type", "V");
                            Response.Redirect("UserInformation.aspx");
                        }
                        //Response.Redirect("UserInformation.aspx ? Parameter = user_id" +Server.UrlEncode(passid.Text));
                        else
                              if (flag == 3)
                        {
                            Session.Add("ids", user_id);
                            Session.Add("type", "S");
                            Response.Redirect("UserInformation.aspx");
                        }
                        /* c5 = new SqlCommand("Check_Viewer", cnn);
                         c5.CommandType = System.Data.CommandType.StoredProcedure;
                         c5.Parameters.Add(new SqlParameter("@user_id", user_id));
                         c5.Parameters.Add("@checking", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

                         using (SqlDataReader rde = c5.ExecuteReader())
                         { flag = Convert.ToInt32(c5.Parameters["@checking"].Value); }
                         if (flag==1)
                         {
                             Response.Redirect("ViewerProfile");
                         }
                        */



                        //     cnc.Close();
                    }


                }

                catch (Exception E)
                {
                    if (E.Message == "account permenantly deactivated")
                        ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + E.Message + " ');", true);
                    else
                        ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + "Email or password incorrect" + " ');", true);

                }



                
                // Session["ID"] = user_id;
                cnn.Close();


               
            }
        }


       
    }
}



