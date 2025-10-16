using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Diagnostics;
using DocumentFormat.OpenXml.Math;
using System.Web.Services.Description;

namespace ENOSISLEARNING
{
    public partial class BatchInfo : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindAllBatchGidView("All");
                AllBatch();
                BindCourseDrp();
                BindFacultyDrpFilter();
                CompleteBatches();
            }
        }
        // Batch Type Dropdown SelectedIndecChange//
        protected void BatchTypeDrp_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string selectedValue = BatchTypeDrp.SelectedValue;
                //BindAllBatchGidView(selectedValue);
                if(selectedValue == "All")
                {
                    AllBatch();
                }
                if(selectedValue == "Current")
                {
                    CurrentBatch();
                }
                if(selectedValue == "Planned")
                {
                    PlannedBatch();
                }
            }
            catch (Exception ex)
            {

                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Bind All Batch GidView with filter//
        void AllBatch()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT     bi.*,    cd.COURSEID FROM     enosis.BatchesInfo AS bi LEFT JOIN     (        SELECT             BatchID,             MAX(ChapterNumber) AS ChapterNumber       FROM             enosis.BatchSheetDetails        GROUP BY             BatchID    ) AS lc ON bi.BatchID = lc.BatchID LEFT JOIN     COURSES_DETAIL AS cd ON bi.BatchSubject = cd.COURSENAME LEFT JOIN    (        SELECT             BatchID       FROM             enosis.BatchSheetDetails        GROUP BY           BatchID    ) AS tc ON bi.BatchID = tc.BatchID WHERE     bi.Status != 'Complete'";
           
                //string query = "SELECT     bi.*,      lc.ChapterNumber AS LatestChapterNumber,    cd.COURSEID,    tc.TotalChapters FROM     enosis.BatchesInfo AS bi LEFT JOIN     (        SELECT             BatchID,             MAX(ChapterNumber) AS ChapterNumber       FROM             enosis.BatchSheetDetails        GROUP BY             BatchID    ) AS lc ON bi.BatchID = lc.BatchID LEFT JOIN     COURSES_DETAIL AS cd ON bi.BatchSubject = cd.COURSENAME LEFT JOIN    (        SELECT             BatchID,             COUNT(ChapterNumber) AS TotalChapters        FROM             enosis.BatchSheetDetails        GROUP BY           BatchID    ) AS tc ON bi.BatchID = tc.BatchID WHERE     bi.Status != 'Complete'";
                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                dataAdapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                    Batchgrv.Rows[0].Cells.Clear();
                    Batchgrv.Rows[0].Cells.Add(new TableCell());
                    Batchgrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    Batchgrv.Rows[0].Cells[0].Text = "No Batches Found";
                    Batchgrv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    Batchgrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    Batchgrv.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Bind All Batch GidView with filter//
        //Bind Current Batch GidView with filter//
        void CurrentBatch()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT    bi.*, lc.ChapterNumber AS ChapterNumber,   cd.COURSEID FROM     enosis.BatchesInfo AS bi LEFT JOIN     (SELECT          BatchID,         MAX(ChapterNumber) AS ChapterNumber     FROM       enosis.BatchSheetDetails     GROUP BY        BatchID) AS lc ON   bi.BatchID = lc.BatchID LEFT JOIN    COURSES_DETAIL AS cd ON    bi.BatchSubject = cd.COURSENAME WHERE     bi.BatchType = 'Current'    AND bi.Status != 'Complete'";
                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                dataAdapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                    Batchgrv.Rows[0].Cells.Clear();
                    Batchgrv.Rows[0].Cells.Add(new TableCell());
                    Batchgrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    Batchgrv.Rows[0].Cells[0].Text = "No Batches Found";
                    Batchgrv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    Batchgrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    Batchgrv.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Bind Plannes Batch GidView with filter//
        void PlannedBatch()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT     bi.*,     lc.ChapterNumber AS ChapterNumber,     cd.COURSEID FROM     enosis.BatchesInfo AS bi LEFT JOIN     (SELECT         BatchID,          MAX(ChapterNumber) AS ChapterNumber      FROM          enosis.BatchSheetDetails      GROUP BY          BatchID) AS lc ON     bi.BatchID = lc.BatchID LEFT JOIN     COURSES_DETAIL AS cd ON     bi.BatchSubject = cd.COURSENAME WHERE     bi.BatchType = 'Planned'     AND bi.Status != 'Complete'";
                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                dataAdapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                    Batchgrv.Rows[0].Cells.Clear();
                    Batchgrv.Rows[0].Cells.Add(new TableCell());
                    Batchgrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    Batchgrv.Rows[0].Cells[0].Text = "No Batches Found";
                    Batchgrv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    Batchgrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    Batchgrv.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Bind Complete Batch GidView with filter//
       
        //Bind All Batch GidView with filter//
        void BindAllBatchGidView(string statusFilter)
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT BatchesInfo.*,LatestChapter.ChapterNumber AS ChapterNumber FROM BatchesInfo LEFT JOIN (SELECT BatchID, MAX(ChapterNumber) AS ChapterNumber FROM BatchSheetDetails GROUP BY BatchID) AS LatestChapter ON BatchesInfo.BatchID = LatestChapter.BatchID";

                // Apply status filter if not "All"
                if (statusFilter != "All")
                {
                    query += $" WHERE BatchType = '{statusFilter}'";
                }

                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                dataAdapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                    Batchgrv.Rows[0].Cells.Clear();
                    Batchgrv.Rows[0].Cells.Add(new TableCell());
                    Batchgrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    Batchgrv.Rows[0].Cells[0].Text = "No Batches Found";
                    Batchgrv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    Batchgrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    Batchgrv.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Bind All Batch GidView with filter//
        // Bind Faculty Dropdown// 
        void BindFacultyDrp()
        {
            try
            {
                DropDownList drpFaculty = Batchgrv.FooterRow.FindControl("drpFaculty") as DropDownList;
                string query = "SELECT USERID, FULLNAME FROM USERDETAILS WHERE (STATUS = 'ACTIVE' OR STATUS = '1') AND FULLNAME IS NOT NULL ORDER BY FULLNAME ASC;";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                drpFaculty.DataSource = data;
                drpFaculty.DataTextField = "FULLNAME";
                drpFaculty.DataValueField = "FULLNAME";
                drpFaculty.DataBind();
                ListItem selectitem = new ListItem("Faculty", "Faculty");
                selectitem.Selected = true;
                drpFaculty.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {

                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        void BindFacultyDrpFilter()
        {
            try
            {
                string query = "SELECT USERID, FULLNAME FROM USERDETAILS WHERE (STATUS = 'ACTIVE' OR STATUS = '1') AND FULLNAME IS NOT NULL ORDER BY FULLNAME ASC;";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                FacultyDrp.DataSource = data;
                FacultyDrp.DataTextField = "FULLNAME";
                FacultyDrp.DataValueField = "FULLNAME";
                FacultyDrp.DataBind();
                ListItem selectitem = new ListItem("Faculty", "Faculty");
                selectitem.Selected = true;
                FacultyDrp.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {

                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        // Bind Faculty Dropdown// 
        // Bind Footer Course Dropdown// 
        void BindCourseDrp()
        {
            try
            {
                DropDownList CourseDrp = Batchgrv.FooterRow.FindControl("FooterCourseDrp") as DropDownList;
                string query = "select * from COURSES_DETAIL WHERE STATUS = 'A'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                CourseDrp.DataSource = data;
                CourseDrp.DataTextField = "COURSENAME";
                CourseDrp.DataValueField = "COURSENAME";
                CourseDrp.DataBind();
                ListItem selectitem = new ListItem("Course", "Course");
                selectitem.Selected = true;
                CourseDrp.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {

                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        // Bind Footer Course Dropdown// 
        // Bind Course Faculty DropDownList// 
        protected void Batchgrv_DataBound(object sender, EventArgs e)
        {
            BindFacultyDrp();
            BindCourseDrp();
        }
        // Bind Course Faculty DropDownList//
        // Add Batch Details// 
        protected void Batchgrv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if (e.CommandName.Equals("Add"))
            //{
            //    try
            //    {
            //        GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
            //        DropDownList BatchTypeDrp = (DropDownList)Batchgrv.FooterRow.FindControl("FooterBatchTypeDrp");
            //        DropDownList BatchMode = (DropDownList)Batchgrv.FooterRow.FindControl("FooterBatchMode");
            //        DropDownList CourseDrp = (DropDownList)Batchgrv.FooterRow.FindControl("FooterCourseDrp");
            //        string selectedCourseId = CourseDrp.SelectedValue; //CourseID//
            //        TextBox Startdatet = (TextBox)Batchgrv.FooterRow.FindControl("FooterStartdatettxt");
            //        DateTime SD = Convert.ToDateTime(Startdatet.Text);
            //        TextBox Enddate = (TextBox)Batchgrv.FooterRow.FindControl("FooterEnddatettxt");
            //        DateTime ED = Convert.ToDateTime(Enddate.Text);
            //        TextBox StartTime = (TextBox)Batchgrv.FooterRow.FindControl("FooterStartTimetxt");
            //        DateTime ST = Convert.ToDateTime(StartTime.Text);
            //        TextBox EndTime = (TextBox)Batchgrv.FooterRow.FindControl("FooterEndTimetxt");
            //        DateTime ET = Convert.ToDateTime(EndTime.Text);
            //        DropDownList drpFaculty = (DropDownList)Batchgrv.FooterRow.FindControl("drpFaculty");
            //        TextBox StudentName = (TextBox)Batchgrv.FooterRow.FindControl("FooterExpectStudtxt");
            //        DropDownList Status = (DropDownList)Batchgrv.FooterRow.FindControl("FooterStatus");
            //        //string BatchId = (row.FindControl("HdnBatchId") as HiddenField).Value;
            //        con.Open();
            //        SqlCommand cmd = new SqlCommand("insert into enosis.BatchesInfo(BatchType,BatchMode,BatchSubject,StartDate,EndDate,StartTime,EndTime,FaclutyName,ExpectedStudent,Status) values('" + BatchTypeDrp.SelectedValue + "','" + BatchMode.SelectedItem.Text + "','" + CourseDrp.SelectedValue + "','" + SD.ToString() + "','" + ED.ToString() + "','" + ST.ToString() + "','" + ET.ToString() + "','" + drpFaculty.SelectedValue + "','" + StudentName.Text.ToString() + "','" + Status.SelectedValue + "')", con);
            //        cmd.ExecuteNonQuery();
            //        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Batch Added.')</script>");
            //        con.Close();
            //        //BindAllBatchGidView("All");
            //        AllBatch();
            //    }
            //    catch (Exception ex)
            //    {
            //        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Failed.')</script>");
            //        Errorlbl.Text = ex.Message;
            //        Errorlbl.ForeColor = System.Drawing.Color.Red;
            //    }
            //}
            if (e.CommandName.Equals("Add"))
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                    DropDownList BatchTypeDrp = (DropDownList)Batchgrv.FooterRow.FindControl("FooterBatchTypeDrp");
                    DropDownList BatchMode = (DropDownList)Batchgrv.FooterRow.FindControl("FooterBatchMode");
                    DropDownList CourseDrp = (DropDownList)Batchgrv.FooterRow.FindControl("FooterCourseDrp");
                    string selectedCourseId = CourseDrp.SelectedValue;
                    TextBox Startdatet = (TextBox)Batchgrv.FooterRow.FindControl("FooterStartdatettxt");
                    DateTime SD = Convert.ToDateTime(Startdatet.Text);
                    TextBox Enddate = (TextBox)Batchgrv.FooterRow.FindControl("FooterEnddatettxt");
                    DateTime ED = Convert.ToDateTime(Enddate.Text);
                    TextBox StartTime = (TextBox)Batchgrv.FooterRow.FindControl("FooterStartTimetxt");
                    DateTime ST = Convert.ToDateTime(StartTime.Text);
                    TextBox EndTime = (TextBox)Batchgrv.FooterRow.FindControl("FooterEndTimetxt");
                    DateTime ET = Convert.ToDateTime(EndTime.Text);
                    DropDownList drpFaculty = (DropDownList)Batchgrv.FooterRow.FindControl("drpFaculty");
                    //TextBox StudentName = (TextBox)Batchgrv.FooterRow.FindControl("FooterExpectStudtxt");
                    TextBox StudentName = (TextBox)Batchgrv.FooterRow.FindControl("FooterExpectStudtxt");
                    string studentNames = StudentName != null ? StudentName.Text.Trim() : "";
                    DropDownList Status = (DropDownList)Batchgrv.FooterRow.FindControl("FooterStatus");

                    if (StudentName == null)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Student Name field not found!');</script>");
                        return;
                    }

                    if (string.IsNullOrWhiteSpace(StudentName.Text))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Student Name is required!');</script>");
                        return;
                    }

                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO enosis.BatchesInfo (BatchType, BatchMode, BatchSubject, StartDate, EndDate, StartTime, EndTime, FaclutyName, ExpectedStudent, Status,CreatetedBy,USERID,COURSEID) VALUES (@BatchType, @BatchMode, @BatchSubject, @StartDate, @EndDate, @StartTime, @EndTime, @FacultyName, @ExpectedStudent, @Status,@CreatetedBy,@USERID,@COURSEID)", con);

                    cmd.Parameters.AddWithValue("@BatchType", BatchTypeDrp.SelectedValue);
                    cmd.Parameters.AddWithValue("@BatchMode", BatchMode.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@BatchSubject", CourseDrp.SelectedValue);
                    cmd.Parameters.AddWithValue("@StartDate", SD);
                    cmd.Parameters.AddWithValue("@EndDate", ED);
                    cmd.Parameters.AddWithValue("@StartTime", ST);
                    cmd.Parameters.AddWithValue("@EndTime", ET);
                    cmd.Parameters.AddWithValue("@FacultyName", drpFaculty.SelectedValue);
                    //cmd.Parameters.AddWithValue("@ExpectedStudent",StudentName.Text);
                    cmd.Parameters.AddWithValue("@ExpectedStudent",studentNames);
                    cmd.Parameters.AddWithValue("@Status", Status.SelectedValue);
                    string CurrentUser = Session["USERNAME"].ToString();

                    cmd.ExecuteNonQuery();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Batch Added.')</script>");
                    con.Close();

                    AllBatch();
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Failed.')</script>");
                    Errorlbl.Text = ex.Message;
                    Errorlbl.ForeColor = System.Drawing.Color.Red;
                }
            }

            if (e.CommandName == "ViewDetails")
            {
                try
                {
                    
                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                    
                    string BatchId = Batchgrv.DataKeys[row.RowIndex]["BatchId"].ToString();
                    string FacultyName = Batchgrv.DataKeys[row.RowIndex]["FaclutyName"].ToString();
                    string StartDate = Batchgrv.DataKeys[row.RowIndex]["StartDate"].ToString();
                    string EndDate = Batchgrv.DataKeys[row.RowIndex]["EndDate"].ToString();
                    string CourseId = Batchgrv.DataKeys[row.RowIndex]["COURSEID"].ToString();
                    string ExpectedStudent = Batchgrv.DataKeys[row.RowIndex]["ExpectedStudent"].ToString();

                    //Response.Redirect($"NewBatchSheetDetails.aspx?BatchId={BatchId}&FacultyName={Server.UrlEncode(FacultyName)}&StartDate={StartDate}&EndDate={EndDate}&CourseId={CourseId}&ExpectedStudent={ExpectedStudent}");
                    // Storing values in session
                    Session["BatchId"] = BatchId;
                    Session["FacultyName"] = FacultyName;
                    Session["StartDate"] = StartDate;
                    Session["EndDate"] = EndDate;
                    Session["CourseId"] = CourseId;
                    Session["ExpectedStudent"] = ExpectedStudent;

                    // Redirect to the target page
                    Response.Redirect("NewBatchSheetDetails.aspx");

                }
                catch (Exception ex)
                {
                    Errorlbl.Text = ex.Message;
                    Errorlbl.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        // Add Batch Details//
        // Edit Batch Details//
        protected void Batchgrv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                Batchgrv.EditIndex = e.NewEditIndex;
                //if(BatchTypeDrp.SelectedIndex == 0 || BatchTypeDrp.SelectedValue == "All")
                //{
                //    BindAllBatchGidView("All");
                //}
                //else
                //{
                //    BindAllBatchGidView(BatchTypeDrp.SelectedValue);
                //}
                AllBatch();

            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        // Cancel Batch Details Editing//
        protected void Batchgrv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                Batchgrv.EditIndex = -1;
                if (BatchTypeDrp.SelectedIndex == 0 || BatchTypeDrp.SelectedValue == "All")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Updation Cancelled.')</script>");
                    //BindAllBatchGidView("All");
                    AllBatch();
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Updation Cancelled.')</script>");
                    //BindAllBatchGidView(BatchTypeDrp.SelectedValue);
                    AllBatch();
                }

            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        // Cancel Batch Details Editing//
        //Update Batch Details//
        protected void Batchgrv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                    //TextBox BatchType = (Batchgrv.Rows[e.RowIndex].FindControl("BatchTypeTxt") as TextBox);
                    DropDownList BatchType = (DropDownList)Batchgrv.Rows[e.RowIndex].FindControl("EditBatchTypeDrp");
                    DropDownList BatchMode = (DropDownList)Batchgrv.Rows[e.RowIndex].FindControl("EditBatchMode");
                    //TextBox BatchMode = (Batchgrv.Rows[e.RowIndex].FindControl("BatchModeTxt") as TextBox);
                    TextBox Course = (Batchgrv.Rows[e.RowIndex].FindControl("CourseNametxt") as TextBox);
                    TextBox Startdate = (Batchgrv.Rows[e.RowIndex].FindControl("StartDatetxt") as TextBox);
                    TextBox Enddate = (Batchgrv.Rows[e.RowIndex].FindControl("EndDatetxt") as TextBox);
                    TextBox StartTime = (Batchgrv.Rows[e.RowIndex].FindControl("StartTimetxt") as TextBox);
                    TextBox EndTime = (Batchgrv.Rows[e.RowIndex].FindControl("EndTimetxt") as TextBox);
                    TextBox Faculty = (Batchgrv.Rows[e.RowIndex].FindControl("FaclutyNametxt") as TextBox);
                    TextBox StudentName = (Batchgrv.Rows[e.RowIndex].FindControl("ExpectedStudenttxt") as TextBox);
                    // TextBox Status = (Batchgrv.Rows[e.RowIndex].FindControl("Statustxt") as TextBox);
                    DropDownList Status = (DropDownList)Batchgrv.Rows[e.RowIndex].FindControl("EditStatus");
                    int BatchId = Convert.ToInt32(Batchgrv.DataKeys[e.RowIndex].Value);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE enosis.BatchesInfo SET BatchType='" + BatchType.SelectedValue + "',BatchMode='" + BatchMode.SelectedValue + "',BatchSubject='" + Course.Text + "',StartDate='" + Startdate.Text + "',EndDate='" + Enddate.Text + "',StartTime='" + StartTime.Text + "',EndTime='" + EndTime.Text + "',FaclutyName='" + Faculty.Text + "',ExpectedStudent='" + StudentName.Text + "',Status='" + Status.SelectedValue + "',UpdatedDate='" + DateTime.Now + "',UpdatedBy='" + DateTime.Now + "' WHERE BatchId = " + BatchId, con);
                    cmd.ExecuteNonQuery();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Batch Updated.')</script>");
                    Batchgrv.EditIndex = -1;
                //BindAllBatchGidView("All");
                 AllBatch();
            }
            catch (Exception ex)
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Failed.')</script>");
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
                //BindAllBatchGidView("All");
                AllBatch();
            }
        }
        // Update Batch Details//
       
        // Delete Batch Details//
        protected void Batchgrv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int BatchId = Convert.ToInt32(Batchgrv.DataKeys[e.RowIndex].Value);
                con.Open();
                
                    SqlCommand cmd1 = new SqlCommand("DELETE enosis.BatchSheetDetails WHERE BatchId=" + BatchId, con);
                // SqlCommand cmd = new SqlCommand("DELETE BatchesInfo WHERE BatchId=" + BatchId, con);
                SqlCommand cmd2 = new SqlCommand("DELETE enosis.BatchesInfo WHERE BatchId=" + BatchId, con);
                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Batch Deleted.')</script>");
                con.Close();
                //BindAllBatchGidView("All");
                AllBatch();
            }
            catch (Exception ex)
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Failed.')</script>");
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        // Delete Batch Details//   
        //Filter GridView By CourseName//
        protected void BindGridViewWithButtonFilter(string[] selectedCourses, string batchType)
        {
            try
            {
                DataTable dt = new DataTable();
                string courseList = string.Join(",", selectedCourses.Select(name => "'" + name.Replace("'", "''") + "'"));
                string query = $"SELECT BatchesInfo.*, LatestChapter.ChapterNumber AS ChapterNumber " +
                               $"FROM BatchesInfo " +
                               $"LEFT JOIN (SELECT BatchID, MAX(ChapterNumber) AS ChapterNumber FROM BatchSheetDetails GROUP BY BatchID) AS LatestChapter " +
                               $"ON BatchesInfo.BatchID = LatestChapter.BatchID " +
                               $"WHERE BatchSubject IN ({courseList})";

                // Add batch type condition if a specific type is selected
                if (!string.IsNullOrEmpty(batchType) && batchType != "All")
                {
                    query += $" AND BatchType = '{batchType.Replace("'", "''")}'";
                }

                // Execute the query and fill the DataTable
                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                dataAdapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                    Batchgrv.Rows[0].Cells.Clear();
                    Batchgrv.Rows[0].Cells.Add(new TableCell());
                    Batchgrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    Batchgrv.Rows[0].Cells[0].Text = "No Batches Found";
                    Batchgrv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    Batchgrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    Batchgrv.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }

        //Filter GridView By CourseName//
        //Bind ASP Batch GidView with filter//
        void ASPBatch()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT \r\n    bi.*, \r\n    lc.ChapterNumber AS ChapterNumber, \r\n    cd.COURSEID \r\nFROM \r\n    enosis.BatchesInfo AS bi \r\nLEFT JOIN \r\n    (SELECT \r\n         BatchID, \r\n         MAX(ChapterNumber) AS ChapterNumber \r\n     FROM \r\n         enosis.BatchSheetDetails \r\n     GROUP BY \r\n         BatchID) AS lc \r\nON \r\n    bi.BatchID = lc.BatchID \r\nLEFT JOIN \r\n    COURSES_DETAIL AS cd \r\nON \r\n    bi.BatchSubject = cd.COURSENAME \r\nWHERE \r\n    bi.BatchSubject IN ('ASP.NET', 'FULLSTACK.NET', 'MVC', 'CSHARP.NET','CSHARP.NET,ASP.NET,SQLSERVER', '.NET CORE','ASP.NET MVC')";
                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                dataAdapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                    Batchgrv.Rows[0].Cells.Clear();
                    Batchgrv.Rows[0].Cells.Add(new TableCell());
                    Batchgrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    Batchgrv.Rows[0].Cells[0].Text = "No Batches Found";
                    Batchgrv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    Batchgrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    Batchgrv.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }

        //Bind JAVA Batch GidView with filter//
        void JAVABatch()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT \r\n    bi.*, \r\n    lc.ChapterNumber AS ChapterNumber, \r\n    cd.COURSEID \r\nFROM \r\n    enosis.BatchesInfo AS bi \r\nLEFT JOIN \r\n    (SELECT \r\n         BatchID, \r\n         MAX(ChapterNumber) AS ChapterNumber \r\n     FROM \r\n         enosis.BatchSheetDetails \r\n     GROUP BY \r\n         BatchID) AS lc \r\nON \r\n    bi.BatchID = lc.BatchID \r\nLEFT JOIN \r\n    COURSES_DETAIL AS cd \r\nON \r\n    bi.BatchSubject = cd.COURSENAME \r\nWHERE \r\n    bi.BatchSubject IN ('JAVA', 'ADVANCE-JAVA', 'FULL STACK JAVA')";
                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                dataAdapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                    Batchgrv.Rows[0].Cells.Clear();
                    Batchgrv.Rows[0].Cells.Add(new TableCell());
                    Batchgrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    Batchgrv.Rows[0].Cells[0].Text = "No Batches Found";
                    Batchgrv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    Batchgrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    Batchgrv.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }

        //Bind Data Analytics Batch GidView with filter//
        void DATABatch()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT \r\n    bi.*, \r\n    lc.ChapterNumber AS ChapterNumber, \r\n    cd.COURSEID \r\nFROM \r\n    enosis.BatchesInfo AS bi \r\nLEFT JOIN \r\n    (SELECT \r\n         BatchID, \r\n         MAX(ChapterNumber) AS ChapterNumber \r\n     FROM \r\n         enosis.BatchSheetDetails \r\n     GROUP BY \r\n         BatchID) AS lc \r\nON \r\n    bi.BatchID = lc.BatchID \r\nLEFT JOIN \r\n    COURSES_DETAIL AS cd \r\nON \r\n    bi.BatchSubject = cd.COURSENAME \r\nWHERE \r\n    bi.BatchSubject IN ('DATA ANALYTICS', 'SQL SERVER DBA 2012', 'SQL PROG & DBA', 'SQL SERVER', 'POWER-BI') \r\n    AND bi.Status != 'Complete'";
                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                dataAdapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                    Batchgrv.Rows[0].Cells.Clear();
                    Batchgrv.Rows[0].Cells.Add(new TableCell());
                    Batchgrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    Batchgrv.Rows[0].Cells[0].Text = "No Batches Found";
                    Batchgrv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    Batchgrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    Batchgrv.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //ASP Filter Button//
        protected void asp_Click(object sender, EventArgs e)
        {
            //string[] selectedCourses = { "ASP.NET", "FULLSTACK.NET", "ASP.NET MVC", "CSHARP.NET,ASP.NET,SQLSERVER", ".NET CORE" };
            //string selectedBatchType = BatchTypeDrp.SelectedValue;
            //BindGridViewWithButtonFilter(selectedCourses, selectedBatchType);
            ASPBatch();
            asp.CssClass = "btn highlight";
            java.CssClass = "btn";
            dataanalytics.CssClass = "btn";
        }
        //ASP Filter Button//
        //Java Filter Button//
        protected void java_Click(object sender, EventArgs e)
        {
            //string[] selectedCourses = { "JAVA", "ADVANCE-JAVA", "FULL STACK JAVA" };
            //string selectedBatchType = BatchTypeDrp.SelectedValue;
            //BindGridViewWithButtonFilter(selectedCourses, selectedBatchType);
            JAVABatch();
            asp.CssClass = "btn";
            java.CssClass = "btn highlight";
            dataanalytics.CssClass = "btn";
        }
        //Java Filter Button//
        //Data Analytics Filter Button//
        protected void dataanalytics_Click(object sender, EventArgs e)
        {
            //string[] selectedCourses = { "DATA ANALYTICS", "SQL SERVER DBA 2012", "SQL PROG & DBA", "SQL SERVER", "POWER-BI" };
            //string selectedBatchType = BatchTypeDrp.SelectedValue;
            //BindGridViewWithButtonFilter(selectedCourses, selectedBatchType);
            DATABatch();
            asp.CssClass = "btn";
            java.CssClass = "btn";
            dataanalytics.CssClass = "btn highlight";
        }
        //Data Analytics Filter Button//
        //DropDown Validations//
        protected void BatchTypeValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DropDownList BatchTypeDrp = (DropDownList)Batchgrv.FooterRow.FindControl("FooterBatchTypeDrp");
            args.IsValid = BatchTypeDrp.SelectedIndex != 0;
        }

        protected void BatchModeValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DropDownList FooterBatchMode = (DropDownList)Batchgrv.FooterRow.FindControl("FooterBatchMode");
            args.IsValid = FooterBatchMode.SelectedIndex != 0;
        }

        protected void CourseValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DropDownList FooterCourseDrp = (DropDownList)Batchgrv.FooterRow.FindControl("FooterCourseDrp");
            args.IsValid = FooterCourseDrp.SelectedIndex != 0;
        }

        protected void FacultyDrpValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DropDownList drpFaculty = (DropDownList)Batchgrv.FooterRow.FindControl("drpFaculty");
            args.IsValid = drpFaculty.SelectedIndex != 0;
        }

        protected void Statusvalidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                DropDownList Status = (DropDownList)Batchgrv.FooterRow.FindControl("FooterStatus");
                args.IsValid = Status.SelectedIndex != 0;
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        public int GetChapterCount()
        {
            return 0;
        }
        //DropDown Validations//
        //Method For Get Progress Bar//
        protected string GetProgressBar(object chapterNumberObj)
        {
            if (chapterNumberObj != DBNull.Value)
            {
                int chapterNumber = Convert.ToInt32(chapterNumberObj);
                int totalChapters = 10; // Total number of chapters

                // Calculate progress percentage
                double progress = (double)chapterNumber / totalChapters * 100;

                // Determine color based on progress
                string colorClass = "";
                string textColor = "";
                if (progress < 30)
                {
                    colorClass = "progress-bar bg-danger";
                    textColor = "color: black;";
                }
                else if (progress < 60)
                {
                    colorClass = "progress-bar bg-warning";
                    textColor = "color: black;";
                }
                else
                {
                    colorClass = "progress-bar bg-success";
                    textColor = "color: black;";
                }

                // Render progress bar HTML with percentage and color
                return $"<div class='progress'>" +
                    $"<div class='{colorClass}' role='progressbar' style='width: {progress}%;' aria-valuenow='{progress}' aria-valuemin='0' aria-valuemax='100'>" +
                        $"<span style='{textColor} font-size: 12px;'>{progress:F0}%</span>" +
                    $"</div>" +
                $"</div>";
            }
            else
            {
                // Handle DBNull value, for example:
                return "N/A";
            }
        }

        //Method For Get Progress Bar//
        //Value change for Pending for Planned and Running and Complete for Current Batch Dropdown//
        protected void FooterBatchTypeDrp_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownList batchTypeDropDown = (DropDownList)sender;
                GridViewRow row = (GridViewRow)batchTypeDropDown.NamingContainer;
                DropDownList statusDropDown = (DropDownList)row.FindControl("FooterStatus");
                if (batchTypeDropDown.SelectedIndex == 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Please Select Status.')</script>");
                }
                else if (batchTypeDropDown.SelectedIndex == 1)
                {
                    statusDropDown.SelectedValue = "Pending";
                }
                else
                {
                    statusDropDown.SelectedValue = "Running";
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Value change for Pending for Planned and Running and Complete for Current Batch Dropdown//
        // Update the database status to "Complete" by Changing Dropdownlist value from Running//
        protected void EditStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                // Handle the SelectedIndexChanged event of the DropDownList within the EditItemTemplate
                DropDownList ddlEditStatus = (DropDownList)sender;
                GridViewRow row = (GridViewRow)ddlEditStatus.NamingContainer;
                DropDownList BatchType = (DropDownList)row.FindControl("EditBatchTypeDrp");
                if (ddlEditStatus.SelectedValue == "Complete")
                {
                    int BatchId = Convert.ToInt32(Batchgrv.DataKeys[row.RowIndex].Value);
                    string Status = "Complete";
                    UpdateDatabaseStatusToComplete(BatchId, Status);
                    Batchgrv.EditIndex = -1;
                    // Add the row index to the Session
                    AddHiddenRowIndex(row.RowIndex);
                    // BindAllBatchGidView("All");
                    AllBatch();
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        // Update the database status to "Complete" by Changing Dropdownlist value from Running//
        //Update Database Record From Running to Complete//
        private void UpdateDatabaseStatusToComplete(int BatchId , String Status)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE enosis.BatchesInfo SET Status='" + Status.ToString() + "' WHERE BatchId = " + BatchId, con);
                cmd.ExecuteNonQuery();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Batch Marked As Complete.')</script>");
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Update Database Record From Running to Complete//
        //Bind GridView after Hide Row//
        protected void Batchgrv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow && Batchgrv.EditIndex == e.Row.RowIndex)
                {
                    if (e.Row.RowState == DataControlRowState.Edit)
                    {
                        DropDownList ddlEditStatus = (DropDownList)e.Row.FindControl("EditStatus");
                        ddlEditStatus.SelectedIndexChanged += EditStatus_SelectedIndexChanged;
                    }
                }
                // Check if the row should be hidden
                if (IsRowHidden(e.Row.RowIndex))
                {
                    e.Row.Visible = false;
                }          
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Bind GridView after Hide Row//
        //Method For Row Hide//
        private void AddHiddenRowIndex(int index)
        {
            try
            {
                List<int> hiddenRowIndices;
                if (Session["HiddenRowIndices"] == null)
                {
                    hiddenRowIndices = new List<int>();
                }
                else
                {
                    hiddenRowIndices = (List<int>)Session["HiddenRowIndices"];
                }

                if (!hiddenRowIndices.Contains(index))
                {
                    hiddenRowIndices.Add(index);
                }

                Session["HiddenRowIndices"] = hiddenRowIndices;
                //BindAllBatchGidView("All");
                AllBatch();
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        private bool IsRowHidden(int index)
        {
                List<int> hiddenRowIndices = Session["HiddenRowIndices"] as List<int>;
                return hiddenRowIndices != null && hiddenRowIndices.Contains(index);
        }
        //Method For Row Hide//
        //Value change for Pending for Planned and Running and Complete for Current Batch Dropdown in Edit Mode//
        protected void EditBatchTypeDrp_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownList batchTypeDropDown = (DropDownList)sender;
                GridViewRow row = (GridViewRow)batchTypeDropDown.NamingContainer;
                DropDownList statusDropDown = (DropDownList)row.FindControl("EditStatus");
                if (batchTypeDropDown.SelectedIndex == 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Please Select Batch Type.')</script>");
                }
                else if (batchTypeDropDown.SelectedIndex == 1)
                {
                    statusDropDown.SelectedValue = "Pending";
                }
                else
                {
                    statusDropDown.SelectedValue = "Running";
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Value change for Pending for Planned and Running and Complete for Current Batch Dropdown in Edit Mode//
        //Validation For Current or Pending Batch Mark As Complete//
        protected void FooterStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownList batchTypeDropDown = (DropDownList)sender;
                GridViewRow row = (GridViewRow)batchTypeDropDown.NamingContainer;
                DropDownList statusDropDown = (DropDownList)row.FindControl("FooterStatus");
                if (batchTypeDropDown.SelectedIndex == 3)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('You Cannot Select Current or Pending Batch Mark As Complete On  Batch Creation.!')</script>");
                    batchTypeDropDown.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Validation For Current or Pending Batch Mark As Complete//
        protected void Batchgrv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (Batchgrv.PageIndex == 0 && e.NewPageIndex < 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                e.Cancel = true;
            }
            else
            {
                Batchgrv.PageIndex = e.NewPageIndex;
                //BindAllBatchGidView("All");
                AllBatch();
            }
        }

        private int GetChapterCountByCourse(int courseId)
        {
            int count = 0;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                string query = "SELECT COUNT(*) FROM enosis.COURSE_CHAPTER_DETAIL WHERE Course_Id = @CourseID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CourseID", courseId);
                con.Open();
                count = (int)cmd.ExecuteScalar();
            }
            return count;
        }

        protected void FooterCourseDrp_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlCourse = (DropDownList)sender;
            int selectedCourseID = Convert.ToInt32(ddlCourse.SelectedValue);

            if (selectedCourseID > 0)
            {
                int id = GetChapterCountByCourse(selectedCourseID);
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{id}');", true);
            }
            else
            {
                // If count is zero, show alert message
                string message = "Chapters Count: 0";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}');", true);
            }
        }
        void BatchesByFaculty()
        {
            string FacultyName = FacultyDrp.SelectedValue.ToString();
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT bi.*, cd.COURSEID FROM enosis.BatchesInfo AS bi LEFT JOIN (SELECT BatchID, MAX(ChapterNumber) AS ChapterNumber FROM enosis.BatchSheetDetails GROUP BY BatchID) AS lc ON bi.BatchID = lc.BatchID LEFT JOIN COURSES_DETAIL AS cd ON bi.BatchSubject = cd.COURSENAME LEFT JOIN (SELECT BatchID FROM enosis.BatchSheetDetails GROUP BY BatchID) AS tc ON bi.BatchID = tc.BatchID WHERE bi.Status != 'Complete' AND bi.FaclutyName = @FacultyName";
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString()))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@FacultyName", FacultyName);
                        using (SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd))
                        {
                            dataAdapter.Fill(dt);
                        }
                    }
                }

                if (dt.Rows.Count > 0)
                {
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    Batchgrv.DataSource = dt;
                    Batchgrv.DataBind();
                    Batchgrv.Rows[0].Cells.Clear();
                    Batchgrv.Rows[0].Cells.Add(new TableCell());
                    Batchgrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    Batchgrv.Rows[0].Cells[0].Text = "No Records Found";
                    Batchgrv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    Batchgrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    Batchgrv.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }


        void CompleteBatches()
        {
            string FacultyName = FacultyDrp.SelectedValue.ToString();
            try
            {
                DataTable dt = new DataTable();
                string query = "select * from enosis.BatchesInfo where Status='Complete'";
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString()))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@FacultyName", FacultyName);
                        using (SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd))
                        {
                            dataAdapter.Fill(dt);
                        }
                    }
                }

                if (dt.Rows.Count > 0)
                {
                    CompleteBatchGrv.DataSource = dt;
                    CompleteBatchGrv.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    CompleteBatchGrv.DataSource = dt;
                    CompleteBatchGrv.DataBind();
                    CompleteBatchGrv.Rows[0].Cells.Clear();
                    CompleteBatchGrv.Rows[0].Cells.Add(new TableCell());
                    CompleteBatchGrv.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    CompleteBatchGrv.Rows[0].Cells[0].Text = "No Records Found";
                    CompleteBatchGrv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    CompleteBatchGrv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    CompleteBatchGrv.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void FacultyDrp_SelectedIndexChanged(object sender, EventArgs e)
        {
            BatchesByFaculty();
        }

        protected void CompleteBatchGrv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int BatchId = Convert.ToInt32(CompleteBatchGrv.DataKeys[e.RowIndex].Value);
                con.Open();

                SqlCommand cmd1 = new SqlCommand("DELETE enosis.BatchSheetDetails WHERE BatchId=" + BatchId, con);
                // SqlCommand cmd = new SqlCommand("DELETE BatchesInfo WHERE BatchId=" + BatchId, con);
                SqlCommand cmd2 = new SqlCommand("DELETE enosis.BatchesInfo WHERE BatchId=" + BatchId, con);
                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Batch Deleted.')</script>");
                con.Close();
                //BindAllBatchGidView("All");
                AllBatch();
            }
            catch (Exception ex)
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Failed.')</script>");
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void CompleteBatchGrv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (CompleteBatchGrv.PageIndex == 0 && e.NewPageIndex < 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                e.Cancel = true;
            }
            else
            {
                CompleteBatchGrv.PageIndex = e.NewPageIndex;
                CompleteBatches();
                hfModalState.Value = "open";
                UpdatePanel1.Update();
            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (CompleteBatchGrv.PageIndex > 0) // Or any condition to check if modal was open
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "OpenModal", "$('#myModal').modal('show');", true);
            }
        }

    }
}