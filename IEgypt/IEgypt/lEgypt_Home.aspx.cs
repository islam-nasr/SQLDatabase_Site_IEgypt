
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
    public partial class lEgypt_Home : System.Web.UI.Page
    {
        //LEGYPT MESH I
        protected void Page_Load(object sender, EventArgs e)
        { }
           


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
        public void buttonREClicked(object sender, EventArgs args)
        {
            if (Session["type"].ToString() == "V")
            {
                Response.Redirect("ViewerMain.aspx");

            }
            else
            {
                if (Session["type"].ToString() == "C")
                {
                    Response.Redirect("Contributor.aspx");
                }
                else
                {
                    Response.Redirect("Staff_Main.aspx");
                }
            }

        }
    }
    }




