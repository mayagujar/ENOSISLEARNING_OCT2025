<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="Enquiries.aspx.cs" Inherits="ENOSISLEARNING.Enquiries" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link href="css/MyAdmin.css" rel="stylesheet" />
     <script src="js/jquery-3.3.1.min.js"></script>
     <link href="../Layout_file/libs/flot/css/float-chart.css" rel="stylesheet"/>
   <%-- <link href="../Layout_file/css/style.min.css" rel="stylesheet"/>--%>
   
    <!--[if lt IE 9]>
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
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.ico"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.6.2/css/bootstrap.min.css">

     <%-- Font Style --%>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond&display=swap"/>
    <%-- Bootstrap CSS --%>
    <link href="css/bootstrap-min.css" rel="stylesheet" />
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <%-- Font Awesome --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
     <%-- Jquery --%>
    <script src="js/jquery-3.3.1.min.js"></script>
    <%-- Popper JS --%>
     <script src="../Layout_file/libs/popper.js/dist/umd/popper.min.js"></script>

    <style>
         *
         {
             font-family: 'Montserrat', sans-serif;
             box-sizing:border-box;
         } 
         .container
          {
             width: 100%;
             height:100%;
             margin-top :3px;
             overflow:auto;
          }
          body
         {
             /*background-color:white;*/
         }
          .menu2
        {
            max-width : 1345px;
            margin-top:5px;
            width:100%;
            height:50px;
            margin: auto;
            background-color:#ffffff;
            display:flex;
            border : 1px solid white;
            border-radius : 20px;
            margin-top:5px;
        }
     .Simage
     {
         width:50px;
         height:100%;
         background-color : white;
         border-radius : 50%;
     }
     .Coursedrp
     {
         width:100px;
         height:100%;
         background-color:white;
     }
     .Cdrp
     {
         width:100%;
         height:50%;
         font-size : 18px;
         margin:10px 0px 0px 12px;
         background-color:white;
         border : none;
     }
    .Cdrp option {
          background-color: transparent;
          color: #333;
          padding: 8px;
          font-size:12px;
        }
    .Coursedrp2
     {
         width:130px;
         height:100%;
         background-color:transparent;
     }
     .Cdrp2
     {
         width:100%;
         height:50%;
         font-size : 18px;
         margin:10px 0px 0px 12px;
         background-color:transparent;
         border : none;
     }
    .Cdrp2 option {
          background-color: transparent;
          color: #333;
          padding: 8px;
          font-size:12px;
        }
     .separater
     {
     width:50px;
     height : 100%;
     background-color : transparent;
     font-size : 20px;
     padding : 6px 0px 0px 24px;
     font-weight : lighter;
         }
         .Cdrp:focus 
         {
         border: none;
         } 
         .Cdrp2:focus 
         {
         border: none;
         } 
         .Cdrp3:focus {
              border-color: transparent;
              border:none;
            }
         .Coursedrp3:focus
         {
              border:none;
         }
         .Coursedrp3
         {
             width:135px;
             height:100%;
             background-color:transparent;
         }
         .Cdrp3
         {
             width:100%;
             height:50%;
             font-size : 18px;
             margin:10px 0px 0px 12px;
             background-color:transparent;
             border : none;
             border-color: transparent;
         }
         .button
         {
            width:25%;
            height:100%;
            margin : 6px 0px 0px 15px;
            margin-left : 25px;
         }
         .btn-custom {
          width:47%;
          height:35px;
          display: inline-block;
          padding: 2px 0px;
          text-decoration: none;
          color: #fff;
          background-color: #1d96b2;
          border-radius: 15px;
          transition: all 0.3s ease;
        }
        .btn-custom2 {
          width:15%;
          height:30px;
          margin:-5% 0px 0px 8px;
          display: inline-block;
          padding: 2px 0px;
          text-decoration: none;
          color: #fff;
          background-color: #1d96b2;
          border-radius: 5px;
          transition: all 0.3s ease;
        }
         /* Style for content area */
        .contentDiv {
          padding: 20px;
          border: 1px solid transparent;
          border-radius: 4px;
          background-color: white;
          overflow-x:scroll;
        }
        /* Active button customization */
        .nav-link.active {
          color: black !important;
        }
        /* Style for content area */
        /*Pager Style*/
        .pager {
            text-align: right;
            border-color:white;
            display:inline-block;
            width:300px;
            position:relative;
            top: -50px;
            background-color:transparent;

        }

        .pager .pagination-group {
            display: inline-block;
            position:absolute;
            right:100px;
            
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
        /* Styling for previous and next buttons */
        .pager a:last-child {
            padding: 9px 14px;
            background-color: #d9534f;
            border-color: #d9534f;
            color: white;
            margin-top:-1px;
        }
        /*Pager Style*/
        /*Gridview header Style*/
        .table
        {
            width:100%;
            table-layout: fixed;
        }
        .gridview-header {
         text-align:left;
         background-color: #1d96b2;
         color: #fff;
         font-size:10px;
         font-weight: bold;
         font-family: 'Montserrat', sans-serif;

        }
         .gridview-header th {
         text-align: left;
         border: none;
         }
.table td:nth-child(1) {
    width: 70px;
    overflow: hidden;
    white-space: nowrap;
}.table td:nth-child(2) {
    width: 50px;
    overflow: hidden;
    white-space:wrap;
}.table td:nth-child(3) {
    width: 80px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow:ellipsis;
}.table td:nth-child(4) {
    width: 70px;
    overflow: hidden;
    white-space: nowrap;
}.table td:nth-child(5) {
    width: 80px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow:ellipsis;
}.table td:nth-child(6) {
    width: 80px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow:ellipsis;
}.table td:nth-child(7) {
    width: 70px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow:ellipsis;
}.table td:nth-child(8) {
    width: 60px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow:ellipsis;
}.table td:nth-child(9) {
    width: 70px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow:ellipsis;
}.table td:nth-child(10) {
    width: 70px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow:ellipsis;
}.table td:nth-child(11) {
    width: 80px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow:ellipsis;
}.table td:nth-child(12) {
    width: 50px;
    overflow: hidden;
    white-space: nowrap;
}
 .table th:nth-child(13), 
.table td:nth-child(13) {
    width: -30px;
    overflow: hidden;
    white-space: nowrap;
    text-align:left;
}
        /*Gridview header Style*/
        /*Gridview Item Style*/
        .gridview-item
        {
            transition: background-color 0.3s ease;
            text-align:center;
            font-size:10px;
            font-family: 'Montserrat', sans-serif;
            font-weight:500;
            color:black;
            background-color :transparent;
        }
        /*Gridview Item Style*/
        .close
        {
            color:black;
        }
         /* Separator line between pills */
        .nav-pills .nav-item + .nav-item {
            border-left: 1px solid #ccc;
        }

       .nav-pills .nav-item + .nav-item {
    border-left: 1px solid #ccc;
}
.nav-pills .nav-link.active {
    background-color: #007bff;
    color: black;
}
.nav-link
{
    color:black;
}

       /* .nav-pills {
            border: 1px solid #ccc;
            border-radius: 0px;
            overflow: hidden;
        }*/
.btn-secondary
{
    background-color:#ccc;
    border-right:1px solid #ddd;
}
textarea[readonly] {
  background-color: #f8f9fa;
  border: 1px solid #ced4da;
}

    </style>
    <%-- Add Modal --%>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#myModal").modal('hide');
            $("#myfooter").modal('hide');
            $("#myadmissions").modal('hide');

            /*  $('#ContentPlaceHolder1_btnACPP').click(function () {
                  alert('show');
                  $("#dialog-detail1").dialog('open');
              });*/

            $('#ContentPlaceHolder1_btnAJava').click(function () {
                alert('show');
                $("#dialog-detail").dialog('open');
            });
            $("#dialog-detail1").dialog({
                title: 'Fill User Details',
                autoOpen: false,
                resizable: false,
                width: 400,
                modal: true,
                show: { effect: 'drop', direction: "up" },
                draggable: true,
                beforeclose: function (event) {
                    if (!confirm("Close dialog ?")) return false;
                },

                open: function (event, ui) {


                    // $(".ui-dialog-titlebar-close").hide();
                },
                buttons: {
                    "OK": function () {
                        $(this).dialog("close");

                    },
                    "Cancel": function () {
                        $(this).dialog("close");
                    }
                }
            });



        });

    </script>
    <%-- Add Modal --%>
     <script type="text/javascript">
         function openModal() {

             //$('#myModal').modal();
             $("#myModal").modal('show');
         }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />

     <%--<asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />--%>

              <asp:ScriptManager runat="server"></asp:ScriptManager>
    <%-- Add Modal --%>  
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:transparent;">
        <h5 class="modal-title display-5 text-primary" id="myModallabel">Add Enquiry</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="color:red;">&times;</span>
        </button>
      </div>
     <!-- Modal Body -->
        <div class="modal-body">
            <div class="row">
                <!-- First Column -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtName">Full Name</label>
                        <input type="text" id="txtUserName" class="form-control form-control-lg" placeholder="Full Name" />
                    </div>
                    <div class="form-group">
                        <label for="txtCourse">Course</label>
                        <select id="drpDCourse" class="form-control my-form-control" style="height:30px">
                            <option>.NET</option>
                            <option>JAVA</option>
                            <option>SQLSERVER</option>
                            <option>POWERBI</option>
                            <option>DATAANALYTICS</option>
                            <option>C</option>
                            <option>C++</option>
                            <option>DESIGNING</option>
                            <option>OTHERS</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="txtAssigned">Assigned To</label>
                        <asp:DropDownList ID="drpPAssigned" CssClass="form-control my-form-control" style="height:30px" runat="server"></asp:DropDownList>
                    </div>
                </div>

                <!-- Second Column -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtUpdate">Email Id</label>
                        <input type="text" id="TextBox1" class="form-control form-control-lg" placeholder="Email Id" />
                    </div>
                    <div class="form-group">
                        <label for="txtMobile">Status</label>
                        <asp:DropDownList ID="drpPStatus" CssClass="form-control my-form-control" style="height:30px" runat="server">
                            <asp:ListItem Text="NEW" />
                            <asp:ListItem Text="INTERESTED" />
                            <asp:ListItem Text="NOTINTERESTED" />
                            <asp:ListItem Text="HOLD" />
                            <asp:ListItem Text="JOINED" />
                            <asp:ListItem Text="CLOSED" />                
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="txtStatus">Source</label>
                        <asp:DropDownList ID="drpPSource" CssClass="form-control my-form-control" style="height:30px" runat="server">
                            <asp:ListItem Text="WEBSITE" />
                            <asp:ListItem Text="PHONE" />
                            <asp:ListItem Text="WALKIN" />
                            <asp:ListItem Text="JUSTDIAL" />
                            <asp:ListItem Text="URBANPRO" />
                            <asp:ListItem Text="OTHERS" />
                            <asp:ListItem Value="" Text="" /> 
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- Third Column -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtEmail">Mobile</label>
                        <input type="text" id="txtUserContactNo" class="form-control form-control-lg" placeholder="Mobile Number" />
                    </div>
                    <div class="form-group">
                        <label for="txtCourse">Mode</label>
                        <select id="drpTMode" class="form-control my-form-control" style="height:30px">
                            <option>CLASSROOM</option>
                            <option>ONLINE</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="txtMode">FollowUp Date:</label>
                        <input type="date" id="clnFNEXTENQDATE" class="form-control my-form-control" />
                    </div>
                </div>
                
                <!-- Comment Section -->
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="txtComment">Comment</label>
                        <textarea id="TextBox12" class="form-control" rows="4" ></textarea>
                    </div>
                </div>
            </div>
        </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="addEnquiry()">Add Enquiry</button>
      </div>
    </div>
  </div>
</div>

    <%-- Add Modal --%>
    <!-- Edit Modal -->
      <div id="editModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="height:55px;">
        <h5 class="modal-title display-5 text-primary" id="editModalLabel">Edit Enquiry</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="color:red;position:relative;bottom:30px;">&times;</span>
        </button>
      </div>
     <!-- Modal Body -->
        <div class="modal-body">
    <div class="row">
        <asp:HiddenField ID="hiddenEnquiryId" runat="server" />
        <!-- First Column -->
        <div class="col-md-4">
            <div class="form-group">
                <label for="txtEditDate">Date</label>
                <asp:TextBox ID="txtEditDate" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtUpdate">Update By</label>
                <asp:TextBox ID="txtUpdate" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtAssigned">Assigned To</label>
               <%-- <asp:TextBox ID="txtAssigned" runat="server" CssClass="form-control"></asp:TextBox>--%>
                 <asp:DropDownList ID="DropDownList4" CssClass="form-control my-form-control" style="height:30px" runat="server"></asp:DropDownList>
            </div>
        </div>

        <!-- Second Column -->
        <div class="col-md-4">
            <div class="form-group">
                <label for="txtEditName">Name</label>
                <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtMobile">Mobile</label>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtStatus">Status</label>
               <%-- <asp:TextBox ID="txtStatus" runat="server" CssClass="form-control"></asp:TextBox>--%>
                 <asp:DropDownList ID="DropDownList3" CssClass="form-control my-form-control" style="height:30px" runat="server">
                     <asp:ListItem Text="NEW" />
                     <asp:ListItem Text="INTERESTED" />
                     <asp:ListItem Text="NOTINTERESTED" />
                     <asp:ListItem Text="HOLD" />
                     <asp:ListItem Text="JOINED" />
                     <asp:ListItem Text="CLOSED" />                
                 </asp:DropDownList>
            </div>
        </div>

        <!-- Third Column -->
        <div class="col-md-4">
            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtCourse">Course</label>
               <%-- <asp:TextBox ID="txtCourse" runat="server" CssClass="form-control"></asp:TextBox>--%>
                 <asp:DropDownList ID="DropDownList1" CssClass="form-control my-form-control" style="height:30px" runat="server">
                     <asp:ListItem>.NET</asp:ListItem>
                     <asp:ListItem>JAVA</asp:ListItem>
                     <asp:ListItem>SQLSERVER</asp:ListItem>
                     <asp:ListItem>POWERBI</asp:ListItem>
                     <asp:ListItem>DATAANALYTICS</asp:ListItem>
                     <asp:ListItem>C</asp:ListItem>
                     <asp:ListItem>C++</asp:ListItem>
                     <asp:ListItem>DESIGNING</asp:ListItem>
                     <asp:ListItem>OTHERS</asp:ListItem>
              </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtMode">Mode</label>
               <%-- <asp:TextBox ID="txtMode" runat="server" CssClass="form-control"></asp:TextBox>--%>
                   <asp:DropDownList ID="DropDownList2" CssClass="form-control my-form-control" style="height:30px" runat="server">
                           <asp:ListItem>CLASSROOM</asp:ListItem>
                           <asp:ListItem>ONLINE</asp:ListItem>
                    </asp:DropDownList>
            </div>
        </div>

        <!-- Additional Fields -->
        <div class="col-md-6">
            <div class="form-group">
                <label for="txtNextEq">Next Enquiry</label>
                <asp:TextBox ID="txtNextEq" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <label for="txtSource">Source</label>
               <%-- <asp:TextBox ID="txtSource" runat="server" CssClass="form-control"></asp:TextBox>--%>
                 <asp:DropDownList ID="DropDownList5" CssClass="form-control my-form-control" style="height:30px" runat="server">
                     <asp:ListItem Text="WEBSITE" />
                     <asp:ListItem Text="PHONE" />
                     <asp:ListItem Text="WALKIN" />
                     <asp:ListItem Text="JUSTDIAL" />
                     <asp:ListItem Text="URBANPRO" />
                     <asp:ListItem Text="OTHERS" />
                     <asp:ListItem Value="" Text="" /> 
                 </asp:DropDownList>
            </div>
        </div>

        <!-- Comment Section -->
        <div class="col-md-12">
            <div class="form-group">
                <label for="txtComment">Comment</label>
                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="4"></asp:TextBox>
            </div>
        </div>
    </div>
</div>

      <div class="modal-footer">
      <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClientClick="return updateEnquiry();" CssClass="btn btn-primary" />
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
    <!-- Edit Modal -->
    <div class="container-fluid">
        <%-- Search Menu --%>
          <div class="menu2">
            <%-- Search Iamage --%>
            <div class="Simage"><i class="fa-solid fa-magnifying-glass" style="font-size : 25px;color:#767c8d;padding:12px 0px 0px 12px;"></i></div>
            <%-- Search Iamage --%>
            <%-- Course Drp --%>
             <div class="Coursedrp">
             <asp:DropDownList ID="drpcourses" runat="server" AutoPostBack="true"  OnSelectedIndexChanged="drpcourses_SelectedIndexChanged" CssClass="Cdrp">
                 <asp:ListItem Value="0" Text="Course" /> 
                <asp:ListItem Text=".NET" />
                <asp:ListItem Text="JAVA" />
                <asp:ListItem Text="SQLSERVER" />
                <asp:ListItem Text="POWERBI" />
                <asp:ListItem Text="DATAANALYTICS" />
                <asp:ListItem Text="C" />
                <asp:ListItem Text="C++" />
                <asp:ListItem Text="DESIGNING" />
                <asp:ListItem Text="OTHERS" />
             </asp:DropDownList>
            </div>
            <%-- Course Drp --%>
             <%-- Separater --%>
             <div class="separater">|</div>
             <%-- Separater --%>
            <%-- Mode Drp --%>
            <div class="Coursedrp">
                <asp:DropDownList AppendDataBoundItems="true"  ID="drpmode" CssClass="Cdrp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpmode_SelectedIndexChanged">
                       <asp:ListItem Value="0" Text="Mode"></asp:ListItem>
                       <asp:ListItem Text="CLASSROOM" />
                       <asp:ListItem Text="ONLINE" />   
                </asp:DropDownList>
            </div>
            <%-- Mode Drp --%>
             <%-- Separater --%>
             <div class="separater">|</div>
             <%-- Separater --%>
            <%-- Status Drp --%>
             <div class="Coursedrp">
                 <asp:DropDownList CssClass="Cdrp"  AppendDataBoundItems="true"   ID="drpstatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpstatus_SelectedIndexChanged">
                    <asp:ListItem Value="0" Text="Status" />
                    <asp:ListItem Text="NEW" />
                    <asp:ListItem Text="INTERESTED" />
                    <asp:ListItem Text="NOTINTERESTED" />
                    <asp:ListItem Text="HOLD" />
                    <asp:ListItem Text="JOINED" />
                    <asp:ListItem Text="CLOSED" />
                 </asp:DropDownList>
             </div>
            <%-- Status Drp --%>
            <%-- Separater --%>
            <div class="separater">|</div>
            <%-- Separater --%>
            <%-- Assigned Drp --%>
            <div class="Coursedrp2">
            <asp:DropDownList CssClass="Cdrp2" AppendDataBoundItems="true"   ID="drpAssigned" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpAssigned_SelectedIndexChanged">
                <asp:ListItem Value="0" Text="Assigned To" /> 
                <%--         <asp:ListItem Text="DIPALI" />
                    <asp:ListItem Text="DILLIP" />
                          <asp:ListItem Text="SHRUTI" />--%>                 
               <%--<asp:ListItem Value="DBDev" Text="Database/BI Developer" />--%>
            </asp:DropDownList>
            </div>
            <%-- Assigned Drp --%>
             <%-- Separater --%>
             <div class="separater">|</div>
             <%-- Separater --%>
            <%-- Source Drp --%>
             <div class="Coursedrp">
                 <asp:DropDownList CssClass="Cdrp" AppendDataBoundItems="true"   ID="drpsource" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpsource_SelectedIndexChanged">
                    <asp:ListItem Value="0" Text="Source" /> 
                    <asp:ListItem Text="WEBSITE" />
                    <asp:ListItem Text="PHONE" />
                    <asp:ListItem Text="WALKIN" />
                    <asp:ListItem Text="JUSTDIAL" />
                    <asp:ListItem Text="URBANPRO" />
                    <asp:ListItem Text="OTHERS" />
                 </asp:DropDownList>
             </div>
            <%-- Source Drp --%>
             <%-- Separater --%>
             <div class="separater">|</div>
             <%-- Separater --%>
             <%-- Name Txt --%>
             <div class="Coursedrp3">
                <asp:TextBox ID="txtName" CssClass="Cdrp3" runat="server" placeholder="Student Name"/>
             </div>
             <%-- Name Txt --%>
            <%-- Buttons --%>
            <div class="button">
        <asp:Button ID="btnSearch" Text="Search" runat="server" CssClass="btn btn-custom" OnClick="btnSearch_Click"></asp:Button>
       <a id="btnRDemo" href="#" class="btn btn-custom" style="margin-left:7px;padding-top:6px" data-toggle="modal" data-target="#myModal" target="_parent"><span class="fa fa-send" style="padding:0px 15px 2px 0px"></span>&nbsp;Add Enquiry</a>
     </div>
            <%-- Buttons --%>
        </div>
   <%-- Search Menu --%>
           <div class="container">
        <div class="Search-Menu" style="width:100%;">
          <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
              <asp:Button class="btn btn-secondary" ID="All" Text="ALL" type="button" role="tab" runat="server" OnClick="All_Click"/>
            </li>
            <li class="nav-item" role="presentation">
           <asp:Button ID="BtnHold" runat="server" Text="HOLD" CssClass="btn btn-secondary" OnClick="BtnHold_Click"/>
            </li>
            <li class="nav-item" role="presentation">
              <asp:Button class="btn btn-secondary" ID="NotIntrested" Text="NOT INTERESTED" type="button" role="tab" runat="server" OnClick="NotIntrested_Click"/>
            </li>
          </ul>
  <%-- Search Menu --%>
         <%-- <div class="contentDiv" style="width:100%">--%>
             <%-- GridView Menu --%>
            
 <%--Chat popup moal --%> 
<!-- Hidden field to store enquiry ID -->
<asp:HiddenField ID="HiddenField2" runat="server" ClientIDMode="Static" />

<!-- Chat Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="chatModalLabel">
  <div class="modal-dialog modal-md modal-dialog-centered" role="document">
    <div class="modal-content shadow-md rounded-3 border-0">

      <!-- Modal Header -->
      <div class="modal-header bg-primary text-white" style="border-radius:0px;">
        <h5 class="modal-title mb-0" id="chatModalLabel">💬 Chat Messages</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <!-- Modal Body -->
      <div class="modal-body p-4">

        <!-- Chat Display Area -->
        <textarea id="txtChatBox" class="form-control mb-3" rows="10" readonly style="resize: none; height: 300px;"></textarea>

        <!-- Reply Input -->
        <asp:TextBox ID="txtReply" runat="server" CssClass="form-control mb-3" 
                     TextMode="MultiLine" Rows="2" placeholder="Type your reply here..." 
                     Style="resize: none;"></asp:TextBox>

        <!-- Hidden Enquiry ID -->
        <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />

        <!-- Reply Button -->
        <div class="d-grid gap-2" style="margin-top:5px;">
          <asp:Button ID="btnSendReply" runat="server" CssClass="btn btn-success btn-lg" Text="📤 Send Reply" OnClick="btnSendReply_Click" />
        </div>

      </div>
    </div>
  </div>
</div>


 <%--Chat popup moal --%>  
   
        <!-- Custom Header -->
                    <table class="table table-borderless" style="border:none;margin-top:-30px;">
                         <tbody style="border:none">
                        <%-- GridView Code --%>
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                 <ContentTemplate>
                        <asp:GridView ID="grvCandidatesDetail" AutoGenerateColumns="false" runat="server" DataKeyNames="ENQUIRYID" OnRowCommand="grvCandidatesDetail_RowCommand" EmptyDataText="No Records Found For the Selected Search Criteria!!" AllowPaging="true" PageSize="5" OnPageIndexChanging="grvCandidatesDetail_PageIndexChanging" OnRowEditing="grvCandidatesDetail_RowEditing" OnRowCancelingEdit="grvCandidatesDetail_RowCancelingEdit" PagerStyle-CssClass="pager" ShowFooter="true" BorderStyle="None" PagerStyle-BorderStyle="None"  CssClass="table table-borderless gridview-table" FooterStyle-CssClass="footer" OnRowCreated="grvCandidatesDetail_RowCreated" PagerStyle-Width="300px">
                        <Columns>
                           <asp:TemplateField HeaderStyle-BorderStyle="None" ItemStyle-BorderStyle="None" FooterStyle-BorderStyle="None">
                        <ItemTemplate> 

                               <tr data-enquiryid='<%# Eval("ENQUIRYID") %>'>
                                 <td class="gridview-item" data-field="CREATED_DATE" style="text-align:center;border:none">
                                     <asp:Label ID="txtEnqDate" runat="server" Text='<%# Bind("CREATED_DATE", "{0:dd/MM/yyyy}") %>' CssClass="gridview-item"></asp:Label>
                                 </td>
                                 <td class="gridview-item" data-field="UPDATEDBY" style="text-align:center;border:none">
                                     <asp:Label ID="txtUpDate" runat="server" Text='<%# Bind("UPDATEDBY") %>' CssClass="gridview-item"></asp:Label>
                                 </td>
                                <td class="gridview-item" data-field="NAME" style="text-align:center;border:none">
                                     <asp:Label ID="txtName" runat="server" Text='<%# Bind("NAME") %>' CssClass="gridview-item"></asp:Label>
                                </td>
                                 <td class="gridview-item" data-field="CONTACTMOBILENO" style="text-align:center;border:none">
                                     <asp:Label ID="txtMobile" runat="server" Text='<%# Bind("CONTACTMOBILENO") %>' CssClass="gridview-item"></asp:Label>
                                </td>
                                <td class="gridview-item" data-field="CONTACTEMAIL" style="text-align:center;border:none">
                                     <asp:Label ID="txtEmail" runat="server" Text='<%# Bind("CONTACTEMAIL") %>' CssClass="gridview-item"></asp:Label>
                                </td>
                                <td class="gridview-item" data-field="COURSENAME" style="text-align:center;border:none">
                                     <asp:Label ID="txtCourse" runat="server" Text='<%# Bind("COURSENAME") %>' CssClass="gridview-item"></asp:Label>
                                </td> 
                                <td class="gridview-item" data-field="STATUS" style="text-align:center;border:none">
                                     <asp:Label ID="txtStatus" runat="server" Text='<%# Bind("STATUS") %>' CssClass="gridview-item"></asp:Label>
                                </td> 
                                <td class="gridview-item" data-field="MODE" style="text-align:center;border:none">
                                     <asp:Label ID="txtMode" runat="server" Text='<%# Bind("MODE") %>' CssClass="gridview-item"></asp:Label>
                                </td>
                                <td class="gridview-item" data-field="ASSIGNEDTO" style="text-align:center;border:none">
                                     <asp:Label ID="txtAssigned" runat="server" Text='<%# Bind("ASSIGNEDTO") %>' CssClass="gridview-item"></asp:Label>
                                </td>
                                <td class="gridview-item" data-field="SOURCE" style="text-align:center;border:none">
                                     <asp:Label ID="txtSource" runat="server" Text='<%# Bind("SOURCE") %>' CssClass="gridview-item"></asp:Label>
                                </td>
                                <td class="gridview-item" data-field="NXTENQDATE" style="text-align:center;border:none">
                                     <asp:Label ID="txtNextEq" runat="server" Text='<%# Bind("NEXTENQDATE","{0:dd/MM/yyyy}")%>' CssClass="gridview-item"></asp:Label>
                                </td> 
                               <%-- <td class="gridview-item" data-field="ECOMMENTS" style="text-align:center;border:none">
                                     <asp:Label ID="txtComment" runat="server" Text='<%# Bind("ECOMMENTS") %>' CssClass="gridview-item"></asp:Label>
                                </td>--%>
                                 <td class="gridview-item" data-field="ECOMMENTS" style="text-align:center;border:none;">
                                      <asp:LinkButton ID="lnkComment" runat="server"
                                       Text='<%# Bind("ECOMMENTS") %>'
                                       CssClass="gridview-item comment-link" data-toggle="modal"
                                       data-target="#myModal2" target="_parent" OnClientClick='<%# "openChatModal(" + Eval("ENQUIRYID") + "); return false;" %>'  data-id='<%# Eval("ENQUIRYID") %>'>
                                    </asp:LinkButton>
                                 </td>
                                   


                                  <td class="gridview-item" data-field="Edit/Delete" style="text-align:left;border:none;">
                                      <a href="#" class="btn btn-primary" style="background-color:transparent;border:none;margin-top:-10px" data-toggle="modal" data-target="#editModal" onclick='<%# "openEditModal(\"" + Eval("ENQUIRYID") + "\"); return false;" %>'>
                                           <img src="Images/edit-icon-png-3598.png" width="20" height="20" alt="Edit"/>
                                      </a>
                                                    
                                        <asp:ImageButton 
                                            ID="btnDelete" 
                                            runat="server" 
                                            CausesValidation="false"
                                            OnClientClick="return confirm('Do you want to delete this record?');"
                                            CommandName="DeleteRow" 
                                            CommandArgument='<%# Eval("ENQUIRYID") %>'
                                            ImageUrl="~/Images/DeleteDoc.png" 
                                            Width="20" 
                                            Height="20" 
                                            ToolTip="Delete" />
                                          </td>
                                     </tr>
           
        <%--<asp:Label ID="txtEnqDate" runat="server" Text='<%# Bind("CREATED_DATE","{0:dd/MM/yy}")%>' CssClass="gridview-item"></asp:Label>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                        </Columns>
                             <PagerTemplate>
                                <asp:LinkButton ID="lbtnFirst" runat="server" CommandName="Page" CommandArgument="First" CausesValidation="false">First</asp:LinkButton>
                                <asp:LinkButton ID="lbtnprev" runat="server" CommandName="Page" CommandArgument="Prev" CausesValidation="false">Prev</asp:LinkButton>
                                <asp:LinkButton ID="lbtnnext" runat="server" CommandName="Page" CommandArgument="Next" CausesValidation="false">Next</asp:LinkButton>
                                <asp:LinkButton ID="lbtnlast" runat="server" CommandName="Page" CommandArgument="Last" CausesValidation="false">Last</asp:LinkButton>
                            </PagerTemplate>
                            <PagerStyle CssClass="pager"/>
                    </asp:GridView>
                       </ContentTemplate>
                                 <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click" />
                                </Triggers>
                    </asp:UpdatePanel>
                        </tbody>
                    </table>
                        </div>
                  </div>
             <%-- GridView Menu 1 --%>
             <%-- GridView Menu 2 --%>
                 <%-- <asp:GridView ID="grvHoldCandidatesDetail" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="NAME" HeaderText="Name" />
                            <asp:BoundField DataField="CONTACTEMAIL" HeaderText="Email" />
                            <asp:BoundField DataField="CONTACTMOBILENO" HeaderText="Mobile No" />
                            <asp:BoundField DataField="COURSENAME" HeaderText="Course" />
                        </Columns>
                        <EmptyDataTemplate>
                            <p>No records found.</p>
                        </EmptyDataTemplate>
                    </asp:GridView>--%>

             <%-- GridView Menu 2 --%>
             <%-- GridView Menu 2 --%>
          </div>
           <asp:Button ID="btnFollowUp" Text="TODAY FOLLOW UP" OnClick="btnFollowUp_Click" runat="server" 
     CssClass="btn btn-custom2" style="margin-left:20px;" ></asp:Button>

       <asp:Button ID="btnEnquiry" Text="Enquiry Analysis"  OnClick="btnEnquiry_Click" runat="server" 
     CssClass="btn btn-custom2"  ></asp:Button>
    <asp:Label ID="lblError" runat="server" ForeColor="Red" />

       <%-- </div>--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <%-- Chat popup modal --%>
<script type="text/javascript">
    // Open Modal & Load Chat
    function openChatModal(enquiryId) {
        console.log("Selected ENQUIRYID:", enquiryId);

        $('#<%= HiddenField2.ClientID %>').val(enquiryId);

        // Clear old reply
        $('#txtReply').val('');

        // Optional: load chat via AJAX (if implemented)
        $('#myModal2').modal('show');
        $('#hiddenChatEnquiryId').val(enquiryId);

        $.ajax({
            type: "POST",
            url: 'Enquiries.aspx/GetChatMessages',
            data: JSON.stringify({ enquiryId: enquiryId }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var messages = response.d;
                var chatText = "";

                if (Array.isArray(messages)) {
                    messages.forEach(function (msg) {
                        var sender = msg.Sender || "Unknown";
                        var text = msg.MessageText || "";
                        var date = msg.CreatedOn || "";

                        chatText += sender + ": " + text + (date ? " (" + date + ")" : "") + "\n";
                    });
                } else {
                    chatText = JSON.stringify(messages);
                }

                $('#txtChatBox').val(chatText);
                $('#myModal2').modal('show');
            },
            error: function (xhr, status, error) {
                console.error("Error fetching chat:", error);
                alert("Error loading chat messages.");
            }
        });
    }
    Sys.Application.add_load(function () {
        $('#myModal2').off('hidden.bs.modal').on('hidden.bs.modal', function () {
            $('#txtChatBox').val('');
            $('#hiddenChatEnquiryId').val('');
        });
    });
</script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#myModal2').on('hidden.bs.modal', function () {
                Sys.Application.add_load(function () {
                    wireUpEvents(); 
                });
            });
        });

        function wireUpEvents() {
            $('[id*=lnkChat]').each(function () {
                var $btn = $(this);
                var enquiryId = $btn.data("enquiryid");
                $btn.off("click").on("click", function (e) {
                    e.preventDefault();
                    openChatModal(enquiryId); // modal open
                });
            });
        }
        Sys.Application.add_load(function () {
            wireUpEvents();
        });
    </script>



    <%-- Chat popup modal --%>
      <%-- Edit Recrds --%>   
    <script type="text/javascript">
        function formatDateForServer(dateString) {
            var dateParts = dateString.split(/[-/]/);
            if (dateParts.length === 3) {
                var day = parseInt(dateParts[0], 10);    // dd
                var month = parseInt(dateParts[1], 10) - 1; // 0-indexed month
                var year = parseInt(dateParts[2], 10);   // yyyy

                var formattedDate = new Date(Date.UTC(year, month, day)).toISOString();
                // Return only the date part, i.e., YYYY-MM-DD
                return formattedDate.split('T')[0];
            }
            return null; // Handle invalid date input as needed
        }

        function openEditModal(enquiryId) {
            var row = document.querySelector(`[data-enquiryid='${enquiryId}']`);
            if (row) {
                document.getElementById('<%= txtEditName.ClientID %>').value = row.querySelector('.gridview-item[data-field="NAME"]').innerText;
                document.getElementById('<%= txtEditDate.ClientID %>').value = row.querySelector('.gridview-item[data-field="CREATED_DATE"]').innerText;
                document.getElementById('<%= txtMobile.ClientID %>').value = row.querySelector('.gridview-item[data-field="CONTACTMOBILENO"]').innerText;
                document.getElementById('<%= txtEmail.ClientID %>').value = row.querySelector('.gridview-item[data-field="CONTACTEMAIL"]').innerText;
                document.getElementById('<%= DropDownList1.ClientID %>').value = row.querySelector('.gridview-item[data-field="COURSENAME"]').innerText;
                document.getElementById('<%= DropDownList3.ClientID %>').value = row.querySelector('.gridview-item[data-field="STATUS"]').innerText;
                document.getElementById('<%= DropDownList2.ClientID %>').value = row.querySelector('.gridview-item[data-field="MODE"]').innerText;
                document.getElementById('<%= DropDownList4.ClientID %>').value = row.querySelector('.gridview-item[data-field="ASSIGNEDTO"]').innerText;
                document.getElementById('<%= DropDownList5.ClientID %>').value = row.querySelector('.gridview-item[data-field="SOURCE"]').innerText;
                document.getElementById('<%= txtNextEq.ClientID %>').value = row.querySelector('.gridview-item[data-field="NXTENQDATE"]').innerText;
                document.getElementById('<%= txtComment.ClientID %>').value = row.querySelector('.gridview-item[data-field="ECOMMENTS"]').innerText;
                document.getElementById('<%= txtUpdate.ClientID %>').value = row.querySelector('.gridview-item[data-field="UPDATEDBY"]').innerText;
                document.getElementById('<%= hiddenEnquiryId.ClientID %>').value = enquiryId;

                $('#editModal').modal('show');
            } else {
                console.error('Row not found for EnquiryID:', enquiryId);
            }
        }

        function updateEnquiry() {
            var enquiryId = document.getElementById('<%= hiddenEnquiryId.ClientID %>').value;
        var name = document.getElementById('<%= txtEditName.ClientID %>').value;
        var date = formatDateForServer(document.getElementById('<%= txtEditDate.ClientID %>').value);
        var mobile = document.getElementById('<%= txtMobile.ClientID %>').value;
        var email = document.getElementById('<%= txtEmail.ClientID %>').value;
        <%--var course = document.getElementById('<%= txtCourse.ClientID %>').value;--%>
        var course = document.getElementById('<%= DropDownList1.ClientID %>').value;
       <%-- var status = document.getElementById('<%= txtStatus.ClientID %>').value;--%>
        var status = document.getElementById('<%= DropDownList3.ClientID %>').value;
      <%--  var mode = document.getElementById('<%= txtMode.ClientID %>').value;--%>
        var mode = document.getElementById('<%= DropDownList2.ClientID %>').value;
      <%--  var assigned = document.getElementById('<%= txtAssigned.ClientID %>').value;--%>
        var assigned = document.getElementById('<%= DropDownList4.ClientID %>').value;
       <%-- var source = document.getElementById('<%= txtSource.ClientID %>').value;--%>
        var source = document.getElementById('<%= DropDownList5.ClientID %>').value;
        var nextEq = formatDateForServer(document.getElementById('<%= txtNextEq.ClientID %>').value);
        var comment = document.getElementById('<%= txtComment.ClientID %>').value;
        var updatedBy = document.getElementById('<%= txtUpdate.ClientID %>').value;

            console.log("Enquiry ID: ", enquiryId);
            console.log("Name: ", name);
            console.log("Date: ", date);
            console.log("mobile: ", mobile);
            console.log("email: ", email);
            console.log("course: ", course);
            console.log("status: ", status);
            console.log("mode: ", mode);
            console.log("assigned: ", assigned);
            console.log("source: ", source);
            console.log("NextEq Date: ", nextEq);
            console.log("Comment: ", comment);
            console.log("updatedby: ", updatedBy);

            $.ajax({
                type: "POST",
                url: "Enquiries.aspx/UpdateEnquiry",
                data: JSON.stringify({
                    enquiryId: enquiryId,
                    name: name,
                    date: date,
                    mobile: mobile,
                    email: email,
                    course: course,
                    status: status,
                    mode: mode,
                    assigned: assigned,
                    source: source,
                    nextEq: nextEq,
                    comment: comment,
                    updatedBy: updatedBy
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        alert("Update successful!");
                        clearModalFields();
                        $('#editModal').modal('hide');
                    } else {
                        alert("Update failed.");
                        $('#editModal').modal('hide');

                        // Optionally, refresh your GridView or data on the page after the update
                        location.reload(); // Reloads the page to refresh data
                    }
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseText);
                    alert("Error: " + xhr.responseText);
                }
            });
        return false;
        }

        function clearModalFields() {
            document.getElementById('<%= txtEditName.ClientID %>').value = '';
            document.getElementById('<%= txtEditDate.ClientID %>').value = '';
            document.getElementById('<%= txtMobile.ClientID %>').value = '';
            document.getElementById('<%= txtEmail.ClientID %>').value = '';
           <%-- document.getElementById('<%= txtCourse.ClientID %>').value = '';--%>
            document.getElementById('<%= DropDownList1.ClientID %>').value = '';
          <%--  document.getElementById('<%= txtStatus.ClientID %>').value = '';--%>
            document.getElementById('<%= DropDownList3.ClientID %>').value = '';
          <%--  document.getElementById('<%= txtMode.ClientID %>').value = '';--%>
            document.getElementById('<%= DropDownList2.ClientID %>').value = '';
           <%-- document.getElementById('<%= txtAssigned.ClientID %>').value = '';--%>
            document.getElementById('<%= DropDownList4.ClientID %>').value = '';
           <%-- document.getElementById('<%= txtSource.ClientID %>').value = '';--%>
            document.getElementById('<%= DropDownList5.ClientID %>').value = '';
            document.getElementById('<%= txtNextEq.ClientID %>').value = '';
            document.getElementById('<%= txtComment.ClientID %>').value = '';
            document.getElementById('<%= txtUpdate.ClientID %>').value = '';
            document.getElementById('<%= hiddenEnquiryId.ClientID %>').value = '';
        }
        function CloseModal() {

            $("#editModal").modal('hide');
            $(this).dialog("close");
        }
    </script>
      <%-- Edit Recrds --%>
      <%-- Add Recrds --%>
    <script>
        function addEnquiry() {
            if ($('#txtUserName').val() != "" && $('#drpDCourse').val() != "" && $('#TextBox1').val() != "" && $('#txtUserContactNo').val() != "" && $('#TextBox12').val() != "") {
                var name = $('#txtUserName').val();
                var course = $('#drpDCourse').val();
                var assigned = $('#<%= drpPAssigned.ClientID %>').val();  // ASP.NET DropDownList value
                var email = $('#TextBox1').val();
                var status = $('#<%= drpPStatus.ClientID %>').val();  // ASP.NET DropDownList value
                var source = $('#<%= drpPSource.ClientID %>').val();  // ASP.NET DropDownList value
                var mobile = $('#txtUserContactNo').val();
                var mode = $('#drpTMode').val();
                var followUpDate = $('#clnFNEXTENQDATE').val();
                var comment = $('#TextBox12').val();
                console.log(name);
                console.log(course);
                console.log(assigned);
                console.log(email);
                console.log(status);
                console.log(source);
                console.log(mobile);
                console.log(mode);
                console.log(followUpDate);
                console.log(comment);
                $.ajax({
                    type: "POST",
                    url: "Enquiries.aspx/AddEnquiry",
                    data: JSON.stringify({
                        name: name,
                        course: course,
                        assigned: assigned,
                        email: email,
                        status: status,
                        source: source,
                        mobile: mobile,
                        mode: mode,
                        followUpDate: followUpDate,
                        comment: comment
                    }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            alert("Enquiry added successfully!");
                            name = "";
                            course = "";
                            assigned = "";  
                            email = "";
                            status = "";  
                            source = "";  
                            mobile = "";
                            mode = "";
                            followUpDate = "";
                            comment = "";

                            // Close modal after success
                            $('#myModal').modal('close');
                            $.ajax({
                                type: "POST",
                                url: "Enquiries.aspx/RefreshGridView",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    $('#grvCandidatesDetail').html(response.d);  // Replace GridView HTML with updated data
                                },
                                error: function (xhr, status, error) {
                                    alert('Error refreshing GridView: ' + error);
                                }
                            });

                        } else {
                            alert("Failed to add enquiry.");
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log(xhr.responseText);
                        alert("Error: " + xhr.responseText);
                    }

                });
            }
            else {
                alert("Before Add Enquiry Please Fill Fields First.!");
            }
        }
    </script>
      <%-- Add Recrds --%>
</asp:Content>
