<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="Interview_Questions.aspx.cs" Inherits="ENOSISLEARNING.Csharp_Question_Paper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  <%-- <link href="css/bootstrap.css" rel="stylesheet" />--%>
  
   <style>
      .panel-body
      {
      padding: 10px 30px !important;
      line-height: 2em !important;
      word-spacing: 4px !important;
      }
      a:hover,a:focus{
      text-decoration: none;
      outline: none;
      }
      .ui-widget-header {
      border: 1px solid transparent !important;
      border-radius:0px !important;
      background: navy !important;
      color: white !important;
      font-weight: bold;
      font-size: 26px;
      }
      .ui-widget-overlay {
      background: #615151  !important;
      opacity: 0.8 !important;
      filter: Alpha(Opacity=30);
      }
      .mybtncss {
      color: #fff;
      background-color: navy;
      border:1px solid navy;
      padding: 10px 21px;
      font-size: 24px !important;
      border-radius:3px !important;
      }
      .ui-dialog .ui-dialog-content {
      background: #f2f2f6  !important;
      color:navy !important;
      font-size: 18px;
      position: relative;
      border: 0;
      padding: 1.5em 1em !important;
      background: none;
      overflow: auto;
      zoom: 1;
      }
      .ques
      {
      color:#f08102;
      font-size:16px !important;
      font-weight:900;
      }
      .ans
      {
        margin-bottom:-15px;
      font-size:15px;
      font-weight:unset;
      margin-left:25.9px;
      color:black;
      margin-top:-10px;
      }
      .panel-footer a:active
      {
      BACKGROUND: WHITE !IMPORTANT;
      COLOR: BLACK;
      }
      .panel-footer a {
      color: white;
      border: 1px solid #7a4212;
      BOX-SHADOW: 2PX 2PX 2PX #7a4212;
      background: #7a4212;
      padding: 0px 10px;
      font-size: 17PX;
      FONT-WEIGHT: 900;
      /* width: 59px; */
      text-decoration: none;
      }
      .topbtn
      {
      margin-left:20px;
      }
      .quesheader
      {
      margin: 0px;
      font-weight: 900;
      font-size: 26px;
      }
      .panel-info > .panel-heading {
      color: white;
      background-color: #173151 !important;
      border-color: #173151 !important;
      padding: 4px 12px;
      }
     .imgDownload {
    height: 40px;
    width: 40px;
    position:relative;
    left:5%;
    float:right;
}
        .dropdown13 {
            position: relative;
            display: inline-block;
            padding-top:2px;
        }

        /* Style the dropdown button */
        .dropbtnn{
            background-color: #173151;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            margin-left:11px;
        }

        /* Style the dropdown content (hidden by default) */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 91px;
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            z-index: 1;
            margin-top:2px;
       
        }

        /* Style the dropdown links */
        .dropdown-content a {
            color: black;
            padding: 12px 6px;
            text-decoration: none;
            display: block;
            font-size:13px;

        }

        /* Change color on hover */
        .dropdown-content a:hover {
            background-color: #ddd;
        }

        /* Show the dropdown menu on hover */
        .dropdown13:hover .dropdown-content {
            display: block;
        }


   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   <div class="container-fluid" style=" margin-top: 10px;">
      <div class="row">
         <div class="col-md-12">
            <div class="panel  panel-info"  >
               <div class="panel-heading " >
                  <div class="panel-title row h1">
                     <span class="h4 col-md-6 quesheader">
                        <asp:Label ID="lblcourse"  runat="server" />
                        Interview Questions
                     </span>
                     <span class="col-md-6" style="display:flex; width:370px; position:relative;left:-130px; float:right">
                                     <asp:Button ID="btndownload" runat="server"  Text="Download PDF"   CssClass="btn btn-danger pull-right topbtn" CausesValidation="False" OnClick="btndownload_Click"  />

                                <asp:Button ID="btnaddques" CssClass="pull-right btn btn-danger topbtn" runat="server" Text="Ask Your Question to Our Experts" />
                         <asp:Image runat="server" ImageUrl="~/Images/share-icon.png" AlternateText="Download PDF" CssClass="imgDownload"/>
                        <div class="dropdown13">
        <button class="dropbtnn">Share</button>
        <div class="dropdown-content">
            <!-- WhatsApp icon -->
          <%--  text=This is WhatsApp sharing example using link" 
            <a href="https://api.whatsapp.com/send?phone=917757012052">

          --%>
            <a href="https://api.whatsapp.com/send?text=https://www.enosislearning.com/Interview_Questions.aspx?lag=SQL%20Server">
            <img src="Images/whatsapp1.png" alt="WhatsApp" style="width: 20px; height: 20px; margin-right: 2px;" /> WhatsApp
            </a>
            <!-- Facebook icon -->
            <a href="https://www.facebook.com/enosis.learning?mibextid=tPfjzR">
                <img src="Images/facebook1.png" alt="Facebook" style="width: 18px; height: 18px; margin-right:2px;" /> Facebook
            </a> <a href="https://www.instagram.com/enosislearning?igsh=Z2R3OXpiZjhjbmQ0">
                <img src="Images/instagram1.png" alt="Facebook" style="width: 22px; height: 22px; margin-right:2px;" /> instagram
            </a>
        </div>
    </div>
                     </span>
                  </div>
               </div>

               <!-- /.box-header -->
               <div class="panel-body" id="panel1" runat="server">
                  <asp:Repeater ID="rpquesdetails"   runat="server">
                     <ItemTemplate>
                        <h4 class="ques">
                           
                           <asp:Label ID="lblno" runat="server" Text='<%#Eval("RowNumber") %>' />
                           . 
                           <asp:Label ID="lblques" runat="server" Text='<%#Eval("Question") %>' />
                        </h4>
                         <br />
                        <p class="ans"> 
                           <asp:Label ID="lblans" Text='<%#Eval("Answer") %>' runat="server" />
                        </p>
                        <hr style="margin-top:10px;margin-bottom:10px;"/>
                     </ItemTemplate>
                  </asp:Repeater>
               </div>
               <div class="panel-footer" id="Div1" >
                  <asp:Repeater ID="rptPager" runat="server">
                     <ItemTemplate>
                        <asp:LinkButton ID="lnkPage" runat="server" CausesValidation="False" OnClick="lnkPage_Click" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                           CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'  
                           OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                     </ItemTemplate>
                  </asp:Repeater>
               </div>
            </div>
         </div>
         <div class="col-md-12">
            <div class="panel panel-info">
               <div class="panel-heading">
                  <h3 class="panel-title">Post Question Details</h3>
               </div>
               <!-- /.box-header -->
               <div class="panel-body">
                  <div class="form-group">
                     <asp:Repeater ID="rppostques"   runat="server">
                        <ItemTemplate>
                           <h4 class="ques">
                              Ques. 
                              <asp:Label ID="lblques" runat="server" Text='<%#Eval("Ques") %>' />
                              <p class="ans" style="float:right;color:navy;font-size:14px;">
                                 Posted On:
                                 <asp:Label ID="lblans" Text='<%#Eval("Posted_On") %>' runat="server" />
                              </p>
                           </h4>
                           <br />
                        </ItemTemplate>
                     </asp:Repeater>
                  </div>
               </div>
               <div class="panel-footer" id="btndiv" >
                  <asp:Repeater ID="rppostquestpager" runat="server">
                     <ItemTemplate>
                        <asp:LinkButton ID="lnkPage" CausesValidation="False" runat="server"  OnClick="lnkPage_Click1" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                           CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'  
                           OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                     </ItemTemplate>
                  </asp:Repeater>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div id="dialog" class="container-fluid" style="display: none" >
      <div class="row">
         <div class="form-group">
            <asp:Label id="Label1" runat="server" CssClass="col-md-3 " >Course:</asp:Label>
            <div class="col-md-9" >
               <asp:Label ID="txtselectcourse" Height="50px" ReadOnly="True"  CssClass="form-control" runat="server" />
            </div>
         </div>
         <div class="clearfix"><br /></div>
         <div class="form-group">
            <asp:Label id="lblemail" runat="server" CssClass="col-md-3 " >Your Email Id:<span style="color:red;">*</span></asp:Label>
            <div class="col-md-9" >
               <asp:TextBox ID="txtemail" Height="50px" MaxLength="100" CssClass="form-control" runat="server" />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter email id" ForeColor="Red" ControlToValidate="txtemail" Display="Dynamic"></asp:RequiredFieldValidator>
               <br />
               <asp:RegularExpressionValidator ID="reemail" ControlToValidate="txtemail" Display="Dynamic" runat="server" ForeColor="Red"  ErrorMessage="Please Enter Valid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
         </div>
         <div class="clearfix"><br /></div>
         <div class="form-group">
            <asp:Label id="lblques" runat="server" CssClass="col-md-3"  >Question:<span style="color:red;">*</span></asp:Label>
            <div class="col-md-9" >
               <asp:TextBox ID="txtpost" runat="server" CssClass="form-control" MaxLength="1000" Height="100px"  TextMode="MultiLine"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfques" ControlToValidate="txtpost" runat="server" ErrorMessage="Please enter the question" ForeColor="Red" Display="Dynamic" />
            </div>
         </div>
         <div class="clearfix"><br /></div> 
         <div class="form-group">
            <div class="col-md-3"></div>
            <div class="col-md-9">
               <asp:Button ID="btnpost" runat="server"  Text="Post Question" CssClass="btn btn-danger mybtncss" OnClick="btnpost_Click"  />
            </div>
         </div>
      </div>
   </div>
   <script src="Scripts/ajax-libs-jquery-1.7.2-jquery.min.js"></script>
   <script src="Scripts/ajax-jquery.ui-1.8.9-jquery-ui.js"></script>
   <link href="Scripts/ajax-jquery.ui-1.8.9-themes-start-jquery-ui.css" rel="stylesheet" />
   <script type="text/javascript">
       $("[id*=btnaddques]").live("click", function () {
           $("#dialog").dialog({
               title: "Enter Your Question Details",
               height: 600,
               width: 700,

               modal: true,
               open: function (type, data) {
                   $(this).parent().appendTo("form");
               }
           });
           return false;
       });

   </script>
   <br />
   <br />
</asp:Content>