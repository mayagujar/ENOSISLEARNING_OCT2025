<%@ Page Title="" Language="C#" MasterPageFile="~/learningSearch.Master" AutoEventWireup="true" CodeBehind="ShowCounsellorCandidates.aspx.cs" Inherits="ENOSISLEARNING.ShowCounsellorCandidates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="css/demo.css" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />
    <link href="css/searchCandidate.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <%--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <%--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
    <%-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />--%>
    <link href="Dashboard_File/css/bootstrap.min.css" rel="stylesheet" />
    <link href="./assets/main.css" rel="stylesheet" />
    <link href="css/searchcss.css" rel="stylesheet" />
    

    <link rel="stylesheet" href="css/bootstrap-theme.min2.css" />
    <script src="js/jquery.min2.js"></script>
    <script src="js/bootstrap.min2.js"></script>


 
<style>
body {
background-color:#fff;
}
.hide-div {
display: none;
}
.crousel-bg {
padding:0px;
}
.add-candidate {
height: 34px;
margin: 0 auto;
background: url(images/employee-details-main-h.png) repeat-x;
line-height: 32px;
padding-left: 20px;
font-family: arial;
font-size: 14px;
font-weight: bold;
color: #368aff;       
}
.add-candidate h5{
padding:10px;
color:#1C71BB;
font-weight:bold;
font-family:15px!important;  
}
.baccolor {
color:blue;
            
}
.registration_tabl h5 {
padding:0px 0px;
color:#1C71BB;
font-weight:bold;
font-family:17px;  
}
.myhr {
margin-top: 20px!important;
margin-bottom:0px!important;
border: 0;
border-top: 2px solid #069;
}
input[type="radio"], input[type="checkbox"] {
margin: 7px 0 0 0;
line-height: normal;
}
       
.css3-shadow

{
position:relative;
-webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3);
box-shadow:0 1px 4px rgba(0, 0, 0, 0.3);
}

.css3-shadow:after
{
content:"";
position:absolute;
z-index:-1;
-webkit-box-shadow:0 0 40px rgba(0,0,0,0.8);
box-shadow:0 0 40px rgba(0,0,0,0.8);
bottom:0px;
width:80%;
height:50%;
-moz-border-radius:100%;
border-radius:100%;
left:10%;
right:10%;
}

</style>

<link rel="stylesheet" href="css/bootstrap-theme.min2.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
&nbsp;
</div>
<center>
<table  style="font-size:14px;" Width="800px" >
<tr>
<td >
<center>
<h4 class="upld-resume" >ADMISSION MADE FOR THE MONTH OF : <asp:Label ID="lblMonth" Font-Bold="true" runat="server" /> IN THE YEAR : <asp:Label ID="lblYear"  Font-Bold="true"  runat="server" /> FOR COURSE : <asp:Label ID="lblCourse"  Font-Bold="true" runat="server" /></h4>
</center>
                 


<br />
</td>
</tr>

</table>
<div>
<asp:GridView ID="grvCounsellorCandidates"  AutoGenerateColumns="true" runat="server"
EmptyDataText="No records has been added." Width="600px"
AllowPaging="true"  PageSize="12" PagerSettings-Mode="NumericFirstLast"  PagerStyle-HorizontalAlign="Right"  PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" Visible="true"  
CssClass="table table-striped table-hover my-table" HeaderStyle-BackColor="SeaShell"    >
<PagerStyle HorizontalAlign="Right" ForeColor="Black" CssClass ="right-pagination"/>
                    
</asp:GridView>

</div>
<div>
<asp:Button ID="btnBack" runat="server" Width="250px"   height="35px" Text="Back To Search Candidates" CssClass="btn-frm-bt1" style="color: #fff;" OnClick="btnBack_Click"/>

</div>
</center>
</asp:Content>
