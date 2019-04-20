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
    public partial class AssignContributorRequest : System.Web.UI.Page
    {

        int contributor_id = 0;
        int newrequest_id = 0;
        string contributor = "";
        string request = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            contributor_id = 0;
            newrequest_id = 0;
            contributor = " ";
            request = " ";

            string connetionString;
            SqlConnection cnn, cnn2;
            SqlCommand command, command2;
            String sql = " ";


            SqlDataReader dataReader, dataReader0;



            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            cnn = new SqlConnection(connetionString);


            cnn.Open();
            sql = "SELECT * FROM PossibleContributors p INNER JOIN [User] u ON p.contributor_id=u.ID";

            command = new SqlCommand(sql, cnn);

            Table1.Visible = true;
            TableRow row1 = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = "First Name ";

            TableCell cell2 = new TableCell();
            cell2.Text = "Middle Name ";

            TableCell cell3 = new TableCell();
            cell3.Text = "Last Name";

            TableCell cell4 = new TableCell();
            cell4.Text = "Select Contributor ";




            row1.Cells.Add(cell1);
            row1.Cells.Add(cell2);
            row1.Cells.Add(cell3);
            row1.Cells.Add(cell4);

            Table1.Rows.Add(row1);
            Table1.Visible = true;
            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {



                TableRow row2 = new TableRow();

                TableCell cell5 = new TableCell();
                TableCell cell6 = new TableCell();
                TableCell cell7 = new TableCell();
                TableCell cell15 = new TableCell();


                Button bt = new Button();
                bt.Text = "Select Contributor";
                bt.Click += new EventHandler(ButtonClicked);

                bt.ID = dataReader.GetValue(0).ToString();


                cell5.Text = dataReader.GetValue(5).ToString();
                cell6.Text = dataReader.GetValue(6).ToString();
                cell7.Text = dataReader.GetValue(7).ToString();

                cell15.Controls.Add(bt);

                row2.Cells.Add(cell5);
                row2.Cells.Add(cell6);
                row2.Cells.Add(cell7);
                row2.Cells.Add(cell15);


                Table1.Rows.Add(row2);



            }




            dataReader.Close();


            ///////////////////////////////////////////////////////

            sql = "select * from New_Request n where n.contributor_id IS NULL";

            command = new SqlCommand(sql, cnn);

            Table1.Visible = true;
            TableRow row3 = new TableRow();

            TableCell cell8 = new TableCell();
            cell8.Text = "Information";

            TableCell cell9 = new TableCell();
            cell9.Text = "Accepted At ";

            TableCell cell10 = new TableCell();
            cell10.Text = "Select Request";




            row3.Cells.Add(cell8);
            row3.Cells.Add(cell9);
            row3.Cells.Add(cell10);


            Table2.Rows.Add(row3);
            Table2.Visible = true;
            dataReader0 = command.ExecuteReader();

            while (dataReader0.Read())
            {



                TableRow row4 = new TableRow();

                TableCell cell12 = new TableCell();
                TableCell cell13 = new TableCell();
                TableCell cell14 = new TableCell();


                Button bt = new Button();
                bt.Text = "Select Request";
                bt.Click += new EventHandler(ButtonClicked2);

                bt.ID = dataReader0.GetValue(0).ToString();


                cell12.Text = dataReader0.GetValue(3).ToString();
                cell13.Text = dataReader0.GetValue(7).ToString();

                cell14.Controls.Add(bt);

                row4.Cells.Add(cell12);
                row4.Cells.Add(cell13);
                row4.Cells.Add(cell14);



                Table2.Rows.Add(row4);




            }
            dataReader0.Close();

            cnn.Close();

        }

        protected void ButtonClicked(object sender, EventArgs e)
        {
            contributor = (sender as Button).ID;
            Label1.Text = contributor;
           // Response.Write(contributor);


        }
        protected void ButtonClicked2(object sender, EventArgs e)
        {
            request = (sender as Button).ID;
            Label2.Text = request;
          //  Response.Write(request);


        }
        public void Assign(object sender, EventArgs e)
        {
            String connetionString;
            SqlConnection cnn;
            SqlCommand command;
            SqlCommand command2;
            String sql2 = " ";
            String value = " ";
            String co = " ";
            String re = " ";

            SqlDataReader dataReader2;






            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            cnn = new SqlConnection(connetionString);


            cnn.Open();
            co = Label1.Text;
            re = Label2.Text;



            if (co.Equals(null))
            {
                sql2 = "SELECT top 1 ID FROM PossibleContributors p INNER JOIN[User] u ON p.contributor_id = u.ID";
                command2 = new SqlCommand(sql2, cnn);
                dataReader2 = command2.ExecuteReader();
                while (dataReader2.Read())
                {
                    value = dataReader2.GetValue(0).ToString();
                }
                dataReader2.Close();
                contributor = value;

                //contributor_id = Convert.ToInt32(contributor);
                //newrequest_id = Convert.ToInt32(request);
                command = new SqlCommand("Assign_Contributor_Request", cnn);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@contributor_id", contributor));

                command.Parameters.Add(new SqlParameter("@new_request_id", request));

                command.ExecuteReader();

            }
            else
            {




                command = new SqlCommand("Assign_Contributor_Request", cnn);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@contributor_id", co));

                command.Parameters.Add(new SqlParameter("@new_request_id", re));

                command.ExecuteReader();



            }
            Response.Redirect("AssignContributorRequest.aspx");
            cnn.Close();
        }




        protected void RedirectToDefaule(object sender, EventArgs e)
        {
            Response.Redirect("Staff_Main.aspx");
        }




    }
}