<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="QuestionPapers.aspx.cs" Inherits="ENOSISLEARNING.QuestionPapers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
     @media screen and (max-width: 980px)
          {
            .panel-group
            {
            
                width: 90%;
    margin-left: 22px;
            }
           

            .row {
    margin-right: -6px;
    margin-left: -15px;
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
<a data-toggle="collapse" data-parent="#accordion" href="#collapseC"><span class="fa fa-plus myicon"></span>C QuestionPapers</a>
</h4>
</div>
<div id="collapseC" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       

<asp:GridView DataKeyNames="Name"  ID="grvC"   AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/QuestionPapers/C/{0}" DataTextField="Name" HeaderText="Question Papers"
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="200px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true"
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
<a data-toggle="collapse" data-parent="#accordion" href="#collapseCPP"><span class="fa fa-plus myicon"></span>C++ QuestionPapers</a>
</h4>
</div>
<div id="collapseCPP" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       

<asp:GridView DataKeyNames="Name"  ID="grvCPP"   AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/QuestionPapers/CPP/{0}" DataTextField="Name" HeaderText="Question Papers" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="200px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" />
                                                

                                                    
</Columns>
</asp:GridView>
</div>
</div>
</div>
</div>
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseJava"><span class="fa fa-plus myicon"></span>Java Question Papers</a>
</h4>
</div>
<div id="collapseJava" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       

<asp:GridView DataKeyNames="Name"  ID="grvJava" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/QuestionPapers/Java/{0}" DataTextField="Name" HeaderText="Question Papers"
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="200px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" />
                                                

                                                    
</Columns>
</asp:GridView>
</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseNet"><span class="fa fa-plus myicon"></span>.Net Question Papers</a>
</h4>
</div>
<div id="collapseNet" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       

<asp:GridView DataKeyNames="Name"  ID="grvNet" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/QuestionPapers/Net/{0}" DataTextField="Name" HeaderText="Question Papers"
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="200px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" />
                                                

                                                    
</Columns>
</asp:GridView>
</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseAsp"><span class="fa fa-plus myicon"></span>ASP.Net Question Papers</a>
</h4>
</div>
<div id="collapseAsp" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       

<asp:GridView DataKeyNames="Name"  ID="grvAsp" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/QuestionPapers/Asp.Net/{0}" DataTextField="Name" HeaderText="Question Papers"  
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="200px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" />
                                                

                                                    
</Columns>
</asp:GridView>
</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseSQL"><span class="fa fa-plus myicon"></span>SQL SERVER Question Papers</a>
</h4>
</div>
<div id="collapseSQL" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvSQL" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/QuestionPapers/SQL/{0}" DataTextField="Name" HeaderText="Question Papers" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="200px"  
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
<a data-toggle="collapse" data-parent="#accordion" href="#collapseTesting"><span class="fa fa-plus myicon"></span>Testing QuestionPapers</a>
</h4>
</div>
<div id="collapseTesting" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvTesting" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/QuestionPapers/Testing/{0}" DataTextField="Name" HeaderText="Question Papers"
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="200px"  
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
<a data-toggle="collapse" data-parent="#accordion" href="#collapseWeb"><span class="fa fa-plus myicon"></span>Web Designing Question Papers</a>
</h4>
</div>
<div id="collapseWeb" class="panel-collapse in">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvDesigning" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/QuestionPapers/Designing/{0}" DataTextField="Name" HeaderText="Question Papers" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="200px"  
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
<a data-toggle="collapse" data-parent="#accordion" href="#collapsePowerBI"><span class="fa fa-plus myicon"></span>Web Designing Question Papers</a>
</h4>
</div>
<div id="collapsePowerBI" class="panel-collapse in">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvPowerBI" AutoGenerateColumns="false" runat="server" HeaderStyle-BackColor="#e4eef2"  Width="340px" Height="60px">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/QuestionPapers/POWERBI/{0}" DataTextField="Name" HeaderText="Question Papers" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="200px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true"
/>

                                                    
</Columns>
</asp:GridView>

                                        
</div>
</div>
</div>
</div>

                      
</div>
</div>
               
</div><!--row end-->
</div><!--container end-->
</asp:Content>
