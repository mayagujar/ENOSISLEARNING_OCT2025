<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="Articles.aspx.cs" Inherits="ENOSISLEARNING.Articles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <asp:GridView DataKeyNames="Name"  ID="grvFiles" AutoGenerateColumns="false" runat="server" OnSelectedIndexChanged="grvFiles_SelectedIndexChanged">
                    <Columns> 
                        <asp:HyperLinkField DataNavigateUrlFields="Name"
                             DataNavigateUrlFormatString="~/Articles/{0}" DataTextField="Name" HeaderText="Articles"  />

                         <asp:CommandField ShowSelectButton="True"   SelectText="Download" ControlStyle-CssClass="btn-accordion" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
