using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ENOSISLEARNING
{
    public partial class Courseshist : System.Web.UI.Page
    {
        string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
        SqlConnection sconn = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            sconn = new SqlConnection(CONNSTRING);



            if (!Page.IsPostBack)
            {
                if (Request.QueryString["COURSEID"] != null)
                {
                    string query = "select * from COURSESDETAIL_HISTORY where COURSEID=" + Request.QueryString["COURSEID"].ToString();
                    SqlDataAdapter adp = new SqlDataAdapter(query, sconn);
                    DataTable dt = new DataTable();

                    adp.Fill(dt);
                    historygrid.DataSource = dt;
                    historygrid.DataBind();
                }


            }
        }

       
    }
}