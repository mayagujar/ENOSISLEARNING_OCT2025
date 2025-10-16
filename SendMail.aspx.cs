using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Configuration;

namespace ENOSISLEARNING
{
    public partial class SendMail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string appPath = HttpContext.Current.Request.ApplicationPath;

        
                if (Session["TOEMAIL"] != null)
                {
                    txtto.Text = Session["TOEMAIL"].ToString();
                }
                else
                {
                    txtto.Text = "";
                }
                txtsubject.Text = "EnosisLearning";
        
            }
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            SendNewMail();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script", "<script type='text/javascript'>window.close();</script>", false);
        }
        private void SendNewMail()
        {
            try
            {
                string strSMTP = ConfigurationManager.AppSettings["NETSMTP"];
                string strUserName = ConfigurationManager.AppSettings["NETUSERNAME"];
                string strPassword = ConfigurationManager.AppSettings["NETPASSWORD"];
        
                MailMessage message = new MailMessage();
                message.From = new MailAddress(strUserName, "EnosisLearning");
                if (txtto.Text.Length > 0)
                {
                    message.To.Add(txtto.Text.Trim());
                }
                else
                {
                    Response.Write("Please enter To Address");
                }
                if (txtcc.Text.Length > 0)
                {
                    message.CC.Add(txtcc.Text.Trim());
                }
                else
                {
                }
                if (txtsubject.Text.Length > 0)
                {
                    message.Subject = txtsubject.Text.Trim();
                }
                else
                {
                    message.Subject = "TrafficFine";
                }
                if (txtbody.Text.Length > 0)
                {
                    message.Body = txtbody.Text.Trim();
                }
                else
                {
                    message.Body = "TrafficFine";
                }
                message.Priority = MailPriority.High;
#pragma warning disable CS0219 // The variable 'fullPath' is assigned but its value is never used
                string fullPath = "";
#pragma warning restore CS0219 // The variable 'fullPath' is assigned but its value is never used

                string appPath = HttpContext.Current.Request.ApplicationPath;
                string physicalPath = HttpContext.Current.Request.MapPath(appPath);
                

                if (hykFile1.Text.Length > 0)
                {
                    
                    if (Session["RADOCPATH"] != null)
                    {
                        string phyfinalpath = physicalPath + "/" + Session["RADOCPATH"].ToString();
                        message.Attachments.Add(new Attachment(phyfinalpath));
                    }
                }
                if (hykFile2.Text.Length > 0)
                {
                    
                    if (Session["FINEDOCPATH"] != null)
                    {
                        string finepath = physicalPath + "/" + Session["FINEDOCPATH"].ToString();

                        message.Attachments.Add(new Attachment(finepath));
                    }
                }

                if (hykFile3.Text.Length > 0)
                {
                   if (Session["ADMINLETTER"] != null)
                    {
                        string path = Session["ADMINLETTER"].ToString();
                        message.Attachments.Add(new Attachment(path));
                    }
                }
                if (hykFile4.Text.Length > 0)
                {
                     if (Session["INVOICE"] != null)
                    {
                        string path = Session["INVOICE"].ToString();
                        message.Attachments.Add(new Attachment(path));
                    }
                }
               
                
                message.IsBodyHtml = true;
                NetworkCredential loginInfo = new NetworkCredential(strUserName,strPassword);
                SmtpClient client = new SmtpClient(strSMTP);
                client.UseDefaultCredentials = false;
                client.Credentials = loginInfo;
                client.Send(message);

                message.Dispose();
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent sucessfully.');", true);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}