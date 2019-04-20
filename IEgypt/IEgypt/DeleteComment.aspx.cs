using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Web;
using System.Web.UI;

using System.Data.SqlClient;
using System.Web.Configuration;

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IEgypt
{
    public partial class DeleteComment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SqlDataReader dataReader;


            string connetionString;
            SqlConnection cnn, cnn2;
            SqlCommand command, command2;
            String sql = " ";
            String sql2 = " ";
            Session["ID"] = 7;
            //Int32 s = (Int32)Session["ID"];

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            cnn = new SqlConnection(connetionString);


            cnn.Open();
            sql = "select * from Comment";

            command = new SqlCommand(sql, cnn);

            Table1.Visible = true;
            TableRow row1 = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = "DATE OF COMMENT ";

            TableCell cell2 = new TableCell();
            cell2.Text = "TEXT";

            TableCell cell3 = new TableCell();
            cell3.Text = "Buttons";



            row1.Cells.Add(cell1);
            row1.Cells.Add(cell2);
            row1.Cells.Add(cell3);

            Table1.Rows.Add(row1);
            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {



                TableRow row2 = new TableRow();
                TableCell cell4 = new TableCell();
                TableCell cell5 = new TableCell();
                TableCell cell6 = new TableCell();


                Button bt = new Button();
                bt.Text = "Delete Comment";
                bt.Click += new EventHandler(Buttonclicked);

                bt.ID = dataReader.GetValue(0).ToString() + "-" + dataReader.GetValue(1).ToString();

                cell4.Text = dataReader.GetValue(2).ToString();
                cell5.Text = dataReader.GetValue(3).ToString();

                cell6.Controls.Add(bt);

                row2.Cells.Add(cell4);
                row2.Cells.Add(cell5);
                row2.Cells.Add(cell6);


                Table1.Rows.Add(row2);



            }

            dataReader.Close();
            cnn.Close();
        }
        protected void Buttonclicked(object sender, EventArgs e)
        {


            String viewer = "";
            String content = "";
            string ids = (sender as Button).ID;
            for (int i = 0; i < ids.Length; i++)
            {
                if (ids[i] == '-')
                {
                    viewer = ids.Substring(0, i);
                    content = ids.Substring(i + 1);
                }
            }
            String connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            SqlConnection cnn = new SqlConnection(connetionString);


            cnn.Open();
            SqlCommand command = new SqlCommand("Delete_Commentx", cnn);
            command.CommandType = System.Data.CommandType.StoredProcedure;


            int viewer_id = Convert.ToInt32(viewer);
            Int32 original_content_id = Convert.ToInt32(content);



            command.Parameters.Add(new SqlParameter("@viewer_id", viewer_id));
            command.Parameters.Add(new SqlParameter("@original_content_id", original_content_id));


            command.ExecuteReader();

            cnn.Close();

            Response.Redirect("DeleteComment.aspx");
        }


        protected void RedirectToDefaule(object sender, EventArgs e)
        {
            Response.Redirect("Staff_Main.aspx");
        }



    }


}