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
    public partial class addPage : System.Web.UI.Page
    {
        //String Connection = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
        //SqlConnection con = null;
        protected void Page_Load(object sender, EventArgs e)
        {
          //  con = new SqlConnection(Connection);
            if (!Page.IsPostBack)
            {

                if ((Request.QueryString["MODE"] != null) && (Request.QueryString["MODE"].ToString() == OPERATION.EDIT.ToString()))
                {
                   // txtId.Text = Session["Id"].ToString();
                    txtuser.Text = Session["Name"].ToString();
                    txtpass.Text = Session["Password1"].ToString();
                    txtfullname2.Text = Session["FullName"].ToString();
                    txtdob.Text = string.Format("{0:dd/MM/yyyy}", Session["DOB"].ToString());
                    txtemail.Text = Session["EmailId"].ToString();
                    txtmobile.Text = Session["MobileNo"].ToString();
                    txtdoj.Text = Session["DOJ"].ToString();
                    drp.SelectedItem.Text = Session["Designation"].ToString();
                    txtskills.Text = Session["Skills"].ToString();
                }
                else
                {
                    //     txtfullname.Text = "";

                    txtuser.Text = "";
                    txtpass.Text = "";

                    txtdob.Text = "";
                    txtemail.Text = "";
                    txtmobile.Text = "";
                    txtdoj.Text = "";
                    txtskills.Text = "";
                }
                
            }
        }
        protected void btnAddUSer_Click(object sender, EventArgs e)
        {
            try
            {
                //
                string offerletterpath = Server.MapPath(@"~\OfferLetter\") + fOfferLetter.FileName;

                fResume.SaveAs(Server.MapPath(@"~\EmpResume\") + fResume.FileName);
                fPhoto.SaveAs(Server.MapPath(@"~\Photo\") + fPhoto.FileName);
                fOfferLetter.SaveAs(offerletterpath);
                fID.SaveAs(Server.MapPath(@"~\IDPROOF\") + fOfferLetter.FileName);


                string degn = drp.SelectedItem.Text;
                string query = "";


                List<SqlParameter> parameters = new List<SqlParameter>();
                //  parameters.Add(new DbParameter("postID", System.Data.ParameterDirection.Input, postID));
                // SqlParameter s1 = new SqlParameter("@USERNAME", SqlDbType.VarChar);
                /////

                parameters.Add(new SqlParameter("@USERID", SqlDbType.VarChar));
                parameters[0].Value = (Session["Id"] != null && Session["Id"].ToString().Length > 0) ? Convert.ToInt32(Session["Id"].ToString()) : 0;

                parameters.Add(new SqlParameter("@USERNAME", SqlDbType.VarChar));
                parameters[1].Value = txtuser.Text;
                parameters.Add(new SqlParameter("@PASSWORD", SqlDbType.VarChar));
                parameters[2].Value = txtpass.Text;
                parameters.Add(new SqlParameter("@FULLNAME", SqlDbType.VarChar));
                parameters[3].Value = txtfullname2.Text;

                parameters.Add(new SqlParameter("@DOB", SqlDbType.DateTime));
                parameters[4].Value = txtdob.Text;

                parameters.Add(new SqlParameter("@EMAILID", SqlDbType.VarChar));
                parameters[5].Value = txtemail.Text;

                parameters.Add(new SqlParameter("@MOBILENO", SqlDbType.VarChar));
                parameters[6].Value = txtmobile.Text;

                parameters.Add(new SqlParameter("@DOJ", SqlDbType.DateTime));
                parameters[7].Value = txtdob.Text;

                parameters.Add(new SqlParameter("@DESIGNATION", SqlDbType.VarChar));
                parameters[8].Value = drp.SelectedItem.Value;

                parameters.Add(new SqlParameter("@SKILLS", SqlDbType.VarChar));
                parameters[9].Value = txtskills.Text;



                parameters.Add(new SqlParameter("@OFFICIALEMAILID", SqlDbType.VarChar));
                parameters[10].Value = txtOffEmail.Text;

                parameters.Add(new SqlParameter("@EMAILPASSWORD", SqlDbType.VarChar));
                parameters[11].Value = txtEmailPass.Text;

                parameters.Add(new SqlParameter("@RESUME", SqlDbType.VarChar));
                parameters[12].Value = fResume.FileName;

                parameters.Add(new SqlParameter("@PHOTO", SqlDbType.VarChar));
                parameters[13].Value = fPhoto.FileName;

                parameters.Add(new SqlParameter("@OFFERLETTER", SqlDbType.VarChar));
                parameters[14].Value = fOfferLetter.FileName;

                parameters.Add(new SqlParameter("@IDPROOF", SqlDbType.VarChar));
                parameters[15].Value = fID.FileName;


                //@DESIGNATION varchar(100) NULL, @SKILLS varchar NULL, @STATUS varchar NULL,
                //@OFFICIALEMAILID varchar(100) NULL, @EMAILPASSWORD varchar(100) NULL, @RESUME varchar(100) NULL,
                //@PHOTO varchar(100) NULL, @OFFERLETTER varchar(100) NULL, @IDPROOF varchar(100) NULL

                if (Session["Id"] != null && Session["Id"].ToString().Length > 0)
                {
                    dbconnect.ExecuteStoredProcedure("SP_ADDUPDATEUSER", parameters);
                 //  query = "UPDATE USERDETAILS SET USERNAME='" + txtuser.Text + "',PASSWORD='" + txtpass.Text + "',FULLNAME= '" + txtfullname2.Text + "',DOB='" + txtdob.Text + "',EMAILID='" + txtemail.Text + "',MOBILENO='" + txtmobile.Text + "',DOJ='" + txtdoj.Text + "',DESIGNATION='" + drp.SelectedItem.Value + "',SKILLS='" + txtskills.Text + "',OFFICIALEMAILID='" + txtOffEmail.Text + "',EMAILPASSWORD='" + txtEmailPass.Text + "',RESUME='" + fResume.FileName + "',PHOTO='" + fPhoto.FileName + "',OFFERLETTER='" + fOfferLetter.FileName + "',IDPROOF='" + fID.FileName + "' WHERE USERID=" + Session["Id"].ToString();
                   // dbconnect.ExecuteQuery(query);

                }
                else
                {
                    dbconnect.ExecuteStoredProcedure("SP_ADDUPDATEUSER", parameters);

                    //     query = "Insert into USERDETAILS values('" + txtuser.Text + "','" + txtpass.Text + "','" + txtfullname2.Text + "','" + txtdob.Text + "','" + txtemail.Text + "','" + txtmobile.Text + "','" + txtdoj.Text + "','" + degn + "','" + txtskills.Text + "','" + STATUS.ACTIVE.ToString() + "','" +  txtOffEmail.Text + "','" + txtEmailPass.Text + "','" + fResume.FileName + "','" + fPhoto.FileName + "','" + fOfferLetter.FileName + "','" + fID.FileName + "')";
                    //      dbconnect.ExecuteQuery(query);
                  //  SENDEMAIL obj = new SENDEMAIL();
                  //obj.SendWelcomeEmailToEmployee(txtfullname2.Text, txtOffEmail.Text, txtEmailPass.Text, txtuser.Text, txtpass.Text, txtemail.Text,offerletterpath);

                }

                Response.Write("<script>alert('Inserted successfully!')</script>"); //works great
         
                //lbl.Text = "Data Saved.....";
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

                Response.Write("<script>alert('" + ex.Message + "')</script>");


                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }



        }

    }
}