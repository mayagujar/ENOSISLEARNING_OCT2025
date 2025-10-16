<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="DownLoads.aspx.cs" Inherits="ENOSISLEARNING.DownLoads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
     <style>
        .hide-div {
            display:none
        }

         @media screen and (max-width: 980px)
          {
             .menu-btn
             {
                width: 100%;
    margin-right: 35px;
             }
          }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
<div class="row">
<div class="col-lg-12">
<asp:GridView DataKeyNames="Name"  ID="grvFiles" AutoGenerateColumns="false" runat="server" OnSelectedIndexChanged="grvFiles_SelectedIndexChanged">
<Columns> 
<asp:HyperLinkField DataNavigateUrlFields="Name"
DataNavigateUrlFormatString="~/Downloads/{0}" DataTextField="Name" HeaderText="DownLoads"  />

<asp:CommandField ShowSelectButton="True"  SelectText="Download" ControlStyle-CssClass="btn-accordion" />
</Columns>
</asp:GridView>
</div>
</div>
</div>
</asp:Content>
