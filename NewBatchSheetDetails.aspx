<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="NewBatchSheetDetails.aspx.cs" Inherits="ENOSISLEARNING.NewBatchSheetDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />
    <style>
         *
         {
             font-family: 'Montserrat', sans-serif;
         }
         .container
         {
            width:95%;
            height:100%;
            border:1px solid transparent;
         }
         .top-info
         {
             width:100%;
             height:30px;
             border:1px solid transparent;
             display:flex;  
         }
         .top-items
         {
             width:150px;
             height:100%;
             background-color:transparent;
             margin:auto;
         }
         .querystring-label2 
         {
             display: inline-block;
             padding-left:5px;
             color: grey;
             font-size: 10px;
             font-weight: bold;
             text-transform: uppercase;
             font-family:'Montserrat', sans-serif;
             letter-spacing: 1px;       
             transition: background-color 0.3s ease;
         }
         .fa-solid
        {
         margin-top:10px;
         font-size:15px;
         margin-left:88%;
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
     background-color:white;
}
.gridview-item
{
    padding-left:50px;
    font-weight:normal;
    transition: background-color 0.3s ease;
    text-align:justify;
    font-size:10px;
    font-family: 'Montserrat', sans-serif;
    font-weight:500;
    color:black;
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
/* .gridview-item:hover {
     background-color: rgba(0, 0, 0, 0.03);
 }*/

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
     background-color: #388e3c;
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
 .custom-style {
    width: 200px;
    color: black;
    font-size:10px;
    font-family: 'Montserrat', sans-serif;
    font-weight:500;
}
/* .btn
{
  padding: 10px 20px;
  background-color: #ddd;
  border: none;
  cursor: pointer;
  outline: none;
 border:none;
 padding: 5px 5px;
 margin-top: 3px;
 font-size: 8px;
 border: none;
 border-radius: 0px;
 background: none;
 color: grey;
 cursor: pointer;
 transition: all 0.3s ease-in;
 font-weight:600;
 font-family:'Montserrat', sans-serif;
}*/
.tag-input-container {
    width:200px;
    height:80px;
    overflow-y:auto;
    overflow-x:hidden;
    flex-wrap: wrap; /* Allow items to wrap onto new lines */
    justify-content: start; /* Align items at the start */
}

/* Style each checkbox item to ensure uniform alignment */
.tag-input-container label {
    align-items: center;
    justify-content: flex-start;
    padding-left: 5px;
    padding-bottom: 2px;
    font-family: 'Montserrat', sans-serif;
    color:dimgray;
    font-size: 5px;
}
.addbtn
{
    border-radius:10px;
    margin-top:5px;
    color:red;
}
.custom-modal-header
{
    border-radius:0px;
    background-color:dodgerblue;
}
.custom-modal-content {
  display: flex;
  flex-direction: column;
  height: 500px; /* Fixed height to show scroll */
  max-width: 400px;
}

.custom-modal-body {
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  padding: 0.5rem 1rem;
  background-color: #f7f7f7;
  overflow-y:hidden;
}
#chatMessages p {
  margin: 5px 0;
  padding:0;
  border-radius: 15px;
  max-width: 75%;
  word-wrap: break-word;
}

/* Styling messages differently by sender - example */
.message-user {
  background-color: #d1e7dd;  /* light green */
  align-self: flex-end;
  text-align: right;
}

.message-student {
  background-color: #f8d7da;  /* light red */
  align-self: flex-start;
  text-align: left;
}

#chatMessages {
        background-color: #f9f9f9;
        border-radius: 8px;
        padding: 10px;
        font-size: 14px;
    }
/* Chat area container */
#chatMessages {
    max-height: 400px;
    overflow-y: auto;
    padding: 10px;
    background: #f9f9f9;
    border: 1px solid #ccc;
    border-radius: 10px;
}

/* Each chat bubble */
.chat-bubble {
    max-width: 80%;
    margin-bottom: 12px;
    padding: 10px 15px;
    border-radius: 15px;
    position: relative;
    word-wrap: break-word;
    background-color: #e4f1ff;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

/* Sender name */
.chat-bubble .sender {
    font-weight: 600;
    margin-bottom: 4px;
    color: #0056b3;
}

/* Timestamp */
.chat-bubble .timestamp {
    font-size: 0.75rem;
    color: gray;
    position: absolute;
    bottom: 5px;
    right: 10px;
}

/* Chat attachment link */
.chat-bubble a {
    color: #007bff;
    text-decoration: underline;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" enctype="multipart/form-data">
    <div class="container">
       <%-- <asp:Literal ID="litAlertMessage" runat="server"></asp:Literal>
        <asp:HiddenField ID="hdnSelectedBatchId" runat="server" ClientIDMode="Static" />
   <div id="myModal" class="modal fade custom-batch-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered custom-modal-dialog">
    <div class="modal-content custom-modal-content d-flex flex-column" style="height: 550px; max-width: 600px;">
      
      <div class="modal-header custom-modal-header">
           <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close" style="background-color:transparent;float:right">X</button>
        <h5 class="modal-title">Add Your Comments</h5>
      </div>
      
      <div class="modal-body custom-modal-body flex-grow-1 overflow-scroll" style="background:#f7f7f7; padding: 10px; display: flex; flex-direction: column;overflow-y:scroll;">
        <!-- Chat messages container -->
       <div id="chatMessages" runat="server" style="flex-grow: 1; overflow-y: scroll; margin-bottom: 10px; border: 1px solid #ddd; border-radius: 5px; padding: 10px; background: #fff;color:black">
       </div>

        <!-- Message input area -->
      </div>
         <div class="modal-body custom-modal-body flex-grow-1 overflow-scroll" style="height:120px;">
              <asp:TextBox ID="ModalFooterStudentTxt" runat="server" CssClass="form-control mb-2" TextMode="MultiLine" Rows="3" Placeholder="Type your message here..."></asp:TextBox>
         </div>
      <div class="modal-footer custom-modal-footer">--%>
      <%--  <asp:Button id="btnSendMessage" class="btn btn-success" onclick="sendMessage()" runat="server" causesvalidation="false">Send <i class='fab fa-telegram-plane'></i></asp:Button>--%>
         <%--<asp:Button ID="btnUpdateStudents" runat="server" Text="Send" CssClass="btn btn-success" OnClick="btnUpdateStudents_Click" CausesValidation="false"/>
      </div>
    </div>
  </div>
</div>--%>
                    
 <%--Chat popup moal --%> 
<!-- Hidden field to store enquiry ID -->
<asp:HiddenField ID="HiddenField2" runat="server" ClientIDMode="Static" />

<!-- Chat Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="chatModalLabel">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content shadow-md rounded-3 border-0">

      <!-- Modal Header -->
      <div class="modal-header bg-primary text-white" style="border-radius:0px;background-color:dodgerblue;">
        <h5 class="modal-title mb-0" id="chatModalLabel">💬 Chat Messages</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <!-- Modal Body -->
      <div class="modal-body p-4">

        
       <%-- <textarea id="txtChatBox" class="form-control mb-3" rows="10" readonly style="resize: none; height: 300px;"></textarea>--%> 
          <!-- File Upload-->
            <div class="input-group mb-3">
                <!-- Chat Display Area -->
              <div id="chatMessages" class="form-control mb-3"  style="height: 300px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background-color: #f9f9f9;">></div>
              <!-- Reply Input -->
               <asp:TextBox ID="txtReply" runat="server" CssClass="form-control mb-3" 
               TextMode="MultiLine" Rows="2" placeholder="Type your reply here..." 
               Style="resize: none;margin-top:10px; border-radius:0.625rem;"></asp:TextBox>
                <!-- Chat Attachment Area -->
                <div class="input-group">
                  <%--  <div class="input-group-prepend">
                        <span class="input-group-text bg-light border" id="uploadIcon">📎</span>
                    </div>--%>
                    <div class="custom-file">
                        <asp:FileUpload ID="fuAttachment" runat="server" CssClass="form-control"  Style="resize: none;margin-top:10px; border-radius:0.625rem;" aria-describedby="uploadIcon"/>
                    </div>
                </div>
            </div>


        <!-- Hidden Enquiry ID -->
        <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />

        <!-- Reply Button -->
        <div class="d-grid gap-2" style="margin-top:5px;">
          <asp:Button ID="btnSendReply" runat="server" CssClass="btn btn-success btn-md" Text="📤 Send Reply" OnClick="btnSendReply_Click" CausesValidation="false" style="border-radius:5px;"/>
        </div>

      </div>
    </div>
  </div>
</div>


 <%--Chat popup moal --%>  
        <div class="top-info">
            <div class="top-items">
                <i class="fas fa-id-card-alt"></i>
                <asp:Label ID="BatchId" runat="server"  CssClass="querystring-label2"></asp:Label>
            </div>
            <div class="top-items">
                <i class="fas fa-chalkboard-teacher"></i>
                <asp:Label ID="FaclutyName" runat="server" CssClass="querystring-label2"></asp:Label>
            </div>
            <div class="top-items">
                <i class="fas fa-calendar-day"></i>
                <asp:Label ID="StartDate" runat="server" CssClass="querystring-label2"></asp:Label>
            </div>
            <div class="top-items">
                <i class="fas fa-calendar-day"></i>
                <asp:Label ID="EndDate" runat="server" CssClass="querystring-label2"></asp:Label>
            </div>
        </div>
        <div class="gridview-area">
            <asp:GridView ID="BatchSheetDetailsGrv" runat="server" DataKeyNames="BatchSheetId" AutoGenerateColumns="false" OnRowCommand="BatchSheetDetailsGrv_RowCommand" OnDataBound="BatchSheetDetailsGrv_DataBound" OnRowEditing="BatchSheetDetailsGrv_RowEditing" OnRowCancelingEdit="BatchSheetDetailsGrv_RowCancelingEdit" OnRowDeleting="BatchSheetDetailsGrv_RowDeleting" OnRowUpdating="BatchSheetDetailsGrv_RowUpdating" ShowFooter="true"  BorderStyle="None" AlternatingRowStyle-BackColor="White"  AlternatingRowStyle-ForeColor="#071a29" CssClass="table table-borderless gridview-table" FooterStyle-CssClass="footer">
                <Columns>
                       <asp:TemplateField  HeaderText="Day" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                           <ItemTemplate>
                               <p class="list"> <%#Container.DataItemIndex+1 %>.</p>
                           </ItemTemplate>
                       </asp:TemplateField>
                      <asp:TemplateField HeaderText="Date" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <ItemTemplate>
                         <asp:Label ID="Datelbl" Text='<%#Eval("Date","{0:dd/MM/yyyy}") %>' DataFormatString="{0:dd/MM/yyyy}" runat="server" CssClass="gridview-item" style="width:100px;height:30px;margin-left:-20px;position:relative;left:-10px"/>
                    </ItemTemplate>
                    <EditItemTemplate>
                         <asp:TextBox ID="DateTxt" Text='<%#Eval("Date","{0:dd/MM/yyyy}") %>' CssClass="form-control" style="width:100px;height:30px;margin-left:0px;" runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="*" ControlToValidate="FooterDate" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" runat="server" />
                         <asp:TextBox ID="FooterDate" TextMode="Date" runat="server" CssClass="dropbtn" style="width:100px;height:30px;margin-left:0px;"/>
                    </FooterTemplate>
                </asp:TemplateField> 
                     <%-- <asp:TemplateField HeaderText="Student Name" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                      <ItemTemplate>
                           <asp:Label ID="Studentlbl" Text='<%#Eval("StudentName") %>' runat="server" CssClass="gridview-item" style="display:inline-block;position:relative;left:0px"/>
                      </ItemTemplate>
                      <EditItemTemplate>
                           <asp:TextBox ID="StudentTxt" Text='<%#Eval("StudentName") %>' CssClass="form-control" style="width:180px;height:30px;margin-left:20px;" runat="server" />
                      </EditItemTemplate>
                      <FooterTemplate>
                           <asp:DropDownList ID="FooterStudentDrp" CssClass="dropbtn" AutoPostBack="true" style="width:150px;height:30px;margin-left:20px;" runat="server"></asp:DropDownList>
                      </FooterTemplate>
                  </asp:TemplateField>--%>
                  <%--  <asp:TemplateField HeaderText="Status" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                      <ItemTemplate>
                           <asp:Label ID="Statuslbl" Text='<%#Eval("Status") %>' runat="server" CssClass="gridview-item"/>
                      </ItemTemplate>
                      <EditItemTemplate>
                           <asp:TextBox ID="StatusTxt" Text='<%#Eval("Status") %>' CssClass="form-control" style="width:100px;height:30px;margin-left:20px;" runat="server" />
                      </EditItemTemplate>
                      <FooterTemplate>
                           <asp:DropDownList ID="FooterStatus" CssClass="dropbtn" style="width:100px;height:30px;margin-left:20px;" runat="server">
                               <asp:ListItem Value="Present">Present</asp:ListItem>
                               <asp:ListItem Value="Absent">Absent</asp:ListItem>
                           </asp:DropDownList>
                      </FooterTemplate>
                  </asp:TemplateField>--%>
                      <asp:TemplateField HeaderText="Chapter Number" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                     <ItemTemplate>
                          <asp:Label ID="Chapterlbl" Text='<%#Eval("ChapterNumber") %>' runat="server" CssClass="gridview-item"/>
                     </ItemTemplate>
                     <EditItemTemplate>
                          <asp:TextBox ID="ChapterTxt" Text='<%#Eval("ChapterNumber") %>' CssClass="form-control" style="width:90px;height:30px;margin-left:20px;" runat="server" />
                     </EditItemTemplate>
                     <FooterTemplate>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="*" ControlToValidate="ChapterDrp" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" runat="server" />
                          <asp:CustomValidator ID="CustomValidator" ControlToValidate="ChapterDrp" ErrorMessage="*" OnServerValidate="CustomValidator_ServerValidate" ForeColor="Red" Display="Dynamic" runat="server" />
                         <asp:DropDownList ID="ChapterDrp" runat="server" CssClass="dropbtn" AutoPostBack="true" style="width:150px;height:30px;margin-left:20px;" CausesValidation="false"></asp:DropDownList>
                     </FooterTemplate>
                 </asp:TemplateField>
                  <asp:TemplateField HeaderText="Topic Covered" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                      <ItemTemplate>
                           <asp:Label ID="Topiclbl" Text='<%#Eval("TopicCovered") %>' runat="server" CssClass="gridview-item" style="display:inline-block"/>
                      </ItemTemplate>
                      <EditItemTemplate>
                           <asp:TextBox ID="TopicTxt" Text='<%#Eval("TopicCovered") %>' CssClass="form-control" style="width:180px;height:30px;margin-left:20px;" runat="server" />
                      </EditItemTemplate>
                      <FooterTemplate>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="*" ControlToValidate="FooterTopic" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" runat="server" />
                          <asp:TextBox ID="FooterTopic" CssClass="form-control" style="width:180px;height:30px;margin-left:20px;" runat="server" placeholder="Enter Topic Name"/>
                      </FooterTemplate>
                  </asp:TemplateField>
                
                    <asp:TemplateField HeaderText="Uploads" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                     <ItemTemplate>
                          <asp:Label ID="filelbl" Text='<%#Eval("uploads") %>' runat="server" CssClass="gridview-item"/>
                     <%-- <asp:LinkButton ID="uploads" runat="server" 
        Text='<%# Eval("uploads") %>' 
        CommandArgument='<%# Eval("uploads") %>' 
        OnCommand="PreviewFile" 
        CssClass="gridview-item" 
        CausesValidation="false">
    </asp:LinkButton>--%>
                     </ItemTemplate>
                     <EditItemTemplate>
                          <asp:TextBox ID="fileTxt" Text='<%#Eval("uploads") %>' CssClass="form-control" style="width:180px;height:30px;margin-left:20px;" runat="server" />
                     </EditItemTemplate>
                     <FooterTemplate>
                         <asp:FileUpload ID="FileUpload1" runat="server" style="width:230px;height:30px;position:relative;top:2px"/>
                     </FooterTemplate>
                 </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Add Comment" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                   <%-- <ItemTemplate>
                          <asp:Label ID="Commentlbl" Text='<%#Eval("Comments") %>' runat="server" CssClass="gridview-item"/>
                     </ItemTemplate>--%>
                    <%-- <EditItemTemplate>
                          <asp:TextBox ID="CommentsTxt" Text='<%#Eval("Comments") %>' CssClass="form-control" style="width:180px;height:30px;margin-left:20px;" runat="server" />
                     </EditItemTemplate>--%>
                         <ItemTemplate>
                                     <%-- <a id="btnRDemo" href="#" class="addbtn" 
                                   data-toggle="modal" 
                                   data-target="#myModal" 
                                   onclick="openStudentModal(<%# Eval("BatchSheetId") %>); return false;" 
                                   target="_parent">Add Comment</a>--%>
                            <%-- <a id="btnRDemo" 
                               href="#" 
                               class="addbtn" 
                                 data-toggle="modal" 
                                data-target="#myModal2" 
                               onclick='openStudentModal(<%# Eval("BatchSheetId") %>); return false;'>
                               Add Comment
                            </a>--%>
                               <asp:LinkButton ID="lnkComment" runat="server"
                                   Text='<%# Bind("Comments") %>'
                                   CssClass="gridview-item comment-link" data-toggle="modal"
                                   data-target="#myModal2" target="_parent" OnClientClick='<%# "openChatModal(" + Eval("BatchSheetId") + "); return false;" %>'  data-id='<%# Eval("Comments") %>'>
                                </asp:LinkButton>
                         </ItemTemplate>
                     <FooterTemplate>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ErrorMessage="*" ControlToValidate="FooterComments" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" runat="server" />
                          <asp:TextBox ID="FooterComments" CssClass="form-control" style="width:180px;height:30px;margin-left:20px;" runat="server" placeholder="Enter Comments"/>
                          
                     </FooterTemplate>
                 </asp:TemplateField> 
                 <asp:TemplateField HeaderText="Action" HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" ItemStyle-CssClass="gridview-item" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                     <ItemTemplate>
                          <asp:ImageButton ID="EditBtn" ImageUrl="~/Images/edit-icon-png-3598.png" CommandName="Edit" runat="server" ToolTip="Edit" Width="20px" Height="20px" CausesValidation="false"/>
                          <asp:ImageButton ID="DeleteBtn"  ImageUrl="~/Images/DeleteDoc.png" CommandName="Delete" runat="server" ToolTip="Delete" Width="19px" Height="19px" CausesValidation="false"/>
                     </ItemTemplate>
                     <EditItemTemplate>
                         <asp:ImageButton ID="UpdateBtn" ImageUrl="~/Images/UpdateDoc.png" CommandName="Update" runat="server" ToolTip="Update" Width="20px" Height="20px" CausesValidation="false"/>   
                         <asp:ImageButton ID="CancelBtn" ImageUrl="~/Images/cancel.png" CommandName="Cancel" runat="server" ToolTip="Cancel" Width="19px" Height="19px" CausesValidation="false"/>
                     </EditItemTemplate>
                     <FooterTemplate>
                          <asp:ImageButton ID="AddBtn" Text="Add Details" ToolTip="Add" runat="server" CommandName="Add" ImageUrl="~/Images/AddDoc.png" Width="25px" Height="25px" ImageAlign="Middle" CssClass="add"/>
                     </FooterTemplate>
                 </asp:TemplateField>
                 </Columns>
            </asp:GridView>
        </div>
            <div class="btn-group" role="group" aria-label="Basic example">
       <asp:Button ID="BackButton" runat="server" Text="Go To Batch List" OnClick="BackButton_Click"  CssClass="btn btn-danger text-danger" style="margin-top:3px;position:absolute;left:1125px;border-radius:5px;" CausesValidation="false"/>
</div>
    </div>
    <div>
    <asp:Label ID="Errorlbl" runat="server" />
    </div>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    function openChatModal(BatchSheetId) {
        console.log("Selected BatchSheetId:", BatchSheetId);

        $('#<%= HiddenField2.ClientID %>').val(BatchSheetId);
        $('#txtReply').val('');
        $('#chatMessages').html('');
        $('#myModal2').modal('show');

        $.ajax({
            type: "POST",
            url: 'NewBatchSheetDetails.aspx/GetChatMessages',
            data: JSON.stringify({ batchSheetId: BatchSheetId }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var messages = response.d;
                var chatHTML = "";

                if (Array.isArray(messages)) {
                    messages.forEach(function (msg) {
                        var sender = msg.Sender || "Unknown";
                        var text = escapeHtml(msg.MessageText || "");
                        var date = msg.MessageDateTime || "";
                        var file = msg.FileAttachment || "";

                        var isAdmin = (sender.toLowerCase() === "admin"); // customize as per logic
                        var bubbleClass = isAdmin ? "admin-bubble" : "user-bubble";

                        chatHTML += `<div class="chat-bubble ${bubbleClass}">`;

                        // Header with sender
                        chatHTML += `<div class="sender font-weight-bold">${sender}</div>`;

                        // Message
                        chatHTML += `<div class="message-text">${text}</div>`;

                        // File (if available)
                        if (file !== "") {
                            var fileName = file.substring(file.lastIndexOf('/') + 1);
                            var downloadUrl = file.replace("~", "");
                            chatHTML += `<div class="file-link mt-1">📎 <a href='${downloadUrl}' target='_blank' download class='text-primary'>${fileName}</a></div>`;
                        }

                        // Timestamp
                        if (date) {
                            chatHTML += `<div class="timestamp text-muted small mt-1">🕒 ${date}</div>`;
                        }

                        chatHTML += `</div>`; // close chat bubble
                    });
                } else {
                    chatHTML = `<div class="alert alert-warning">No messages found.</div>`;
                }

                $('#chatMessages').html(chatHTML);
                $('#chatMessages').scrollTop($('#chatMessages')[0].scrollHeight); // scroll to bottom
            },
            error: function (xhr, status, error) {
                console.error("Error fetching chat:", error);
                alert("Error loading chat messages.");
            }
        });
    }

    // Helper function to escape special characters in message text
    function escapeHtml(text) {
        return $('<div>').text(text).html();
    }
</script>

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        var currentBatchId = 0;  // set this dynamically when modal opens

        document.querySelectorAll('.addbtn').forEach(btn => {
            btn.addEventListener('click', function (e) {
                e.preventDefault();
                var batchId = this.getAttribute('data-batchid');
                openStudentModal(batchId);
            });
        });

        function openStudentModal(batchId) {
            currentBatchId = batchId;
            // Agar Bootstrap 5 use kar rahe ho to:
            var myModalEl = document.getElementById('myModal');
            var modal = bootstrap.Modal.getInstance(myModalEl);
            if (!modal) modal = new bootstrap.Modal(myModalEl);
            modal.show();

            document.getElementById('ModalFooterStudentTxt').value = '';
            loadMessages();
        }


        function sendMessage() {
            var message = document.getElementById('ModalFooterStudentTxt').value.trim();
            if (message === "") return alert("Please enter a message.");

            $.ajax({
                type: "POST",
                url: "NewBatchSheetDetails.aspx/SaveBatchMessage",
                data: JSON.stringify({ batchId: currentBatchId, messageText: message }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d === "Success") {
                        alert("Message sent successfully");
                        loadBatchMessages(currentBatchId);
                    } else {
                        alert("Server error: " + response.d);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("AJAX error:", status, error);
                    alert("AJAX error: " + error);
                }
            });

        }

        function loadMessages() {
            $.ajax({
                type: "POST",
                url: "NewBatchSheetDetails.aspx/GetBatchMessages",
                data: JSON.stringify({ batchId: currentBatchId }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var messages = response.d;
                    var chatWindow = document.getElementById('chatWindow');
                    chatWindow.innerHTML = "";

                    messages.forEach(function (msg) {
                        var msgDiv = document.createElement('div');
                        msgDiv.className = "chat-message";
                        msgDiv.innerHTML = "<strong>" + (msg.SenderName || "Admin") + ":</strong> " + msg.MessageText +
                            "<br><small>" + new Date(msg.SentOn).toLocaleString() + "</small>";
                        chatWindow.appendChild(msgDiv);
                    });

                    chatWindow.scrollTop = chatWindow.scrollHeight;
                }
            });
        }

    </script>--%>
<%--<script>
    setTimeout(function () {
        var alertBox = document.querySelector("#<%= litAlertMessage.ClientID %>");
        if (alertBox) {
            alertBox.style.display = "none";
        }
    }, 4000); // hides after 4 seconds
</script>--%>
<script type="text/javascript">
    function openStudentModal(batchSheetId) {
        document.getElementById("hdnSelectedBatchId").value = batchSheetId;
        console.log(batchSheetId);
        $('#myModal').modal('show'); // Bootstrap 5 will work if modal is correct
    }
</script>

</asp:Content>
