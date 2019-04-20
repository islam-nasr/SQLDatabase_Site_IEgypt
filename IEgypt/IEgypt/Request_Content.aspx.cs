using System;
using System.Collections;
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
    public partial class Request_Content : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;
            String sql1, sql2;
            SqlCommand command;
            SqlDataReader dataReader;


            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            cnn = new SqlConnection(connetionString);
            cnn.Open();


            sql1 = "Select COUNT(ER.ID)  AS 'Number of requests',C.link,C.uploaded_at,c.category_type,c.subcategory_name,c.[type] from Existing_Request ER INNER JOIN Content C ON ER.original_content_id = C.ID Group By ER.original_content_id, C.link ,C.uploaded_at,c.category_type,c.subcategory_name,c.[type] ORDER BY Count(ER.ID) DESC ";
            command = new SqlCommand(sql1, cnn);

            TableCell cell1 = new TableCell();
            cell1.Text = "Number of Requests";
            TableCell cell2 = new TableCell();
            cell2.Text = "Link";
            TableCell cell3 = new TableCell();
            cell3.Text = "Uploaded At ";
            TableCell cell4 = new TableCell();
            cell4.Text = "Category";
            TableCell cell5 = new TableCell();
            cell5.Text = "Sub Category";
            TableCell cell6 = new TableCell();
            cell6.Text = "Type";

            TableRow row1 = new TableRow();


            row1.Cells.Add(cell1);
            row1.Cells.Add(cell2);
            row1.Cells.Add(cell3);
            row1.Cells.Add(cell4);
            row1.Cells.Add(cell5);
            row1.Cells.Add(cell6);



            Table1.Rows.Add(row1);
            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                TableCell cell7 = new TableCell();
                cell7.Text = dataReader.GetValue(0).ToString();
                TableCell cell8 = new TableCell();
                cell8.Text = dataReader.GetValue(1).ToString();
                TableCell cell9 = new TableCell();
                cell9.Text = dataReader.GetValue(2).ToString();
                TableCell cell10 = new TableCell();
                cell10.Text = dataReader.GetValue(3).ToString();
                TableCell cell11 = new TableCell();
                cell11.Text = dataReader.GetValue(4).ToString();
                TableCell cell12 = new TableCell();
                cell12.Text = dataReader.GetValue(5).ToString();
                TableRow row2 = new TableRow();

                row2.Cells.Add(cell7);
                row2.Cells.Add(cell8);
                row2.Cells.Add(cell9);
                row2.Cells.Add(cell10);
                row2.Cells.Add(cell11);
                row2.Cells.Add(cell12);

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