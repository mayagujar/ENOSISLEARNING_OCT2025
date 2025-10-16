using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ENOSISLEARNING.Libraries;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;

namespace ENOSISLEARNING
{// 09/09/2025 Enquiries
    public partial class Enquiries : System.Web.UI.Page
    {
        //http://www.binaryintellect.net/articles/0d7482a0-0706-41c0-8543-859dd2431768.aspx

        //https://stackoverflow.com/questions/3720796/staying-on-current-jquery-tab-across-post-back

        //https://lkarolak.wordpress.com/2010/01/25/maintain-selected-tab-position-upon-postback-jquery-ui-tabs/

        [WebMethod]
        public static bool UpdateEnquiry(string enquiryId, string name, string date, string mobile, string email, string course, string status, string mode, string assigned, string source, string nextEq, string comment, string updatedBy)
        {
            bool isUpdated = false;
            string connString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString))
            {
                try
                {
                    con.Open();
                    string query = @"
                UPDATE ENQUIRIES
                SET 
                    NAME = @Name,
                    CREATED_DATE = @Date,
                    CONTACTMOBILENO = @Mobile,
                    CONTACTEMAIL = @Email,
                    COURSENAME = @Course,
                    STATUS = @Status,
                    MODE = @Mode,
                    ASSIGNEDTO = @Assigned,
                    SOURCE = @Source,
                    NEXTENQDATE = @NextEq,
                    COMMENTS = @Comment,
                    UPDATEDBY = @UpdatedBy
                WHERE 
                    ENQUIRYID = @EnquiryId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@EnquiryId", enquiryId);
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Date", Convert.ToDateTime(date));
                        cmd.Parameters.AddWithValue("@Mobile", mobile);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Course", course);
                        cmd.Parameters.AddWithValue("@Status", status);
                        cmd.Parameters.AddWithValue("@Mode", mode);
                        cmd.Parameters.AddWithValue("@Assigned", assigned);
                        cmd.Parameters.AddWithValue("@Source", source);
                        cmd.Parameters.AddWithValue("@NextEq", Convert.ToDateTime(nextEq));
                        cmd.Parameters.AddWithValue("@Comment", comment);
                        cmd.Parameters.AddWithValue("@UpdatedBy", updatedBy);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        isUpdated = rowsAffected > 0; // Check if any row was updated
                    }
                }
                catch (Exception ex)
                {
                    // Handle exception (log it, etc.)
                    Console.WriteLine("Error: " + ex.Message);
                }
            }

            return isUpdated;
        }

       


        [WebMethod]
        public static string AddEnquiry(string name, string email, string mobile, string course, string status, string mode, string assigned, string source, string followUpDate, string comment)
        {
            string result = string.Empty;
            try
            {
                // Define the connection string
                string connectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

                // Convert the next enquiry date into the correct format
                DateTime nextEnqDateParsed;
                if (!DateTime.TryParse(followUpDate, out nextEnqDateParsed))
                {
                    return "Invalid date format";
                }

                // SQL query for insertion
                string query = "INSERT INTO ENQUIRIES (NAME, CONTACTEMAIL, CONTACTMOBILENO, COURSENAME, STATUS, MODE, ASSIGNEDTO, SOURCE, NEXTENQDATE, COMMENTS) " +
                               "VALUES (@Name, @Email, @ContactNo, @CourseName, @Status, @Mode, @AssignedTo, @Source, @NextEnqDate, @Comments)";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Adding parameters
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@ContactNo", mobile);
                        cmd.Parameters.AddWithValue("@CourseName", course);
                        cmd.Parameters.AddWithValue("@Status", status);
                        cmd.Parameters.AddWithValue("@Mode", mode);
                        cmd.Parameters.AddWithValue("@AssignedTo", assigned);
                        cmd.Parameters.AddWithValue("@Source", source);
                        cmd.Parameters.AddWithValue("@NextEnqDate", nextEnqDateParsed);
                        cmd.Parameters.AddWithValue("@Comments", comment);

                        // Open connection and execute the command
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        result = rowsAffected > 0 ? "success" : "error";
                    }
                }
            }
            catch (Exception ex)
            {
                result = "error: " + ex.Message;
            }
            return result;
        }
        //Hold Status Record//
        [WebMethod]
        public static List<Enquiry> GetHoldEnquiries()
        {
            List<Enquiry> enquiries = new List<Enquiry>();
            string connectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM ENQUIRIES WHERE STATUS = 'HOLD'";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Enquiry enquiry = new Enquiry
                        {
                            NAME = reader["NAME"].ToString(),
                            CONTACTEMAIL = reader["CONTACTEMAIL"].ToString(),
                            CONTACTMOBILENO = reader["CONTACTMOBILENO"].ToString(),
                            COURSENAME = reader["COURSENAME"].ToString(),
                            STATUS = reader["STATUS"].ToString(),
                            MODE = reader["MODE"].ToString(),
                            ASSIGNEDTO = reader["ASSIGNEDTO"].ToString(),
                            SOURCE = reader["SOURCE"].ToString(),
                            NEXTENQDATE = Convert.ToDateTime(reader["NEXTENQDATE"]).ToString("dd/MM/yyyy"),
                            COMMENTS = reader["COMMENTS"].ToString()
                        };

                        enquiries.Add(enquiry);
                    }
                }
            }
            return enquiries;
        }


        //      drpPAssigned
        //drpAssigned
        //drpAssigned
        //drpFAssigned

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        // SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindAllCandidateGidView();
                GetCoordinator();
                GetCoordinators();
                GetCoordinatorsForEdit();

            }

        }
        void BindAllCandidateGidView()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT \r\n    E.ENQUIRYID, \r\n    E.NAME, \r\n    E.CONTACTEMAIL, \r\n    E.CONTACTMOBILENO, \r\n    E.COURSENAME, \r\n    E.STATUS, \r\n    E.MODE, \r\n    E.ASSIGNEDTO, \r\n    E.SOURCE, \r\n    E.NEXTENQDATE, \r\n    E.CREATED_DATE, \r\n    E.UPDATEDBY,\r\n    ISNULL(LatestChat.LatestComment, E.COMMENTS) AS ECOMMENTS\r\n\r\nFROM \r\n    ENQUIRIES E\r\n\r\nOUTER APPLY (\r\n    SELECT TOP 1 MessageText AS LatestComment\r\n    FROM EnquiryChat C\r\n    WHERE C.EnquiryId = E.ENQUIRYID\r\n    ORDER BY MessageTime DESC\r\n) AS LatestChat\r\n\r\nWHERE \r\n    E.STATUS IN ('NEW', 'INTERESTED') \r\n    AND E.STATUS NOT IN ('INACTIVE')\r\n\r\nORDER BY \r\n    E.CREATED_DATE DESC";

                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                dataAdapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    grvCandidatesDetail.DataSource = dt;
                    grvCandidatesDetail.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    grvCandidatesDetail.DataSource = dt;
                    grvCandidatesDetail.DataBind();
                    grvCandidatesDetail.Rows[0].Cells.Clear();
                    grvCandidatesDetail.Rows[0].Cells.Add(new TableCell());
                    grvCandidatesDetail.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    grvCandidatesDetail.Rows[0].Cells[0].Text = "No Batches Found";
                    grvCandidatesDetail.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    grvCandidatesDetail.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    grvCandidatesDetail.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                //Errorlbl.Text = ex.Message;
                //Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Refresh GridView//
        [WebMethod]
        public static void RefreshGridView()
        {
            Page page = HttpContext.Current.Handler as Page;
            GridView grvCandidatesDetail = (GridView)page.FindControl("grvCandidatesDetail");  // Adjust GridView ID
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT ENQUIRYID, NAME, CONTACTEMAIL, CONTACTMOBILENO, COURSENAME, STATUS, MODE, ASSIGNEDTO, SOURCE, NEXTENQDATE, CREATED_DATE, UPDATEDBY, CAST(ENQUIRYID AS VARCHAR(10)) + ':' + COMMENTS AS ECOMMENTS FROM ENQUIRIES WHERE STATUS IN ('NEW', 'INTERESTED') AND STATUS NOT IN ('INACTIVE') ORDER BY CREATED_DATE DESC";

                string connectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, connectionString);
                dataAdapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    grvCandidatesDetail.DataSource = dt;
                    grvCandidatesDetail.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    grvCandidatesDetail.DataSource = dt;
                    grvCandidatesDetail.DataBind();
                    grvCandidatesDetail.Rows[0].Cells.Clear();
                    grvCandidatesDetail.Rows[0].Cells.Add(new TableCell());
                    grvCandidatesDetail.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    grvCandidatesDetail.Rows[0].Cells[0].Text = "No Batches Found";
                    grvCandidatesDetail.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    grvCandidatesDetail.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    grvCandidatesDetail.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {

            }


        }

        //Refresh GridView//
        //Bind Coordinator DropDown//
        void GetCoordinator()
        {
            try
            {
                drpAssigned.DataSource = dbconnect.GetDataSet("select USERID,UPPER(USERNAME) AS USERNAME from userdetails WHERE DESIGNATION IN ('MANAGER','COUNSELLOR') AND STATUS = 'ACTIVE'");
                //string query = "select USERID,UPPER(USERNAME) AS USERNAME from userdetails WHERE DESIGNATION IN ('MANAGER','COUNSELLOR') AND STATUS = 'ACTIVE'";
                string query = "select USERID,UPPER(USERNAME) AS USERNAME from USERDETAILS WHERE STATUS='ACTIVE'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                drpAssigned.DataSource = data;
                drpAssigned.DataTextField = "USERNAME";
                drpAssigned.DataValueField = "USERNAME";
                drpAssigned.DataBind();
                //ListItem selectitem = new ListItem("Select  UserName", "Select State");
                //selectitem.Selected = true;
                //drpPAssigned.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {

                //lblmsg.Text = ex.Message;
            }
        }

        void GetCoordinators()
        {
            try
            {
                drpAssigned.DataSource = dbconnect.GetDataSet("select USERID,UPPER(USERNAME) AS USERNAME from userdetails WHERE DESIGNATION IN ('MANAGER','COUNSELLOR') AND STATUS = 'ACTIVE'");
                //string query = "select USERID,UPPER(USERNAME) AS USERNAME from userdetails WHERE DESIGNATION IN ('MANAGER','COUNSELLOR') AND STATUS = 'ACTIVE'";
                string query = "select USERID,UPPER(USERNAME) AS USERNAME from USERDETAILS WHERE STATUS='ACTIVE'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                drpPAssigned.DataSource = data;
                drpPAssigned.DataTextField = "USERNAME";
                drpPAssigned.DataValueField = "USERNAME";
                drpPAssigned.DataBind();
                //ListItem selectitem = new ListItem("Select  UserName", "Select State");
                //selectitem.Selected = true;
                //drpPAssigned.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {

                //lblmsg.Text = ex.Message;
            }
        }
        void GetCoordinatorsForEdit()
        {
            try
            {
                DropDownList4.DataSource = dbconnect.GetDataSet("select USERID,UPPER(USERNAME) AS USERNAME from userdetails WHERE DESIGNATION IN ('MANAGER','COUNSELLOR') AND STATUS = 'ACTIVE'");
                string query = "select USERID,UPPER(USERNAME) AS USERNAME from userdetails WHERE DESIGNATION IN ('MANAGER','COUNSELLOR') AND STATUS = 'ACTIVE'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                DropDownList4.DataSource = data;
                DropDownList4.DataTextField = "USERNAME";
                DropDownList4.DataValueField = "USERNAME";
                DropDownList4.DataBind();
                //ListItem selectitem = new ListItem("Select  UserName", "Select State");
                //selectitem.Selected = true;
                //drpPAssigned.Items.Insert(0, selectitem);
            }
            catch (Exception ex)
            {

                //lblmsg.Text = ex.Message;
            }
        }
        //Bind Coordinator DropDown//
        private void BindIntQuery()
        {

            try
            {

                string mainquery = "SELECT ENQUIRYID, NAME, CONTACTEMAIL, CONTACTMOBILENO, COURSENAME, STATUS, MODE, ASSIGNEDTO, SOURCE, NEXTENQDATE, CREATED_DATE, UPDATEDBY, CAST(ENQUIRYID AS VARCHAR(10)) + ':' + COMMENTS AS ECOMMENTS FROM ENQUIRIES WHERE STATUS IN ('NEW', 'INTERESTED') AND STATUS NOT IN ('INACTIVE') ORDER BY CREATED_DATE DESC";
                /* if (Request.QueryString["REGNO"] != null)
                 {
                     int RegNo = Convert.ToInt32(Request.QueryString["REGNO"].ToString());
                     mainquery += "and C.CANDIDATE_CODE = " + RegNo + "";
                 }
                 if (txtName.Text != "")
                 {
                     mainquery += "and C.FULLNAME LIKE '%" + txtName.Text + "%'";
                 }*/
                //if (txtName.Text != "")
                //{
                //    mainquery += " and NAME LIKE '%" + txtName.Text + "%'";
                //}
                ///*if (txtCourse.Text != "")
                //{
                //    mainquery += "and COURSENAME LIKE '%" + txtCourse.Text + "%'";
                //}*/
                if (drpcourses.SelectedItem.Value != "0")
                {
                    mainquery += " and coursename like '%" + drpcourses.SelectedItem.Text + "%'";
                }
                if (drpmode.SelectedItem.Value != "0")
                {
                    mainquery += " and mode like '%" + drpmode.SelectedItem.Text + "%'";
                }

                if (drpsource.SelectedItem.Value != "0")
                {
                    mainquery += " and source like '%" + drpsource.SelectedItem.Text + "%'"; //drppositions.selecteditem.text ;
                }
                if (drpstatus.SelectedItem.Value != "0")
                {
                    mainquery += " and status like '%" + drpstatus.SelectedItem.Text + "%'"; //drppositions.selecteditem.text ;
                }
                else
                {
                    mainquery += " and status not in('joined','closed')";
                }
                if (drpAssigned.SelectedItem.Value != "0")
                {
                    mainquery += " and assignedto like '%" + drpAssigned.SelectedItem.Text + "%'"; //drppositions.selecteditem.text ;
                }


                mainquery = mainquery + " ORDER BY CREATED_DATE DESC";
                DataTable dt = new DataTable();
                dt = dbconnect.GetDataSet(mainquery);
                if (dt.Rows.Count > 0)
                {

                    //grvCandidatesDetail.DataSource = dt;
                    //grvCandidatesDetail.DataBind();
                }
                else
                {
                    //grvCandidatesDetail.DataSource = null;
                    //grvCandidatesDetail.DataBind();


                }

            }
            catch (Exception ex)
            {
                //lblError.Text = ex.Message;

            }

        }



        protected void dropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindIntQuery();
        }

        protected void grvCandidatesDetail_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvCandidatesDetail.EditIndex = e.NewEditIndex;
            BindAllCandidateGidView();
        }

        protected void grvCandidatesDetail_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvCandidatesDetail.EditIndex = -1;
            BindAllCandidateGidView();
        }

        protected void grvCandidatesDetail_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                // Clear the current cells to start building a custom header
                e.Row.Cells.Clear();

                // Create the header structure
                TableCell dateHeader = new TableCell();
                dateHeader.Text = "Date";
                dateHeader.HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells.Add(dateHeader);

                TableCell updatedHeader = new TableCell();
                updatedHeader.Text = "Updated By";
                updatedHeader.HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells.Add(updatedHeader);

                TableCell nameHeader = new TableCell();
                nameHeader.Text = "Name";
                nameHeader.HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells.Add(nameHeader);

                TableCell mobileHeader = new TableCell();
                mobileHeader.Text = "Contact";
                mobileHeader.HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells.Add(mobileHeader);

                TableCell emailHeader = new TableCell();
                emailHeader.Text = "Email";
                emailHeader.HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells.Add(emailHeader);

                TableCell courseHeader = new TableCell();
                courseHeader.Text = "Course";
                courseHeader.HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells.Add(courseHeader);

                TableCell statusHeader = new TableCell();
                statusHeader.Text = "Status";
                statusHeader.HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells.Add(statusHeader);

                TableCell modeHeader = new TableCell();
                modeHeader.Text = "Mode";
                modeHeader.HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells.Add(modeHeader);

                TableCell assignHeader = new TableCell();
                assignHeader.Text = "Assigned To";
                assignHeader.HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells.Add(assignHeader);

                TableCell SourceHeader = new TableCell();
                SourceHeader.Text = "Source";
                SourceHeader.HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells.Add(SourceHeader);

                TableCell NextEqDateHeader = new TableCell();
                NextEqDateHeader.Text = "Next Eq.Date";
                NextEqDateHeader.HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells.Add(NextEqDateHeader);

                TableCell CommentHeader = new TableCell();
                CommentHeader.Text = "Comment";
                CommentHeader.HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells.Add(CommentHeader);

                TableCell actionsHeader = new TableCell();
                actionsHeader.Text = "Actions";
                actionsHeader.HorizontalAlign = HorizontalAlign.Center;
                actionsHeader.Width = Unit.Pixel(80);
                e.Row.Cells.Add(actionsHeader);

                // Optionally, add a CSS class for styling
                e.Row.CssClass = "gridview-header";
                e.Row.BorderColor = System.Drawing.ColorTranslator.FromHtml("#1d96b2");
            }
        }

        protected void grvCandidatesDetail_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (grvCandidatesDetail.PageIndex == 0 && e.NewPageIndex < 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                e.Cancel = true;
            }
            else
            {
                grvCandidatesDetail.PageIndex = e.NewPageIndex;
                BindAllCandidateGidView();
            }
        }
       
        //Refreash GridView Data//

        //Refreash GridView Data//

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Optionally rebind your GridView to show the updated data
            BindAllCandidateGidView();

            // Close the modal if needed (you might need to handle this via JavaScript)
            ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseModal", "$('#editModal').modal('hide');", true);
        }
        //Add//
        
        public class Enquiry
        {
            public string NAME { get; set; }
            public string CONTACTEMAIL { get; set; }
            public string CONTACTMOBILENO { get; set; }
            public string COURSENAME { get; set; }
            public string STATUS { get; set; }
            public string MODE { get; set; }
            public string ASSIGNEDTO { get; set; }
            public string SOURCE { get; set; }
            public string NEXTENQDATE { get; set; }
            public string COMMENTS { get; set; }
        }
        //Hold Status Record//



        protected void btnEnquiry_Click(object sender, EventArgs e)
        {
            Response.Redirect("EnquiryAnalysis.aspx");
        }


        protected void btnFollowUp_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = dbconnect.GetDataSet("select *,CAST(ENQUIRYID AS VARCHAR(10)) + ':' + COMMENTS AS ECOMMENTS  from ENQUIRIES WHERE NEXTENQDATE <= GETDATE()");
                grvCandidatesDetail.DataSource = dt;
                grvCandidatesDetail.DataBind();
            }

            catch (Exception ex)
            {
                // lblError.Text = ex.Message;
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);


            }
        }

        //Filter All Candidates//



        //Filter Method For Hold Candidates//
        void BindHoldCandidateGidView()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT ENQUIRYID, NAME, CONTACTEMAIL, CONTACTMOBILENO, COURSENAME, STATUS, MODE, ASSIGNEDTO, SOURCE, NEXTENQDATE, CREATED_DATE, UPDATEDBY, COMMENTS FROM ENQUIRIES  WHERE STATUS = 'HOLD' ORDER BY CREATED_DATE DESC";

                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                dataAdapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    grvCandidatesDetail.DataSource = dt;
                    grvCandidatesDetail.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    grvCandidatesDetail.DataSource = dt;
                    grvCandidatesDetail.DataBind();
                    grvCandidatesDetail.Rows[0].Cells.Clear();
                    grvCandidatesDetail .Rows[0].Cells.Add(new TableCell());
                    grvCandidatesDetail.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    grvCandidatesDetail.Rows[0].Cells[0].Text = "No Records Found";
                    grvCandidatesDetail.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    grvCandidatesDetail.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    grvCandidatesDetail.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                // Handle exception
            }
        }

        //Filter Method For Hold Candidates//
        //Filter OnClick Hold Candidates//
        protected void All_Click(object sender, EventArgs e)
        {
            BindAllCandidateGidView();
        }
        //Filter OnClick For Hold Candidates//
        protected void BtnHold_Click(object sender, EventArgs e)
        {
            BindHoldCandidateGidView();
        }
        //Filter OnClick For Hold Candidates//
        void BindNotIntCandidateGidView()
        {
            try
            {
                DataTable dt = new DataTable();
                string query = "SELECT * FROM ENQUIRIES WHERE STATUS = 'NOTINTERESTED'";

                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                dataAdapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    grvCandidatesDetail.DataSource = dt;
                    grvCandidatesDetail.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    grvCandidatesDetail.DataSource = dt;
                    grvCandidatesDetail.DataBind();
                    grvCandidatesDetail.Rows[0].Cells.Clear();
                    grvCandidatesDetail.Rows[0].Cells.Add(new TableCell());
                    grvCandidatesDetail.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                    grvCandidatesDetail.Rows[0].Cells[0].Text = "No Records Found";
                    grvCandidatesDetail.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    grvCandidatesDetail.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    grvCandidatesDetail.Rows[0].Cells[0].BorderStyle = BorderStyle.None;
                }
            }
            catch (Exception ex)
            {
                //Errorlbl.Text = ex.Message;
                //Errorlbl.ForeColor = System.Drawing.Color.Red;
            }
        }
        //Filter OnClick For Hold Candidates//
        protected void NotIntrested_Click(object sender, EventArgs e)
        {
            BindNotIntCandidateGidView();
        }
        //Name Search box Filter//
        private void BindGridViewByName(string searchName)
        {
            string query = @"SELECT ENQUIRYID, NAME, CONTACTEMAIL, CONTACTMOBILENO, COURSENAME, STATUS, MODE, ASSIGNEDTO, SOURCE, NEXTENQDATE, CREATED_DATE, UPDATEDBY, 
                     CAST(ENQUIRYID AS VARCHAR(10)) + ':' + COMMENTS AS ECOMMENTS 
                     FROM ENQUIRIES 
                     WHERE STATUS IN ('NEW', 'INTERESTED') 
                     AND STATUS NOT IN ('INACTIVE')
                     AND NAME LIKE '%' + @SearchName + '%' 
                     ORDER BY CREATED_DATE DESC";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Add the parameter for the search term (NAME)
                    cmd.Parameters.AddWithValue("@SearchName", searchName);

                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Bind the data to the GridView
                    grvCandidatesDetail.DataSource = dt;
                    grvCandidatesDetail.DataBind();
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Get the search term from the TextBox
            string searchTerm = txtName.Text.Trim();

            // Call the method to bind the GridView with search results
            BindGridViewByName(searchTerm);
            //BindIntQuery();
        }
        //Method for Search By DropDownList//
        private void BindCourseCandidatesGrid(string courseName)
        {
            DataTable dt = new DataTable();
            string query = "SELECT ENQUIRYID,NAME,CONTACTEMAIL,CONTACTMOBILENO,COURSENAME,STATUS,MODE,ASSIGNEDTO,SOURCE,NEXTENQDATE,CREATED_DATE,UPDATEDBY, COMMENTS AS ECOMMENTS  FROM ENQUIRIES WHERE COURSENAME = @courseName ORDER BY CREATED_DATE DESC";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@CourseName", courseName);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            if (dt.Rows.Count > 0)
            {
                grvCandidatesDetail.DataSource = dt;
                grvCandidatesDetail.DataBind();
            }
            else
            {
                grvCandidatesDetail.DataSource = null;
                grvCandidatesDetail.DataBind();
            }
        }

        //Method for Search By DropDownList//
        private void BindModeCandidatesGrid(string Mode)
        {
            DataTable dt = new DataTable();
            string query = "SELECT ENQUIRYID,NAME,CONTACTEMAIL,CONTACTMOBILENO,COURSENAME,STATUS,MODE,ASSIGNEDTO,SOURCE,NEXTENQDATE,CREATED_DATE,UPDATEDBY, COMMENTS AS ECOMMENTS  FROM ENQUIRIES WHERE MODE = @Mode ORDER BY CREATED_DATE DESC";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Mode", Mode);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            if (dt.Rows.Count > 0)
            {
                grvCandidatesDetail.DataSource = dt;
                grvCandidatesDetail.DataBind();
            }
            else
            {
                grvCandidatesDetail.DataSource = null;
                grvCandidatesDetail.DataBind();
            }
        }
        //Method for Search By DropDownList//
        //Method for Search By DropDownList//
        private void BindStatusCandidatesGrid(string Status)
        {
            DataTable dt = new DataTable();
            string query = "SELECT ENQUIRYID,NAME,CONTACTEMAIL,CONTACTMOBILENO,COURSENAME,STATUS,MODE,ASSIGNEDTO,SOURCE,NEXTENQDATE,CREATED_DATE,UPDATEDBY, COMMENTS AS ECOMMENTS  FROM ENQUIRIES WHERE STATUS = @Status ORDER BY CREATED_DATE DESC";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Status", Status);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            if (dt.Rows.Count > 0)
            {
                grvCandidatesDetail.DataSource = dt;
                grvCandidatesDetail.DataBind();
            }
            else
            {
                grvCandidatesDetail.DataSource = null;
                grvCandidatesDetail.DataBind();
            }
        }
        //Method for Search By DropDownList//
        //Method for Search By DropDownList//
        private void BindAssignedToCandidatesGrid(string Assigned)
        {
            DataTable dt = new DataTable();
            string query = "SELECT ENQUIRYID,NAME,CONTACTEMAIL,CONTACTMOBILENO,COURSENAME,STATUS,MODE,ASSIGNEDTO,SOURCE,NEXTENQDATE,CREATED_DATE,UPDATEDBY, COMMENTS AS ECOMMENTS  FROM ENQUIRIES WHERE ASSIGNEDTO = @Assigned ORDER BY CREATED_DATE DESC";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Assigned", Assigned);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            if (dt.Rows.Count > 0)
            {
                grvCandidatesDetail.DataSource = dt;
                grvCandidatesDetail.DataBind();
            }
            else
            {
                grvCandidatesDetail.DataSource = null;
                grvCandidatesDetail.DataBind();
            }
        }
        //Method for Search By DropDownList//
        //Method for Search By DropDownList//
        private void BindSourceCandidatesGrid(string Source)
        {
            DataTable dt = new DataTable();
            string query = "SELECT ENQUIRYID,NAME,CONTACTEMAIL,CONTACTMOBILENO,COURSENAME,STATUS,MODE,ASSIGNEDTO,SOURCE,NEXTENQDATE,CREATED_DATE,UPDATEDBY, COMMENTS AS ECOMMENTS  FROM ENQUIRIES WHERE SOURCE = @Source ORDER BY CREATED_DATE DESC";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Source", Source);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            if (dt.Rows.Count > 0)
            {
                grvCandidatesDetail.DataSource = dt;
                grvCandidatesDetail.DataBind();
            }
            else
            {
                grvCandidatesDetail.DataSource = null;
                grvCandidatesDetail.DataBind();
            }
        }
        //Method for Search By DropDownList//
        //Method for Search By DropDownList//
        //Search By DropDownList//
        protected void drpcourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCourse = drpcourses.SelectedValue;

            if (selectedCourse != "0") // Make sure it's not the default 'Course' option
            {
                BindCourseCandidatesGrid(selectedCourse);
            }
            else
            {
                // Optionally bind all data if no specific course is selected
                BindAllCandidateGidView();
            }
        }

        protected void drpmode_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Mode = drpmode.SelectedValue;
            if (Mode != "0")
            {
                BindModeCandidatesGrid(Mode);
            }
            else
            {
                BindAllCandidateGidView();
            }
        }

        protected void drpstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Status = drpstatus.SelectedValue;
            if (Status != "0")
            {
                BindStatusCandidatesGrid(Status);
            }
            else
            {
                BindAllCandidateGidView();
            }
        }

        protected void drpAssigned_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Assigned = drpAssigned.SelectedValue;
            if (Assigned != "0")
            {
                BindAssignedToCandidatesGrid(Assigned);
            }
            else
            {
                BindAllCandidateGidView();
            }
        }

        protected void drpsource_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Source = drpsource.SelectedValue;
            if (Source != "0")
            {
                BindSourceCandidatesGrid(Source);
            }
            else
            {
                BindAllCandidateGidView();
            }
        }
        protected void grvCandidatesDetail_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                int enquiryId = Convert.ToInt32(e.CommandArgument);
                string connString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString();

                try
                {
                    using (SqlConnection con = new SqlConnection(connString))
                    {
                        string query = "DELETE FROM ENQUIRIES WHERE ENQUIRYID = @EnquiryID";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@EnquiryID", enquiryId);
                            con.Open();
                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertSuccess",
                                    "alert('Record deleted successfully!');", true);
                            }
                            else
                            {
                              
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertFailure",
                                    "alert('Error: Record could not be deleted.');", true);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertError",
                        "alert('An error occurred while deleting the record. Please try again.');", true);
                }

                // Refresh the GridView
                BindAllCandidateGidView();
            }
        }
        private DataTable GetChatMessagesFromDB(string enquiryId)
        {
            DataTable dt = new DataTable();

            string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT Sender, MessageText, CreatedOn FROM ChatTable WHERE EnquiryId = @EnquiryId ORDER BY CreatedOn ASC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EnquiryId", enquiryId);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            return dt;
        }

        [System.Web.Services.WebMethod]
        public static List<ChatMessage> GetChatMessages(string enquiryId)
        {
            Enquiries eq = new Enquiries();
            List<ChatMessage> messages = new List<ChatMessage>();

            string constr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("SELECT MessageText, Sender, MessageTime FROM EnquiryChat WHERE ENQUIRYID = @id ORDER BY MessageTime ASC", con);
                cmd.Parameters.AddWithValue("@id", enquiryId);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    messages.Add(new ChatMessage
                    {
                        MessageText = dr["MessageText"].ToString(),
                        Sender = dr["Sender"].ToString(),
                        MessageTime = Convert.ToDateTime(dr["MessageTime"]).ToString("dd MMM yyyy hh:mm tt")
                    });
                }
            }
            return messages;
        }
        public class ChatMessage
        {
            public string MessageText { get; set; }
            public string Sender { get; set; }
            public string MessageTime { get; set; }
        }
        protected void btnSendReply_Click(object sender, EventArgs e)
        {
            try
            {
                int enquiryId;
                string rawValue = HiddenField2.Value;
                if (!int.TryParse(rawValue, out enquiryId))
                {
                    // Log the exact value
                    System.Diagnostics.Debug.WriteLine("Raw Enquiry ID: " + rawValue);
                    lblError.Text = "Invalid Enquiry ID.";
                    return;
                }

                string message = txtReply.Text.Trim();
                string senderName = Session["FULLNAME"]?.ToString() ?? "Admin";

                if (!string.IsNullOrEmpty(message))
                {
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString))
                    {
                        string query = "INSERT INTO EnquiryChat (ENQUIRYID, MessageText, Sender) VALUES (@EnquiryId, @MessageText, @SenderName)";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@EnquiryId", enquiryId);
                        cmd.Parameters.AddWithValue("@MessageText", message);
                        cmd.Parameters.AddWithValue("@SenderName", senderName);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertSuccess",
                                   "alert('Comment added successfully!');", true);
                    }

                    txtReply.Text = "";
                }
                //BindAllCandidateGidView();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
                lblError.Text = "Error while sending reply.";
            }
        }
    }
}