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
    public partial class contents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connetionString, sql;
            SqlConnection cnn;
            SqlDataReader dataReader;
            SqlCommand cmd, cmd2;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            /*WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;*/

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            Table2.Visible = true;
            List<string> list = new List<string>();
            TableRow row1 = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = "content type";
            row1.Cells.Add(cell1);
            Table2.Rows.Add(row1);


            sql = "select * from Content_type";
            cmd2 = new SqlCommand(sql, cnn);
            dataReader = cmd2.ExecuteReader();


            while (dataReader.Read())
            {




                TableRow row2 = new TableRow();
                TableCell cell2 = new TableCell();
                cell2.Text = dataReader.GetValue(0).ToString();

                row2.Cells.Add(cell2);
                Table2.Rows.Add(row2);

            }

            dataReader.Close();


            cnn.Close();




        }

        protected void AddContent(object sender, EventArgs e)
        {
            String type_name;

            type_name = Content_typeTB.Text;

            SqlDataReader dataReader0;
            SqlCommand cmd2;
            String connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            /*WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;*/

            SqlConnection cnn = new SqlConnection(connetionString);
            List<string> list = new List<string>();
            if (type_name != "")
            {


                cnn.Open();
                cmd2 = new SqlCommand("Staff_Create_Type", cnn);


                cmd2.CommandType = System.Data.CommandType.StoredProcedure;


                cmd2.Parameters.Add(new SqlParameter("@type_name", type_name));
                //cmd2.ExecuteReader();


                dataReader0 = cmd2.ExecuteReader();
                if (!list.Contains(type_name))
                {
                    while (dataReader0.Read())
                    {
                        string s = (string)dataReader0.GetValue(0);

                        if (!list.Contains(s))
                        {
                            list.Add(s);
                        }
                    }
                }


                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "This type already exist , please choose another one" + " ');", true);

                    // MessageBox.Show("This type already exist , please choose another one");
                }

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please fille the box with Valid information" + " ');", true);

                //MessageBox.Show("Please fille the box with Valid information");
            }



            cnn.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Successfully Done :)" + "');window.location.href = 'contents.aspx'", true);

            //MessageBox.Show("Successfully Done :) ");
           // Response.Redirect("Content.aspx");





        }

        protected void back_to_default(object sender, EventArgs e)
        {
            Response.Redirect("Staff_Main.aspx");
        }



    }

}