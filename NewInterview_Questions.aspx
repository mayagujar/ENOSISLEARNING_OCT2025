<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="NewInterview_Questions.aspx.cs" Inherits="ENOSISLEARNING.NewInterview_Questions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <link href="../css/demo.css" rel="stylesheet" type="text/css" />
    <link href="../css/styles.css" rel="stylesheet" type="text/css" />
    <link href="../css/searchCandidate.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui.min.js"></script>


    <script src="../js/jquery-1.12.4.min.js" ></script>


    <link rel="stylesheet" href="../css/jquery-ui.css" />

     <link rel="stylesheet" href="../css/bootstrap-theme.min2.css"/>
<style>

    
.box{
color: #fff;
background: #ccc;
font-family: 'Ubuntu', sans-serif;
overflow: hidden;
position: relative;
transition: all 0.3s ease-in-out;
height:200px;
width:360px;
}
.box:hover{ box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); }
.box img{
width: 100%;
height: auto;
transition: all 0.3s ease;
}
.box:hover img{
opacity: 0.6;
filter: grayscale(100%);
}
.box .box-content{
color: #fff;
background: linear-gradient(to right, transparent,transparent,rgba(34,47,61,0.9),#222f3d,#222f3d);
text-align: right;
width: 100%;
padding: 15px 15px 15px 60px;
transform: translateY(-50%) scaleY(0);
position: absolute;
top: 50%;
right: 0;
transition: all 0.3s ease-in-out;
}
.box:hover .box-content{ transform: translateY(-50%) scaleY(1); }
.box .title{
font-size: 20px;
font-weight: 800;
letter-spacing: 1px;
text-transform: uppercase;
margin: 0 0 4px;
}
.box .post{
font-size: 15px;
font-style: italic;
text-transform: capitalize;
margin: 0 0 5px;
display: block;
}
.box .icon{
padding: 0;
margin: 0;
list-style: none;
transform: translate(-100%, -50%);
position: absolute;
top: 50%;
left: 0;
transition: all 0.3s ease-in-out;
}
.box:hover .icon{ transform: translate(0, -50%); }
.box .icon li a{
color: #222f3d;
background: #fff;
font-size: 20px;
text-align:center;
line-height: 40px;
height: 40px;
width: 40px;
display: block;
transition: all 0.3s ease;
}
.box .icon li  a:hover{ box-shadow: 0 0 5px #222f3d inset; }
@media only screen and (max-width:990px){
.box { margin: 0 0 30px; }
}

.box img {
width: 100%;
height:200px;
transition: all 0.3s ease;
}
.row
{
margin-right: 0px;
margin-left: -50px;
}
hr
{
height:5px;
width:50px;
margin:0 auto;
border:none;
border-radius:10px;
background:linear-gradient(to left ,blue ,red);
}
hr:hover
{
background:linear-gradient(to right,yellow,black);
}

.my-navbar {
    background-color: #fff;
}
.my-navbar a{
	color:#006495;
}


    @media screen and (max-width: 750px)
    {
        .container
        {
        margin-left:46px;
        }

    }
    .box-footer {
    text-align: center;
}

.box-footer p {
    font-size: 16px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
     <div class="row">
     <div class="col-lg-12 col-sm-12">
         <div class="training-program"><h3>Interview Questions & Answers</h3></div>
     </div>
 </div>
<div class="row">
<div class="col-md-4 col-sm-6">
<div class="box">
   <a href="Interview_Questions.aspx?lag=C">
        <img src="Images/C-Training-In-Pune.jpg" />
        <div class="box-content">
            <h3 class="title">C</h3>
            <span class="post">Questions And Answers.</span>
        </div>
    </a>  
   </div>
    <!-- Footer inside the box -->
    <div class="box-footer">
         <p style="padding-left:13%;">C Related Interview Questions And Answers.</p>
    </div>
</div>

<div class="col-md-4 col-sm-6">
             
<div class="box">
   <a href="Interview_Questions.aspx?lag=CPP">
        <img src="Images/C++Training-In-Pune.jpg" />
        <div class="box-content">
            <h3 class="title">C++</h3>
            <span class="post"> Questions And Answers.</span>
        </div>
    </a>  
   </div>
    <!-- Footer inside the box -->
    <div class="box-footer">
         <p style="padding-left:13%;">C++ Related Interview Questions And Answers.</p>
    </div>
</div>
<div class="col-md-4 col-sm-6">
<div class="box">
<a href="Interview_Questions.aspx?lag=JAVA"><img src="Images/Java.jpg" />
<div class="box-content">
<h3 class="title">Full Stack JAVA</h3>
<span class="post">Questions And Answers.</span>
</div></a>                
</div>
 <!-- Footer inside the box -->
 <div class="box-footer">
      <p style="padding-left:13%;">Java Related Interview Questions And Answers.</p>
 </div>      
</div>         
</div>
        <%-- Second Row --%>
<div class="row">
<div class="col-md-4 col-sm-6">
<div class="box">
   <a href="Interview_Questions.aspx?lag=CSHARP">
        <img src="Images/C-Sparp-Training-In-Pune.jpg" />
        <div class="box-content">
            <h3 class="title">C#</h3>
            <span class="post">Questions And Answers.</span>
        </div>
    </a>  
   </div>
    <!-- Footer inside the box -->
    <div class="box-footer">
         <p style="padding-left:13%;">C# Related Interview Questions And Answers.</p>
    </div>
</div>

<div class="col-md-4 col-sm-6">
             
<div class="box">
   <a href="Interview_Questions.aspx?lag=ASP.NET">
        <img src="Images/ASP.NET.jpg" />
        <div class="box-content">
            <h3 class="title">Asp.Net</h3>
            <span class="post"> Questions And Answers.</span>
        </div>
    </a>  
   </div>
    <!-- Footer inside the box -->
    <div class="box-footer">
         <p style="padding-left:13%;">Asp.Net Related Interview Questions And Answers.</p>
    </div>
</div>
<div class="col-md-4 col-sm-6">
<div class="box">
<a href="Interview_Questions.aspx?lag=MVC"><img src="Images/MVC-Training-Pune.png" />
<div class="box-content">
<h3 class="title">Asp.Net MVC</h3>
<span class="post">Questions And Answers.</span>
</div></a>                
</div>
 <!-- Footer inside the box -->
 <div class="box-footer">
      <p style="padding-left:13%;">Asp.Net MVC Related Interview Questions And Answers.</p>
 </div>      
</div>         
</div>
        <%-- Third Row --%>
<div class="row">
<div class="col-md-4 col-sm-6">
<div class="box">
   <a href="Interview_Questions.aspx?lag=SQLSERVER">
        <img src="Images/SQL-Server-Training.png" />
        <div class="box-content">
            <h3 class="title">SQL Server</h3>
            <span class="post">Questions And Answers.</span>
        </div>
    </a>  
   </div>
    <!-- Footer inside the box -->
    <div class="box-footer">
         <p style="padding-left:13%;">SSIS Related Interview Questions And Answers.</p>
    </div>
</div>

<div class="col-md-4 col-sm-6">
             
<div class="box">
   <a href="Interview_Questions.aspx?lag=SSIS">
        <img src="Images/SsisLanguage.png" />
        <div class="box-content">
            <h3 class="title">SSIS</h3>
            <span class="post">Questions And Answers.</span>
        </div>
    </a>  
   </div>
    <!-- Footer inside the box -->
    <div class="box-footer">
         <p style="padding-left:13%;">SSIS Related Interview Questions And Answers.</p>
    </div>
</div>
<div class="col-md-4 col-sm-6">
<div class="box">
<a href="Interview_Questions.aspx?lag=SSRS"><img src="Images/SSRSLanguage.png" />
<div class="box-content">
<h3 class="title">SSRS</h3>
<span class="post">SSRS Questions And Answers.</span>
</div></a>                
</div>
 <!-- Footer inside the box -->
 <div class="box-footer">
      <p style="padding-left:13%;">SSRS Related Interview Questions And Answers.</p>
 </div>      
</div>         
</div>
        <%-- Forth Row --%>
<div class="row">
<div class="col-md-4 col-sm-6">
<div class="box">
   <a href="Interview_Questions.aspx?lag=SSAS">
        <img src="Images/ssas.png" />
        <div class="box-content">
            <h3 class="title">SSAS</h3>
            <span class="post">Questions And Answers.</span>
        </div>
    </a>  
   </div>
    <!-- Footer inside the box -->
    <div class="box-footer">
         <p style="padding-left:13%;">SSAS Related Interview Questions And Answers.</p>
    </div>
</div>

<div class="col-md-4 col-sm-6">
             
<div class="box">
   <a href="Interview_Questions.aspx?lag=POWERBI">
        <img src="Images/powerbi.jpg" />
        <div class="box-content">
            <h3 class="title">Power BI</h3>
            <span class="post"> Questions And Answers.</span>
        </div>
    </a>  
   </div>
    <!-- Footer inside the box -->
    <div class="box-footer">
         <p style="padding-left:13%;">Power BI Related Interview Questions And Answers.</p>
    </div>
</div>
<div class="col-md-4 col-sm-6">
<div class="box">
<a href="Interview_Questions.aspx?lag=MANUALTESTING"><img src="Images/ManualTestingLanguage.png" />
<div class="box-content">
<h3 class="title">Manual Testing</h3>
<span class="post">Questions And Answers.</span>
</div></a>                
</div>
 <!-- Footer inside the box -->
 <div class="box-footer">
      <p style="padding-left:13%;">Manual Testing Related Interview Questions And Answers.</p>
 </div>      
</div>         
</div>
        <%-- Fifth Row --%>
<div class="row">
<div class="col-md-4 col-sm-6">
<div class="box">
   <a href="Interview_Questions.aspx?lag=SELENIUM">
        <img src="Images/SeleniumLanguage.png" />
        <div class="box-content">
            <h3 class="title">Selenium</h3>
            <span class="post">Questions And Answers.</span>
        </div>
    </a>  
   </div>
    <!-- Footer inside the box -->
    <div class="box-footer">
         <p style="padding-left:13%;">Selenium Related Interview Questions And Answers.</p>
    </div>
</div>

<div class="col-md-4 col-sm-6">
             
<div class="box">
   <a href="Interview_Questions.aspx?lag=WEBDESIGNING">
        <img src="Images/WebDesignLanguage.png" />
        <div class="box-content">
            <h3 class="title">Web Design</h3>
            <span class="post"> Questions And Answers.</span>
        </div>
    </a>  
   </div>
    <!-- Footer inside the box -->
    <div class="box-footer">
         <p style="padding-left:13%;">Web Design Related Interview Questions And Answers.</p>
    </div>
</div>
</div>
</div>
</asp:Content>
