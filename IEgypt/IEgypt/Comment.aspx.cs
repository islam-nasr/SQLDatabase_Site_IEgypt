using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IEgypt
{
    public partial class Comment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);
            cnn.Open();
            int vw_id = Convert.ToInt32(Session["ids"]);
            String sql1 = "Select original_content_id,date,text FROM Comment WHERE Viewer_id=" + "'" + vw_id + "'";
            SqlDataAdapter sda1 = new SqlDataAdapter(sql1, cnn);
            DataTable t1 = new DataTable();
            sda1.Fill(t1);
            Table1.DataSource = t1;
            Table1.DataBind();

            String sql2 = "Select  C.*,O.rating From Original_Content O INNER JOIN Content C ON O.ID=C.ID";
            SqlDataAdapter sda2 = new SqlDataAdapter(sql2, cnn);
            DataTable t2 = new DataTable();
            sda2.Fill(t2);
            Table2.DataSource = t2;
            Table2.DataBind();


            cnn.Close();
        }
        public void WriteClicked(object sender, EventArgs e)
        {
            try
            {
                string connetionString;
                SqlConnection cnn;

                connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                cnn = new SqlConnection(connetionString);

                if (Text1.Text == "" || OID1.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please insert all values!" + " ');", true);
                }

                else
                {
                    int oid = int.Parse(OID1.Text);
                    String comment = Text1.Text;
                    int vw_id = Convert.ToInt32(Session["ids"]);

                    cnn.Open();
                    SqlCommand cmd = new SqlCommand("Write_Comment", cnn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@comment_text", comment));
                    cmd.Parameters.Add(new SqlParameter("@viewer_id", vw_id));
                    cmd.Parameters.Add(new SqlParameter("@original_content_id", oid));
                    cmd.Parameters.Add(new SqlParameter("@written_time", DateTime.Now.ToString()));

                    SqlDataReader rdr = cmd.ExecuteReader();
                    cnn.Close();



                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Comment Posted Successfully!" + "'); window.location.href = 'Comment.aspx'", true);
                }

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Cannot post comment." + "'); window.location.href = 'Comment.aspx'", true);
            }
        }

        public void EditClicked(object sender, EventArgs e)
        {
            try
            {
                string connetionString;
                SqlConnection cnn;

                connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                cnn = new SqlConnection(connetionString);

                if (Text2.Text == "" || OID2.Text == "" || LastDate1.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please insert all values!" + " ');", true);
                }

                else
                {


                    cnn.Open();
                    int vw_id = Convert.ToInt32(Session["ids"]);
                    SqlCommand cmd = new SqlCommand("Edit_Comment", cnn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@comment_text", Text2.Text));
                    cmd.Parameters.Add(new SqlParameter("@viewer_id", vw_id));
                    cmd.Parameters.Add(new SqlParameter("@original_content_id", int.Parse(OID2.Text)));
                    cmd.Parameters.Add(new SqlParameter("@last_written_time", LastDate1.Text));
                    cmd.Parameters.Add(new SqlParameter("@updated_written_time", DateTime.Now.ToString()));

                    SqlDataReader rdr = cmd.ExecuteReader();
                    cnn.Close();



                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Comment Edited Successfully!" + "'); window.location.href = 'Comment.aspx'", true);
                }

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Cannot edit comment." + "'); window.location.href = 'Comment.aspx'", true);
            }

        }

        /*    public void DeleteClicked(object sender, EventArgs e)
            {

                    string connetionString;
                    SqlConnection cnn;

                    connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                    cnn = new SqlConnection(connetionString);

                    if ( OID3.Text == "" || LastDate2.Text == "")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please insert all values!" + " ');", true);
                    }

                    else
                    {
                        cnn.Open();


                        SqlCommand cmd = new SqlCommand("Delete_Comment", cnn);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.Add(new SqlParameter("@viewer_id", 7));
                        cmd.Parameters.Add(new SqlParameter("@original_content_id", int.Parse(OID3.Text)));
                        cmd.Parameters.Add(new SqlParameter("@written_time", LastDate2.Text));

                        SqlDataReader rdr = cmd.ExecuteReader();
                        cnn.Close();



                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Comment Deleted Successfully!" + "'); window.location.href = 'Comment.aspx'", true);
                    }


                catch (Exception)
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Cannot delete comment. Please try again." + "'); window.location.href = 'Comment.aspx'", true);
                }


            } */

        public void button2Clicked(object sender, EventArgs e)
        {
            Response.Redirect("ViewerMain.aspx");
        }

        protected void DeleteCommand(object sender, GridViewCommandEventArgs e)
        {

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            cnn = new SqlConnection(connetionString);

            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = Table1.Rows[index];
            var id = row.Cells[0].Text;
            var date = row.Cells[1].Text;

            int oc_id = int.Parse(id);
            DateTime lastdate = Convert.ToDateTime(date);
            int vw_id = Convert.ToInt32(Session["ids"]);
            cnn.Open();

            try
            {
                SqlCommand cmd = new SqlCommand("Delete_Comment", cnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@viewer_id", vw_id));
                cmd.Parameters.Add(new SqlParameter("@original_content_id", oc_id));
                cmd.Parameters.Add(new SqlParameter("@written_time", lastdate));

                SqlDataReader rdr = cmd.ExecuteReader();
                cnn.Close();



                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Comment Deleted Successfully!" + "'); window.location.href = 'Comment.aspx'", true);
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + "Cannot delete comment." + "'); window.location.href = 'Comment.aspx'", true);
            }

        }
    }
}
