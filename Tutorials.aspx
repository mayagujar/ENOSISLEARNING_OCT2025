<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="Tutorials.aspx.cs" Inherits="ENOSISLEARNING.Tutorials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
       @media screen and (max-width: 980px)
          {
              .panel-group
              {
              width: 90%;
    margin-left: 20px;
              }
          }
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
<div class="row">
<div class="row">
<div class="panel-group" id="accordion">

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseC"><span class="fa fa-plus myicon"></span>C Tutorials</a>
</h4>
</div>
<div id="collapseC" class="panel-collapse in">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvC" AutoGenerateColumns="false" runat="server"
HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Tutorials/C/{0}" DataTextField="Name" HeaderText="Tutorials" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true"  />

                                              

                                                    
</Columns>
</asp:GridView>

                                       
</div>
</div>
</div>
</div>
                        
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseCPP"><span class="fa fa-plus myicon"></span>CPP Tutorials</a>
</h4>
</div>
<div id="collapseCPP" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvCPP" AutoGenerateColumns="false" runat="server"
HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Tutorials/CPP/{0}" DataTextField="Name" HeaderText="Tutorials" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true"  />

                                              

                                                    
</Columns>
</asp:GridView>

                                       
</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseDesign"><span class="fa fa-plus myicon"></span>WEB DESIGNING Tutorials</a>
</h4>
</div>
<div id="collapseDesign" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvDesigning" AutoGenerateColumns="false" runat="server"
HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Tutorials/Designing/{0}" DataTextField="Name" HeaderText="Tutorials" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true"  />

                                              

                                                    
</Columns>
</asp:GridView>

                                       
</div>
</div>
</div>
</div>
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseJava"><span class="fa fa-plus myicon"></span>Java Tutorials</a>
</h4>
</div>
<div id="collapseJava" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       

<asp:GridView DataKeyNames="Name"  ID="grvJava" AutoGenerateColumns="false" runat="server"  
HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Tutorials/Java/{0}" DataTextField="Name" HeaderText="Tutorials"    
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true"
/>
                                                

                                                    
</Columns>
</asp:GridView>
</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="fa fa-plus myicon"></span>CSHARP</a>
</h4>
</div>
<div id="collapseOne" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       

<asp:GridView DataKeyNames="Name"  ID="grvNet" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Tutorials/Net/{0}" DataTextField="Name" HeaderText="Tutorials" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" />
                                                

                                                    
</Columns>
</asp:GridView>
</div>
</div>
</div>
</div>


    <div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseAsp"><span class="fa fa-plus myicon"></span>ASP.Net</a>
</h4>
</div>
<div id="collapseAsp" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       

<asp:GridView DataKeyNames="Name"  ID="grvASP" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Tutorials/Net/{0}" DataTextField="Name" HeaderText="Tutorials" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" />
                                                

                                                    
</Columns>
</asp:GridView>
</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"><span class="fa fa-plus myicon"></span>SQL SERVER </a>
</h4>
</div>
<div id="collapseFour" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvSQL" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Tutorials/SQL/{0}" DataTextField="Name" HeaderText="Tutorials" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true"
/>

                                                    
</Columns>
</asp:GridView>
</div>
</div>
</div>
</div>
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapsePowerBI"><span class="fa fa-plus myicon"></span>POWER BI</a>
</h4>
</div>
<div id="collapsePowerBI" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvPowerBI" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Tutorials/POWERBI/{0}" DataTextField="Name" HeaderText="Tutorials" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="400px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true"
/>

                                                    
</Columns>
</asp:GridView>
</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseSSIS"><span class="fa fa-plus myicon"></span>SSIS Tutorials</a>
</h4>
</div>
<div id="collapseSSIS" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       

<asp:GridView DataKeyNames="Name"  ID="grvSSIS" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Tutorials/SSIS/{0}" DataTextField="Name" HeaderText="Tutorials" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" />
                                                

                                                    
</Columns>
</asp:GridView>
</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseSSRS"><span class="fa fa-plus myicon"></span>SSRS Tutorials</a>
</h4>
</div>
<div id="collapseSSRS" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       

<asp:GridView DataKeyNames="Name"  ID="grvSSRS" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Tutorials/SSRS/{0}" DataTextField="Name" HeaderText="Tutorials" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true"
/>
                                                

                                                    
</Columns>
</asp:GridView>
</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseSSAS"><span class="fa fa-plus myicon"></span>SSAS Tutorials</a>
</h4>
</div>
<div id="collapseSSAS" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       

<asp:GridView DataKeyNames="Name"  ID="grvSSAS" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Tutorials/SSAS/{0}" DataTextField="Name" HeaderText="Tutorials" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true"
/>
                                                

                                                    
</Columns>
</asp:GridView>
</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="fa fa-plus myicon"></span>ASP.Net MVC</a>
</h4>
</div>
<div id="collapseTwo" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvMvc" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Tutorials/MVC/{0}" DataTextField="Name" HeaderText="Tutorials" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true"
/>

                                                    
</Columns>
</asp:GridView>
</div>
</div>
</div>
</div>
                        
                        

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="fa fa-plus myicon"></span>Web Designing</a>
</h4>
</div>
<div id="collapseThree" class="panel-collapse in">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvFiles2" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Tutorials/{0}" DataTextField="Name" HeaderText="Tutorials" 
                                                    
/>

                                                    
</Columns>
</asp:GridView>

<table class="web-design" border="1" style="width:56%;margin:0px auto;border-collapse:collapse;">
<tr class="tbl-head">
<td>Tutorials</td>
<td></td>
</tr>
<tr>
<td><a href="Tutorials2/HTML/index.html" target="_blank">HTML</a></td>
<td style="text-align:center;"><a href="Tutorials2/HTML.rar" download class="dwld-btn" style="color:#fff!important;">Download</a></td>
</tr>
                                           
<tr>
<td><a href="Tutorials2/HTML5/index.html" target="_blank">HTML5</a></td>
<td style="text-align:center;"><a href="Tutorials2/HTML5.rar" download class="dwld-btn" style="color:#fff!important;">Download</a></td>
</tr>
<tr>
<td><a href="Tutorials2/CSS3/index.html" target="_blank">CSS3</a></td>
<td style="text-align:center;"><a href="Tutorials2/CSS3.rar" download class="dwld-btn" style="color:#fff!important;">Download</a></td>
</tr>
<tr>
<td><a href="Tutorials2/JavaScript/index.html" target="_blank">JAVASCRIPT</a></td>
<td style="text-align:center;"><a href="Tutorials2/JAVASCRIPT.rar" download class="dwld-btn" style="color:#fff!important;">Download</a></td>
</tr>
                                           
<tr>
<td><a href="Tutorials2/JQuery/index.html" target="_blank">JQUERY</a></td>
<td style="text-align:center;"><a href="Tutorials2/JQUERY.rar" download class="dwld-btn" style="color:#fff!important;">Download</a></td>
</tr>
</table>
</div>
</div>
</div>
</div>

                      
</div>
</div>
               
</div><!--row end-->
</div><!--container end-->
</asp:Content>
