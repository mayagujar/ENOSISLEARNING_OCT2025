<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="BatchesDetails.aspx.cs" Inherits="ENOSISLEARNING.BatchesDetails" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css">

    <style>
 *
 {
     font-family: 'Montserrat', sans-serif;
 } 
 .container
 {
    width:1265px;
    height:100%;
    margin-top :5px;
    margin:auto;
 }   
  .menu
  {
      width:100%;
      height:30px;
      background-color:transparent;
  }
  .filter-menu
  {
      width:25%;
      height:100%;
      background-color:transparent;
      float:right;
      display:flex;
  }
  .filter-menu-item
  {
      width:150px;
      height:100%;
      background-color:transparent;
      border-radius: 5px;
      margin:0px 0px 0px 10px;
  }
  .btn-custom {
    justify-content: center;
    font-size: 14px;
    font-family: 'Montserrat', sans-serif;
    font-weight:600;
    border: none;
    color: dimgray;
    text-align: center;
    background-color:transparent;
    position:relative;
    left:0px;
  }
  .btn-custom2 {
    justify-content: center;
    font-size: 14px;
    font-family: 'Montserrat', sans-serif;
    font-weight:600;
    border: none;
    color: #333333;
    text-align: center;
    background-color:transparent;
    position:relative;
    top:0%;
    left:0px;
  }
   .icon-button 
   {
    display: flex;
    align-items: center;
    gap:0px;
    font-size:20px;
   }
  .btn:hover
 {
    transform: scale(1.1);
    color:grey;
 }
 .btn:active
 {
     transform: scale(0.9);
     box-shadow: none;
 }
 .active {
   background-color: #007bff;
   color: white;
 }
 .highlight 
 {
    background-color:#1d96b2; /* Blue background color */
    color: white; /* White text color */
 }
 .modern-dropdown 
 {
    width:160px;
    height:100%;
    background-color:transparent;
    float:left;
 }

.custom-select 
{
width: 100%;
height: 30px;
padding: 5px;
background-color:transparent;
font-size: 12px;
color:dimgray;
font-weight:500;
border:none;
transition: border-color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
}

.custom-select:focus 
{
border-color: #1d96b2;
border-radius:8px;
outline: 0;
box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}
  @media (max-width: 768px) {
    .menu {
        flex-direction: column;
        align-items: flex-start;
    }

    .filter-menu {
        width: 100%;
        justify-content: space-between;
    }

    .filter-menu-item {
        width: 100%;
        justify-content: center;
    }

    .modern-dropdown {
        width: 100%;
    }
}

@media (max-width: 480px) {
    .btn-custom, .btn-custom2 {
        font-size: 14px;
        padding: 8px 10px;
    }

    .custom-select {
        font-size: 14px;
        height: 35px;
    }
}
.gridview-area
{
    max-width: 100%;
    margin-top:5px;
    overflow-x: auto;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    background-color: #f8f9fa;
}
.table
{
     border-collapse: collapse;
     border-color:#1d96b2;
     background-color :white;
}
.gridview-item
{
    padding:-10px;
    transition: background-color 0.3s ease;
    text-align:center;
    font-size:10px;
    font-family: 'Montserrat', sans-serif;
    font-weight:500;
    color:black;
    background-color :white;
    width:100px;
}
.gridview-header {
 text-align:center;
 background-color: #1d96b2;
 color: #fff;
 font-size:10px;
 font-weight: bold;
 font-family: 'Montserrat', sans-serif;
}
 .gridview-header th {
 text-align: center;
 border: none;
 }


 .gridview-header-item {
     padding: 12px;
     text-align: center;
     background-color: #4caf50;
     color: #fff;
     border-radius: 8px;
     position: relative;
     cursor: pointer;
     transition: background-color 0.3s ease;
 }

 .gridview-header-item:hover {
    
 }

 .gridview-header-item::after {
     content: "\f0dc"; /* FontAwesome icon for sorting */
     font-family: "Font Awesome 5 Free";
     font-weight: 900;
     position: absolute;
     right: 10px;
     top: 50%;
     transform: translateY(-50%);
     opacity: 0.7;
     background-color :white;
 }
 .footer
{
    border-bottom:0.5px solid lightgrey;
    border-top:none;
    border-right:none;
    border-left:none;
}
.dropbtn 
  {
   text-align:center;
   font-size: 10px;
   border: none;
   cursor: pointer;
   border-radius: 4px;
   font-family: 'Montserrat', sans-serif;
   color:dimgray;
  font-weight:600;
  }
 .dropbtn  option 
 {
   position: absolute;
   background-color:whitesmoke;
   min-width: 120px;
   box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
   z-index: 1;
   border-radius: 4px;
   font-family:'Montserrat', sans-serif;
   font-weight:600;
   color:dimgray;
 }
.dropbtn:hover
{
    border:1px solid #00adef;
    box-shadow: 0 0 5px #00adef;
}
.form-control
 {
    border: 1px solid #efeeed;
    border-radius: 5px;
    font-size: 12px;
    font-weight:600;
 }
 .form-control::placeholder
 {
    color: dimgray;
    font-family:'Montserrat', sans-serif;
 }
 .form-control:hover
 {
    outline: none;
    border-color: #00adef;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
 }
 .add
{
    margin:4px 0px 0px 18px;
}
  /*Pager Style*/
 .pager {
     text-align: right;
     margin-top: 45px;
     border-color:white;
     position:absolute;
     right:65px;
     background-color:transparent;
     float:right;
 } 
 .pager2 {
    text-align: right;
    margin-top: 20px;
    border-color:white;
}

 .pager .pagination-group {
     display: inline-block;
 }
 .pager2 .pagination-group {
     display: inline-block;
 }

 .pager a,
 .pager span {
     padding: 9px 14px;
     margin: 2px;
     border-radius: 8px; /* Change border-radius to make squares */
     background-color: #007bff;
     color: #fff;
     text-decoration: none;
     transition: background-color 0.3s, color 0.3s;
     font-weight: 500;
 }

 .pager2 a,
.pager2 span {
    padding: 9px 14px;
    margin: 2px;
    border-radius: 8px; /* Change border-radius to make squares */
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
    font-weight: 500;
}
 .pager2 a:hover,
.pager2 a:active,
.pager2 span.current {
    border-color: #d9534f;
}
 .pager2 span {
    cursor: default;
}
 /* Styling for previous and next buttons */
 .pager a:last-child {
     padding: 9px 14px;
     background-color: #d9534f;
     border-color: #d9534f;
     color: white;
     margin-top:-1px;
 }

 .pager2 a:last-child {
    padding: 9px 14px;
    background-color: #d9534f;
    border-color: #d9534f;
    color: white;
    margin-top:-1px;
}
 .tag-box   
 {
     width:350px;
     height:80px;
     overflow-y:scroll;
     border:none;   
 }
 .tag-box2  
 {
     width:300px;
     height:80px;
     overflow-y:scroll; 
 }
 /*Pager Style*/
.tagify__tag {
    background-color:;  /* Light blue or any color */
    color: #0d47a1 !important;             /* Dark text color for visibility */
    border: 0px solid #90caf9;   
    border-radius: 0px;
}
.tagify__tag > div {
    font-size: 5px !important;
    display:inline;
    color: #0d47a1 !important; /* Dark color for visibility */
    background-color:#333;
    border-radius: 0px;
    position:relative;
    left:-15px;
    box-sizing:border-box;
}
.tagify__tag__removeBtn {
    background-color:dodgerblue;
    color: #0d47a1 !important;
    padding: 0px 3px !important;
    display: inline !important;
    font-size: 14px;
}

/* Prevent white strip on hover */
.tagify__tag__removeBtn:hover {
    background-color: #bbdefb !important;
}
.addbtn
{
    border-radius:10px;
    margin-top:5px;
    color:red;
}
.custom-batch-modal .custom-modal-dialog {
    max-width: 550px;
    margin: auto;
}

.custom-batch-modal .custom-modal-content {
    border-radius: 1rem;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    overflow: hidden;
}

.custom-batch-modal .custom-modal-header {
    background-color: #007bff;
    color: white;
    padding: 1rem 1.5rem;
    border-radius:0px;
}

.custom-close-text {
    font-size: 1.8rem;
    background: none;
    border: none;
    color: white;
    position: absolute;
    top: 15px;
    right: 20px;
    cursor: pointer;
}
.custom-close-text:hover {
    color: #ccc;
}


.custom-batch-modal .custom-modal-body {
    padding: 2rem;
    background-color: #f9f9f9;
}

.custom-batch-modal .custom-form-group {
    margin-bottom: 1.2rem;
}

.custom-batch-modal .custom-form-label {
    display: block;
    font-weight: 600;
    margin-bottom: 0.5rem;
    color: #333;
}

.custom-batch-modal .custom-form-control {
    width: 100%;
    padding: 0.6rem 1rem;
    border: 1px solid #ccc;
    border-radius: 0.5rem;
    font-size: 1rem;
}

.custom-batch-modal .custom-submit-btn {
    display: block;
    width: 100%;
    padding: 0.75rem;
    background-color: #28a745;
    border: none;
    color: white;
    font-weight: bold;
    border-radius: 0.5rem;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.custom-batch-modal .custom-submit-btn:hover {
    background-color: #218838;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
       <div id="myModal" class="modal fade custom-batch-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered custom-modal-dialog">
        <!-- Hidden field to hold the BatchId being edited -->
         <asp:HiddenField ID="EditBatchId" runat="server" /> <!-- HiddenField for BatchId -->
        <div class="modal-content custom-modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title">Add Students to Batch</h5>
                <button type="button" class="custom-close-text" data-bs-dismiss="modal" id="manualCloseBtn" aria-label="Close" onclick="close();">&times;</button>
            </div>
            <div class="modal-body custom-modal-body">
                <div class="custom-form-group">
                    <label for="FooterStudentTxt" class="custom-form-label">Enter Student Name</label>
                    <asp:TextBox ID="ModalFooterStudentTxt" CssClass="custom-form-control" runat="server" placeholder="e.g. Aarti Bhapkar, Renuka Mali" />
                </div>
               <asp:HiddenField ID="ModalSelectedStudentIDs" runat="server" />
               <asp:HiddenField ID="ModalSelectedStudentNames" runat="server" />
              <asp:Button ID="btnUpdateStudents" runat="server" Text="Update Students" CssClass="btn btn-success" OnClick="btnUpdateStudents_Click" CausesValidation="false"/>
            </div>
        </div>
    </div>
</div>

             <div class="menu">
        <div class="filter-menu">
            <div class="filter-menu-item">
                <div class="icon-button">
                   <%-- <i class="fa-brands fa-windows" style="color:#0aa8e7;"></i>--%>
                    <asp:Button ID="asp" runat="server" Text="ASP.NET" CssClass="btn btn-custom" OnClick="asp_Click" CausesValidation="false" ToolTip="ASP.NET"/>
                </div>
            </div>
            <div class="filter-menu-item">
                <div class="icon-button">
                   <%-- <i class="fa-brands fa-java" style="color:#168eca;"></i>--%>
                    <asp:Button ID="java" runat="server" Text="JAVA" CssClass="btn btn-custom"  OnClick="java_Click" CausesValidation="false" ToolTip="JAVA"/>
                </div>
            </div>
            <div class="filter-menu-item">
                <div class="icon-button">
                    <%--<i class="fa-solid fa-chart-line" style="color:#6dbe4f;"></i>--%>
                    <asp:Button ID="dataanalytics" runat="server" Text="Data Analytics" CssClass="btn btn-custom" OnClick="dataanalytics_Click"  CausesValidation="false" ToolTip="Data Analytics"/>
                </div>
            </div>
        </div>
         <div class="modern-dropdown">
              <asp:DropDownList ID="BatchTypeDrp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="BatchTypeDrp_SelectedIndexChanged" CssClass="form-control custom-select" style="font-weight:100">
                 <asp:ListItem Text="All Batches" Value="All"></asp:ListItem>
                 <asp:ListItem Text="Current Batches" Value="Current"></asp:ListItem>
                 <asp:ListItem Text="Planned Batches" Value="Planned"></asp:ListItem>
             </asp:DropDownList>
         </div> 
        <div class="modern-dropdown" style="position:relative;left:10px">
              <asp:DropDownList ID="FacultyDrp" runat="server" AutoPostBack="true" CssClass="form-control custom-select" style="font-weight:100" OnSelectedIndexChanged="FacultyDrp_SelectedIndexChanged">
             </asp:DropDownList>
         </div>
    </div>
            <div class="gridview-area">
                     <asp:GridView ID="Batchgrv" runat="server" ShowHeader="true" DataKeyNames="BatchId,FaclutyName,COURSEID,StartDate,EndDate,ExpectedStudent" AutoGenerateColumns="false" ShowFooter="true"  BorderStyle="None" AlternatingRowStyle-BackColor="white"  AlternatingRowStyle-ForeColor="white" CssClass="table table-borderless gridview-table" FooterStyle-CssClass="footer" PageSize="5" AllowPaging="true" PagerStyle-CssClass="pager" OnDataBound="Batchgrv_DataBound" OnRowCommand="Batchgrv_RowCommand" OnRowEditing="Batchgrv_RowEditing" OnRowCancelingEdit="Batchgrv_RowCancelingEdit" OnRowUpdating="Batchgrv_RowUpdating" OnRowDeleting="Batchgrv_RowDeleting" OnPageIndexChanging="Batchgrv_PageIndexChanging">
     <PagerStyle CssClass="pager" BorderColor="Transparent" BorderStyle="None"/>
     <Columns>
       <asp:TemplateField Visible="false">
          <ItemTemplate>
              <asp:HiddenField ID="HdnBatchId" Visible="false" runat="server" Value='<%#Eval("BatchId")%>'/>
          </ItemTemplate>
        </asp:TemplateField>
          <asp:TemplateField Visible="false">
             <ItemTemplate>
               <asp:Label ID="CourseIdLbl" Text='<%# Eval("COURSEID") %>' runat="server" CssClass="gridview-item" style="color:black"/>
             </ItemTemplate>
           </asp:TemplateField>
     </Columns>
     <Columns>
         <asp:TemplateField HeaderText="Type" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
             <ItemTemplate>
                 <asp:Label ID="BatchTypeLbl" Text='<%#Eval("BatchType") %>' runat="server" CssClass="gridview-item"/>
             </ItemTemplate>
             <EditItemTemplate>
                  <asp:DropDownList ID="EditBatchTypeDrp" Text='<%#Eval("BatchType") %>'  OnSelectedIndexChanged="EditBatchTypeDrp_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass="dropbtn" style="width:80px;height:30px;" >
                      <asp:ListItem Text="Type"/>
                      <asp:ListItem Value="Planned" Text="Planned" />
                      <asp:ListItem Value="Current" Text="Current" />
                  </asp:DropDownList>
             </EditItemTemplate>
             <FooterTemplate>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="*" ControlToValidate="FooterBatchTypeDrp" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" runat="server" />
                 <%--<asp:CustomValidator ID="BatchTypeValidator" ControlToValidate="FooterBatchTypeDrp" ErrorMessage="*" OnServerValidate="BatchTypeValidator_ServerValidate" ForeColor="Red" Display="Dynamic" runat="server" />--%>
                  <asp:DropDownList ID="FooterBatchTypeDrp" runat="server" CssClass="dropbtn" style="width:80px;height:30px;" OnSelectedIndexChanged="FooterBatchTypeDrp_SelectedIndexChanged" AutoPostBack="true">
                      <asp:ListItem Text="Type"/>
                      <asp:ListItem Value="Planned" Text="Planned" />
                      <asp:ListItem Value="Current" Text="Current" />
                  </asp:DropDownList>
             </FooterTemplate>
        </asp:TemplateField>
     </Columns>
     <Columns>
         <asp:TemplateField HeaderText="Mode" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
             <ItemTemplate>
                 <asp:Label ID="BatchModeLbl" Text='<%#Eval("BatchMode") %>' runat="server" CssClass="gridview-item"/>
             </ItemTemplate>
              <EditItemTemplate>
                 <asp:DropDownList ID="EditBatchMode" Text='<%#Eval("BatchMode") %>' runat="server" CssClass="dropbtn" style="width:80px;height:30px;">
                      <asp:ListItem Text="Mode" />
                      <asp:ListItem Value="Offline" Text="Offline" />
                      <asp:ListItem Value="Online" Text="Online" />
                  </asp:DropDownList>
              </EditItemTemplate>
             <FooterTemplate>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="*" ControlToValidate="FooterBatchMode" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" runat="server" />
                <%-- <asp:CustomValidator ID="BatchModeValidator" ControlToValidate="FooterBatchMode" ErrorMessage="*" OnServerValidate="BatchModeValidator_ServerValidate" ForeColor="Red" Display="Dynamic" runat="server" />--%>
                 <asp:DropDownList ID="FooterBatchMode" runat="server" CssClass="dropbtn" style="width:80px;height:30px;" required="required">
                     <asp:ListItem Text="Mode" />
                     <asp:ListItem Value="Offline" Text="Offline" />
                     <asp:ListItem Value="Online" Text="Online" />
                 </asp:DropDownList>
             </FooterTemplate>
         </asp:TemplateField>
     </Columns>
     <Columns>
         <asp:TemplateField HeaderText="Course" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
              <ItemTemplate>
                  <asp:Label ID="CourseNameLbl" Text='<%#Eval("BatchSubject") %>' runat="server" CssClass="gridview-item"/>
              </ItemTemplate>
             <EditItemTemplate>
                  <asp:TextBox ID="CourseNametxt" Text='<%#Eval("BatchSubject") %>' CssClass="form-control" runat="server" />
             </EditItemTemplate>
             <FooterTemplate>
                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="*" ControlToValidate="FooterCourseDrp" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" runat="server" />--%>
                <%-- <asp:CustomValidator ID="CourseValidator" ControlToValidate="FooterCourseDrp" ErrorMessage="*" OnServerValidate="CourseValidator_ServerValidate" ForeColor="Red" Display="Dynamic" runat="server" />--%>
                  <asp:DropDownList ID="FooterCourseDrp" runat="server" AutoPostBack="true" CssClass="dropbtn" style="width:100px;height:30px;" required="required"></asp:DropDownList>
             </FooterTemplate>
       </asp:TemplateField>
     </Columns>
     <Columns>
         <asp:TemplateField HeaderText="Start Date" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
              <ItemTemplate>
                  <asp:Label ID="StartDatelbl" Text='<%#Eval("StartDate","{0:dd/MM/yyyy}") %>' DataFormatString="{0:dd/MM/yyyy}" runat="server" CssClass="gridview-item"/>
              </ItemTemplate>
             <EditItemTemplate>
                  <asp:TextBox ID="StartDatetxt"  Text='<%#Eval("StartDate","{0:MM/dd/yyyy}") %>' CssClass="form-control" runat="server" />
             </EditItemTemplate>
             <FooterTemplate>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ErrorMessage="*" ControlToValidate="FooterStartdatettxt" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" runat="server" />
                  <asp:TextBox ID="FooterStartdatettxt" TextMode="Date" runat="server" CssClass="dropbtn" style="width:120px;height:30px;"/>
             </FooterTemplate>
        </asp:TemplateField>
     </Columns>
     <Columns>
         <asp:TemplateField HeaderText="End Date" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
              <ItemTemplate>
                 <asp:Label ID="EndDatelbl" Text='<%#Eval("EndDate","{0:dd/MM/yyyy}") %>' DataFormatString="{0:dd/MM/yyyy}" runat="server" CssClass="gridview-item"/>
             </ItemTemplate>
              <EditItemTemplate>
                  <asp:TextBox ID="EndDatetxt"  Text='<%#Eval("EndDate","{0:MM/dd/yyyy}") %>' CssClass="form-control" runat="server" />
             </EditItemTemplate>
             <FooterTemplate>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ErrorMessage="*" ControlToValidate="FooterEnddatettxt" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" runat="server" />
                  <asp:TextBox ID="FooterEnddatettxt" TextMode="Date" runat="server" CssClass="dropbtn" style="width:120px;height:30px;"/>
             </FooterTemplate>
        </asp:TemplateField>
     </Columns>
     <Columns>
         <asp:TemplateField HeaderText="Start Time" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
              <ItemTemplate>
                 <asp:Label ID="StartTimelbl" Text='<%#Eval("StartTime") %>' runat="server" CssClass="gridview-item"/>
             </ItemTemplate>
              <EditItemTemplate>
                     <asp:TextBox ID="StartTimetxt" Text='<%#Eval("StartTime") %>' CssClass="form-control" runat="server" />
               </EditItemTemplate>
            <FooterTemplate>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ErrorMessage="*" ControlToValidate="FooterStartTimetxt" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" InitialValue=""  runat="server" />
                 <asp:TextBox ID="FooterStartTimetxt" TextMode="Time" runat="server" CssClass="dropbtn" style="width:120px;height:30px;"/>
            </FooterTemplate>
       </asp:TemplateField>
     </Columns>
     <Columns>
         <asp:TemplateField HeaderText="End Time" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
              <ItemTemplate>
                  <asp:Label ID="EndTimelbl" Text='<%#Eval("EndTime") %>' runat="server" CssClass="gridview-item"/>
              </ItemTemplate>
              <EditItemTemplate>
                  <asp:TextBox ID="EndTimetxt" Text='<%#Eval("EndTime") %>' CssClass="form-control" runat="server"/>
             </EditItemTemplate>
             <FooterTemplate>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ErrorMessage="*" ControlToValidate="FooterEndTimetxt" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" runat="server" />
                  <asp:TextBox ID="FooterEndTimetxt" TextMode="Time" runat="server" CssClass="dropbtn" style="width:120px;height:30px;" />
             </FooterTemplate>
         </asp:TemplateField>
     </Columns>
     <Columns>
          <asp:TemplateField HeaderText="Faculty" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
               <ItemTemplate>
                  <asp:Label ID="FaclutyNamelbl" Text='<%#Eval("FaclutyName") %>' runat="server" CssClass="gridview-item"/>
              </ItemTemplate>
              <EditItemTemplate>
                  <asp:TextBox ID="FaclutyNametxt" Text='<%#Eval("FaclutyName") %>' CssClass="form-control" runat="server" />
              </EditItemTemplate>
                 <FooterTemplate>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ErrorMessage="*" ControlToValidate="drpFaculty" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" runat="server"/>
                    <%-- <asp:CustomValidator ID="FacultyDrpValidator" ControlToValidate="drpFaculty" ErrorMessage="*" OnServerValidate="FacultyDrpValidator_ServerValidate" ForeColor="Red" Display="Dynamic" runat="server" />--%>
                      <asp:DropDownList ID="drpFaculty" runat="server" AutoPostBack="true" CssClass="dropbtn" style="width:110px;height:30px;"></asp:DropDownList>
                 </FooterTemplate>
        </asp:TemplateField>
     </Columns>
     <Columns>
          <asp:TemplateField HeaderText="Students" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
               <ItemTemplate>
                   <asp:Label ID="ExpectedStudentlbl" Text='<%#Eval("ExpectedStudent") %>' runat="server" CssClass="gridview-item" style="text-align:center"/>
               </ItemTemplate>
           <EditItemTemplate>
     <asp:TextBox ID="ExpectedStudenttxt" 
                  Text='<%# Eval("ExpectedStudent") %>' 
                  CssClass="form-control" 
                  runat="server" 
                  ReadOnly="true"/>

     <a id="btnRDemo" href="#" class="addbtn" 
        data-toggle="modal" 
        data-target="#myModal" 
        onclick="openStudentModal(<%# Eval("BatchId") %>); return false;" 
        target="_parent">Add More Student</a>
</EditItemTemplate>

           <FooterTemplate>
             <asp:TextBox ID="FooterStudentTxt" ClientIDMode="Static" CssClass="tag-box" runat="server"></asp:TextBox>
             <asp:HiddenField ID="SelectedStudentIDs" ClientIDMode="Static" runat="server" />
             <asp:HiddenField ID="SelectedStudentNames" ClientIDMode="Static" runat="server" />

              <%-- <div id="tag-container" class="tag-box"></div>--%>
             </FooterTemplate>
         </asp:TemplateField>
     </Columns>
     <Columns>
             <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="none" ItemStyle-BorderStyle="None">
                 <ItemTemplate>
                    <asp:Label ID="Statuslbl" Text='<%#Eval("Status") %>' runat="server" CssClass="gridview-item"/>
                 </ItemTemplate>
                 <EditItemTemplate>
                      <asp:DropDownList ID="EditStatus" runat="server" Text='<%#Eval("Status") %>' OnSelectedIndexChanged="EditStatus_SelectedIndexChanged"  AutoPostBack="true" CssClass="dropbtn" style="width:130px;height:30px;">
                           <asp:ListItem Text="Status" />
                           <asp:ListItem Value="Running" Text="Running" />
                           <asp:ListItem Value="Pending" Text="Pending" />
                           <asp:ListItem Value="Complete" Text="Complete" />
                       </asp:DropDownList>
                     <%--<asp:TextBox ID="Statustxt" Text='<%#Eval("Status") %>' CssClass="form-control" runat="server" />--%>
                 </EditItemTemplate>
                 <FooterTemplate>
                      <asp:Requiredfieldvalidator id="Requiredfieldvalidator10" errormessage="*" controltovalidate="footerstatus" forecolor="red" display="dynamic" setfocusonerror="true" runat="server" />
                      <%--<asp:customvalidator id="Statusvalidator" controltovalidate="footerbatchmode" errormessage="*" onservervalidate="Statusvalidator_ServerValidate" forecolor="red" display="dynamic" runat="server" />--%>
                      <asp:DropDownList ID="FooterStatus" runat="server" OnSelectedIndexChanged="FooterStatus_SelectedIndexChanged"  AutoPostBack="true" CssClass="dropbtn" style="width:100px;height:30px;">
                          <asp:ListItem Text="Status" />
                          <asp:ListItem Value="Running" Text="Running" />
                          <asp:ListItem Value="Pending" Text="Pending" />
                          <asp:ListItem Value="Complete" Text="Complete" />
                      </asp:DropDownList>
                 </FooterTemplate>
             </asp:TemplateField>
     </Columns>
     <Columns>
          <asp:TemplateField HeaderText="Progress" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="none" ItemStyle-BorderStyle="None">
           <%-- <ItemTemplate><%# GetProgressBar(Eval("ChapterNumber")) %></ItemTemplate>--%>
          <FooterTemplate>
                <asp:ImageButton ID="AddBtn" Text="Add Batch" runat="server" ToolTip="Add" CommandName="Add" ImageUrl="~/Images/AddDoc.png" Width="25px" Height="25px" ImageAlign="Baseline"  CssClass="add" CausesValidation="false" OnClientClick="return Page_ClientValidate();"/>
            </FooterTemplate>
        </asp:TemplateField>
       <asp:TemplateField HeaderText="Info" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="none" ItemStyle-BorderStyle="None">
           <ItemTemplate>
               <asp:ImageButton ID="DetailBtn" Text="Add Batch" runat="server" ToolTip="Details" CommandName="ViewDetails"   ImageUrl="~/Images/file.png" Width="25px" Height="25px" ImageAlign="Middle" CssClass="add" CausesValidation="false" style="margin-top:-5px;"/>
           </ItemTemplate>
       </asp:TemplateField>
     </Columns>
     <Columns>
           <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" HeaderStyle-Font-Bold="true" FooterStyle-BorderStyle="none" ItemStyle-BorderStyle="None">
                 <ItemTemplate>
                     <asp:ImageButton ID="EditBtn" ImageUrl="~/Images/edit-icon-png-3598.png" CommandName="Edit" runat="server" ToolTip="Edit" Width="22px" Height="22px" CausesValidation="false"/>
                     <asp:ImageButton ID="DeleteBtn" ImageUrl="~/Images/DeleteDoc.png" CommandName="Delete" runat="server" ToolTip="Delete" Width="22px" Height="22px" CausesValidation="false"/>
                 </ItemTemplate>
                 <EditItemTemplate>
                      <asp:ImageButton ID="UpdateBtn" ImageUrl="~/Images/UpdateDoc.png" CommandName="Update" runat="server" ToolTip="Update" Width="20px" Height="20px" CausesValidation="false"/>
                      <asp:ImageButton ID="CancelBtn" ImageUrl="~/Images/cancel.png" CommandName="Cancel" runat="server" ToolTip="Cancel" Width="20px" Height="20px" CausesValidation="false"/>
                 </EditItemTemplate>
             </asp:TemplateField>
     </Columns>
  <PagerTemplate>
     <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="Page" CommandArgument="First" CausesValidation="false">First</asp:LinkButton>
     <asp:LinkButton ID="lbtnprev" runat="server" CommandName="Page" CommandArgument="Prev" CausesValidation="false">Prev</asp:LinkButton>
     <asp:LinkButton ID="lbtnnext" runat="server" CommandName="Page" CommandArgument="Next" CausesValidation="false">Next</asp:LinkButton>
     <asp:LinkButton ID="lbtnlast" runat="server" CommandName="Page" CommandArgument="Last" CausesValidation="false">Last</asp:LinkButton>
 </PagerTemplate>
 </asp:GridView>
            </div>
           <asp:button Id="AllBatchGrid" text="Complete Batches" runat="server" OnClick="AllBatchGrid_Click" CausesValidation="false" CssClass="btn btn-danger btn-md" style="border-radius:3px;float:right;margin-top:5px;"/>
   <asp:Label ID="lblUserID" runat="server" style="color:black;"/>
   <asp:Label ID="lblFullName" runat="server" style="color:black;"/>
   <asp:Label ID="Errorlbl" runat="server" />
     </div>

    <%-- Script --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
   <script>
       $(document).ready(function () {
           $(".datepicker").datepicker({ dateFormat: "yy-mm-dd" });
           $(".timepicker").timepicker({ 'timeFormat': 'h:i A' });
       });
   </script>
<script type="text/javascript">
    function validateDate(sender, args) {
        var txt = document.getElementById(sender.controltovalidate);
        if (txt && txt.value.trim() !== "") {
            args.IsValid = true;
        } else {
            args.IsValid = false;
        }
    }
</script>

    <%-- Script --%>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        var input = document.getElementById('<%= Batchgrv.FooterRow.FindControl("FooterStudentTxt").ClientID %>');
        var hiddenIDs = document.getElementById('<%= Batchgrv.FooterRow.FindControl("SelectedStudentIDs").ClientID %>');
        var hiddenNames = document.getElementById('<%= Batchgrv.FooterRow.FindControl("SelectedStudentNames").ClientID %>');

        var tagify = new Tagify(input, {
            enforceWhitelist: false,
            maxTags: 10,
            whitelist: [],
            dropdown: {
                maxItems: 10,
                enabled: 0,
                closeOnSelect: false
            }
        });

        tagify.on('input', function (e) {
            var value = e.detail.value;
            $.ajax({
                type: "POST",
                url: "BatchesDetails.aspx/GetCandidates",
                data: JSON.stringify({ keyword: value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var candidates = result.d.map(function (item) {
                        return {
                            value: item.Name,
                            id: item.ID
                        };
                    });
                    tagify.settings.whitelist = candidates;
                    tagify.dropdown.show.call(tagify, value);
                }
            });
        });

        //tagify.on('change', function () {
        //    var selectedTags = tagify.value;

        //    var ids = selectedTags.map(t => {
        //        var found = tagify.settings.whitelist.find(x => x.value === t.value);
        //        return found ? found.id : '';
        //    }).filter(id => id !== '');
        //    hiddenIDs.value = ids.join(',');

        //    var names = selectedTags.map(t => t.value).filter(n => n !== '');
        //    hiddenNames.value = names.join(',');
        //    console.log("Selected Tags:", tagify.value);
        //});
        tagify.on('change', function () {
            var selectedTags = tagify.value;

            // ✅ Directly extract IDs and Names
            var ids = selectedTags.map(t => t.id).filter(id => id !== '');
            var names = selectedTags.map(t => t.value).filter(n => n !== '');

            hiddenIDs.value = ids.join(',');
            hiddenNames.value = names.join(',');

            console.log("✅ IDs:", hiddenIDs.value);
            console.log("✅ Names:", hiddenNames.value);
        });
    });
</script>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        var input = document.getElementById('<%= ModalFooterStudentTxt.ClientID %>');
        var hiddenIDs = document.getElementById('<%= ModalSelectedStudentIDs.ClientID %>');
        var hiddenNames = document.getElementById('<%= ModalSelectedStudentNames.ClientID %>');

       var tagify = new Tagify(input, {
           enforceWhitelist: false,
           maxTags: 10,
           whitelist: [],
           dropdown: {
               maxItems: 10,
               enabled: 0,
               closeOnSelect: false
           }
       });

       tagify.on('input', function (e) {
           var value = e.detail.value;
           $.ajax({
               type: "POST",
               url: "BatchesDetails.aspx/GetCandidates",
               data: JSON.stringify({ keyword: value }),
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (result) {
                   var candidates = result.d.map(function (item) {
                       return {
                           value: item.Name,
                           id: item.ID
                       };
                   });
                   tagify.settings.whitelist = candidates;
                   tagify.dropdown.show.call(tagify, value);
               }
           });
       });

        tagify.on('change', function () {
            var selectedTags = tagify.value;

            // ✅ Directly extract IDs and Names
            var ids = selectedTags.map(t => t.id).filter(id => id !== '');
            var names = selectedTags.map(t => t.value).filter(n => n !== '');

            hiddenIDs.value = ids.join(',');
            hiddenNames.value = names.join(',');

            console.log("✅ IDs:", hiddenIDs.value);
            console.log("✅ Names:", hiddenNames.value);
        });
   });
</script>
<script>
    function close() {
        var btn = document.getElementById("manualCloseBtn");
        var modal = document.getElementById("myModal");
        modal.style.display = "block";
    }
</script>
<script>
    function openStudentModal(batchId) {
        document.getElementById('<%= EditBatchId.ClientID %>').value = batchId;
        $('#editStudentModal').modal('show');
    }
</script>
    <script>
        function openStudentModal(batchId) {
            // Find the HiddenField that holds the BatchId value
            var batchIdField = document.getElementById('<%= EditBatchId.ClientID %>');
            if (batchIdField != null) {
                batchIdField.value = batchId; // Set the BatchId value in the hidden field
                $('#myModal').modal('show');  // Open the modal using Bootstrap
            } else {
                console.error("Error: EditBatchId field not found.");
            }
        }
    </script>
</asp:Content>
