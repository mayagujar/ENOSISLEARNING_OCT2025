<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.Master" AutoEventWireup="true" CodeBehind="CourseContentDetails.aspx.cs" Inherits="ENOSISLEARNING.CorseContentDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="css/bootstrap-min.css" rel="stylesheet" />
<style>
      .header
 {
     background-color: #173151;
     color: white;
     font-family:'Times New Roman', Times, serif;
     font-size:16px;
     font-weight:900;
     text-align:center;
 }
 .empty
 {
     text-align:center;
     border:none;
 }
 .drp
 {
     width:200px;
     height:30px;
     border-bottom:0.5px solid lightgrey;
     border-top:none;
     border-right:none;
     border-left:none;
     color:black;
     font-weight:600;
     font-family:'Times New Roman', Times, serif;
     font-size:17px;
 }
 .table
 {
     margin-top:10px;
     
 }
 .list
 {
     text-align:center;
     font-family:'Times New Roman', Times, serif;
     font-size:15px;
     font-weight:900;
 }
 .list2
{
    text-align:center;
    font-family:'Times New Roman', Times, serif;
    font-size:15px;
    font-weight:900;
    color:red;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="form1" runat="server">
        <div class="main">
    <div class="CourseList">
        <%-- DropDown --%>
            <asp:DropDownList ID="drpCourses" runat="server" OnSelectedIndexChanged="drpCourses_SelectedIndexChanged" AutoPostBack="true" CssClass="drp"></asp:DropDownList>
        <%-- DropDown --%>
         <%-- Gridview - 1 Starts--%>
        <div class="ChpGrv">
            <asp:GridView ID="Chaptergv" DataKeyNames="Chapter_Id" AutoGenerateColumns="false"  ShowFooter="true" ShowHeaderWhenEmpty="true" OnRowCommand="Chaptergv_RowCommand" OnRowDataBound="Chaptergv_RowDataBound" OnRowEditing="Chaptergv_RowEditing" OnRowCancelingEdit="Chaptergv_RowCancelingEdit" OnRowUpdating="Chaptergv_RowUpdating" OnRowDeleting="Chaptergv_RowDeleting" CssClass="table" runat="server" Width="850px">
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="header" HeaderStyle-Width="10px" ItemStyle-Height="20px" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                              <img alt="" style="cursor: pointer" src="images/plus.png"/>
                             <%--GridView 2 Panel Starts--%>
                             <asp:Panel ID="TopicPanel" runat="server" Style="display: none">
                                   <%-- Gridview - 2 Starts--%>
                                 <asp:GridView ID="TopicGrv" DataKeyNames="Topic_Id" AutoGenerateColumns="false" ShowFooter="true" ShowFooterWhenEmpty="true" ShowHeaderWhenEmpty="true" OnRowCommand="TopicGrv_RowCommand" runat="server" CssClass="table table-responsive" Width="900px">
                                     <Columns>
                                         <asp:TemplateField  HeaderText="Sr. no" HeaderStyle-CssClass="header" HeaderStyle-Width="100px">
                                             <ItemTemplate>
                                                 <p class="list"> <%#Container.DataItemIndex+1 %></p>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                     </Columns>
                                     <Columns>
                                         <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="HdnTopicId" Visible="false" runat="server" Value='<%#Eval("Topic_Id")%>'/>
                                            </ItemTemplate>
                                          </asp:TemplateField>
                                         <asp:TemplateField ItemStyle-CssClass="list" HeaderStyle-CssClass="header" HeaderText="Topic Name" ItemStyle-Width="850px">
                                             <ItemTemplate>
                                                  <asp:Label ID="TopicNameLabel" runat="server" Text='<%#Eval("Topic_Name") %>'></asp:Label>
                                             </ItemTemplate>
                                              <EditItemTemplate>
                                                  <asp:TextBox ID="Topic_NameTxt" Text='<%# Eval("Topic_Name") %>' runat="server" CssClass="form-control" CausesValidation="false"/>
                                             </EditItemTemplate>
                                             <FooterTemplate>
                                                 <asp:TextBox ID="FooterTopic_NameTxt" placeholder="Add Topic Name" runat="server" CssClass="form-control"/>
                                                 <asp:RequiredFieldValidator ID="Topic" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ErrorMessage="*" ControlToValidate="FooterTopic_NameTxt" runat="server" />
                                             </FooterTemplate>
                                         </asp:TemplateField>
                                     </Columns>
                                     <Columns>
                                         <asp:TemplateField ItemStyle-CssClass="list" HeaderStyle-CssClass="header" HeaderText="Days" HeaderStyle-Width="125px">
                                             <ItemTemplate>
                                                  <asp:Label ID="DaysLabel" runat="server" Text='<%#Eval("Days") %>'></asp:Label>
                                             </ItemTemplate>
                                             <EditItemTemplate>
                                                 <asp:TextBox ID="DaysTxt" Text='<%# Eval("Days") %>' runat="server" CssClass="form-control" CausesValidation="false"/>
                                             </EditItemTemplate>
                                             <FooterTemplate>
                                                 <asp:TextBox ID="FooterTopic_DaysTxt" placeholder="Days" runat="server" CssClass="form-control" style="display:inline"/>
                                                 <asp:RequiredFieldValidator ID="Days" ErrorMessage="*" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="FooterTopic_DaysTxt" runat="server"/>
                                             </FooterTemplate>
                                         </asp:TemplateField>
                                               <asp:TemplateField HeaderStyle-CssClass="header" HeaderText="Action" ItemStyle-CssClass="list">
                                                <ItemTemplate>
                                                   <%-- <asp:ImageButton ID="EditTopicBtn" ImageUrl="~/CourseContentImages/icons8-edit-property-48.png" Text="Edit"  CommandName="EditTopic" CausesValidation="false" ToolTip="Edit Topic" Width="20px" Height="20px" ImageAlign="Middle"  runat="server"/>--%>
                                                    <asp:ImageButton ID="DeleteTopic" ImageUrl="~/CourseContentImages/icons8-delete-48.png" CommandName="DeleteTopic"  ToolTip="Delete Topic" Width="20px" Height="20px" runat="server" ImageAlign="Middle" CausesValidation="false"/>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:ImageButton ImageUrl="~/CourseContentImages/icons8-save-50.png" CommandName="UpdateTopic" CausesValidation="false"  ToolTip="Update Topic" Width="20px" Height="20px" runat="server"/>
                                                   <asp:ImageButton ImageUrl="~/CourseContentImages/icons8-cancel-48.png" CommandName="CancelTopic" ToolTip="Cancel" Width="20px" CausesValidation="false" Height="20px" runat="server"/>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Button ID="AddTopicBtn" Text="Add Topic" ToolTip="Add New Topic" CommandName="AddTopicGrv" CssClass="btn btn-primary" ImageAlign="Middle" runat="server" CausesValidation="false"/>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                     </Columns>
                                 </asp:GridView>
                                   <%-- Gridview - 2 End--%>
                             </asp:Panel>
                             <%--GridView 2 Panel End--%>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
                              <ItemTemplate>
                               <asp:Label runat="server" ID="LblChpId" Visible="false" Text='<%#Eval("Chapter_Id") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Chapter Number" ItemStyle-CssClass="list" HeaderStyle-CssClass="header">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("Chapter_Number") %>' CssClass="list2"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Chapter_NumberTxt" Text='<%# Eval("Chapter_Number") %>' runat="server" CssClass="form-control"/>
                            </EditItemTemplate>
                            <FooterTemplate>
                                 <asp:TextBox ID="FooterChapter_NumberTxt" placeholder="Add New Chapter" runat="server" CssClass="form-control"/>
                                 <asp:RequiredFieldValidator ID="Chapter" ErrorMessage="*" ControlToValidate="FooterChapter_NumberTxt" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" runat="server"/>
                           </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="header" HeaderText="Action" ItemStyle-HorizontalAlign="center">
                            <ItemTemplate>
                                <asp:ImageButton ImageUrl="~/CourseContentImages/icons8-edit-property-48.png" CausesValidation="false" ToolTip="Edit" CommandName="Edit" Width="20px" Height="20px" runat="server"/>
                                <asp:ImageButton ImageUrl="~/CourseContentImages/icons8-delete-48.png" CausesValidation="false" ToolTip="Delete" CommandName="Delete" Width="20px" Height="20px" runat="server"/>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ImageUrl="~/CourseContentImages/icons8-save-50.png" ToolTip="Update" CommandName="Update" Width="20px" Height="20px" runat="server"/>
                               <asp:ImageButton ImageUrl="~/CourseContentImages/icons8-cancel-48.png" ToolTip="Cancel" CommandName="Cancel" Width="20px" Height="20px" runat="server"/>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ImageUrl="~/CourseContentImages/icons8-add-48.png" CommandName="AddNew" CausesValidation="false" ToolTip="Add New Chapter" Width="20px" Height="20px" ImageAlign="Middle" runat="server"/>
                            </FooterTemplate>
                     </asp:TemplateField>
               </Columns>
            </asp:GridView>
        </div>
         <%-- Gridview - 1 --%>
    </div>
    <%-- Label --%>
    <asp:Label ID="lblSuccessMessage" ForeColor="Green" Text="" runat="server"></asp:Label>
    <asp:Label ID="lblErrorMessage" ForeColor="Red" Text="" runat="server"></asp:Label>
    <%-- Label --%>
</div>  
<%--Collapse script Starts--%>
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
     <script type="text/javascript">
         $("[src*=plus]").live("click", function () {
             $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
             $(this).attr("src", "images/minus.png");
         });
         $("[src*=minus]").live("click", function () {
             $(this).attr("src", "images/plus.png");
             $(this).closest("tr").next().remove();
         });
     </script>
<%--Collapse script Ends--%>
    </form>
</asp:Content>
