<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="NewImageManager.aspx.cs" Inherits="ENOSISLEARNING.NewImagelider" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link href="Content/bootstrap.css" rel="stylesheet" />
 <%--<link href="Dashboard_File/css/bootstrap.min.css" rel="stylesheet" />--%>

 <script src="Scripts/jquery-3.4.1.min.js"></script>
 <script src="Scripts/bootstrap.min.js"></script>
 <script src="js/jquery-3.3.1.min.js"></script>
           <link href="../Layout_file/libs/flot/css/float-chart.css" rel="stylesheet"/>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
    <script  src="https://www.googletagmanager.com/gtag/js?id=UA-35962033-1"></script>
     <link rel="stylesheet" type="text/css" href="css/bootstrap-min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css" />
  <script type="text/javascript" src="Scripts/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    
     <%-- Jquery --%>
    <script src="js/jquery-3.3.1.min.js"></script>
  
    <%-- Popper JS --%>
     <script src="../Layout_file/libs/popper.js/dist/umd/popper.min.js"></script>
 <script type="text/javascript">
     $(document).ready(function () {
         $("#myModal").modal('hide');

     });

 </script>
 <script type="text/javascript">
     function openModal() {

         //$('#myModal').modal();
         $("#myModal").modal('show');
     }
 </script>
 <script type="text/javascript">
     function CloseModal() {

         $("#myModal").modal('hide');
     }

 </script>
    <script>
    function openImage(filePath) {
        window.open(filePath, '_blank');
    } </script>
  
     <style>
    *
    {
        margin:0;
        padding:0;
        box-sizing:border-box;
    }
    html,body
    {
        width:100%;
        height:100%;
    }    
     .container
    {
       width:95%;
       height:100%;
       margin-top :5px;
       margin:auto;
    }  
    .head
    {
        width:100%;
        height:100px;
        border:0px solid green;
    }
    .form-control
    {
      text-align:center;
    }
    th
    {
        text-align:center;
        margin-bottom:5px;
    }
    .SortBy
    {
        display:inline;
        width:53%;
        height:30px;
        margin-bottom:25px;
    }
    .drp
    {
        width:150px;
        font-family:'Times New Roman';
        font-weight:500;
        border-top:none;
        border-right:none;
        border-left:none;
    }
     .txtbx
     {
          width:200px;
          font-family:'Times New Roman';
          margin-left:10px;
          border-top:none;
          border-right:none;
          border-left:none;
          border-bottom:1px solid grey;
     }
     .grv
     {
         margin-top:15px;
     }
     .file
     {
         color:black;
     }
     .heading
     {
         font-weight:700;
     }
     .tab
     {
         
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
.gridview-item:hover 
{
     background-color: rgba(0, 0, 0, 0.03);
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
 .font{
     font-size: 14px;
 }
 .vacancy-top-tab {
text-align: center;
padding: 10px 10px 10px;
background-color: #1d96b2;  
border-radius:15px;
}
.vacancy-top-tab select {
padding: 7px;
border:none;
position: relative;
top: 1px;
}
.br
{
    border-radius: 15px;     
}
.close
{
    width:30px;
    height:30px;
    color:red;
    font-size:40px;
}
.close:hover
{
    color:red;
}
   
    .modal-header {
       
        color: white; /* Text color for the header */
        border-style: none;
    }
    
     .containerr
    {
          background-color:transparent;
    }
     .hidden {
    display: none;
    }
     .card
     {
         border:0.125rem solid #ddd;
         display:inline-block;
         margin:10px 0 10px 15px;
         padding:15px 12px;
         border-radius:0.625rem;
     }
     .card-body img
     {
         width:100%;
         height:30px;
         text-align:center;

     }
     .card-body span
     {
         color:#333;
         font-size:14px;
         text-align:center;
     }
     .hr
     {
         width:100px;
         color:#333;
         margin:auto;
         margin-top:5px;
     }
     .del{
         display: flex;
          align-items: center;
     }

     .name-delete {
    display: flex;
    align-items: center;       /* vertical center */
    justify-content: space-between; /* text left, button right */
    gap: 10px;                 /* thoda space */
}

.img-name {
    font-size: 14px;
    font-weight: 500;
    color: #333;
    flex: 1;                   /* text ko left side fill karne de */
}

.name-delete img { 
    cursor: pointer;           /* delete icon hover pointer */
}



.pagination-container {
    margin-top: 15px;
    text-align: center;
}

.page-btn {
    margin: 3px;
    padding: 6px 12px;
    background-color: #007bff;
    border: none;
    color: white;
    border-radius: 4px;
    cursor: pointer;
}

.page-btn:disabled {
    background-color: #ccc;
    cursor: not-allowed;
}

.page-info {
   /* margin: 0 10px;*/
    font-weight: bold;
    color: #007bff;
}
        
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <div class="container">
     <%--   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
          <div class="vacancy-top-tab" style="height:58px">
            <table class="table table-borderless" style=" background-color :#1d96b2;position: relative;margin-top: -11px;border-radius: 15px;">
              
                <tr>

            <td class="text-center" style="border-radius:50px;border-style: none;">
     <asp:TextBox ID="txtdocname" runat="server" placeholder="Search_Image_Name" Style="border-radius:15px; text-align:center;border-style: none;
      " Height="35px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <%-- <asp:Button ID="Btnsearch" runat="server" Text="Search" OnClick="Btnsearch_Click" Cssclass="btn-primary" Width="80px"  Height="35px"/>--%>
                <asp:LinkButton ID="Btnsearch" Width="35px" Height="35px" style="background-color:white; border-radius:15px" runat="server" OnClick="Btnsearch_Click">
                 <img src="../img/View.png" title="Search" height="25" width="25" /><span class="hidden-xs"></span></asp:LinkButton>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Button ID="Cancel"  runat="server" onclick="Cancel_Click" Text="View All" BorderColor="Green"  BackColor="Green" CssClass="btn btn-danger bton datafield br" BorderStyle="Solid"   />  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="Btnclear" runat="server" Text="Clear"  BorderColor="Green"  BackColor="Green" style="border-radius:15px;" ForeColor="White" Width="80px"  Height="35px" OnClick="Btnclear_Click"/>
           
          </td>

           <td style="border-radius:50px;border-style: none;">
      <%--   <asp:Button ID="btnadd" runat="server" Text="Add Image" OnClick="btnadd_Click" Width="140px" Height="35px"  Cssclass=" br" style="height:35px;width:140px;background-color: #1D96B2;color: white;"/>--%>

                <a id="btnRDemo" href="#" class="btn btn-danger br" style="box-shadow: 1px 1px 3px 1px gray"" data-toggle="modal" data-target="#myModal" target="_parent"><span>  <img src="../img/Add4.png"  title="Add" height="25" width="25" /></span> &nbsp;ADD NEW Image</a> 
         </td>
        </tr>
            </table>
            
          
            <!-- Modal Dialog -->
     <div id="myModal" clientidmode="Static" class="modal fade" data-backdrop="false"  role="dialog" style="background-color:#ddd;">
        <div class="modal-dialog custom-modal-width modal-dialog-centered">
            <div class="modal-content br">
                     
                <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 
         
                </div>

                <div class="modal-body">
                     <h4 class="modal-title" style="text-align: center;color: #1d96b2;">Add New Image</h4>
            <b><asp:Label ID="Label1" runat="server" Text="Image Name"></asp:Label></b>
               <asp:TextBox ID="txtname" CssClass="form-control br"  runat="server" placeholder="Enter Image Name" style="
    text-align: center;
" />
                    <asp:RequiredFieldValidator ID="rfvalid" runat="server" ErrorMessage="Name is Required" ForeColor="Red" ControlToValidate="txtname" ValidationGroup="test" CssClass="float-right"></asp:RequiredFieldValidator>

            <b><asp:Label ID="Label2" runat="server" Text="Image"></asp:Label></b>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control br" />
                    <asp:RequiredFieldValidator ID="rfvalidfile" runat="server" ErrorMessage="File is Required" ForeColor="Red" ControlToValidate="FileUpload1" ValidationGroup="test" CssClass="float-right"></asp:RequiredFieldValidator>
                 </div>
                 <div class="modal-footer">
                    
                 <asp:Button ID="Btnsave" runat="server" Text="Save" ValidationGroup="test" OnClick="Btnsave_Click" Height="35px" Width="110px" Cssclass="btn-primary br"/>
                 </div>
             </div>
        </div>

    </div>
    </div>


<asp:Repeater ID="rptGallery" runat="server" OnItemCommand="rptGallery_ItemCommand">
    <ItemTemplate>
        <div class="card">
            <img src='<%# ResolveUrl(Eval("filePath").ToString()) %>' 
                 alt='<%# Eval("ImageName") %>' 
                 width="150" height="150" style="margin-bottom:5px;" />
            <hr class="mt-2" />
            <div class="card-body">
                <div class="name-delete">
                    <span class="img-name"><%# Eval("ImageName") %></span>
                    
                        <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false"
    OnClientClick="return confirm('Do you want to delete this record?');"
    CommandName="Delete" CommandArgument='<%# Eval("imgId") %>'
    ToolTip="Delete" ImageUrl="~/img/Delete3.png" Width="20" Height="20" />
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>


<div class="pagination-container">
    <asp:Button ID="btnFirst" runat="server" Text="First" CssClass="page-btn" OnClick="btnFirst_Click" />
    <asp:Button ID="btnPrevious" runat="server" Text="Previous" CssClass="page-btn" OnClick="btnPrevious_Click" />
    <asp:Label ID="lblPageInfo" runat="server" Style="position: relative; left: 0px;" CssClass="page-info"></asp:Label>
    <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="page-btn" OnClick="btnNext_Click" />
    <asp:Button ID="btnLast" runat="server" Text="Last" CssClass="page-btn" OnClick="btnLast_Click" />
</div>


   <%-- slider--%>
 <div class="containerr hidden">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators" runat="server" id="carouselIndicators">
       
    </ol>
    <div class="carousel-inner" runat="server" id="carouselInner" style="border-radius: 15px;">
       
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
        </div>
          
     <div id="tabs" style="height:100%; border-radius: 15px;" class="gridview-area">  
    <asp:GridView ID="GridView1" Visible="false"  runat="server" AutoGenerateColumns="false" DataKeyNames="imgId" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" class="gridview-area" 
         OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowUpdating="GridView1_RowUpdating"  HeaderStyle-BackColor="#14A3C7"  AllowPaging="true" PagerSettings-Mode="NumericFirstLast" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last"  PageSize="10"  EditRowStyle-ForeColor="Black" ViewStateMode="Enabled"
          BorderStyle="None" AlternatingRowStyle-BackColor="white"   CssClass="table table-borderless gridview-table" FooterStyle-CssClass="footer">
         <PagerStyle HorizontalAlign="Right" CssClass="GridPager" BorderStyle="Solid" ForeColor="black"/>
              <Columns>
                 
                  <asp:TemplateField HeaderText="Image Name"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>
                    <asp:Label ID="lbldname" Text='<%#Eval("ImageName") %>'  CssClass="gridview-item" runat="server"  ForeColor="Black" Font-Size="Small"/>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtdname"  style="text-align: center;border-radius:50px" Text='<%#Eval("ImageName") %>' runat="server" ForeColor="Black"/>
                         </EditItemTemplate>
                         </asp:TemplateField>

                  <asp:TemplateField HeaderText="Path"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>
                  <asp:Label ID="lblpath" Text='<%#Eval("filePath") %>'  CssClass="gridview-item" runat="server" ForeColor="Black" Font-Size="Small"/>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:FileUpload ID="txtpath"  style="text-align: center;border-radius:50px" Text='<%#Eval("filePath") %>' runat="server" ForeColor="Black" />
                             
                         </EditItemTemplate>
                         </asp:TemplateField>

                  
                 

                  <asp:TemplateField HeaderText="Action"  HeaderStyle-Font-Bold="true" HeaderStyle-CssClass="gridview-header" FooterStyle-BorderStyle="None" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                         <ItemTemplate>
                         
                               <asp:ImageButton ID="Open" runat="server" CausesValidation="false" CommandName="View"
                                 AlternateText="View Image" CommandArgument='<%# Container.DataItemIndex %>' ToolTip="View Image"  ImageUrl="~/img/admin.png" Width="25" Height="25" />

                    <%--                             <asp:Button ID="Open" runat="server" Text="View Image"  CssClass="bg-info" ForeColor="White" />--%>

                             <asp:ImageButton ID="Edit" runat="server" CausesValidation="false" CommandName="Edit"
                             Text="Delete" ToolTip="Edit"  ImageUrl="~/img/Edit1.png" Width="20" Height="20" />

                           <%--  <asp:ImageButton ID="Delete" runat="server" CausesValidation="false" onclientclick="return confirm('Do you  want to delete this record?');"
                         CommandName="Delete" Text="Delete" ToolTip="Delete"  ImageUrl="~/img/Delete3.png" Width="20" Height="20" />--%>
                         </ItemTemplate>

                         <EditItemTemplate>
                          
                              <asp:ImageButton ID="Update" runat="server" CausesValidation="false" onclientclick="return confirm('Do you want to Update this record?');"
                        CommandName="Update" Text="SAVE" ToolTip="Update"  ImageUrl="~/img/Add4.png" Width="20" Height="20" />
                              <asp:ImageButton ID="Cancel" runat="server"  CausesValidation="false" onclientclick="return confirm('Do you want to Cancel this record?');"
                        CommandName="Cancel" Text="Cancel" ToolTip="Cancel"  ImageUrl="~/img/cancel2.png" Width="20" Height="20" />
                         </EditItemTemplate>
                     </asp:TemplateField>
              </Columns>
         <EditRowStyle />
 <%-- <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />--%>
   <HeaderStyle Font-Bold="True" BackColor="#5D7B9D" ForeColor="White"></HeaderStyle>
  <PagerStyle BackColor="#1d96b2" ForeColor="White" HorizontalAlign="Center" />
  <%--<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />--%>
  <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
  <SortedAscendingCellStyle BackColor="#E9E7E2" />
  <SortedAscendingHeaderStyle BackColor="#506C8C" />
  <SortedDescendingCellStyle BackColor="#FFFDF8" />
  <SortedDescendingHeaderStyle BackColor="#6F8DAE" /> 
            </asp:GridView>
         </div>






          </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</asp:Content>
