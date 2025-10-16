using System;
using System.Configuration;
using System.Data;
//using System.Data.Common.CommandTrees.ExpressionBuilder;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class CorseContentDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCourseDDL();
            }
        }

        //Bind Dropdown// 
        void BindCourseDDL()
        {
            try
            {
                drpCourses.DataSource = dbconnect.GetDataSet("select * from COURSES_DETAIL");
                string query = "select * from COURSES_DETAIL";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                drpCourses.DataSource = data;
                drpCourses.DataTextField = "COURSENAME";
                drpCourses.DataValueField = "COURSEID";
                drpCourses.DataBind();
                ListItem selectitem = new ListItem("Select  Course", "Select Course");
                selectitem.Selected = true;
                drpCourses.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
        }
        // Bind Dropdown// 
        //Dropdown SelectedIndexChanged//
        protected void drpCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpCourses.SelectedIndex != 0)
            {
                int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
                ViewChapterGridView(Course_Id);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Please select Course.')</script>");
                drpCourses.SelectedIndex = 0;
            }
        }
        //Dropdown SelectedIndexChanged//
        // Bind Chapter GridView// 
        void ViewChapterGridView(int Course_Id)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT * FROM COURSE_CHAPTER_DETAIL where Course_Id='" + Course_Id + "'", con);
            dataAdapter.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Chaptergv.DataSource = dt;
                Chaptergv.DataBind();
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                Chaptergv.DataSource = dt;
                Chaptergv.DataBind();
                Chaptergv.Rows[0].Cells.Clear();
                Chaptergv.Rows[0].Cells.Add(new TableCell());
                Chaptergv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                Chaptergv.Rows[0].Cells[0].Text = "No Data Found";
                Chaptergv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
        // Bind Chapter GridView// 

        //Add Chapter//
        protected void Chaptergv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    con.Open();
                    string query = " insert into COURSE_CHAPTER_DETAIL(Chapter_Number,Course_Id) values (@FooterChapter_NumberTxt,@Course_Id)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@FooterChapter_NumberTxt", (Chaptergv.FooterRow.FindControl("FooterChapter_NumberTxt") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Course_Id", Course_Id);
                    cmd.ExecuteNonQuery();
                    ViewChapterGridView(Course_Id);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Chapter Added.')</script>");
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Error Occured.')</script>");
                lblErrorMessage.Text = ex.Message;
            }
        }
        //Add Chapter//

        //Edit Chapter//
        protected void Chaptergv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
            Chaptergv.EditIndex = e.NewEditIndex;
            ViewChapterGridView(Course_Id);
        }

        protected void Chaptergv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
            Chaptergv.EditIndex = -1;
            ViewChapterGridView(Course_Id);
        }
        //Edit Chapter//

        //Update Chapter//
        protected void Chaptergv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
            try
            {
                con.Open();
                string query = " update COURSE_CHAPTER_DETAIL set Chapter_Number=@Chapter_NumberTxt where Chapter_Id=@Chapter_Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Chapter_NumberTxt", (Chaptergv.Rows[e.RowIndex].FindControl("Chapter_NumberTxt") as TextBox).Text.Trim());
                cmd.Parameters.AddWithValue("Chapter_Id", Convert.ToInt32(Chaptergv.DataKeys[e.RowIndex].Value.ToString()));
                cmd.ExecuteNonQuery();
                Chaptergv.EditIndex = -1;
                ViewChapterGridView(Course_Id);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Chapter Updated.')</script>");
                con.Close();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Error Occured.')</script>");
                lblErrorMessage.Text = ex.Message;
            }
        }
        //Update Chapter//

        //Delete Chapter//
        protected void Chaptergv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
            try
            {
                con.Open();
                string query = " delete COURSE_CHAPTER_DETAIL where Chapter_Id=@Chapter_Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("Chapter_Id", Convert.ToInt32(Chaptergv.DataKeys[e.RowIndex].Value.ToString()));
                cmd.ExecuteNonQuery();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Chapter Deleted.')</script>");
                con.Close();
                ViewChapterGridView(Course_Id);
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Please Delete Topics First.!')</script>");
                //lblErrorMessage.Text = "ERROR CODE 101 :  Please Delete Topics First.!";
                //lblSuccessMessage.Text = string.Empty;
                ViewChapterGridView(Course_Id);
            }
        }
        //Delete Chapter//

        // Bind Topic GridView//
        protected void Chaptergv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridView Topicgrv = e.Row.FindControl("Topicgrv") as GridView;
                Label Chapter_Id = (Label)e.Row.FindControl("LblChpId");
                DataTable dt = new DataTable();
                SqlDataAdapter dataAdapter = new SqlDataAdapter("select Topic_Id,Topic_Name,Days from COURSE_TOPIC_DETAIL where Chapter_Id='" + Chapter_Id.Text + "'", con);
                dataAdapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Topicgrv.DataSource = dt;
                    Topicgrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    Topicgrv.DataSource = dt;
                    Topicgrv.DataBind();
                    Topicgrv.Rows[0].Cells.Clear();
                    Topicgrv.Rows[0].Cells.Add(new TableCell());
                    Topicgrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    Topicgrv.Rows[0].Cells[0].Text = "No Data Found";
                    Topicgrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }
        }
        // Bind Topic GridView//

        // Add Topic//
        protected void TopicGrv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Add Topic//
            if (e.CommandName == "AddTopicGrv")
            {
                try
                {
                    int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
                    GridView Topicgrv = (GridView)sender;
                    int rowIndex = ((((Button)e.CommandSource).NamingContainer.Parent.Parent.Parent.Parent.Parent) as GridViewRow).RowIndex;
                    string Chapter_Id = Chaptergv.DataKeys[rowIndex].Value.ToString();
                    con.Open();
                    string query = " insert into COURSE_TOPIC_DETAIL(Topic_Name,Days,Chapter_Id) values (@FooterTopic_NameTxt,@FooterTopic_DaysTxt,@Chapter_Id)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@FooterTopic_NameTxt", (Topicgrv.FooterRow.FindControl("FooterTopic_NameTxt") as TextBox).Text.TrimStart(','));
                    cmd.Parameters.AddWithValue("@FooterTopic_DaysTxt", (Topicgrv.FooterRow.FindControl("FooterTopic_DaysTxt") as TextBox).Text.TrimStart(','));
                    cmd.Parameters.AddWithValue("@Chapter_Id", Chapter_Id);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    (Topicgrv.FooterRow.FindControl("FooterTopic_NameTxt") as TextBox).Text = string.Empty;
                    (Topicgrv.FooterRow.FindControl("FooterTopic_DaysTxt") as TextBox).Text = string.Empty;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Topic Added.')</script>");
                    ViewChapterGridView(Course_Id);
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Error Occured.')</script>");
                    lblErrorMessage.Text = "ERROR CODE 101 :" + ex.Message;
                    lblSuccessMessage.Text = string.Empty;
                }
                // Add Topic//
            }
            // Delete Topic//
            else if (e.CommandName == "DeleteTopic")
            {
                try
                {
                    int Course_Id = Convert.ToInt32(drpCourses.SelectedValue);
                    GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                    int RowIndex = row.RowIndex;
                    string Topic_Id = (row.FindControl("HdnTopicId") as HiddenField).Value;
                    con.Open();
                    string query = " delete COURSE_TOPIC_DETAIL where Topic_Id=" + Topic_Id.ToString();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Topic Deleted.')</script>");
                    con.Close();
                    ViewChapterGridView(Course_Id);
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Error Occured.')</script>");
                    lblErrorMessage.Text = "ERROR CODE 101 :"+ex.Message;
                    lblSuccessMessage.Text = string.Empty;
                }
            }
            // Delete Topic//

            //else if (e.CommandName == "EditTopic")
            //{
            //    try
            //    {
            //        GridViewRow row = (sender as TextBox).NamingContainer as GridViewRow;
            //        GridView Topicgrv = (GridView)sender;
            //        int RowIndex = row.RowIndex;
            //        //string Topic_Name = (row.FindControl("HdnTopicName") as HiddenField).Value.ToString();
            //        string Journal = (Topicgrv.FindControl("TopicNameLabel") as Label).Text;
            //        string Journal2 = (Topicgrv.FindControl("DaysLabel") as Label).Text;
            //        string TopicNameText = (row.FindControl("Topic_NameTxt") as TextBox).Text;
            //        string DaysTxt = (row.FindControl("DaysTxt") as TextBox).Text;
            //        (row.FindControl("Topic_NameTxt") as TextBox).Text = TopicNameText.Split(',')[TopicNameText.Split(',').Length - 1];
            //        (row.FindControl("DaysTxt") as TextBox).Text = DaysTxt.Split(',')[DaysTxt.Split(',').Length - 1];
            //    }
            //    catch (NullReferenceException ex)
            //    {

            //        lblErrorMessage.Text = "ERROR CODE 101 :" + ex.Message;
            //    }
        }
    }
}
