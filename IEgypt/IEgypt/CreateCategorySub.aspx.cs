using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Windows.Forms;

namespace IEgypt
{
    public partial class CreateCategorySub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connetionString, sql;
            SqlConnection cnn;
            SqlDataReader dataReader;
            SqlCommand cmd, cmd2, cmd5;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            /*WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;*/

            cnn = new SqlConnection(connetionString);

            cnn.Open();






            Table6.Visible = true;
            List<string> list = new List<string>();
            TableRow row1 = new TableRow();
            TableCell cell1 = new TableCell();

            TableCell cell2 = new TableCell();
            cell1.Text = "Category Type";
            cell2.Text = "Sub Categories types";

            row1.Cells.Add(cell1);
            row1.Cells.Add(cell2);
            Table6.Rows.Add(row1);


            sql = "select * from Sub_Category";
            cmd5 = new SqlCommand(sql, cnn);
            dataReader = cmd5.ExecuteReader();


            while (dataReader.Read())
            {




                TableRow row2 = new TableRow();
                TableCell cell3 = new TableCell();
                TableCell cell4 = new TableCell();
                cell3.Text = dataReader.GetValue(0).ToString();
                cell4.Text = dataReader.GetValue(1).ToString();

                row2.Cells.Add(cell3);
                row2.Cells.Add(cell4);
                Table6.Rows.Add(row2);

            }

            dataReader.Close();


            cnn.Close();

        }









        protected void Add(object sender, EventArgs e)

        {
            String category_name;
            String subcategory_name;
            category_name = category_nameTB.Text;
            subcategory_name = subcategory_nameTB.Text;


            string connetionString;
            SqlConnection cnn;
            String sql1, sql2;
            SqlCommand cmd1, cmd2, cmd3, cmd4;
            SqlDataReader dataReader;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            /*WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;*/

            cnn = new SqlConnection(connetionString);
            if ((category_name).Equals("") || (subcategory_name).Equals(""))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "please fill the boxes" + " ');", true);

                //MessageBox.Show("please fill the boxes");
            }

            else
            {



                cnn.Open();
                List<string> listcat = new List<string>();
                List<string> listsub = new List<string>();


                sql1 = "select [type] from Category ";
                cmd1 = new SqlCommand(sql1, cnn);
                dataReader = cmd1.ExecuteReader();

                while (dataReader.Read())
                {
                    string s = dataReader.GetValue(0).ToString();
                    listcat.Add(s);

                }
                dataReader.Close();


                sql2 = "select[name] from Sub_Category ";
                cmd3 = new SqlCommand(sql2, cnn);
                dataReader = cmd3.ExecuteReader();
                while (dataReader.Read())
                {
                    string s = dataReader.GetValue(0).ToString();
                    listsub.Add(s);

                }
                dataReader.Close();



                if (!(listcat.Contains(category_name)) && (!listsub.Contains(subcategory_name)))
                {
                    cmd1 = new SqlCommand("Staff_Create_Category", cnn);
                    cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd1.Parameters.Add(new SqlParameter("@category_name", category_name));
                    cmd1.ExecuteReader();



                    cmd2 = new SqlCommand("Staff_Create_Subcategory", cnn);
                    cmd2.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd2.Parameters.Add(new SqlParameter("@category_name", category_name));
                    cmd2.Parameters.Add(new SqlParameter("@subcategory_name", subcategory_name));
                    cmd2.ExecuteReader();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Sucessfully Done :) " + " ');", true);

                   // MessageBox.Show("Sucessfully Done :) ");
                }



                if (listcat.Contains(category_name) && (!listsub.Contains(subcategory_name)))
                {
                    cmd4 = new SqlCommand("Staff_Create_Subcategory", cnn);
                    cmd4.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd4.Parameters.Add(new SqlParameter("@category_name", category_name));
                    cmd4.Parameters.Add(new SqlParameter("@subcategory_name", subcategory_name));
                    cmd4.ExecuteReader();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Sucessfully Done :) " + " ');", true);

                    // MessageBox.Show("Sucessfully Done :) ");
                }

                if (listsub.Contains(subcategory_name) && listcat.Contains(category_name))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Both Category and Sub-Category Exisit in your table choose something else :( " + " ');", true);

                    // MessageBox.Show("Both Category and Sub-Category Exisit in your table choose something else :( ");
                }


            }




            cnn.Close();

            Response.Redirect("CreateCategorySub.aspx");


        }

        protected void back_to_default(object sender, EventArgs e)
        {
            Response.Redirect("Staff_Main.aspx");
        }


    }
}