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
    public partial class ContentManager : System.Web.UI.Page
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
            cell1.Text = "Link";
            TableCell cell2 = new TableCell();
            cell2.Text = "Uploaded At";
            TableCell cell3 = new TableCell();
            cell3.Text = " Category";
            TableCell cell4 = new TableCell();
            cell4.Text = "Sub Category";
            TableCell cell5 = new TableCell();
            cell5.Text = "Type";
            TableCell cell6 = new TableCell();
            cell6.Text = "Rating ";
            TableCell cell7 = new TableCell();
            cell7.Text = "Accept Buttons";
            TableCell cell8 = new TableCell();
            cell8.Text = "Reject Buttons";

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

            sql = "select * from Original_Content oc INNER JOIN Content c ON oc.ID = c.ID  and oc.review_status=1 and oc.filter_status IS NULL";
            command = new SqlCommand(sql, cnn);
            dataReader = command.ExecuteReader();
            while (dataReader.Read())
            {
                Button bt1 = new Button();
                bt1.Text = "Accept";
                bt1.ID = 1 + dataReader.GetValue(0).ToString();
                bt1.Click += new EventHandler(Accept);

                Button bt2 = new Button();
                bt2.Text = "Reject";

                bt2.ID = 0 + dataReader.GetValue(0).ToString();
                bt2.Click += new EventHandler(Reject);


                TableCell cell9 = new TableCell();
                cell9.Text = dataReader.GetValue(7).ToString();
                TableCell cell10 = new TableCell();
                cell10.Text = dataReader.GetValue(8).ToString();
                TableCell cell11 = new TableCell();
                cell11.Text = dataReader.GetValue(10).ToString();
                TableCell cell12 = new TableCell();
                cell12.Text = dataReader.GetValue(11).ToString();
                TableCell cell13 = new TableCell();
                cell13.Text = dataReader.GetValue(12).ToString();
                TableCell cell14 = new TableCell();
                cell14.Text = dataReader.GetValue(5).ToString();
                TableCell cell15 = new TableCell();
                cell15.Controls.Add(bt1);
                TableCell cell16 = new TableCell();
                cell16.Controls.Add(bt2);

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


        }

        private void Accept(object sender, EventArgs e)
        {
            //Session["ids"] = 13;
           // Session[ID] = 8;
            String originalcontent = "";


            Button btn = (Button)sender;

            string ids = btn.ID;

            //Response.Write(ids);

            originalcontent = ids.Substring(1);

           string connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            SqlConnection cnn = new SqlConnection(connetionString);


            cnn.Open();

            SqlCommand command = new SqlCommand("content_manager_filter_content", cnn);


            Int32 originalcontent_id = Convert.ToInt32(originalcontent);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.Add(new SqlParameter("@content_manager_id", Session["ids"]));
            command.Parameters.Add(new SqlParameter("@original_content", originalcontent));
            command.Parameters.Add(new SqlParameter("@status", 1));


            command.ExecuteReader();
            cnn.Close();
            Response.Redirect("ContentManager.aspx");

        }


        protected void Reject(object sender, EventArgs e)
        {

           // Session["ID"] = 6;
            String originalcontent = "";

            String contentmanager = "";
            int v;

            Button btn = (Button)sender;

            string ids = btn.ID;


            originalcontent = ids.Substring(1);


           String connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            SqlConnection cnn = new SqlConnection(connetionString);


            cnn.Open();

            SqlCommand command = new SqlCommand("content_manager_filter_content", cnn);
            int s = 0;

            //Int32 originalcontent_id = Convert.ToInt32(originalcontent);
            command.CommandType = System.Data.CommandType.StoredProcedure;


            command.Parameters.Add(new SqlParameter("@content_manager_id", Session["ids"]));
            command.Parameters.Add(new SqlParameter("@original_content", originalcontent));
            command.Parameters.Add(new SqlParameter("@status", s));


            command.ExecuteReader();
            cnn.Close();
            Response.Redirect("ContentManager.aspx");
        }





        protected void RedirectToDefaule(object sender, EventArgs e)
        {
            Response.Redirect("Staff_Main.aspx");
        }


    }
}


