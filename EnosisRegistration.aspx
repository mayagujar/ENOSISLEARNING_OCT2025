<%@ Page Title="" Language="C#" MasterPageFile="~/MyAdmin.Master" AutoEventWireup="true" CodeBehind="EnosisRegistration.aspx.cs" Inherits="ENOSISLEARNING.EnosisRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
<%--   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" />--%>

    <script type="text/javascript">

        $(document).ready(function () {
          
               SearchText();

               function SearchText() {
                   $(".autosuggest").autocomplete({
                       source: function (request, response) {
                           $.ajax({
                               type: "POST",
                               contentType: "application/json; charset=utf-8",
                               url: "EnosisRegistration.aspx/GetAutoCompleteData",
                               data: "{'username':'" + document.getElementById('txtReferBy').value + "'}",
                               dataType: "json",
                               success: function (data) {
                                   response(data.d);
                               },
                               error: function (result) {
                                   alert("Error");
                               }
                           });
                       }
                   });
               }
          

            $("#ContentPlaceHolder1_txtDOB").datepicker({
                changeMonth: true,
                changeYear: true,
                showOn: 'onchange'

            });
            
            $('[id*=ContentPlaceHolder1_drpCourses]').multiselect({
               
                    includeSelectAllOption: true
                });
               

           });
    </script>

    <style>
        body {
        background-color:#fff;
        }
        .hide-div {
            display: none;
        }
        .add-candidate {
            height: 34px;
            margin: 0 auto;
            background: url(images/employee-details-main-h.png) repeat-x;
            line-height: 32px;
            padding-left: 20px;
            font-family: arial;
            font-size: 14px;
            font-weight: bold;
            color: #368aff;       
         }
        .add-candidate h5{
          padding:10px;
          color:#1C71BB;
          font-weight:bold;
          font-family:15px!important;  
        }
        .registration_tabl h5 {
          padding:0px 0px;
          color:#1C71BB;
          font-weight:bold;
          font-family:17px;  
        }
        .myhr {
        margin-top: 20px!important;
        margin-bottom:0px!important;
        border: 0;
        border-top: 2px solid #069;
        }
        input[type="radio"], input[type="checkbox"] {
        margin: 7px 0 0 0;
        line-height: normal;
        }
       
    </style>
    <link href="css/jquery-ui.css" rel="Stylesheet" type="text/css" />
    
   
    <style>
        .ui-datepicker-trigger {
            margin: -2px 0 0 -25px;
            width:23px;
            height:23px;
            border-radius: 3px;
        }

        .registration_tabl
        {
            width:80%;
            margin:10px auto;
            border:1px solid lightgrey;
        }
       .heading {
    position: relative;
    font-weight: 600;
    margin-bottom: 0px;
    background: #173151;
    color: white;
    height: 30px;
    padding: 0px 10px;
    font-size: 25px;
        margin-left: 10px;
}
        .myform
        {
            border:1px solid lightgrey;
            padding:0px;
            margin-left:10px;
        }
        label {
    display: inline-block;
    max-width: 100%;
    margin-bottom: 5px;
    font-weight: bold;
    color: #1d96b2;
    font-size:15px;
}
        .text-end
        {
            width:200px;
            margin:auto;
        }
    </style>
</asp:Content>

<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                               <div class="card-body">
                                                            <asp:Label ID="lblError" ForeColor="Red" BackColor="Yellow"  runat="server" ></asp:Label>
                                     
                                      <div class="border">
                                         <div class="form-group row">
                                        <label for="fname" class="col-sm-2 text-right control-label col-form-label">Name :</label>
                                        <div class="input-group col-sm-4">
                                         
                                             
                                        <asp:TextBox ID="txtName" runat="server"  CssClass="form-control text-success" required="true" TabIndex="1"  />
                                        </div>
                              
                                        <label for="lname" class="col-sm-1 text-right control-label col-form-label">Gender :</label>
                                        <div class="col-sm-2">
                                         
                                           <asp:RadioButton ID="rbMale" Text="Male" GroupName="Gender" runat="server" TabIndex="2" />
                                                 

                                                   <asp:RadioButton ID="rbFeMale" Text="FeMale" GroupName="Gender" runat="server" TabIndex="3"  />
                                     
                                        </div>
                                                <div class="col-sm-2">
                            <asp:CheckBox ID="chkFresher"    runat="server" required="true" AutoPostBack="true" OnCheckedChanged="chkFresher_CheckedChanged" Font-Size="Small" Text="Tick If Fresher" TabIndex="4" />
                             </div>
                                    </div>
                                          <div class="form-group row">
                                         
                                        <label for="fname" class="col-sm-2 text-right control-label col-form-label">D.O.B :</label>
                                           
                                         <div class="input-group col-sm-4">
                                        
                                         <asp:TextBox ID="txtDOB" runat="server"  CssClass="form-control" placeholder="dd/MM/yyyy" TextMode="Date" required="true" TabIndex="5"    />
                                        
                                            </div>
                                    
                                        <label for="fname" class="col-sm-1 text-right control-label col-form-label">MobileNo : </label>
                                        <div class="input-group col-sm-4">
                                            
                             
                                            
                                        
                                      <asp:TextBox ID="txtMobileNo" runat="server"  CssClass="form-control" required="true" TabIndex="6" />

                                        </div>
                                    </div>
                                        <div class="form-group row">
                                        <label for="fname" class="col-sm-2 text-right control-label col-form-label">Email :</label>
                                        <div class="input-group col-sm-4">
                                      

                                     <asp:TextBox ID="txtEmail" runat="server"  CssClass="form-control" required="true" TabIndex="7"
                                          /> 

                                        </div>
                                           
                                  
                                        <label for="fname" class="col-sm-1 text-right control-label col-form-label">Course :</label>
                                        <div class="col-sm-3">
                                        
   <asp:ListBox ID="drpCourses" runat="server" CssClass="select2 form-control m-t-8" TabIndex="8" style="height: 100px;width: 100%;" OnSelectedIndexChanged="drpCourses_SelectedIndexChanged"  AutoPostBack="true" SelectionMode="Multiple">
</asp:ListBox>
                                            </div> 
                                               <div class="col-sm-2">
<asp:Label ID="lblFees" Text="Total Fees" runat="server" CssClass="col-form-label" Visible="false" />
<asp:TextBox ID="txtTotalFees" runat="server" CssClass="form-control" Visible="false"  />
                                                   </div>
                                       
                                    </div>
                                        <div class="form-group row">
                                        <label for="fname" class="col-sm-2 text-right control-label col-form-label">Software Skills :</label>
                                        <div class="input-group col-sm-4">
                                           
                              <asp:TextBox ID="txtSkills" runat="server"  CssClass="form-control" required="true" TabIndex="9" 
                                 /> 
                                        </div>
                                 
                                        <label for="fname" class="col-sm-1 text-right control-label col-form-label">Address : </label>
                                        <div class="input-group col-sm-5">
                                             
                                            
                             <asp:TextBox ID="txtAddress" runat="server"  CssClass="form-control" required="true" TabIndex="10"
 />
                                        </div>
                                    </div>
                                      </div>
                                    <div class="border">
                                  <div class="form-group row">
                                        <label for="fname" class="col-sm-2 text-right control-label col-form-label">Location :</label>
                                        <div class="input-group col-sm-4">
                                       
                                            <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" required="true" TabIndex="11"  />
                                             
                                        </div>
                                  
                                        <label for="fname" class="col-sm-1 text-right control-label col-form-label">City :</label>
                                        <div class="input-group col-sm-2">
                                            
                                           
                             <asp:TextBox ID="txtCity" runat="server"  CssClass="form-control" required="true" TabIndex="12"  />
                                        </div>

                                        <label for="fname" class="col-sm-1 text-right control-label col-form-label">Pincode</label>
                                        <div class="input-group col-sm-2">
                                         
                                      

                             <asp:TextBox ID="txtPinCode" runat="server"  CssClass="form-control" required="true" TabIndex="13"
                              />
                                        </div>

                                    </div>


                                      <div class="form-group row">
                                      
                                      
                                                  
                                    
                                        <label for="fname" class="col-sm-2 text-right control-label col-form-label">Highest Qualification :</label>
                                        <div class="input-group col-sm-4">

                                             
               <asp:DropDownList ID="drpQualifications" runat="server"   CssClass="select2 form-control m-t-15" style="height: 36px;width: 100%;" required="true" TabIndex="14"
                   />
                                        </div>
                                            <label for="fname" class="col-sm-1 text-right control-label col-form-label">Percentage:</label>
                                        <div class="input-group col-sm-2">
                                    
                                            
                                            

                             <asp:TextBox ID="txtPercentage" runat="server"  CssClass="form-control" required="true" TabIndex="15"
                            />
                             </div>
                                              <label for="fname" class="col-sm-1 text-right control-label col-form-label">PassYear </label>
                                        <div class="col-sm-2">
                        <asp:DropDownList ID="drpPassingYears" runat="server"  CssClass="select2 form-control m-t-15" style="height: 36px;width: 100%;" required="true" TabIndex="16">

                              
</asp:DropDownList>
                                             </div>
                                    </div>


                                      

                                    <div class="form-group row">
                                           <label for="fname" class="col-sm-2 text-right control-label col-form-label">Resume :</label>
                                        <div class="col-sm-4">
                                <asp:FileUpload  ID="fResume" runat="server" TabIndex="17" />
                                         
                                            <asp:HyperLink ID="hykResume" runat="server" 
                                                style="margin-top:-10px; float:right" CssClass="btn btn-primary" />
                             </div>
                                    
                                  
                                     <label for="fname" id="trexp1"  runat="server" class="col-sm-1 text-right control-label col-form-label">Exp :</label>
                                        <div class="col-sm-2" id="trexp2" runat="server">
                                             <label for="fname" class=" text-right control-label col-form-label">Year</label>
                                            
                        <asp:DropDownList ID="drpExpYears" runat="server"  CssClass="drpdown1" TabIndex="18"  >
<asp:ListItem>0</asp:ListItem>
<asp:ListItem>1</asp:ListItem>
<asp:ListItem>2</asp:ListItem>
<asp:ListItem>3</asp:ListItem>
<asp:ListItem>4</asp:ListItem>
<asp:ListItem>5</asp:ListItem>
<asp:ListItem>6</asp:ListItem>
<asp:ListItem>7</asp:ListItem>
<asp:ListItem>8</asp:ListItem>
<asp:ListItem>9</asp:ListItem>
<asp:ListItem>10</asp:ListItem>
<asp:ListItem>11</asp:ListItem>
<asp:ListItem>12</asp:ListItem>
<asp:ListItem>13</asp:ListItem>
<asp:ListItem>14</asp:ListItem>
<asp:ListItem>15</asp:ListItem>
<asp:ListItem>16</asp:ListItem>
<asp:ListItem>17</asp:ListItem>
<asp:ListItem>18</asp:ListItem>
<asp:ListItem>19</asp:ListItem>
<asp:ListItem>20</asp:ListItem>
</asp:DropDownList>
                           
                                                  <label for="fname" class=" text-right control-label col-form-label">Month</label>
                                             <asp:DropDownList ID="drpMonths" runat="server" CssClass="drpdown1 drpdown2" TabIndex="19">
<asp:ListItem>0</asp:ListItem>
<asp:ListItem>1</asp:ListItem>
<asp:ListItem>2</asp:ListItem>
<asp:ListItem>3</asp:ListItem>
<asp:ListItem>4</asp:ListItem>
<asp:ListItem>5</asp:ListItem>
<asp:ListItem>6</asp:ListItem>
<asp:ListItem>7</asp:ListItem>
<asp:ListItem>8</asp:ListItem>
<asp:ListItem>9</asp:ListItem>
<asp:ListItem>10</asp:ListItem>
<asp:ListItem>11</asp:ListItem>
<asp:ListItem>12</asp:ListItem>
</asp:DropDownList>
                                                 </div>
                                   


                                        <label for="fname" id="trexp3" runat="server" class="col-sm-1 text-right control-label col-form-label"> Company</label>
                                        <div class="input-group col-sm-2"  id="trexp4" runat="server">
                                           
                         <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" TabIndex="20"  
                          />
                                    
                                     

                                    </div>
                                       
                                        
                             </div>

                                  <div class="form-group row">
                                        <label for="fname" class="col-sm-2 text-right control-label col-form-label">Coordinator Name :</label>
                                        <div class="col-sm-4">
                                            
                           <asp:DropDownList ID="drpCoordinator" runat="server"   CssClass="select2 form-control m-t-15" style="height: 36px;width: 100%;" TabIndex="21" >





</asp:DropDownList>
                                             <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="drpCoordinator"
    InitialValue="0" runat="server" ForeColor="Red" />
                             </div>
                           
                                        <label for="fname" class="col-sm-1 text-right control-label col-form-label">ReferedBy :</label>
                                        <div class="col-sm-2">
                                             
                            <input type="text" id="txtReferBy"  class="autosuggest form-control" TabIndex="22"  />
                             </div>
                                             <div class="col-sm-2">
                           <asp:CheckBox ID="chkPlacement"   runat="server" required="true" Text="Placement Required" TabIndex="23" />
                                            
                                                  
                             </div>
                                       <hr />
                                      <div class="col-sm-1">
    <asp:Button ID="btnSubmit" width="100%" Text="Save" runat="server" OnClick="btnSubmit_Click" BorderWidth="2px" CssClass="btn btn-info bton r-btn badge-orange" TabIndex="24" />
                                                
                                           </div>

                                    </div>
                                  
<div class="form-group row">
<asp:ValidationSummary ID="rv1" ShowMessageBox="true" ShowSummary="false" DisplayMode="BulletList" runat="server" ForeColor="Red" />
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobileNo" ErrorMessage="Mobile Number format is Not correct" Display="Dynamic"  ForeColor="Red"  CssClass="valid" 
ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
<asp:RegularExpressionValidator id="regEmail" ControlToValidate="txtEmail" ForeColor="Red"  Text="Please insert valid email ID" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Runat="server" CssClass="valid" /> 
<asp:RequiredFieldValidator ErrorMessage="Please select Course" ControlToValidate="drpCourses" InitialValue="0" runat="server" ForeColor="Red" />
<asp:RequiredFieldValidator ErrorMessage="Please select Coordinator" ControlToValidate="drpCoordinator" InitialValue="0" runat="server" ForeColor="Red" />

 </div>

                                        </div>
</div>
                                    
</asp:Content>--%>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="container mt-4" style="border:5px solid #1d96b2">
        <div class="card shadow-lg">
            
            <div class="card-body">

                <asp:Label ID="lblError" ForeColor="Red" BackColor="Yellow" runat="server" CssClass="d-block mb-3"></asp:Label>

                <!-- Row 1 -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control text-success" TabIndex="1" />
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Gender</label><br />
                        <div class="form-check form-check-inline">
                            <asp:RadioButton ID="rbMale" Text="Male" GroupName="Gender" runat="server" CssClass="form-check-input" />
                          <%--  <label class="form-check-label" for="rbMale">Male</label>--%>
                        </div>
                        <div class="form-check form-check-inline">
                            <asp:RadioButton ID="rbFeMale" Text="Female" GroupName="Gender" runat="server" CssClass="form-check-input" />
                            <%--<label class="form-check-label" for="rbFeMale">Female</label>--%>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex align-items-end">
                        <asp:CheckBox ID="chkFresher" runat="server" AutoPostBack="true"
                            OnCheckedChanged="chkFresher_CheckedChanged"
                            CssClass="form-check-input me-2" Text="Tick If Fresher" />
                    </div>
                </div>

                <!-- Row 2 -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">D.O.B</label>
                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" TabIndex="5" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Mobile No</label>
                        <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control" TabIndex="6" />
                    </div>
                </div>

                <!-- Row 3 -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TabIndex="7" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Course</label>
                        <asp:ListBox ID="drpCourses" runat="server"
                            CssClass="form-select" TabIndex="8"
                            SelectionMode="Multiple" AutoPostBack="true"
                            OnSelectedIndexChanged="drpCourses_SelectedIndexChanged"
                            style="height:100px;" />
                    </div>
                </div>

                <!-- Fees Section -->
                <div class="row mb-3" id="feesRow" runat="server" visible="false">
                    <div class="col-md-6">
                        <asp:Label ID="lblFees" Text="Total Fees" runat="server" CssClass="form-label" />
                        <asp:TextBox ID="txtTotalFees" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <!-- Skills & Address -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Software Skills</label>
                        <asp:TextBox ID="txtSkills" runat="server" CssClass="form-control" TabIndex="9" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Address</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TabIndex="10" />
                    </div>
                </div>

                <!-- Location, City, Pincode -->
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label class="form-label">Location</label>
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" TabIndex="11" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">City</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" TabIndex="12" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Pincode</label>
                        <asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control" TabIndex="13" />
                    </div>
                </div>

                <!-- Qualification -->
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label class="form-label">Highest Qualification</label>
                        <asp:DropDownList ID="drpQualifications" runat="server" CssClass="form-select" TabIndex="14" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Percentage</label>
                        <asp:TextBox ID="txtPercentage" runat="server" CssClass="form-control" TabIndex="15" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Pass Year</label>
                        <asp:DropDownList ID="drpPassingYears" runat="server" CssClass="form-select" TabIndex="16" />
                    </div>
                </div>

                <!-- Resume Upload -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Resume</label>
                        <asp:FileUpload ID="fResume" runat="server" CssClass="form-control" TabIndex="17" />
                        <asp:HyperLink ID="hykResume" runat="server" CssClass="btn btn-sm btn-outline-primary mt-2" />
                    </div>
                    <div class="col-md-6">
                        <label id="trexp1" runat="server" class="form-label">Experience</label>
                        <div id="trexp2" runat="server" class="d-flex gap-2">

                                                   <asp:DropDownList ID="drpExpYears" runat="server"  CssClass="drpdown1" TabIndex="18"  >
<asp:ListItem>0</asp:ListItem>
<asp:ListItem>1</asp:ListItem>
<asp:ListItem>2</asp:ListItem>
<asp:ListItem>3</asp:ListItem>
<asp:ListItem>4</asp:ListItem>
<asp:ListItem>5</asp:ListItem>
<asp:ListItem>6</asp:ListItem>
<asp:ListItem>7</asp:ListItem>
<asp:ListItem>8</asp:ListItem>
<asp:ListItem>9</asp:ListItem>
<asp:ListItem>10</asp:ListItem>
<asp:ListItem>11</asp:ListItem>
<asp:ListItem>12</asp:ListItem>
<asp:ListItem>13</asp:ListItem>
<asp:ListItem>14</asp:ListItem>
<asp:ListItem>15</asp:ListItem>
<asp:ListItem>16</asp:ListItem>
<asp:ListItem>17</asp:ListItem>
<asp:ListItem>18</asp:ListItem>
<asp:ListItem>19</asp:ListItem>
<asp:ListItem>20</asp:ListItem>
</asp:DropDownList>
                                                                        <asp:DropDownList ID="drpMonths" runat="server" CssClass="drpdown1 drpdown2" TabIndex="19">
<asp:ListItem>0</asp:ListItem>
<asp:ListItem>1</asp:ListItem>
<asp:ListItem>2</asp:ListItem>
<asp:ListItem>3</asp:ListItem>
<asp:ListItem>4</asp:ListItem>
<asp:ListItem>5</asp:ListItem>
<asp:ListItem>6</asp:ListItem>
<asp:ListItem>7</asp:ListItem>
<asp:ListItem>8</asp:ListItem>
<asp:ListItem>9</asp:ListItem>
<asp:ListItem>10</asp:ListItem>
<asp:ListItem>11</asp:ListItem>
<asp:ListItem>12</asp:ListItem>
</asp:DropDownList>
                        </div>
                         <label for="fname" id="trexp3" runat="server" class="col-sm-1 text-right control-label col-form-label"> Company</label>
                         <div class="input-group col-sm-2"  id="trexp4" runat="server">
                        <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" TabIndex="20" />
                    </div>
                </div>

                <!-- Coordinator & Referral -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Coordinator Name</label>
                        <asp:DropDownList ID="drpCoordinator" runat="server" CssClass="form-select" TabIndex="21" />
                        <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="drpCoordinator"
                            InitialValue="0" runat="server" ForeColor="Red" />
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Referred By</label>
                        <input type="text" id="txtReferBy" class="form-control" TabIndex="22" />
                    </div>
                    <div class="col-md-3 d-flex align-items-center">
                        <asp:CheckBox ID="chkPlacement" runat="server" CssClass="form-check-input me-2" Text="Placement Required" TabIndex="23" />
                    </div>
                </div>

                <!-- Buttons -->
                <div class="text-end" style="margin:auto">
                    <asp:Button ID="btnSubmit" Text="Save" runat="server"  CssClass="btn btn-info px-4" TabIndex="24" OnClick="btnSubmit_Click" />
                </div>

                <!-- Validation -->
                <asp:ValidationSummary ID="rv1" ShowMessageBox="true" ShowSummary="false" DisplayMode="BulletList" runat="server" ForeColor="Red" />
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobileNo" ErrorMessage="Mobile Number format is Not correct" Display="Dynamic"  ForeColor="Red"  CssClass="valid" 
ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
<asp:RegularExpressionValidator id="regEmail" ControlToValidate="txtEmail" ForeColor="Red"  Text="Please insert valid email ID" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Runat="server" CssClass="valid" /> 
<asp:RequiredFieldValidator ErrorMessage="Please select Course" ControlToValidate="drpCourses" InitialValue="0" runat="server" ForeColor="Red" />
<asp:RequiredFieldValidator ErrorMessage="Please select Coordinator" ControlToValidate="drpCoordinator" InitialValue="0" runat="server" ForeColor="Red" />
            </div>
        </div>
    </div>
     </div>
</asp:Content>