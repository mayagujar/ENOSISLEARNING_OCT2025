<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="dot-net-training-in-pune.aspx.cs" Inherits="ENOSISLEARNING.DotNet" %>
<%@ Register Src="~/CourseWebControl.ascx" TagPrefix="uc" TagName="CGridView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/enosis.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div class="wrapper">
      <div class="left-side">
          <div class="top">
              <h1>Key Features</h1>
              <div class="left-side-key-features">
                  <div class="left-side-key-features-list-1"><p><i class="fa fa-check-circle" style="color:#006394;"></i> Instructor Led Training : 40 Hrs</p></div>
                  <div class="left-side-key-features-list-2"><p><i class="fa fa-check-circle" style="color:#006394;"></i> 24 X 7 Lifetime Support & Access</p></div>
                  <div class="left-side-key-features-list-3"><p><i class="fa fa-check-circle" style="color:#006394;"></i> Experienced & Professional Trainers</p></div>
                  <div class="left-side-key-features-list-4"><p><i class="fa fa-check-circle" style="color:#006394;"></i> 1 On 1 Training Option Available</p></div>
                  <div class="left-side-key-features-list-5"><p><i class="fa fa-check-circle" style="color:#006394;"></i> Small Batches Upto 10 Participants</p></div>
                  <div class="left-side-key-features-list-6"><p><i class="fa fa-check-circle" style="color:#006394;"></i> Flexible Schedule</p></div>
              </div>
               <div class="grv">
                    <h1>Microsoft Asp Dot Net Training Modules</h1>
                   <div class="grid">
                       <uc:CGridView ID="MyCourseGridView" runat="server"/>
                   </div>
               </div>
          </div>
      </div>
      <div class="right-side">
          <div class="enquiry-form">
              <asp:Label ID="lblRes" runat="server"  />   
              <h3>Drop Us a Query<i class="fa fa-envelope" style="color:#333;"></i></h3>    
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtEUserName" ErrorMessage="*" runat="server" CssClass="valid" Display="Dynamic" SetFocusOnError="true"/>
              <asp:TextBox ID="txtEUserName" runat="server" CssClass="form-control" placeholder="Username"/>  
               <asp:RegularExpressionValidator ID="rM1" ControlToValidate="txtEUserContactNo" Text="*" Display="Dynamic" ValidationExpression="^[0-9\-\(\)\/\.\+]{0,15}$" runat="server" CssClass="valid" SetFocusOnError="true"/>
              <asp:RequiredFieldValidator ID="rMobile" ControlToValidate="txtEUserContactNo" ErrorMessage="*" runat="server" CssClass="valid" Display="Dynamic" SetFocusOnError="true"/>
              <asp:TextBox ID="txtEUserContactNo" runat="server" CssClass="form-control" MaxLength="10" placeholder="Contact Number" />
               <asp:RegularExpressionValidator ID="regEmail" ControlToValidate="txtEEmailId" Text="*" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" CssClass="valid" SetFocusOnError="true"/>
               <asp:RequiredFieldValidator ID="rEmail" ControlToValidate="txtEEmailId" ErrorMessage="*" runat="server" CssClass="valid" Display="Dynamic" SetFocusOnError="true"/>
              <asp:TextBox ID="txtEEmailId" runat="server" CssClass="form-control" TextMode="Email" placeholder="Email Id"/>  
              <asp:DropDownList ID="drpDCourse" AutoPostBack="true" runat="server" CssClass="form-control">
                 <asp:ListItem Text=".NET" />
                 <asp:ListItem Text="JAVA" />
                 <asp:ListItem Text="SQLSERVER" />
                 <asp:ListItem Text="POWERBI" />
                 <asp:ListItem Text="C" />
                 <asp:ListItem Text="C++" />
                 <asp:ListItem Text="DESIGNING" />             
                 <asp:ListItem Text="OTHERS" />   
              </asp:DropDownList>
              <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" onclick="btnSubmit_Click"/>
          </div>
          <div class="Interview-Questions">
               <h3>Interview Questions<i class="fa fa-book" style="color:#333;"></i></h3> 
               <ul class="myul" >
                  <li style=" box-shadow:2px 2px 10px 1px gray;background-color:#006394;"><a href="Interview_Questions.aspx?lag=MVC">ASP.NET MVC</a></li>
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
  </div>
</asp:Content>
