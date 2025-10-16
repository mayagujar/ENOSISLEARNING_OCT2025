<%@ Page Title="" Language="C#" MasterPageFile="~/Candidate_Master.Master" AutoEventWireup="true" CodeBehind="Candidate.aspx.cs" Inherits="ENOSISLEARNING.Candidate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
                       .table-striped tbody th {
    background: #173151 !important;
    color:white;

}
        .table-striped tbody tr:nth-of-type(odd) {
    background: white;
    
   
}
                       .table td, .table th {
    padding: 3px;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
}
.header
{
    font-weight:bold;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
    <h4 class="upld-resume"> OVERALL ATTENDENCE</h4> 
        <br />
        <h5>Student Name: <asp:Label ID="lblname" runat="server" /></h5>
       <div class="table-responsive">
   <asp:GridView ID="AttendenceGrv" runat="server" AutoGenerateColumns="false" BorderStyle="None" AlternatingRowStyle-BackColor="White"  AlternatingRowStyle-ForeColor="Gray" CssClass="table table-borderless gridview-table" FooterStyle-CssClass="footer" HorizontalAlign="Center">
    <Columns>
      
       <%-- <asp:BoundField DataField="BatchSheetId" HeaderText="Batch Sheet ID" SortExpression="BatchSheetId" />--%>
        
        <asp:BoundField DataField="BatchStartDate" HeaderText="Batch Start Date" SortExpression="BatchStartDate" DataFormatString="{0:dd-MM-yyyy}"/>
 
      
        <asp:BoundField DataField="BatchEndDate" HeaderText="Batch End Date" SortExpression="BatchEndDate" DataFormatString="{0:dd-MM-yyyy}" />


        <asp:BoundField DataField="AttendanceDate" HeaderText="Attendance Date" SortExpression="AttendanceDate" DataFormatString="{0:dd-MM-yyyy}" />


        <asp:BoundField DataField="BatchSubject" HeaderText="Subject" SortExpression="BatchSubject" />
        
        
        <asp:BoundField DataField="ChapterNumber" HeaderText="Chapter Number" SortExpression="ChapterNumber" />
        
      
        <asp:BoundField DataField="TopicCovered" HeaderText="Topic Covered" SortExpression="TopicCovered" />
        
       
        <asp:BoundField DataField="AttendanceComments" HeaderText="Comments" SortExpression="AttendanceComments" />
        
       
       <%-- <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />--%>
        
       
       <%-- <asp:BoundField DataField="StudentEmail" HeaderText="Student Email" SortExpression="StudentEmail" />--%>
        
       
        <%--<asp:BoundField DataField="BatchType" HeaderText="Batch Type" SortExpression="BatchType" />--%>
        
       
        <asp:BoundField DataField="BatchMode" HeaderText="Batch Mode" SortExpression="BatchMode" />
        
        
        <asp:BoundField DataField="FacultyName" HeaderText="Faculty Name" SortExpression="FacultyName" />
        
       
       <%-- <asp:BoundField DataField="CourseName" HeaderText="Course Name" SortExpression="CourseName" />--%>
    </Columns>
</asp:GridView>
</div> 
        </div>
     <script src="../Layout_file/libs/jquery/dist/jquery.min.js"></script>
</asp:Content>
