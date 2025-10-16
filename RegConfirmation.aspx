<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" EnableViewState="false" AutoEventWireup="true" CodeBehind="RegConfirmation.aspx.cs" Inherits="ENOSISLEARNING.RegConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link rel="stylesheet" type="text/css" href="css/bootstrap-min.css" />
<script type="text/javascript">
$(document).ready(function () {
$('[id*=ContentPlaceHolder1_drpCourses]').multiselect({
includeSelectAllOption: true
});

});
</script>

<style>
.hide-div {
display: none;
}
               .table-striped tbody th {
    background: #173151 !important;
    color:white;

}
        .table-striped tbody tr:nth-of-type(odd) {
    background: white;
    
   
}
        .table td, .table th {
    padding: 2px;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
}
            .upgradediv
    {
        padding:20px 10px;
        line-height:5em;
       
    }
    .divheading
    {
        font-size:35px;
         font-family:'Colonna MT';
    }
    .lblstyle{
        color: black;
    font-size: small;
    }

  
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<form id="frm1" runat="server">--%>
<div class="container jumbotron text-center border border-info rounded upgradediv">
    <h1 class="divheading lead">REGISTRATION COMPLETED</h1>
    <hr />
    <h4 id="hr1" runat="server">Welcome </h4>
<h4> Your Registration is confirmed.Your Registration Id is <asp:Label ID="lblRegNo" style="font-size:15px;color:red;position:relative;left:0px;"  runat="server" /> Which you can use for further communication if any.</h4>
<h4> If you want to change any information, you can click on the url :<br /> <br />
    <asp:HyperLink ID="hykRegUrl" CssClass="btn btn-danger"  runat="server" /></h4>  


<h4 >
Enrolled Courses : <asp:Label ID="lblEnrolledCourses"  Text="" style="font-size:15px;color:black;position:relative;left:0px;" runat="server" Visible="true" /> |
<asp:Label ID="lblTotalFees" Text="Total Fees" style="font-size:15px;color:black;position:relative;left:0px;" runat="server"  /> |
<asp:Label ID="lblPaidFees" Text="PaidFees" style="font-size:15px;color:black;position:relative;left:0px;" runat="server"  />|
</h4>


<h4 id="hrfees" runat="server"> Enter the Registration Fees & Installment Details of the Candidate - <asp:Label ID="lblCandidateName" runat="server" /> </h4>
<div class="table-responsive" id="divfees" runat="server">
<asp:GridView ID="grvCandidatesFees"  DataKeyNames="RECEIPTID" runat="server" 
AutoGenerateColumns="false"  HeaderStyle-BackColor="#0398D2"
ShowFooter="true"  HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="false" 
OnRowEditing="grvCandidatesFees_RowEditing" CssClass="table table-striped table-hover my-table"
OnRowUpdating="grvCandidatesFees_RowUpdating" OnRowCancelingEdit="grvCandidatesFees_RowCancelingEdit"
OnRowDeleting="grvCandidatesFees_RowDeleting" OnRowCommand="grvCandidatesFees_RowCommand"
OnRowDataBound="grvCandidatesFees_RowDataBound" >
<Columns>
<asp:TemplateField HeaderText="Capture Candidate Installment Details">
<ItemTemplate>
    <div style="padding: 3px;">
<asp:Button ID="btnDelete" runat="server"  Text="Delete Fees Details" CommandName="Delete" CssClass="btn btn-danger" style="color: #fff; height: 28px;"/>
    </div>
    
      <div style="padding: 3px;">
<asp:Button ID="btnEdit" runat="server"  Text="Update Fees Details" CommandName="Edit" CssClass="btn btn-warning" style="color: #fff; height: 28px;"/>
      </div>
</ItemTemplate>
<EditItemTemplate>
   
   <div style="padding: 3px;">
<asp:Button ID="btnCancel" runat="server"  Text="Cancel Details" CommandName="Cancel" CssClass="btn btn-danger" style="color: #fff; height: 28px;"/>
   </div>
    <div style="padding: 3px;">
<asp:Button ID="btnUpdate" runat="server"  Text="Save Fees Details" CommandName="Update"  CssClass="btn btn-warning" style="color: #fff; height: 28px;"/>
</div>
</EditItemTemplate>

<FooterTemplate>
<asp:Button ID="btnAdd" runat="server"
Text="Save & Add Next Installment" CommandName="AddNew" CssClass="btn btn-danger" style="color: #fff;"/>
    
    
</FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="FeesType">
<ItemTemplate>
<asp:Label ID="lblFeesType" Class="lblstyle" runat="server" Text='<%#Eval("FEESTYPE") %>'/>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="txtEFeesType" runat="server"  MaxLength="30" Text='<%#Eval("FEESTYPE") %>' />
    
</EditItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtFFeesType" runat="server" CssClass="form-control"  MaxLength="30" />
    
</FooterTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="FeesAmount">
<ItemTemplate>
<asp:Label ID="lblFeesAmount" Class="lblstyle" runat="server" Text='<%#Eval("FEESAMOUNT") %>'/>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="txtEFeesAmount" Class="lblstyle" runat="server"  MaxLength="30" Text='<%#Eval("FEESAMOUNT") %>' />   
</EditItemTemplate>

<FooterTemplate>
<asp:TextBox ID="txtFFeesAmount" runat="server"  MaxLength="30" CssClass="form-control" />
    
</FooterTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="FeesPaid/DueDate (dd/mm/yyyy)">
<ItemTemplate>
<%#Eval("FEESDUEDATE","{0:dd/MM/yyyy}")%>
    
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="txtEFeesDueDate" Class="lblstyle" runat="server"  MaxLength="30" Text='<%# Eval("FEESDUEDATE", "{0:dd/MM/yyyy}") %>'  />   
</EditItemTemplate>

<FooterTemplate>
<asp:TextBox ID="txtFotFeesDueDate" runat="server"  CssClass="form-control" />
     <span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon=calender"></i></span>   

</FooterTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="STATUS">
<ItemTemplate>
<asp:Label ID="lblStatus"  Class="lblstyle" runat="server" Text='<%#Eval("STATUS") %>'/>
</ItemTemplate>
<EditItemTemplate>
<asp:DropDownList ID="drpStatus" runat="server"  MaxLength="30" Selected='<%#Eval("STATUS")   %>' >
<asp:ListItem Value="PENDING" Text="PENDING"></asp:ListItem>
<asp:ListItem Value="PAID" Text="PAID"></asp:ListItem>
</asp:DropDownList>
</EditItemTemplate>

<FooterTemplate>
<asp:DropDownList ID="drpFStatus" runat="server" CssClass="form-control"   MaxLength="30" Selected='<%#Eval("STATUS") %>' >
<asp:ListItem Value="PENDING" Text="PENDING"></asp:ListItem>
<asp:ListItem Value="PAID" Text="PAID"></asp:ListItem>
</asp:DropDownList>               

</FooterTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Comments">
<ItemTemplate>
<asp:Label ID="lblComments" Class="lblstyle" runat="server" Text='<%#Eval("COMMENTS") %>'/>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="txtEComments" runat="server"  MaxLength="30" Text='<%#Eval("COMMENTS") %>' />   
</EditItemTemplate>

<FooterTemplate>
<asp:TextBox ID="txtFComments" Text="0" CssClass="form-control" rows="1" TextMode="MultiLine" runat="server" />
                  
                               
</FooterTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
    </div>
<asp:Button CssClass="btn btn-info btn-lg" 
ID="btnFeesDetails" Text="Click To Confirm The Fees Details" runat="server" OnClick="btnFeesDetails_Click" />

    </div>
 <%--   </form>--%>
     <script src="Scripts/jquery-1.8.2.js"></script>
    <script>
        $(document).ready(function () {
            $("#ContentPlaceHolder1_grvCandidatesFees_txtFotFeesDueDate").datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2200'

            });
        });
    </script>
</asp:Content>
