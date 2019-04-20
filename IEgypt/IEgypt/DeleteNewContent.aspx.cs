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
    public partial class DeleteNewContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataReader dataReader;


            string connetionString;
            SqlConnection cnn, cnn2;
            SqlCommand command, command2;
            String sql = " ";
            String sql2 = " ";
            String sql3 = " ";

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            cnn = new SqlConnection(connetionString);


            cnn.Open();
            sql = "select * from New_Content nc INNER JOIN Content c ON nc.ID=c.ID ";

            command = new SqlCommand(sql, cnn);

            Table4.Visible = true;
            TableRow row1 = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = "LINK ";

            TableCell cell2 = new TableCell();
            cell2.Text = "Uploaded At";

            TableCell cell3 = new TableCell();
            cell3.Text = "Category Type";

            TableCell cell4 = new TableCell();
            cell4.Text = "SubCategory Name";

            TableCell cell5 = new TableCell();
            cell5.Text = "Type";



            TableCell cell6 = new TableCell();
            cell6.Text = "Buttons";




            row1.Cells.Add(cell1);
            row1.Cells.Add(cell2);
            row1.Cells.Add(cell3);
            row1.Cells.Add(cell4);
            row1.Cells.Add(cell5);
            row1.Cells.Add(cell6);



            Table4.Rows.Add(row1);
            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {



                TableRow row2 = new TableRow();
                TableCell cell8 = new TableCell();
                TableCell cell9 = new TableCell();
                TableCell cell10 = new TableCell();
                TableCell cell11 = new TableCell();
                TableCell cell12 = new TableCell();
                TableCell cell13 = new TableCell();
                TableCell cell14 = new TableCell();


                Button bt = new Button();
                bt.Text = "Delete New Content";
                bt.ID = dataReader.GetValue(0).ToString();
                bt.Click += new EventHandler(Buttonclicked);



                cell8.Text = dataReader.GetValue(3).ToString();
                cell9.Text = dataReader.GetValue(4).ToString();
                cell10.Text = dataReader.GetValue(6).ToString();
                cell11.Text = dataReader.GetValue(7).ToString();
                cell12.Text = dataReader.GetValue(8).ToString();



                cell14.Controls.Add(bt);

                row2.Cells.Add(cell8);
                row2.Cells.Add(cell9);
                row2.Cells.Add(cell10);
                row2.Cells.Add(cell11);
                row2.Cells.Add(cell12);
                row2.Cells.Add(cell13);
                row2.Cells.Add(cell14);



                Table4.Rows.Add(row2);



            }

            dataReader.Close();
            cnn.Close();
        }

        private void Buttonclicked(object sender, EventArgs e)
        {
            string id = (sender as Button).ID;
            String connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            SqlConnection cnn = new SqlConnection(connetionString);


            cnn.Open();
            SqlCommand command = new SqlCommand("Delete_New_Content", cnn);
            command.CommandType = System.Data.CommandType.StoredProcedure;



            command.Parameters.Add(new SqlParameter("@content_id", id));


            command.ExecuteReader();
            cnn.Close();
            Response.Redirect("DeleteNewContent.aspx");
        }
        protected void RedirectToDefaule(object sender, EventArgs e)
        {
            Response.Redirect("Staff_Main.aspx");
        }

    }
}