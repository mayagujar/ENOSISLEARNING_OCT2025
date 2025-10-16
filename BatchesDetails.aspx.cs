using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ENOSISLEARNING.StudentView;

namespace ENOSISLEARNING
{
    //16/08/2025   BatchesDetails
    public partial class BatchesDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AllBatch();
                BindFacultyDrpFilter();
                BindCourseDrp();
            }
        }
        //Bind All Batch GidView with filter//
        void AllBatch()
        {
            try
            {
                int facultyId = Convert.ToInt32(Session["FACULTYID"]);
                DataTable dt = new DataTable();
                string query = "select * from enosis.BatchesInfo where Status != 'Complete'";
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
                string query = "SELECT * FROM Enosis.BatchesInfo WHERE BatchType IN ('Current') AND Status != 'Complete'";
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
        //Bind Current Batch GidView with filter//
        //Bind Plannes Batch GidView with filter//
        void PlannedBatch()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT * FROM Enosis.BatchesInfo WHERE BatchType IN ('Planned') AND Status != 'Complete'";
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
        // Batch Type Dropdown SelectedIndecChange//
        protected void BatchTypeDrp_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string selectedValue = BatchTypeDrp.SelectedValue;
                //BindAllBatchGidView(selectedValue);
                if (selectedValue == "All")
                {
                    AllBatch();
                }
                if (selectedValue == "Current")
                {
                    CurrentBatch();
                }
                if (selectedValue == "Planned")
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
        // Batch Type Dropdown SelectedIndecChange//
        // Batch Type by Faculty//
        void BatchesByFaculty(string FacultyName)
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "select * from Enosis.BatchesInfo where USERID = @FacultyName AND Status != 'Complete'";
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
        // Batch Type by Faculty//
        // Bind FacultyDrp_SelectedIndexChanged Dropdown//
        protected void FacultyDrp_SelectedIndexChanged(object sender, EventArgs e)
        {
            string FacultyName = FacultyDrp.SelectedValue; // Get USERID
            BatchesByFaculty(FacultyName);
        }
        // Bind FacultyDrp_SelectedIndexChanged Dropdown//
        //Bind ASP Batch GidView with filter//
        void ASPBatch()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT * FROM Enosis.BatchesInfo WHERE BatchSubject IN ('ASP.NET', 'FULLSTACK.NET', 'MVC', 'CSHARP.NET', 'CSHARP.NET,ASP.NET,SQLSERVER', '.NET CORE', 'ASP.NET MVC') AND Status != 'Complete'";
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
            ASPBatch();
            asp.CssClass = "btn highlight";
            java.CssClass = "btn";
            dataanalytics.CssClass = "btn";
        }
        //ASP Filter Button//
        //Bind JAVA Batch GidView with filter//
        void JAVABatch()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT * FROM Enosis.BatchesInfo WHERE BatchSubject IN ('JAVA', 'ADVANCE-JAVA', 'FULL STACK JAVA') AND Status != 'Complete'";
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
        //Java Filter Button//
        protected void java_Click(object sender, EventArgs e)
        {
            JAVABatch();
            asp.CssClass = "btn";
            java.CssClass = "btn highlight";
            dataanalytics.CssClass = "btn";
        }
        //Java Filter Button//
        //Bind Data Analytics Batch GidView with filter//
        void DATABatch()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT * FROM Enosis.BatchesInfo WHERE BatchSubject IN ('DATA ANALYTICS', 'SQL SERVER DBA 2012', 'SQL PROG & DBA', 'SQL SERVER', 'POWER-BI') AND Status != 'Complete'";
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

        //Data Analytics Filter Button//
        protected void dataanalytics_Click(object sender, EventArgs e)
        {
            DATABatch();
            asp.CssClass = "btn";
            java.CssClass = "btn";
            dataanalytics.CssClass = "btn highlight";
        }
        //Data Analytics Filter Button//
        // Bind Faculty Dropdown//
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
                FacultyDrp.DataValueField = "USERID";
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
                CourseDrp.DataValueField = "COURSEID";
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
                drpFaculty.DataValueField = "USERID";
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
        // Bind Student Checboxlist// 
        void BindStudentCheckBoxList(string CourseId , int FacultyId)
        {
            try
            {
                CheckBoxList StudentCheckBoxList = Batchgrv.FooterRow.FindControl("StudentCheckBoxList") as CheckBoxList;
                string query = @"
                       SELECT C.CANDIDATE_CODE, C.FULLNAME, C.CREATEDDATE, 'Approved' AS Status
                        FROM Candidates C
                        INNER JOIN FacultyCourseApproval FCA 
                            ON C.CANDIDATE_CODE = FCA.CandidateID 
                            AND FCA.CourseID = @CourseId 
                            AND FCA.FacultyID = @FacultyId 
                            AND FCA.ApprovalStatus = 1 

                        UNION 

                        SELECT C.CANDIDATE_CODE, C.FULLNAME, C.CREATEDDATE, 'New' AS Status
                        FROM Candidates C
                        WHERE C.CourseID = @CourseId 
                        AND NOT EXISTS ( 
                            SELECT 1 FROM CandidateBatchMapping CBM 
                            WHERE CBM.CANDIDATE_CODE = C.CANDIDATE_CODE
                            AND CBM.CourseID = @CourseId
                        )
                        ORDER BY CREATEDDATE DESC";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CourseId", CourseId);
                    cmd.Parameters.AddWithValue("@FacultyId", FacultyId);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable data = new DataTable();
                        sda.Fill(data);
                        StudentCheckBoxList.DataSource = data;
                        StudentCheckBoxList.DataTextField = "FULLNAME";
                        StudentCheckBoxList.DataValueField = "CANDIDATE_CODE";
                        StudentCheckBoxList.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        // Bind Student Checboxlist// 
        //[System.Web.Services.WebMethod]
        //public static List<string> GetStudentsList(string prefixText, int count)
        //{
        //    List<string> students = new List<string>();
        //    string query = @"SELECT DISTINCT CANDIDATE_CODE, FULLNAME 
        //             FROM Candidates 
        //             WHERE FULLNAME LIKE @SearchText + '%' 
        //             ORDER BY CREATEDDATE DESC";

        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand(query, con))
        //        {
        //            cmd.Parameters.AddWithValue("@SearchText", prefixText);
        //            con.Open();
        //            using (SqlDataReader dr = cmd.ExecuteReader())
        //            {
        //                while (dr.Read())
        //                {
        //                    students.Add(dr["FULLNAME"].ToString() + "|" + dr["CANDIDATE_CODE"].ToString());
        //                }
        //            }
        //        }
        //    }
        //    return students;
        //}

        //[System.Web.Services.WebMethod]
        //public static List<Candidate> GetCandidates(string keyword)
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
        //    {
        //        SqlCommand cmd = new SqlCommand("SELECT CandidateID, FullName FROM Candidate WHERE FullName LIKE @kw + '%'", con);
        //        cmd.Parameters.AddWithValue("@kw", keyword);
        //        con.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        List<Candidate> list = new List<Candidate>();
        //        while (reader.Read())
        //        {
        //            list.Add(new Candidate
        //            {
        //                ID = reader["CandidateID"].ToString(),
        //                Name = reader["FullName"].ToString()
        //            });
        //        }
        //        return list;
        //    }
        //}

        //[System.Web.Services.WebMethod]
        //public static List<Candidate> GetCandidates(string keyword)
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
        //    {
        //        SqlCommand cmd = new SqlCommand("SELECT CANDIDATE_CODE, FULLNAME FROM CANDIDATES WHERE FULLNAME LIKE @kw + '%'ORDER BY CANDIDATE_CODE DESC", con);
        //        cmd.Parameters.AddWithValue("@kw", keyword);
        //        con.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        List<Candidate> list = new List<Candidate>();
        //        while (reader.Read())
        //        {
        //            list.Add(new Candidate
        //            {
        //                ID = reader["CANDIDATE_CODE"].ToString(),
        //                Name = reader["FULLNAME"].ToString()
        //            });
        //        }
        //        return list;
        //    }
        //}

        //// Class to map result
        //public class Candidate
        //{
        //    public string ID { get; set; }
        //    public string Name { get; set; }
        //}

        [WebMethod]
        public static List<Candidate> GetCandidates(string keyword)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT CANDIDATE_CODE, FULLNAME FROM CANDIDATES WHERE FULLNAME LIKE @kw + '%'ORDER BY CANDIDATE_CODE DESC", con);
                cmd.Parameters.AddWithValue("@kw", keyword);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                List<Candidate> candidates = new List<Candidate>();
                while (reader.Read())
                {
                    candidates.Add(new Candidate
                    {
                        ID = reader["CANDIDATE_CODE"].ToString(),
                        Name = reader["FULLNAME"].ToString()
                    });
                }

                return candidates;
            }
        }

        public class Candidate
        {
            public string ID { get; set; }
            public string Name { get; set; }
        }



        // Bind Student DropDownList// 
        protected void Batchgrv_DataBound(object sender, EventArgs e)
        {
            BindFacultyDrp();
            BindCourseDrp();
        }
        // Bind Course Faculty DropDownList//
        // FooterCourseDrp_SelectedIndexChanged//
        protected void FooterCourseDrp_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckBoxList StudentCheckBoxList = Batchgrv.FooterRow.FindControl("StudentCheckBoxList") as CheckBoxList;
            DropDownList FooterCourseDrp = Batchgrv.FooterRow.FindControl("FooterCourseDrp") as DropDownList;
            string CourseId = FooterCourseDrp.SelectedValue; // Get CourseID
            int facultyId = Convert.ToInt32(Session["FACULTYID"]);
            BindStudentCheckBoxList(CourseId, facultyId);
            //StudentCheckBoxList.Visible = true;

        }
        // FooterCourseDrp_SelectedIndexChanged//
        // Batch Gridview Row Command//
        protected void Batchgrv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Add"))
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);

                    // Dropdown and textbox controls
                    DropDownList BatchTypeDrp = (DropDownList)Batchgrv.FooterRow.FindControl("FooterBatchTypeDrp");
                    DropDownList BatchMode = (DropDownList)Batchgrv.FooterRow.FindControl("FooterBatchMode");
                    TextBox Startdatet = (TextBox)Batchgrv.FooterRow.FindControl("FooterStartdatettxt");
                    TextBox Enddate = (TextBox)Batchgrv.FooterRow.FindControl("FooterEnddatettxt");
                    TextBox StartTime = (TextBox)Batchgrv.FooterRow.FindControl("FooterStartTimetxt");
                    TextBox EndTime = (TextBox)Batchgrv.FooterRow.FindControl("FooterEndTimetxt");

                    DateTime SD = Convert.ToDateTime(Startdatet.Text);
                    DateTime ED = Convert.ToDateTime(Enddate.Text);
                    DateTime ST = Convert.ToDateTime(StartTime.Text);
                    DateTime ET = Convert.ToDateTime(EndTime.Text);

                    // Hidden fields and student textbox
                    HiddenField hfSelectedStudentIDs = (HiddenField)Batchgrv.FooterRow.FindControl("SelectedStudentIDs");
                    HiddenField hfSelectedStudentNames = (HiddenField)Batchgrv.FooterRow.FindControl("SelectedStudentNames");

                    string studentIDs = hfSelectedStudentIDs.Value.Trim(); // "9851,9866"
                    string studentNames = hfSelectedStudentNames.Value.Trim(); // "Aarti Suresh Bhapkar, Renuka Mali"

                    List<string> selectedStudentsIdList = studentIDs.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries).ToList();

                    // Faculty, course, and user
                    DropDownList Status = (DropDownList)Batchgrv.FooterRow.FindControl("FooterStatus");
                    DropDownList drpFaculty = (DropDownList)Batchgrv.FooterRow.FindControl("drpFaculty");
                    string UserID = drpFaculty.SelectedValue;
                    string UserName = drpFaculty.SelectedItem.Text;

                    DropDownList FooterCourseDrp = (DropDownList)Batchgrv.FooterRow.FindControl("FooterCourseDrp");
                    string CourseID = FooterCourseDrp.SelectedValue;
                    string CourseName = FooterCourseDrp.SelectedItem.Text;

                    string CurrentUser = Session["USERNAME"].ToString();

                    // Insert into BatchesInfo
                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"INSERT INTO Enosis.BatchesInfo 
            (BatchType, BatchMode, BatchSubject, StartDate, EndDate, StartTime, EndTime, FaclutyName, 
             ExpectedStudent, Status, CreatetedBy, USERID, COURSEID) 
            VALUES 
            (@BatchType, @BatchMode, @BatchSubject, @StartDate, @EndDate, @StartTime, @EndTime, @FacultyName, 
             @ExpectedStudent, @Status, @CreatetedBy, @USERID, @COURSEID); 
            SELECT SCOPE_IDENTITY();", con);

                    cmd.Parameters.AddWithValue("@BatchType", BatchTypeDrp.SelectedValue);
                    cmd.Parameters.AddWithValue("@BatchMode", BatchMode.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@BatchSubject", CourseName);
                    cmd.Parameters.AddWithValue("@StartDate", SD);
                    cmd.Parameters.AddWithValue("@EndDate", ED);
                    cmd.Parameters.AddWithValue("@StartTime", ST);
                    cmd.Parameters.AddWithValue("@EndTime", ET);
                    cmd.Parameters.AddWithValue("@FacultyName", UserName);
                    cmd.Parameters.AddWithValue("@ExpectedStudent", studentNames); // ✅ Names only
                    cmd.Parameters.AddWithValue("@Status", Status.SelectedValue);
                    cmd.Parameters.AddWithValue("@CreatetedBy", CurrentUser);
                    cmd.Parameters.AddWithValue("@USERID", UserID);
                    cmd.Parameters.AddWithValue("@COURSEID", CourseID);

                    int batchId = Convert.ToInt32(cmd.ExecuteScalar());
                    // Trim and split student IDs
                    //string[] ids = studentIDs.Trim(',').Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries).Distinct().ToArray();

                    foreach (string studentId in selectedStudentsIdList)
                    {
                        if (!string.IsNullOrWhiteSpace(studentId))
                        {
                            SqlCommand cmdStudent = new SqlCommand("INSERT INTO CandidateBatchMapping (CANDIDATE_CODE, COURSEID, BATCHID) VALUES (@CandidateID, @COURSEID, @BatchID)", con);
                            cmdStudent.Parameters.AddWithValue("@CandidateID", studentId.Trim());
                            cmdStudent.Parameters.AddWithValue("@COURSEID", CourseID);
                            cmdStudent.Parameters.AddWithValue("@BatchID", batchId);

                            try
                            {
                                cmdStudent.ExecuteNonQuery();
                            }
                            catch (Exception innerEx)
                            {
                                // Log or display error (e.g. duplicate key)
                                Errorlbl.Text += $"Failed to insert studentId {studentId}: {innerEx.Message}<br/>";
                            }
                        }
                    }
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
            // Add Batch Row Command//
            // View Batch Details Row Command//
            if (e.CommandName == "ViewDetails")
            {
                try
                {

                    GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                    int facultyId = Convert.ToInt32(Session["FACULTYID"]);
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
            // View Batch Details Row Command//
        }
        // Batch Gridview Row Command//
        // Batch Gridview Row Editing Command//
        protected void Batchgrv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                Batchgrv.EditIndex = e.NewEditIndex;
                AllBatch();

            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        // Batch Gridview Row Editing Command//
        // Batch Gridview Row Cancel Editing Command//
        protected void Batchgrv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                Batchgrv.EditIndex = -1;
                if (BatchTypeDrp.SelectedIndex == 0 || BatchTypeDrp.SelectedValue == "All")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Updation Cancelled.')</script>");
                    AllBatch();
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Updation Cancelled.')</script>");
                    AllBatch();
                }

            }
            catch (Exception ex)
            {
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        // Batch Gridview Row Cancel Editing Command//
        // Batch Gridview Row Update Command//
        protected void Batchgrv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                DropDownList BatchType = (DropDownList)Batchgrv.Rows[e.RowIndex].FindControl("EditBatchTypeDrp");
                DropDownList BatchMode = (DropDownList)Batchgrv.Rows[e.RowIndex].FindControl("EditBatchMode");
                TextBox Course = (Batchgrv.Rows[e.RowIndex].FindControl("CourseNametxt") as TextBox);
                TextBox Startdate = (Batchgrv.Rows[e.RowIndex].FindControl("StartDatetxt") as TextBox);
                TextBox Enddate = (Batchgrv.Rows[e.RowIndex].FindControl("EndDatetxt") as TextBox);
                TextBox StartTime = (Batchgrv.Rows[e.RowIndex].FindControl("StartTimetxt") as TextBox);
                TextBox EndTime = (Batchgrv.Rows[e.RowIndex].FindControl("EndTimetxt") as TextBox);
                TextBox Faculty = (Batchgrv.Rows[e.RowIndex].FindControl("FaclutyNametxt") as TextBox);
                TextBox StudentName = (Batchgrv.Rows[e.RowIndex].FindControl("ExpectedStudenttxt") as TextBox);
                DropDownList Status = (DropDownList)Batchgrv.Rows[e.RowIndex].FindControl("EditStatus");
                int BatchId = Convert.ToInt32(Batchgrv.DataKeys[e.RowIndex].Value);
                string CurrentUser = Session["USERNAME"].ToString();
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE enosis.BatchesInfo SET BatchType='" + BatchType.SelectedValue + "',BatchMode='" + BatchMode.SelectedValue + "',BatchSubject='" + Course.Text + "',StartDate='" + Startdate.Text + "',EndDate='" + Enddate.Text + "',StartTime='" + StartTime.Text + "',EndTime='" + EndTime.Text + "',FaclutyName='" + Faculty.Text + "',ExpectedStudent='" + StudentName.Text + "',Status='" + Status.SelectedValue + "',UpdatedDate='" + DateTime.Now + "',UpdatedBy='" + CurrentUser + "' WHERE BatchId = " + BatchId, con);
                cmd.ExecuteNonQuery();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Batch Updated.')</script>");
                Batchgrv.EditIndex = -1;
                AllBatch();
            }
            catch (Exception ex)
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Failed.')</script>");
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
                AllBatch();
            }
        }
        // Batch Gridview Row Update Command//
        // Batch Gridview Row Delete Command//
        protected void Batchgrv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int BatchId = Convert.ToInt32(Batchgrv.DataKeys[e.RowIndex].Value);

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
                {
                    con.Open();
                    SqlTransaction transaction = con.BeginTransaction(); // Start transaction for safety

                    try
                    {
                        // Step 1: Delete dependent records first
                        SqlCommand cmd0 = new SqlCommand("DELETE FROM CandidateBatchMapping WHERE BATCHID = @BatchId", con, transaction);
                        cmd0.Parameters.AddWithValue("@BatchId", BatchId);
                        cmd0.ExecuteNonQuery();

                        // Step 2: Delete from BatchSheetDetails
                        SqlCommand cmd1 = new SqlCommand("DELETE FROM enosis.BatchSheetDetails WHERE BatchId = @BatchId", con, transaction);
                        cmd1.Parameters.AddWithValue("@BatchId", BatchId);
                        cmd1.ExecuteNonQuery();

                        // Step 3: Delete from BatchesInfo
                        SqlCommand cmd2 = new SqlCommand("DELETE FROM enosis.BatchesInfo WHERE BatchId = @BatchId", con, transaction);
                        cmd2.Parameters.AddWithValue("@BatchId", BatchId);
                        cmd2.ExecuteNonQuery();

                        // Commit transaction
                        transaction.Commit();

                        // Show success message
                        ScriptManager.RegisterStartupScript(this, GetType(), "Script", "alert('Batch Deleted Successfully.');", true);
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback(); // Rollback if any issue occurs
                        ScriptManager.RegisterStartupScript(this, GetType(), "Script", "alert('Failed to delete batch.');", true);
                        Errorlbl.Text = "Error: " + ex.Message;
                        Errorlbl.ForeColor = System.Drawing.Color.Red;
                    }
                }

                AllBatch(); // Refresh grid
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Script", "alert('An error occurred.');", true);
                Errorlbl.Text = ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }

        // Batch Gridview Pagination Command//
        // Batch Gridview FooterBatchTypeDrp_SelectedIndexChanged Command//
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
        // Batch Gridview FooterBatchTypeDrp_SelectedIndexChanged Command//
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
        private void UpdateDatabaseStatusToComplete(int BatchId, String Status)
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
        protected void Batchgrv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                if (Batchgrv.PageIndex == 0 && e.NewPageIndex < 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                    e.Cancel = true;
                }
                else
                {
                    Batchgrv.PageIndex = e.NewPageIndex;
                    AllBatch(); // Reload the data to reflect pagination changes
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Script", "alert('Error occurred during pagination.');", true);
                Errorlbl.Text = "Error: " + ex.Message;
                Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnUpdateStudents_Click(object sender, EventArgs e)
        {
            try
            {
                int batchId = Convert.ToInt32(EditBatchId.Value);
                string studentIDs = ModalSelectedStudentIDs.Value.Trim();
                string studentNames = ModalSelectedStudentNames.Value.Trim();

                con.Open();

                // Step 1: Fetch existing ExpectedStudent from BatchesInfo table
                SqlCommand fetchExistingCmd = new SqlCommand("SELECT ExpectedStudent FROM Enosis.BatchesInfo WHERE BatchId = @BatchId", con);
                fetchExistingCmd.Parameters.AddWithValue("@BatchId", batchId);
                string existingStudentNames = (string)fetchExistingCmd.ExecuteScalar(); // Existing student names

                // Step 2: Merge old and new students
                // Add a comma between existing and new student names if both are present
                string allStudentNames = string.IsNullOrEmpty(existingStudentNames)
                    ? studentNames
                    : existingStudentNames + "," + studentNames; // Combine old and new student names

                // Step 3: Update ExpectedStudent in BatchesInfo table
                SqlCommand updateCmd = new SqlCommand(@"UPDATE Enosis.BatchesInfo 
    SET ExpectedStudent = @StudentNames 
    WHERE BatchId = @BatchId", con);

                updateCmd.Parameters.AddWithValue("@StudentNames", allStudentNames);
                updateCmd.Parameters.AddWithValue("@BatchId", batchId);
                updateCmd.ExecuteNonQuery();

                // Step 4: Insert new mappings into CandidateBatchMapping
                string[] ids = studentIDs.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                foreach (string id in ids)
                {
                    SqlCommand insertCmd = new SqlCommand(@"INSERT INTO CandidateBatchMapping 
        (CANDIDATE_CODE, COURSEID, BATCHID) 
        VALUES (@CandidateID, 
                (SELECT COURSEID FROM Enosis.BatchesInfo WHERE BatchId = @BatchId), 
                @BatchId)", con);

                    insertCmd.Parameters.AddWithValue("@CandidateID", id);
                    insertCmd.Parameters.AddWithValue("@BatchId", batchId);
                    insertCmd.ExecuteNonQuery();
                }

                con.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Students updated successfully');", true);
                AllBatch();
            }
            catch (Exception ex)
            {
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }
        void CompleteBatch()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT * FROM Enosis.BatchesInfo WHERE Status = 'Complete'";
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
        protected void AllBatchGrid_Click(object sender, EventArgs e)
        {
            CompleteBatch();
        }
    }
}