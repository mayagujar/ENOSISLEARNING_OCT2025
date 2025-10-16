<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="Assignments.aspx.cs" Inherits="ENOSISLEARNING.Assignments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       @media screen and (max-width: 980px)
          {
            .container
            {
                width: 100%;
            }
            .row
            {

       margin-left: -2px;
    margin-right: 0px;
}
            table
            {
               width:100px;
            }
            .panel-body
            {
               
                    margin-left: -28px;
            }
            td
            {
                font-size:8px;
            }
            table td a
            {
font-size:8px;
            }
          }

      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Label ID="lblInfo" runat="server" ForeColor="Red" Font-Bold="true"  />
<div class="container">
<div class="row">
<div class="row">
<div class="panel-group" id="accordion">

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseC"><span class="fa fa-plus myicon"></span>C Assignments</a>
</h4>
</div>
<div id="collapseC" class="panel-collapse collapse collapse">


<div class="panel-body">

<div class="container">
<div class="row">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvC" 
HeaderStyle-BackColor="#e4eef2" AutoGenerateColumns="false" Width="480px" Height="60px" runat="server" OnSelectedIndexChanged="grvC_SelectedIndexChanged" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Assignments/C/{0}" 
ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  
ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" DataTextField="Name" 
HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True" ControlStyle-Height="25px" 
ItemStyle-Height="30px"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
ControlStyle-Width="100px"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
</Columns>
</asp:GridView>
</div>
</div>
</div>

                                    
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseJava"><span class="fa fa-plus myicon"></span>Java Assignments</a>
</h4>
</div>
<div id="collapseJava" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       
<asp:GridView DataKeyNames="Name"  ID="grvJava" HeaderStyle-BackColor="#e4eef2" AutoGenerateColumns="false" Width="480px" Height="60px" runat="server" OnSelectedIndexChanged="grvJava_SelectedIndexChanged" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Assignments/Java/{0}"  ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" DataTextField="Name" HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True" ControlStyle-Height="25px"  ItemStyle-Height="30px"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="100px"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
</Columns>
</asp:GridView>

                                       
</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseNet"><span class="fa fa-plus myicon"></span>C# Assignments</a>
</h4>
</div>
<div id="collapseNet" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       
<asp:GridView DataKeyNames="Name"  ID="grvNet" HeaderStyle-BackColor="#e4eef2" AutoGenerateColumns="false" Width="480px" Height="60px" runat="server" OnSelectedIndexChanged="grvNet_SelectedIndexChanged" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Assignments/Net/{0}"  ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" DataTextField="Name" HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True" ControlStyle-Height="25px"  ItemStyle-Height="30px"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="100px"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
</Columns>
</asp:GridView>



</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseAsp"><span class="fa fa-plus myicon"></span>ASP.Net Assignments </a>
</h4>
</div>
<div id="collapseAsp" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       
<asp:GridView DataKeyNames="Name"  ID="grvAsp" HeaderStyle-BackColor="#e4eef2" AutoGenerateColumns="false" Width="480px" Height="60px" runat="server" OnSelectedIndexChanged="grvAsp_SelectedIndexChanged" >
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Assignments/Asp.Net/{0}"  ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" DataTextField="Name" HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True" ControlStyle-Height="25px"  ItemStyle-Height="30px"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="100px"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
</Columns>
</asp:GridView>


</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"><span class="fa fa-plus myicon"></span>SQL SERVER Assignments</a>
</h4>
</div>
<div id="collapseFour" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvSQL" HeaderStyle-BackColor="#e4eef2" AutoGenerateColumns="false" Width="480px" Height="60px" runat="server" OnSelectedIndexChanged="grvSQL_SelectedIndexChanged">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Assignments/SQL/{0}"  ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="350px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" DataTextField="Name" HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True" ControlStyle-Height="25px"  ItemStyle-Height="30px"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="100px"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
</Columns>
</asp:GridView>

</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseSSIS"><span class="fa fa-plus myicon"></span>SSIS Assignments</a>
</h4>
</div>
<div id="collapseSSIS" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       
<asp:GridView DataKeyNames="Name"  ID="grvSSIS" HeaderStyle-BackColor="#e4eef2" AutoGenerateColumns="false" Width="480px" Height="60px" runat="server" OnSelectedIndexChanged="grvSSIS_SelectedIndexChanged">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Assignments/SSIS/{0}"  ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" DataTextField="Name" HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True" ControlStyle-Height="25px"  ItemStyle-Height="30px"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="100px"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
</Columns>
</asp:GridView>


                                      
</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseSSRS"><span class="fa fa-plus myicon"></span>SSRS Assignments</a>
</h4>
</div>
<div id="collapseSSRS" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
                                       

<asp:GridView DataKeyNames="Name"  ID="grvSSRS" HeaderStyle-BackColor="#e4eef2" AutoGenerateColumns="false" Width="480px" Height="60px" runat="server" OnSelectedIndexChanged="grvSSRS_SelectedIndexChanged">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Assignments/SSRS/{0}"  ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" DataTextField="Name" HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True" ControlStyle-Height="25px"  ItemStyle-Height="30px"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="100px"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
</Columns>
</asp:GridView>
                                      
</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseSSAS"><span class="fa fa-plus myicon"></span>SSAS Assignments</a>
</h4>
</div>
<div id="collapseSSAS" class="panel-collapse collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvSSAS" HeaderStyle-BackColor="#e4eef2" AutoGenerateColumns="false" Width="480px" Height="60px" runat="server" OnSelectedIndexChanged="grvSSAS_SelectedIndexChanged">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Assignments/SSAS/{0}"  ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" DataTextField="Name" HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True" ControlStyle-Height="25px"  ItemStyle-Height="30px"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="100px"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
</Columns>
</asp:GridView>


</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="fa fa-plus myicon"></span>ASP.Net MVC Assignments</a>
</h4>
</div>
<div id="collapseTwo" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvMvc" HeaderStyle-BackColor="#e4eef2" AutoGenerateColumns="false" Width="480px" Height="60px" runat="server" OnSelectedIndexChanged="grvMvc_SelectedIndexChanged">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Assignments/MVC/{0}"  ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" DataTextField="Name" HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True" ControlStyle-Height="25px"  ItemStyle-Height="30px"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="100px"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
</Columns>
</asp:GridView>

</div>
</div>
</div>
</div>
                        
                        

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="fa fa-plus myicon"></span>Web Designing Assignments</a>
</h4>
</div>
<div id="collapseThree" class="panel-collapse in">
<div class="panel-body">
<div class="col-lg-12">

<asp:GridView DataKeyNames="Name"  ID="grvDesigning" HeaderStyle-BackColor="#e4eef2" AutoGenerateColumns="false" Width="480px" Height="60px" runat="server" OnSelectedIndexChanged="grvDesigning_SelectedIndexChanged">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Assignments/Designing/{0}"  ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" DataTextField="Name" HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True" ControlStyle-Height="25px"  ItemStyle-Height="30px"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="100px"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
</Columns>
</asp:GridView>
                                        
</div>
</div>
</div>
</div>


<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapsePowerBI"><span class="fa fa-plus myicon"></span>POWERBI Assignments</a>
</h4>
</div>
<div id="collapsePowerBI" class="panel-collapse collapse">
<div class="panel-body">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvPowerBI" HeaderStyle-BackColor="#e4eef2" AutoGenerateColumns="false" Width="480px" Height="60px" runat="server" OnSelectedIndexChanged="grvPowerBI_SelectedIndexChanged">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Assignments/PowerBI/{0}"  ItemStyle-Font-Size="Small" ControlStyle-Height="25px" ControlStyle-Width="300px"  ControlStyle-ForeColor="#F39224" ControlStyle-Font-Bold="true" DataTextField="Name" HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True" ControlStyle-Height="25px"  ItemStyle-Height="30px"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="100px"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
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
        <script src="Scripts/jquery-1.8.2.js"></script>
</asp:Content>
