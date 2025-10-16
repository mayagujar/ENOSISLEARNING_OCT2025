﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteErrors.aspx.cs" Inherits="ENOSISLEARNING.SiteErrors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
           .EU_TableScroll
        {
            max-height: 275px;
            overflow: auto;
            border:1px solid #ccc;
           
        }
        .EU_DataTable
        {
            border-collapse: collapse;
            }
            .EU_DataTable tr th
            {
                background-color: #3c454f;
                color:palegreen;
                padding: 10px 5px 10px 5px;
                border: 1px solid #cccccc;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 14px;
                font-weight:bold;
                text-transform:capitalize;
            }
            .EU_DataTable tr:nth-child(2n+2)
            {
                background-color: #f3f4f5;
            }

            .EU_DataTable tr:nth-child(2n+1) td
            {
                background-color: #d6dadf;
                color: #454545;
                font-weight:200;
            }
            .EU_DataTable tr td
            {
                padding: 5px 10px 5px 10px;
                color: #454545;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 13px;
                border: 1px solid #cccccc;
                vertical-align: middle;
            }
                .EU_DataTable tr td:first-child
                {
                    text-align: center;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr> 
<td>   
<asp:GridView ID="grvErrors" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="EU_DataTable">
<AlternatingRowStyle BackColor="White" />
<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            
</asp:GridView>
</td>
</tr>




</table>
</div>
        </div>
    </form>
</body>
</html>
