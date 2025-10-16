using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    //NewBatchSheetDetails  15/08/2025
    public partial class NewBatchSheetDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        string ExpectedStudent;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBatchDetailsGidView();
                // Retrieve values from session
                string batchId = Session["BatchId"]?.ToString();
                string facultyName = Session["FacultyName"]?.ToString();
                string startDate = Session["StartDate"]?.ToString();
                string endDate = Session["EndDate"]?.ToString();
                string courseId = Session["CourseId"]?.ToString();
                string expectedStudent = Session["ExpectedStudent"]?.ToString();

                // Check if the values are not null
                if (batchId != null)
                    BatchId.Text = batchId;

                // Format faculty name to show only the first name (trim after first space)
                if (facultyName != null)
                {
                    string firstName = facultyName.Split(' ')[0]; // Split and take the first part (first name)
                    FaclutyName.Text = firstName;
                }

                // Format start date to show only date (without time)
                if (startDate != null && DateTime.TryParse(startDate, out DateTime startDateValue))
                {
                    StartDate.Text = startDateValue.ToString("dd-MM-yyyy"); // Change format as per your requirement (e.g., "MM/dd/yyyy")
                }

                // Format end date to show only date (without time)
                if (endDate != null && DateTime.TryParse(endDate, out DateTime endDateValue))
                {
                    EndDate.Text = endDateValue.ToString("dd-MM-yyyy"); // Change format as per your requirement (e.g., "MM/dd/yyyy")
                }
                if(Session["CANDID"] != null)
                {
                    string CandidateId = Session["CANDID"].ToString();
                }
                int CurrentbatchId = Convert.ToInt32(Session["BatchId"]?.ToString());
                //LoadChatMessages(CurrentbatchId);
            }
        }
        //Bind  GridView//
        void BindBatchDetailsGidView()
        {
            try
            {
                int BatchId = Convert.ToInt32(Session["BatchId"]?.ToString());
                DataTable dt = new DataTable();
                SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from enosis.BatchSheetDetails where BatchId = " + BatchId, con);
                dataAdapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    BatchSheetDetailsGrv.DataSource = dt;
                    BatchSheetDetailsGrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    BatchSheetDetailsGrv.DataSource = dt;
                    BatchSheetDetailsGrv.DataBind();
                    BatchSheetDetailsGrv.Rows[0].Cells.Clear();
                    BatchSheetDetailsGrv.Rows[0].Cells.Add(new TableCell());
                    BatchSheetDetailsGrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    BatchSheetDetailsGrv.Rows[0].Cells[0].Text = "No Data Found";
                    BatchSheetDetailsGrv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    BatchSheetDetailsGrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    BatchSheetDetailsGrv.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }

        // Bind Footer Course Dropdown// 
        void BindChapterDrp()
        {
            try
            {
                string courseId = Session["CourseId"]?.ToString();
                if (string.IsNullOrEmpty(courseId))
                {
                    Errorlbl.Text = "Invalid CourseID.";
                    Errorlbl.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                if (con == null)
                {
                    Errorlbl.Text = "Database connection is not initialized.";
                    Errorlbl.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                // Fetch chapters from database
                string query = "SELECT Chapter_Id, Chapter_Number FROM enosis.COURSE_CHAPTER_DETAIL WHERE Course_Id = @CourseId";
                DataTable data = new DataTable();
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CourseId", courseId);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(data);
                }

                // Loop through GridView rows to bind DropDownList inside TemplateField
                foreach (GridViewRow row in BatchSheetDetailsGrv.Rows)
                {
                    DropDownList ChapterDrp = BatchSheetDetailsGrv.FooterRow.FindControl("ChapterDrp") as DropDownList;
                    if (ChapterDrp != null)
                    {
                        ChapterDrp.DataSource = data;
                        ChapterDrp.DataTextField = "Chapter_Number";
                        ChapterDrp.DataValueField = "Chapter_Id";
                        ChapterDrp.DataBind();
                        ChapterDrp.Items.Insert(0, new ListItem("Select Chapter", "0"));
                    }
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = "Error: " + ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Bind Footer Student CheckBoxList// 
        //void BindStudentList()
        //{
        //    try
        //    {
        //        string batchId = Session["BatchId"]?.ToString();
        //        DropDownList StudentList = BatchSheetDetailsGrv.FooterRow.FindControl("FooterStudentDrp") as DropDownList;
        //        string query = "SELECT c.FullName, c.CANDIDATE_CODE AS CandidateID FROM Candidates c INNER JOIN CandidateBatchMapping m ON c.CANDIDATE_CODE = m.CANDIDATE_CODE WHERE m.BatchID =" + batchId;
        //        SqlDataAdapter sda = new SqlDataAdapter(query, con);
        //        DataTable data = new DataTable();
        //        sda.Fill(data);
        //        StudentList.DataSource = data;
        //        StudentList.DataTextField = "FULLNAME";
        //        StudentList.DataValueField = "CandidateID";
        //        StudentList.DataBind();
        //    }
        //    catch (Exception ex)
        //    {

        //        Errorlbl.Text = ex.Message;
        //        Errorlbl.ForeColor = System.Drawing.Color.Red;
        //    }
        //}
        //Bind Footer Student CheckBoxList// 
        protected void BatchSheetDetailsGrv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName.Equals("Add"))
                {
                    BatchId.Text = Session["BatchId"]?.ToString();

                    TextBox Date = (TextBox)BatchSheetDetailsGrv.FooterRow.FindControl("FooterDate");
                    DateTime SD = Convert.ToDateTime(Date.Text);
                    DropDownList ChapterDrp = (DropDownList)BatchSheetDetailsGrv.FooterRow.FindControl("ChapterDrp");
                    //DropDownList StudentName = (DropDownList)BatchSheetDetailsGrv.FooterRow.FindControl("FooterStudentDrp");
                   // DropDownList Status = (DropDownList)BatchSheetDetailsGrv.FooterRow.FindControl("FooterStatus");
                    //TextBox Student = (TextBox)BatchSheetDetailsGrv.FooterRow.FindControl("FooterStudent");
                    TextBox Topic = (TextBox)BatchSheetDetailsGrv.FooterRow.FindControl("FooterTopic");
                    TextBox Comments = (TextBox)BatchSheetDetailsGrv.FooterRow.FindControl("FooterComments");
                    FileUpload fileUpload = (FileUpload)BatchSheetDetailsGrv.FooterRow.FindControl("FileUpload1"); // Find FileUpload Control

                    string filePath = ""; // Variable to store file path

                    // Check if file is uploaded
                    if (fileUpload != null && fileUpload.HasFile)
                    {
                        string folderPath = Server.MapPath("~/Files/");

                        // Ensure the directory exists
                        if (!Directory.Exists(folderPath))
                        {
                            Directory.CreateDirectory(folderPath);
                        }

                        string fileName = Path.GetFileName(fileUpload.FileName);
                        filePath = "~/Files/" + fileName;
                        fileUpload.SaveAs(folderPath + fileName); // Save file to server
                    }

                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"
                                                    INSERT INTO enosis.BatchSheetDetails 
                                                    (Date, ChapterNumber, TopicCovered,BatchId, uploads,Comments,Status) 
                                                    VALUES 
                                                    (@Date, @Chapter, @Topic,@BatchId, @Uploads,@Comments, 'Present')", con);
                    cmd.Parameters.AddWithValue("@Date", SD);
                    cmd.Parameters.AddWithValue("@Chapter", ChapterDrp.SelectedItem.Text);
                    //cmd.Parameters.AddWithValue("@Student", StudentName.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Topic", Topic.Text);
                    cmd.Parameters.AddWithValue("@Comments", Comments.Text);
                    cmd.Parameters.AddWithValue("@BatchId", BatchId.Text);
                    cmd.Parameters.AddWithValue("@Uploads", string.IsNullOrEmpty(filePath) ? (object)DBNull.Value : filePath); // Save file path
                    //cmd.Parameters.AddWithValue("@StudentID", StudentName.SelectedValue);
                    //cmd.Parameters.AddWithValue("@Status", Status.SelectedValue);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Batch Details Added.')</script>");

                    BindBatchDetailsGidView(); // Refresh GridView
                }

            }
            catch (Exception ex)
            {

                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Bind GridView//
        //Edit BatchSheet GridView//
        protected void BatchSheetDetailsGrv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                BatchSheetDetailsGrv.EditIndex = e.NewEditIndex;
                BindBatchDetailsGidView();
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Edit BatchSheet GridView//
        //Cancel Edit BatchSheet GridView//
        protected void BatchSheetDetailsGrv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                BatchSheetDetailsGrv.EditIndex = -1;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Update Declined.')</script>");
                BindBatchDetailsGidView();
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Cancel Edit BatchSheet GridView//
        //Delete BatchSheet GridView//
        protected void BatchSheetDetailsGrv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int BatchSheetId = Convert.ToInt32(BatchSheetDetailsGrv.DataKeys[e.RowIndex].Value);
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE enosis.BatchSheetDetails WHERE BatchSheetId=" + BatchSheetId, con);
                cmd.ExecuteNonQuery();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Batch Details Deleted.')</script>");
                con.Close();
                BindBatchDetailsGidView();
            }
            catch (Exception ex)
            {

                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Delete BatchSheet GridView//
        //Update BatchSheet GridView//
        protected void BatchSheetDetailsGrv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int BatchSheetId = Convert.ToInt32(BatchSheetDetailsGrv.DataKeys[e.RowIndex].Value);

                TextBox Date = BatchSheetDetailsGrv.Rows[e.RowIndex].FindControl("DateTxt") as TextBox;
                DateTime SD = Convert.ToDateTime(Date.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);

                TextBox Chapter = BatchSheetDetailsGrv.Rows[e.RowIndex].FindControl("ChapterTxt") as TextBox;
                TextBox Topic = BatchSheetDetailsGrv.Rows[e.RowIndex].FindControl("TopicTxt") as TextBox;

                con.Open();

                SqlCommand cmd = new SqlCommand("UPDATE enosis.BatchSheetDetails SET Date = @Date, ChapterNumber = @Chapter, TopicCovered = @Topic WHERE BatchSheetId = @BatchSheetId", con);
                cmd.Parameters.AddWithValue("@Date", SD);
                cmd.Parameters.AddWithValue("@Chapter", Chapter.Text.Trim());
                cmd.Parameters.AddWithValue("@Topic", Topic.Text.Trim());
                cmd.Parameters.AddWithValue("@BatchSheetId", BatchSheetId);

                cmd.ExecuteNonQuery();

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Batch Details Updated.')</script>");

                con.Close();

                BatchSheetDetailsGrv.EditIndex = -1;
                BindBatchDetailsGidView();
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Update BatchSheet GridView//
        //DropDown Validation//
        protected void CustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DropDownList BatchTyChapterDrppeDrp = (DropDownList)BatchSheetDetailsGrv.FooterRow.FindControl("ChapterDrp");
            args.IsValid = BatchTyChapterDrppeDrp.SelectedIndex != 0;
        }
        //DropDown Validation//
        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("BatchesDetails.aspx");
        }
        //Bind Chapter DropDoewnList//
        protected void BatchSheetDetailsGrv_DataBound(object sender, EventArgs e)
        {
            BindChapterDrp();
            //BindStudentList();
        }
        //Bind Chapter DropDoewnList//

        protected void PreviewFile(object sender, CommandEventArgs e)
        {
            string fileName = e.CommandArgument.ToString();
            string filePath = "~/Files/" + fileName; // adjust folder if different

            // Just redirect to the file's virtual path (it should be publicly accessible or allowed)
            Response.Redirect(filePath);
        }

        private DataTable GetChatMessagesFromDB(string batchSheetId)
        {
            DataTable dt = new DataTable();

            string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT Sender, MessageText, MessageDateTime FROM BatchMessages WHERE BatchSheetID = @BatchSheetID  ORDER BY MessageDateTime ASC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@BatchSheetID", batchSheetId);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            return dt;
        }
        [System.Web.Services.WebMethod]
        public static List<ChatMessage> GetChatMessages(string batchSheetId)
        {
            List<ChatMessage> messages = new List<ChatMessage>();

            string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("SELECT Sender, MessageText, FileAttachment, MessageDateTime FROM BatchMessages WHERE BatchSheetID = @BatchSheetID ORDER BY MessageDateTime ASC", con);
                cmd.Parameters.AddWithValue("@BatchSheetID", batchSheetId);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    messages.Add(new ChatMessage
                    {
                        Sender = dr["Sender"].ToString(),
                        MessageText = dr["MessageText"].ToString(),
                        MessageDateTime = Convert.ToDateTime(dr["MessageDateTime"]).ToString("dd-MM-yyyy hh:mm tt"),
                        FileAttachment = dr["FileAttachment"] == DBNull.Value ? "" : dr["FileAttachment"].ToString()
                    });
                }
            }
            return messages;
        }

        public class ChatMessage
        {
            public string Sender { get; set; }
            public string MessageText { get; set; }
            public string MessageDateTime { get; set; }
            public string FileAttachment { get; set; }
        }


        protected void btnSendReply_Click(object sender, EventArgs e)
        {
            string batchSheetId = HiddenField2.Value?.Trim();
            string message = txtReply.Text?.Trim();
            string senderName = Session["FULLNAME"]?.ToString() ?? "Admin";
            string filePath = null;

            try
            {
                // Handle file upload
                if (fuAttachment.HasFile)
                {
                    string folderPath = Server.MapPath("~/Uploads/");
                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);

                    string fileName = Path.GetFileName(fuAttachment.FileName);
                    string savedPath = Path.Combine(folderPath, fileName);
                    fuAttachment.SaveAs(savedPath);

                    // Save virtual path for download
                    filePath = "~/Uploads/" + fileName;
                }

                if (!string.IsNullOrEmpty(batchSheetId) && !string.IsNullOrEmpty(message))
                {
                    string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(connStr))
                    {
                        string query = @"INSERT INTO BatchMessages 
                                (BatchSheetID, Sender, MessageText, MessageDateTime, FileAttachment) 
                                VALUES 
                                (@BatchSheetID, @Sender, @MessageText, @MessageDateTime, @FileAttachment)";

                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@BatchSheetID", batchSheetId);
                            cmd.Parameters.AddWithValue("@Sender", senderName);
                            cmd.Parameters.AddWithValue("@MessageText", message.Replace("'", "''")); // Optional safety
                            cmd.Parameters.AddWithValue("@MessageDateTime", DateTime.Now);
                            cmd.Parameters.AddWithValue("@FileAttachment", (object)filePath ?? DBNull.Value);

                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    // Reset input
                    txtReply.Text = "";

                    // Optional: reload chat if needed
                    // BindChatMessages(batchSheetId); 

                    // Show success message
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SuccessScript", "<script>alert('Comment with file added successfully.');</script>");
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = "❌ " + ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}