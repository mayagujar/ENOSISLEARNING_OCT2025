﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ENOSISLEARNING
{
    public partial class Articles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    BindFiles();
                }
            }
            catch (Exception ex)
            {
             //   lblError.Text = ex.Message;
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }
        }
        private void BindFiles()
        {
            List<FileModel> lstFiles = new List<FileModel>();

            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Articles"));
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
            grvFiles.DataSource = lstFiles;
            grvFiles.DataBind();

        }
        protected void grvFiles_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string filename = grvFiles.SelectedDataKey.Value.ToString();
                // Get the physical Path of the file(test.doc)
                string filepath = Server.MapPath(@"~\Articles\" + filename);
                // Create New instance of FileInfo class to get the properties of the file being downloaded
                FileInfo file = new FileInfo(filepath);
                // Checking if file exists 
                //if (file.Exists)

                // Clear the content of the response 
                Response.ClearContent();
                // LINE1: Add the file name and attachment, which will force the open/cance/save dialog to show, to the header
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);

                // Add the file size into the response header
                Response.AddHeader("Content-Length", file.Length.ToString());
                // Set the Content Type 
                Response.ContentType = FILEOPERATIONS.ReturnExtension(file.Extension.ToLower());
                // Write the file into the response (TransmitFile is for ASP.NET 2.0. In ASP.NET 1.1 you have to use WriteFile instead)
                Response.TransmitFile(file.FullName);
                // End the response 
                Response.End();
            }
            catch (Exception ex)
            {
              //  lblError.Text = ex.Message;
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }

        }


    }
}