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
    public partial class ShowNotification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //string user_id;
            string output = "";
            string connetionString;
            SqlConnection cnn;
            SqlCommand command;
            SqlDataReader dataReader;

            //Session["ID"] = 6;



            //user_id = user_idTB.Text;


            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();




            TableRow row1 = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = "City ";

            TableCell cell2 = new TableCell();
            cell2.Text = "Discreption";

            TableCell cell3 = new TableCell();
            cell3.Text = "Entertainer";

            TableCell cell4 = new TableCell();
            cell4.Text = "location";

            TableCell cell5 = new TableCell();
            cell3.Text = "time";




            row1.Cells.Add(cell1);
            row1.Cells.Add(cell2);
            row1.Cells.Add(cell3);
            row1.Cells.Add(cell4);
            row1.Cells.Add(cell5);


            Table2.Rows.Add(row1);
            command = new SqlCommand("Show_Notification", cnn);

            command.Parameters.Add(new SqlParameter("@user_id", Session["ids"]));
            command.CommandType = System.Data.CommandType.StoredProcedure;
            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {

                TableRow row2 = new TableRow();
                //TableCell cell4 = new TableCell();
                TableCell cell6 = new TableCell();
                TableCell cell7 = new TableCell();
                TableCell cell8 = new TableCell();
                TableCell cell9 = new TableCell();
                TableCell cell10 = new TableCell();



                cell6.Text = dataReader.GetValue(0).ToString();
                cell7.Text = dataReader.GetValue(1).ToString();
                cell8.Text = dataReader.GetValue(2).ToString();
                cell9.Text = dataReader.GetValue(3).ToString();
                cell10.Text = dataReader.GetValue(4).ToString();



                row2.Cells.Add(cell6);
                row2.Cells.Add(cell7);
                row2.Cells.Add(cell8);
                row2.Cells.Add(cell9);
                row2.Cells.Add(cell10);

                Table2.Rows.Add(row2);









            }

            cnn.Close();
            dataReader.Close();

        }
        protected void back_to_default(object sender, EventArgs e)
        {
            Response.Redirect("Staff_Main.aspx");
        }
    }

}