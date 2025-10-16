using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class Candidate : System.Web.UI.Page
    {
        string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
        SqlConnection sconn = null;

        private string uname = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["USERNAME"] != null)
                {
                    uname = Convert.ToString(Session["USERNAME"]);
                }
                else if (Request.QueryString["ID"] != null)
                {
                    Session["CANDID"] = Request.QueryString["ID"].ToString();
                    if (Request.QueryString["CNAME"] != null)
                    {
                        Session["CANDNAME"] = Request.QueryString["CNAME"].ToString();

                    }
                }
                else 
                {
                    Response.Redirect("~/Login.aspx");
                }
                sconn = new SqlConnection(CONNSTRING);

                if (!Page.IsPostBack)
                { 
                    if (Session["CANDID"] != null || Session["CANDNAME"] != null)
                    {
                        int candid = Convert.ToInt32(Session["CANDID"]);
                        //BindReports(candid);
                        BindAttendanceData();
                        lblname.Text = Convert.ToString(Session["CANDNAME"]);
                    }
                }
            }
            catch(Exception ex)
            {
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);
            }
        }
        //private void BindReports(int CanId)
        //{
        //    try
        //    {
        //        SqlCommand comm1 = new SqlCommand("select CT.TESTID,CT.DATEOFTEST,C.FULLNAME,CT.TESTTYPE,CD.COURSENAME,CT.SCORE,CT.OUTOF,(CT.SCORE/CT.OUTOF) * 100 AS PERCENTAGE,CT.UPDATEDBY,CT.FEEDBACK from CANDIDATE_TESTRESULTS CT INNER JOIN CANDIDATES C ON CT.CANDIDATEID = C.CANDIDATE_CODE INNER JOIN COURSES_DETAIL CD ON CT.COURSEID = CD.COURSEID where  C.CANDIDATE_CODE=@ID", sconn);
        //        comm1.Parameters.Add("@ID", typeof(int)).Value = CanId;

        //        comm1.CommandType = CommandType.Text;
        //        SqlDataAdapter adap = new SqlDataAdapter(comm1);

        //        DataTable dt = new DataTable();
        //        adap.Fill(dt);

        //        if (dt.Rows.Count > 0)
        //        {
        //            grvCandidatesReports.DataSource = dt;
        //            grvCandidatesReports.DataBind();
        //        }
        //        else
        //        {
        //            grvCandidatesReports.DataSource = null;
        //            grvCandidatesReports.DataBind();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write(ex.Message.ToString());
        //    }

        //}

        private void BindAttendanceData()
        {
            // Connection string
            string connectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            // Get student name and email from the session
            string userEmail = Session["USERNAME"].ToString();  // Assuming Session["USERNAME"] contains the student's name
            //string studentEmail = Session["USEREMAIL"].ToString();  // Assuming you also store the email in session

            // SQL query with parameters
            string query = @"
            SELECT 
    bs.BatchSheetId, 
    bs.Date AS AttendanceDate,
    bs.ChapterNumber,
    bs.TopicCovered,
    bs.Comments AS AttendanceComments,
    c.FULLNAME AS StudentName,
    c.EMAIL AS StudentEmail,
    b.BatchType,
    b.BatchMode,
    b.BatchSubject,
    b.StartDate AS BatchStartDate,
    b.EndDate AS BatchEndDate,
    b.FaclutyName AS FacultyName,
    co.COURSENAME AS CourseName
FROM 
    enosis.BatchSheetDetails bs
INNER JOIN 
    enosis.BatchesInfo b ON bs.BatchId = b.BatchId
INNER JOIN 
    dbo.CANDIDATES c ON bs.StudentName = c.FULLNAME
LEFT JOIN 
    dbo.COURSES_DETAIL co ON CAST(b.BatchSubject AS VARCHAR(255)) = CAST(co.COURSEID AS VARCHAR(255))
WHERE 
    c.EMAIL = @StudentEmail  -- Filter based on the email
ORDER BY 
    bs.Date ASC, c.FULLNAME ASC;";

            // Create a SqlConnection
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Create a SqlCommand with parameter
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentEmail", userEmail);

                // Create a SqlDataAdapter
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                // Create a DataTable to hold the data
                DataTable dt = new DataTable();

                // Fill the DataTable with the query results
                adapter.Fill(dt);

                // Bind the DataTable to the GridView
                AttendenceGrv.DataSource = dt;
                AttendenceGrv.DataBind();
            }
        }
    }
}