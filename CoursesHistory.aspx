<%@ Page Title="" Language="C#" MasterPageFile="~/learningSearch.Master" AutoEventWireup="true" CodeBehind="CoursesHistory.aspx.cs" Inherits="ENOSISLEARNING.Courseshist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/demo.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/searchCandidate.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:GridView ID="historygrid" runat="server"  AllowPaging="true"  PageSize="20" PagerSettings-Mode="NumericFirstLast" CssClass="table table-striped table-hover my-table" HeaderStyle-BackColor="SeaShell" Height="418px" Width="800px" ></asp:GridView>
 </center>
</asp:Content>
