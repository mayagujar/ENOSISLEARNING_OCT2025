using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace ENOSISLEARNING
{
    public partial class QuestionPapers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindC();
                BindCPP();
                BindJava();
                BindNet();
                BindAspNet();
                BindSQL();

                BindTesting();
                BindDesigning();
                BindPowerBI();
              
                
            }
        }
        private void BindC()
        {
            List<FileModel> lstFiles = new List<FileModel>();


            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/QuestionPapers/C"));
            int i = 0;
            foreach (var item in dirInfo.GetFiles())
            {
                lstFiles.Add(new FileModel()
                {
                    Id = i + 1,
                    Name = item.Name,
                    Path = dirInfo.FullName + @"\" + item.Name
                });
                i = i + 1;
            }
            grvC.DataSource = lstFiles;
            grvC.DataBind();

        }

        private void BindCPP()
        {
            List<FileModel> lstFiles = new List<FileModel>();


            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/QuestionPapers/CPP"));
            int i = 0;
            foreach (var item in dirInfo.GetFiles())
            {
                lstFiles.Add(new FileModel()
                {
                    Id = i + 1,
                    Name = item.Name,
                    Path = dirInfo.FullName + @"\" + item.Name
                });
                i = i + 1;
            }
            grvCPP.DataSource = lstFiles;
            grvCPP.DataBind();

        }

        private void BindJava()
        {
            List<FileModel> lstFiles = new List<FileModel>();


            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/QuestionPapers/Java"));
            int i = 0;
            foreach (var item in dirInfo.GetFiles())
            {
                lstFiles.Add(new FileModel()
                {
                    Id = i + 1,
                    Name = item.Name,
                    Path = dirInfo.FullName + @"\" + item.Name
                });
                i = i + 1;
            }
            grvJava.DataSource = lstFiles;
            grvJava.DataBind();

        }

        private void BindNet()
        {
            List<FileModel> lstFiles = new List<FileModel>();


            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/QuestionPapers/Net"));
            int i = 0;
            foreach (var item in dirInfo.GetFiles())
            {
                lstFiles.Add(new FileModel()
                {
                    Id = i + 1,
                    Name = item.Name,
                    Path = dirInfo.FullName + @"\" + item.Name
                });
                i = i + 1;
            }
            grvNet.DataSource = lstFiles;
            grvNet.DataBind();

        }

        private void BindAspNet()
        {
            List<FileModel> lstFiles = new List<FileModel>();


            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/QuestionPapers/Asp.Net"));
            int i = 0;
            foreach (var item in dirInfo.GetFiles())
            {
                lstFiles.Add(new FileModel()
                {
                    Id = i + 1,
                    Name = item.Name,
                    Path = dirInfo.FullName + @"\" + item.Name
                });
                i = i + 1;
            }
            grvAsp.DataSource = lstFiles;
            grvAsp.DataBind();

        }

        private void BindSQL()
        {
            List<FileModel> lstFiles = new List<FileModel>();


            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/QuestionPapers/SQL"));
            int i = 0;
            foreach (var item in dirInfo.GetFiles())
            {
                lstFiles.Add(new FileModel()
                {
                    Id = i + 1,
                    Name = item.Name,
                    Path = dirInfo.FullName + @"\" + item.Name
                });
                i = i + 1;
            }
            grvSQL.DataSource = lstFiles;
            grvSQL.DataBind();

        }

        private void BindTesting()
        {
            List<FileModel> lstFiles = new List<FileModel>();


            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/QuestionPapers/Testing"));
            int i = 0;
            foreach (var item in dirInfo.GetFiles())
            {
                lstFiles.Add(new FileModel()
                {
                    Id = i + 1,
                    Name = item.Name,
                    Path = dirInfo.FullName + @"\" + item.Name
                });
                i = i + 1;
            }
            grvTesting.DataSource = lstFiles;
            grvTesting.DataBind();

        }

        private void BindDesigning()
        {
            List<FileModel> lstFiles = new List<FileModel>();


            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/QuestionPapers/Designing"));
            int i = 0;
            foreach (var item in dirInfo.GetFiles())
            {
                lstFiles.Add(new FileModel()
                {
                    Id = i + 1,
                    Name = item.Name,
                    Path = dirInfo.FullName + @"\" + item.Name
                });
                i = i + 1;
            }
            grvDesigning.DataSource = lstFiles;
            grvDesigning.DataBind();

        }


        private void BindPowerBI()
        {
            List<FileModel> lstFiles = new List<FileModel>();


            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/QuestionPapers/POWERBI"));
            int i = 0;
            foreach (var item in dirInfo.GetFiles())
            {
                lstFiles.Add(new FileModel()
                {
                    Id = i + 1,
                    Name = item.Name,
                    Path = dirInfo.FullName + @"\" + item.Name
                });
                i = i + 1;
            }
            grvPowerBI.DataSource = lstFiles;
            grvPowerBI.DataBind();

        }
    }
}