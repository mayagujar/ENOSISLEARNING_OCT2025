﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ENOSISLEARNING
{
    public class FileModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Path { get; set; }
    }
    public static class FILEOPERATIONS
    {
        public static string ReturnExtension(string fileExtension)
        {
            switch (fileExtension)
            {
                case ".htm":
                case ".html":
                case ".log": return "text/HTML";
                case ".txt": return "text/plain";
                case ".doc": return "application/ms-word";
                case ".docx": return "application/ms-word";
                case ".tiff":
                case ".tif": return "image/tiff";
                case ".asf": return "video/x-ms-asf";
                case ".avi": return "video/avi";
                case ".zip": return "application/zip";
                case ".xls":
                case ".csv": return "application/vnd.ms-excel";
                case ".gif": return "image/gif";
                case ".jpg":
                case "jpeg": return "image/jpeg";
                case ".bmp": return "image/bmp";
                case ".wav": return "audio/wav";
                case ".mp3": return "audio/mpeg3";
                case ".mpg":
                case "mpeg": return "video/mpeg";
                case ".rtf": return "application/rtf";
                case ".asp": return "text/asp";
                case ".pdf": return "application/pdf";
                case ".fdf": return "application/vnd.fdf";
                case ".ppt": return "application/mspowerpoint";
                case ".dwg": return "image/vnd.dwg";
                case ".msg": return "application/msoutlook";
                case ".xml":
                case ".sdxl": return "application/xml";
                case ".xdp": return "application/vnd.adobe.xdp+xml";
                default:
                    return "application/octet-stream";
            }
        }
    }
}