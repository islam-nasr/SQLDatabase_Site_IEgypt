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
    public partial class RequestContentPlace : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataReader dataReader;


            string connetionString;
            SqlConnection cnn, cnn2;
            SqlCommand command, command2;
            String sql = " ";
            String sql2 = " ";
           // Session["ID"] = 12;
            //Int32 s = (Int32)Session["ID"];

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            cnn = new SqlConnection(connetionString);


            cnn.Open();

            command = new SqlCommand("Workingplace_Category_Relation", cnn);

            Table7.Visible = true;
            TableRow row1 = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = "Working Place Type ";

            TableCell cell2 = new TableCell();
            cell2.Text = "Category Tpe";

            TableCell cell3 = new TableCell();
            cell3.Text = "Number Of Requests";



            row1.Cells.Add(cell1);
            row1.Cells.Add(cell2);
            row1.Cells.Add(cell3);

            Table7.Rows.Add(row1);
            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {



                TableRow row2 = new TableRow();
                TableCell cell4 = new TableCell();
                TableCell cell5 = new TableCell();
                TableCell cell6 = new TableCell();





                cell4.Text = dataReader.GetValue(0).ToString();
                cell5.Text = dataReader.GetValue(1).ToString();
                cell6.Text = dataReader.GetValue(2).ToString();



                row2.Cells.Add(cell4);
                row2.Cells.Add(cell5);
                row2.Cells.Add(cell6);
                //row2.Controls.Add(bt);

                Table7.Rows.Add(row2);



            }

            dataReader.Close();
            cnn.Close();
        }

        protected void RedirectToDefaule(object sender, EventArgs e)

        {

            Response.Redirect("Staff_Main.aspx");

        }
    }
}