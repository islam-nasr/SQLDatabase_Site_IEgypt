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
    public partial class Show_Possible_Contributors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connetionString;
            SqlConnection cnn;
            string sql;
            SqlCommand command;
            SqlDataReader dataReader;
            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            cnn = new SqlConnection(connetionString);


            cnn.Open();



            TableCell cell1 = new TableCell();
            cell1.Text = "Email";
            TableCell cell2 = new TableCell();
            cell2.Text = "First Name";
            TableCell cell3 = new TableCell();
            cell3.Text = " Middle Name";
            TableCell cell4 = new TableCell();
            cell4.Text = "Last Name";
            TableCell cell5 = new TableCell();
            cell5.Text = "Birth Date ";
            TableCell cell6 = new TableCell();
            cell6.Text = "Age ";
            TableCell cell7 = new TableCell();
            cell7.Text = "Number Of Requests";
            TableCell cell8 = new TableCell();
            cell8.Text = "Average Days";

            TableRow row1 = new TableRow();


            row1.Cells.Add(cell1);
            row1.Cells.Add(cell2);
            row1.Cells.Add(cell3);
            row1.Cells.Add(cell4);
            row1.Cells.Add(cell5);
            row1.Cells.Add(cell6);
            row1.Cells.Add(cell7);
            row1.Cells.Add(cell8);



            Table1.Rows.Add(row1);

            sql = " SELECT * FROM PossibleContributors p INNER JOIN [User] u ON p.contributor_id=u.ID";
            command = new SqlCommand(sql, cnn);
            dataReader = command.ExecuteReader();
            while (dataReader.Read())
            {


                TableCell cell9 = new TableCell();
                cell9.Text = dataReader.GetValue(4).ToString();
                TableCell cell10 = new TableCell();
                cell10.Text = dataReader.GetValue(5).ToString();
                TableCell cell11 = new TableCell();
                cell11.Text = dataReader.GetValue(6).ToString();
                TableCell cell12 = new TableCell();
                cell12.Text = dataReader.GetValue(7).ToString();
                TableCell cell13 = new TableCell();
                cell13.Text = dataReader.GetValue(8).ToString();
                TableCell cell14 = new TableCell();
                cell14.Text = dataReader.GetValue(9).ToString();
                TableCell cell15 = new TableCell();
                cell15.Text = dataReader.GetValue(1).ToString();
                TableCell cell16 = new TableCell();
                cell16.Text = dataReader.GetValue(2).ToString();

                TableRow row2 = new TableRow();
                row2.Cells.Add(cell9);
                row2.Cells.Add(cell10);
                row2.Cells.Add(cell11);
                row2.Cells.Add(cell12);
                row2.Cells.Add(cell13);
                row2.Cells.Add(cell14);
                row2.Cells.Add(cell15);
                row2.Cells.Add(cell16);

                Table1.Rows.Add(row2);
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