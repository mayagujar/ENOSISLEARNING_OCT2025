<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" Async="true" CodeBehind="Index.aspx.cs" Inherits="ENOSISLEARNING.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="index, follow" />
<title>.Net training,.Net Course,.Net Institute | Enosis Learning</title>
<meta name="description" content=".Net Training,.Net Course,.net institute,.Net training in pune" />
<meta name="keywords" content="C# training, C# training in pune " />
<%--<link href="css/enosis.css" rel="stylesheet" />--%>
  <style>
      #colorbox #cboxClose {
          top: 0;
          right: 0;
      }

      #cboxLoadedContent {
          margin-top: 28px;
          margin-bottom: 0;
      }

      .myul li {
          padding: 5px;
          line-height: 40px;
          margin: 28px;
          border-radius: 3px;
          list-style: none;
          display: inline;
          background-color: #006495;
          border-color: #006495;
          color: white;
      }

      @media screen and (min-width: 768px) {
          .myul li {
              margin: 16px;
          }
      }

      .myul li a {
          color: white;
          outline: none;
          text-decoration: none;
      }

          .myul li a:hover {
              font-style: oblique;
              color: #ff6a00;
          }


      .close {
          float: right;
          font-size: 21px;
          line-height: 1;
          color: white;
          opacity: 1;
      }

      .modal-content {
          position: relative;
          background-color: #fff;
          background-clip: padding-box;
          border: 1px solid rgba(0, 0, 0, .2);
          outline: 0;
      }




      .my-form-control {
          font-size: 15px;
          font-family: 'Montserrat', sans-serif;
          border: 1px solid #999;
          padding: 0px 0px 0px 9px;
          box-shadow: none;
          width: 100%;
      }

      .modal-body {
          position: relative;
          padding: 15px;
          float: left;
          width: 100%;
          background: #f0efef;
      }

      .modal-footer {
          padding: 15px;
          text-align: right;
          border-top: 1px solid #e5e5e5;
          float: left;
          width: 100%;
          background: #f0efef;
      }

      .modal-header {
          min-height: 16.42857143px;
          padding: 15px;
          border-bottom: 1px solid #e5e5e5;
          float: left;
          width: 100%;
          background: #006495;
          color: white;
      }




      @media screen and (max-width: 750px) {

          .myul li {
              margin: 16px;
          }
      }
  </style>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    <script src="js/jquery.min.js"> </script> 
    <script src="js/jquery.colorbox-min.js" ></script>

    <%--<script src="http://www.jacklmoore.com/colorbox/jquery.colorbox.js"></script>--%>
    
    <div id="crousel" class="container-fluid crousel-bg">
        <div class="container">
    <div class="row">
        <div class="col-lg-12 col-sm-12">
            <div class="training-program"><h3>Enosis Learning Training Programs</h3></div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
    <div class="course-enqiry">
    <div class="panel-group" id="accordion">
    
    <!--Full Stack .Net Start -->
    <div class="panel panel-default">
    <div class="panel-heading my-panel-heading">
    <h4 class="panel-title">
    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3"><span class="fa fa-plus myicon"></span>Full Stack.Net(C#,SQL SERVER,ADO.NET,HTML,CSS,ASP.NET,ASP.NET MVC,EF,WEB API,JQUERY)</a>
    </h4>
    </div>
    <div id="collapse3" class="panel-collapse collapse in">
    <div class="panel-body">
    <ul class="acordion-sub-option">
    <li><a href="#" class="btn-accordion" data-toggle="modal" data-target="#largeModal3"><span class="fa fa-book"></span> Course Syllabus</a>
    <div id="largeModal3" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg">
    <div class="modal-content">
    <div class="modal-header">
    <a  href="courses/Img/ENOSIS_FullStack.Net_CourseContents.pdf" class="btn btn-primary"  target="_blank" >Download</a>
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    </div>
    <div class="modal-body">
    <div class="col-lg-12">
      <object data="courses/Img/ENOSIS_FullStack.Net_CourseContents.pdf" type="application/pdf"  style="width:100%;height:100vh;">
</object>



 

        </div>
    </div>
    </div>
    </div>
    </div>
    </li>
                                            
    <li><a href="#" class="upld-resume" style="background-color: #55acee;" data-toggle="modal" data-target="#myModal"><span class="fa fa-send"></span> Request For Demo</a>
    <div class="modal fade" tabindex="-1" role="dialog"></div>
    </li>
    </ul>
    </div>
    </div>
    </div>


     <!--.Net Core Course Contents -->
 <div class="panel panel-default">
 <div class="panel-heading my-panel-heading">
 <h4 class="panel-title">
 <a data-toggle="collapse" data-parent="#accordion" href="#collapseNC"><span class="fa fa-plus myicon"></span>.Net Core Course Contents</a>
 </h4>
 </div>
 <div id="collapseNC" class="panel-collapse collapse">
 <div class="panel-body">
 <ul class="acordion-sub-option">
 <li><a href="#" class="btn-accordion" data-toggle="modal" data-target="#largeModalNC"><span class="fa fa-book"></span> Course Syllabus</a>
 <div id="largeModalNC" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
 <div class="modal-dialog modal-lg">
 <div class="modal-content">
 <div class="modal-header">
 <a href="courses/Img/ENOSIS_.Net-Core_CourseContents.pdf" class="btn btn-primary"  target="_blank" >Download</a>
 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
 </div>
 <div class="modal-body">
 <div class="col-lg-12">
  <object data="courses/Img/ENOSIS_.Net-Core_CourseContents.pdf" type="application/pdf"  style="width:100%;height:100vh;">

     </object>

 
 </div>
 </div>
 </div>
 </div>
 </div>
 </li>
                                         
 <li><a href="#" class="upld-resume" style="background-color: #55acee;" data-toggle="modal" data-target="#myModal"><span class="fa fa-send"></span> Request For Demo</a>
 <div class="modal fade" tabindex="-1" role="dialog"></div>
 </li>
 </ul>
 </div>
 </div>
 </div>
    <!--Full Stack Java Start -->
    <div class="panel panel-default">
    <div class="panel-heading my-panel-heading">
    <h4 class="panel-title">
    <a data-toggle="collapse" data-parent="#accordion" href="#collapse5"><span class="fa fa-plus myicon"></span>Full Stack Java</a>
    </h4>
    </div>
    <div id="collapse5" class="panel-collapse collapse">
    <div class="panel-body">
    <ul class="acordion-sub-option">
    <li><a href="#" class="btn-accordion" data-toggle="modal" data-target="#largeModal5"><span class="fa fa-book"></span> Course Syllabus</a>
    <div id="largeModal5" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg">
    <div class="modal-content">
    <div class="modal-header">
    <a href="courses/Img/ENOSIS_FullStackJavaCourseContents.pdf" class="btn btn-primary"  target="_blank" >Download</a>
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    </div>
    <div class="modal-body">
    <div class="col-lg-12">
    
         <object data="courses/Img/ENOSIS_FullStackJavaCourseContents.pdf" type="application/pdf"  style="width:100%;height:100vh;" >
         </object>


    </div>
    </div>
                                                   
    </div>
    </div>
    </div>
    </li>
                                           
    <li><a href="#" class="btn-accordion" style="background-color: #55acee;"  data-toggle="modal" data-target="#myModal"><span class="fa fa-send"></span> Request For Demo</a>
    <div class="modal fade" tabindex="-1" role="dialog"></div>
    </li>
    </ul>
    </div>
    </div>
    </div>

     <!--Data Analystics Start -->
 <div class="panel panel-default">
 <div class="panel-heading my-panel-heading">
 <h4 class="panel-title">
 <a data-toggle="collapse" data-parent="#accordion" href="#dcollapse7"><span class="fa fa-plus myicon"></span>Data Analytics (SQL SERVER, POWER BI, DAX, MQUERY,PYTHON,RSCRIPTS)</a>
 </h4>
 </div>
 <div id="dcollapse7" class="panel-collapse collapse">
 <div class="panel-body">
 <ul class="acordion-sub-option">
 <li><a href="#" class="btn-accordion" data-toggle="modal" data-target="#dlargeModal7"><span class="fa fa-book"></span> Course Syllabus</a>                        
 <div id="dlargeModal7" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
 <div class="modal-dialog modal-lg">
 <div class="modal-content">
 <div class="modal-header">
 <a href="courses/Img/Enosis_DATAANALYTICS_CourseContents.pdf" class="btn btn-primary"  target="_blank" >Download</a>
 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
 </div>
 <div class="modal-body">
 <div class="col-lg-12 course_list">
     
     <object data="courses/Img/Enosis_DATAANALYTICS_CourseContents.pdf" type="application/pdf"  style="width:100%;height:100vh;">
    </object>

 
 </div>
 </div>
 </div>
 </div>
 </div>
 </li>
                                                                                     
 <li><a href="#" class="btn-accordion"  data-toggle="modal" data-target="#myModal"><span class="fa fa-send"></span> Request For Demo</a>
 <div class="modal fade" tabindex="-1" role="dialog"></div>
 </li>
 </ul>
 </div>
 </div>
 </div>

     <!--SQL SEREVR 2022 Start -->
 <div class="panel panel-default">
 <div class="panel-heading my-panel-heading">
 <h4 class="panel-title">
 <a data-toggle="collapse" data-parent="#accordion" href="#collapse7"><span class="fa fa-plus myicon"></span>SQL SERVER 2022 </a>
 </h4>
 </div>
 <div id="collapse7" class="panel-collapse collapse">
 <div class="panel-body">
 <ul class="acordion-sub-option">
 <li><a href="#" class="btn-accordion" data-toggle="modal" data-target="#largeModal7"><span class="fa fa-book"></span> Course Syllabus</a>                        
 <div id="largeModal7" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
 <div class="modal-dialog modal-lg">
 <div class="modal-content">
 <div class="modal-header">
 <a href="courses/Img/ENOSIS_SQLSERVER_CourseContents.pdf" class="btn btn-primary"  target="_blank" >Download</a>
 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
 </div>
 <div class="modal-body">
 <div class="col-lg-12 course_list">
     <object data="courses/Img/ENOSIS_SQLSERVER_CourseContents.pdf" type="application/pdf"  style="width:100%;height:100vh;">
     </object>


 <%--<img src="courses/Img/ENOSIS_SQLSERVER_CourseContents.pdf"  style="width:100%;" alt="SQL SERVER training course content" title="SQL SERVER 2016 BROCHURE" />
 --%>
 </div>
 </div>
 </div>
 </div>
 </div>
 </li>
                                                                                     
 <li><a href="#" class="btn-accordion"  data-toggle="modal" data-target="#myModal"><span class="fa fa-send"></span> Request For Demo</a>
 <div class="modal fade" tabindex="-1" role="dialog"></div>
 </li>
 </ul>
 </div>
 </div>
 </div>


 <!--POWER BI Start -->
 <div class="panel panel-default">
 <div class="panel-heading my-panel-heading">
 <h4 class="panel-title">
 <a data-toggle="collapse" data-parent="#accordion" href="#PBI"><span class="fa fa-plus myicon"></span>POWER BI </a>
 </h4>
 </div>
 <div id="PBI" class="panel-collapse collapse">
 <div class="panel-body">
 <ul class="acordion-sub-option">
 <li><a href="#" class="btn-accordion" data-toggle="modal" data-target="#PBINEW"><span class="fa fa-book"></span> Course Syllabus</a>
                      
 <div id="PBINEW" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
 <div class="modal-dialog modal-lg">
 <div class="modal-content">
 <div class="modal-header">
 <a href="courses/Img/ENOSIS_POWERBI_CourseContents.pdf" class="btn btn-primary"  target="_blank" >Download</a>
 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
 </div>
 <div class="modal-body">
 <div class="col-lg-12 course_list">
       <object data="courses/Img/ENOSIS_POWERBI_CourseContents.pdf" type="application/pdf"  style="width:100%;height:100vh;">
       </object>

 
 </div>
 </div>
 </div>
 </div>
 </div>
 </li>
                                         
 <li><a href="#" class="btn-accordion"  data-toggle="modal" data-target="#myModal"><span class="fa fa-send"></span> Request For Demo</a>
 <div class="modal fade" tabindex="-1" role="dialog"></div>
 </li>
 </ul>
 </div>
 </div>
 </div>

    <!--Web Designing Start -->
    <div class="panel panel-default">
    <div class="panel-heading my-panel-heading">
    <h4 class="panel-title">
    <a data-toggle="collapse" data-parent="#accordion" href="#collapse8"><span class="fa fa-plus myicon"></span>Web Designing ( HTML, CSS, HTML5, CSS3, Photoshop, Illustrator, Responsive Design, Javascript ) </a>
    </h4>
    </div>
    <div id="collapse8" class="panel-collapse collapse">
    <div class="panel-body">
    <ul class="acordion-sub-option">
    <li><a href="#" class="btn-accordion" data-toggle="modal" data-target="#largeModal8"><span class="fa fa-book"></span> Course Syllabus</a>
                         
    <div id="largeModal8" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg">
    <div class="modal-content">
    <div class="modal-header">
    <a href="courses/Img/ENOSIS_WebDesigningCourseContents.pdf" class="btn btn-primary"  target="_blank" >Download</a>
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                       
    </div>
    <div class="modal-body">
    <div class="col-lg-12">
              <object data="courses/Img/ENOSIS_WebDesigningCourseContents.pdf" type="application/pdf"  style="width:100%;height:100vh;">
              </object>


    
    </div>
    </div>
    </div>
    </div>
    </div>
    </li>
                                            
                                            
    <li><a href="#" class="btn-accordion"  data-toggle="modal" data-target="#myModal"><span class="fa fa-send"></span> Request For Demo</a>
    <div class="modal fade" tabindex="-1" role="dialog"></div>
    </li>
    </ul>
    </div>
    </div>
    </div>

   
    <!--C Start -->
    <div class="panel panel-default">
    <div class="panel-heading my-panel-heading">
    <h4 class="panel-title">
    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="fa fa-plus myicon"></span>C Language</a>
    </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse">
    <div class="panel-body">
    <ul class="acordion-sub-option">
    <li><a href="#" class="btn-accordion" data-toggle="modal" data-target="#largeModal1"><span class="fa fa-book"></span> Course Syllabus</a>
                         
    <div id="largeModal1" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg">
    <div class="modal-content">
    <div class="modal-header">
    <a href="courses/Img/ENOSIS_C_CourseContents.pdf" class="btn btn-primary"  target="_blank" >Download</a>
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    </div>
    <div class="modal-body">
    <div class="col-lg-12">

              <object data="courses/Img/ENOSIS_C_CourseContents.pdf" type="application/pdf"  style="width:100%;height:100vh;">
              </object>

    
    </div>
    </div>
    </div>
    </div>
    </div>
    </li>
                                            
                                           
    <li><a href="#" class="btn-accordion"  data-toggle="modal" data-target="#myModal"><span class="fa fa-send"></span> Request For Demo</a>
    <div class="modal fade" tabindex="-1" role="dialog"></div>
    </li>
    </ul>
    </div>
    </div>
    </div>
                
    <!--C++ Start -->
    <div class="panel panel-default">
    <div class="panel-heading my-panel-heading">
    <h4 class="panel-title">
    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2"><span class="fa fa-plus myicon"></span>C++ Language</a>
    </h4>
    </div>
    <div id="collapse2" class="panel-collapse collapse">
    <div class="panel-body">
    <ul class="acordion-sub-option">
    <li><a href="#" class="btn-accordion" data-toggle="modal" data-target="#largeModal2"><span class="fa fa-book"></span> Course Syllabus</a>
                         
    <div id="largeModal2" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg">
    <div class="modal-content">
    <div class="modal-header">
    <a href="courses/Img/ENOSIS_C++_CourseContents.pdf" class="btn btn-primary"  target="_blank" >Download</a>
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    </div>
    <div class="modal-body">
    <div class="col-lg-12">
          <object data="courses/Img/ENOSIS_C++_CourseContents.pdf" type="application/pdf"  style="width:100%;height:100vh;">
          </object>

    
        </div>
    </div>
    </div>
    </div>
    </div>
    </li>
                                            
                                            
    <li><a href="#" class="btn-accordion"  data-toggle="modal" data-target="#myModal"><span class="fa fa-send"></span> Request For Demo</a>
    <div class="modal fade" tabindex="-1" role="dialog"></div>
    </li>
    </ul>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
    <div class="frm mar-bt1" style="float: left; box-shadow: 0 9px 50px hsla(20, 67%, 75%, 0.31); border: 1px solid rgba(147, 184, 189,0.8);
    border-radius: 5px;width: 100%;">
    <p>Enquiry Form</p>
    <div class="enquiry-form-wrppr1">
                    
    <asp:Label ID="lblRes" runat="server"  />   
    <%--<asp:RegularExpressionValidator ID="regEmail" ControlToValidate="txtEEmailId" Text="Please Enter Valid EmailID" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" CssClass="valid" />
        <asp:RegularExpressionValidator ID="rM1" ControlToValidate="txtEUserContactNo" Text="Please Enter Valid ContactNo" Display="Dynamic" ValidationExpression="^[0-9\-\(\)\/\.\+]{0,15}$" runat="server" CssClass="valid" />--%>


 <asp:RequiredFieldValidator ID="rMobile" ControlToValidate="txtEUserContactNo" ErrorMessage="Please enter Contact No" runat="server" CssClass="valid" Display="Dynamic" />
    <asp:RequiredFieldValidator ID="rEmail" ControlToValidate="txtEEmailId" ErrorMessage="Please enter Email" runat="server" CssClass="valid" Display="Dynamic" />

     

    <div class="form-group">   <asp:TextBox ID="txtEUserName" runat="server" PlaceHolder="Enter User Name" CssClass="form-control" ToolTip="Enter User Name" ></asp:TextBox></div>
    <div class="form-group">   <asp:TextBox ID="txtEUserContactNo" runat="server" PlaceHolder="User Contact Number" CssClass="form-control" ToolTip="Enter User Number" ></asp:TextBox></div>
    <div class="form-group">   <asp:TextBox ID="txtEEmailId" runat="server" PlaceHolder="User Email Id" CssClass="form-control" ToolTip="User E-mail Address" ></asp:TextBox>
      
    </div>
    <div class="form-group">  
        <asp:DropDownList CssClass="form-control my-form-control" ID="drpDCourse" AutoPostBack="true"  runat="server">
<asp:ListItem Value="0" Text="Please Select Course" />
  <asp:ListItem Text=".NET" />
                    <asp:ListItem Text="JAVA" />
                    <asp:ListItem Text="SQLSERVER" />
                    <asp:ListItem Text="POWERBI" />
                         <asp:ListItem Text="C" />
                          <asp:ListItem Text="C++" />
                          <asp:ListItem Text="DESIGNING" />
                
                    <asp:ListItem Text="OTHERS" />
              


</asp:DropDownList>


        <%--<asp:TextBox ID="txtECourseName" runat="server" PlaceHolder="Course Name" CssClass="form-control" ToolTip="Course Name" ></asp:TextBox>--%>

    </div>
    <div class="btn-wrpr">
    <asp:Button ID="btnSubmit" runat="server" Width="85px" height="25px" Text="SUBMIT" onclick="btnSubmit_Click" CssClass="btn-frm-bt1" style="color: #fff;"/>
    </div>                               
    </div>
    </div>
    </div>
    <br />
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="margin-top:10px;padding:10px;">
    <div class="frm mar-bt1" style="box-shadow: 0 9px 50px hsla(20, 67%, 75%, 0.31); border: 1px solid rgba(147, 184, 189,0.8);
    border-radius: 5px;">
    <p>Interview Questions</p>
    <ul class="myul" >
    <li style=" box-shadow:2px 2px 10px 1px gray"><a href="Interview_Questions.aspx?lag=MVC">ASP.NET MVC</a></li>
    <li style="background-color:#d93a32; box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=ManualTesting">Software Testing</a></li>
    <li  style="background-color:#e68f0e;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=WebDesigning">Web Designing</a></li>     
    <li style="background-color:#43b828;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=C">C Language</a></li>
    <li  style="background-color:#1e5257;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=SQLServer">SQL SERVER </a></li>
    <li style="background-color:#cf7e8b;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=POWERBI">POWERBI</a></li>
    <li  style="background-color:#a13875;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=Csharp">C#.Net</a></li> 
    <li style="background-color:#5638a1;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=ASP.NET">ASP.Net</a></li>
    <li  style="background-color:#0c549c;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=Selenium">Selenium</a></li>                                                                  
    <li style="background-color:#0e97a1;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=SSIS">SSIS</a></li>
    <li  style="background-color:#0ea166;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=SSRS">SSRS</a></li>
    <li style="background-color:#0a5909;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=SSAS">SSAS</a></li>                                                   
    <li  style="background-color:#dbbf1d;box-shadow:2px 2px 10px 1px gray""><a href="Interview_Questions.aspx?lag=JAVA">Java</a></li>
    </ul>
    </div>
    </div>
    </div> <!--row end-->
                        
    </div><!--container end-->
                    
    </div>
    <div class="clearfix"></div>
   </asp:Content>
 