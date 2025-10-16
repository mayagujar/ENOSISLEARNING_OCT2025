<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master"  AutoEventWireup="true" Async="true" CodeBehind="contact.aspx.cs" Inherits="ENOSISLEARNING.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script src="scripts/modernizr.js" type="text/javascript" lang="javascript" ></script>
   <link rel="stylesheet" href="./Online/mbr-additional.css" type="text/css" />
   <style type="text/css">
          .row
          {
          display:flex;
          }

        .col-4
        {
            width:300px;
            height:150px;
            background-color : transparent;
            margin : auto;
        }
        .left
        {
            text-align : center;
        }
        /* Card container styling */
        .card-container {
            display: flex;
            justify-content: space-between;
            margin: 10px 0px 0px 20px;
        }

        .card {
            flex: 1;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            margin: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease, color 0.3s ease;
            text-align: center;
        }

        .card h1 {
            font-size: 20px;
            color: #333;
            margin-bottom: 15px;
            font-weight : bold;
        }

        .card p {
            font-size: 14px;
            color: #666;
        }

        .card span {
            font-size: 40px;
            color: #007bff;
            margin-bottom: 15px;
        }

        .card a {
            text-decoration: none;
            color: black;
            font-size : 17px;
        }
        /* Card hover effect with text color transformation */
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card a:hover{
             color: #00adef;
        }
    /*Alert Box Styling*/
    .custom-alert-box {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
        z-index: 1000;
    }
    .alert-content {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        width: 300px;
        text-align: center;
        position: relative;
    }

    .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 18px;
        font-weight: bold;
        color: #333;
        cursor: pointer;
    }

    .alert-content p {
        font-size: 16px;
        color: #333;
        margin: 20px 0;
    }

    .alert-content button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
    }

    .alert-content button:hover {
        background-color: #0056b3;
    }
    /*Table Style*/
.xyz {
    background-color: #fff;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    height : 90%;
    max-width: 500px;
    margin: 10px 0px 0px 10px;
}

/* Style for the table */
.xyz .table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 10px;
    border : none;
}

/* Style for table cells */
.xyz .table td {
    padding: 10px;
    vertical-align: middle;
    border : none;
}

/* Style for labels */
.xyz label {
    font-weight: bold;
    color: #333;
    margin-right: 10px;
}

/* Input fields styling */
.xyz .form-control {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 10px;
    width: 100%;
}

/* Block-level button styling */
.xyz .btn {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 20px;
}
.xyz .btn:hover {
    background-color: #0056b3;
}
/* Styling for the iframe */
.col-md-6 iframe {
    width: 95%;
    height: 90%;
    border: none;
    border-radius: 10px; 
    margin-top : 10px;
}

/* Responsive adjustment */
@media (max-width: 768px) {
    .col-md-6 iframe {
        height: 200px;
    }
}

   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">
   <div class="container">
       <div class="row">
           <div class="card-container">
                <div class="card">
                    <span class="fa fa-location-arrow" aria-hidden="true"></span>
                    <h1>Address</h1>
                    <p><a href="#" title="Office Address">Office No 109, 1st Floor, Shoppers Orbit, opposite ICICI Bank, Vishrantwadi, Pune, Maharashtra 411015</a></p>
                </div>
                <div class="card">
                    <span class="fa fa-phone" aria-hidden="true"></span>
                    <h1>Phone</h1>
                    <p><a href="tel:+7757012054" title="Contact Number">+7757012051</a></p>
                    <p><a href="tel:+7757012054" title="Contact Number">+7757012054</a></p>
                </div>
                <div class="card">
                    <span class="fa fa-envelope-open-o" aria-hidden="true"></span>
                    <h1>Mail</h1>
                    <p><a href="mailto:training@enosislearning.com" title="Contact Email">training@enosislearning.com</a></p>
                </div>
            </div>
       </div>
      <div class="row">
         <div class="col-md-6">
             <div class="xyz">
                  <h3 class="cont-head">GET IN TOUCH WITH US:-</h3>
                    <table class="table table-borderless">
                        <tr>
                            <td>
                                <label for="txtName">Name :</label>
                            </td>
                            <td>
                                <input id="txtName" type="text" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtEmail">Email :</label>
                            </td>
                            <td>
                                <input id="txtEmail" type="email" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtMobile">Mobile No :</label>
                            </td>
                            <td>
                                <input id="txtMobile" type="text" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtSubject">Subject :</label>
                            </td>
                            <td>
                                <input id="txtSubject" type="text" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtDescription">Description :</label>
                            </td>
                            <td>
                                <input id="txtDescription" type="text" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="button" value="Submit" class="btn btn-primary" onclick="SaveRecord();" />
                            </td>
                        </tr>
                    </table>
             </div>
             <div id="customAlertBox" class="custom-alert-box">
                <div class="alert-content">
                    <span class="close-btn" onclick="closeAlertBox()">&times;</span>
                    <p id="alertMessage"></p>
                    <button type="button" onclick="closeAlertBox()">OK</button>
                </div>
            </div>
             <asp:Label ID="lblMsg" runat="server" />
         </div>
         <div class="col-md-6">
            <iframe src="https://maps.google.co.in/maps/ms?hl=en&amp;gl=in&amp;ie=UTF8&amp;oe=UTF8&amp;msa=0&amp;msid=209726770010496360628.0004c2070968a4c89e805&amp;ll=18.571328,73.875225&amp;spn=0.007527,0.00633&amp;t=m&amp;iwloc=0004c207100a33c88f8d5&amp;output=embed"
               frameborder="0" allowfullscreen=""></iframe>
         </div>
      </div>
   </div>
    <script src="Scripts/jquery-1.11.3.min.js"></script>
   <script type="text/javascript">
       //Alert Box Method//
       function showAlertBox(message) {
           document.getElementById("alertMessage").innerText = message;
           document.getElementById("customAlertBox").style.display = "flex"; // Show the alert box
       }
       //Close Alert Box Method//
       function closeAlertBox() {
           document.getElementById("customAlertBox").style.display = "none"; // Hide the alert box
       }

       // Method For SaveRecord function//
       function SaveRecord() {
           var name = $('#txtName').val().trim();
           var email = $('#txtEmail').val().trim();
           var contact = $('#txtMobile').val().trim();
           var subject = $('#txtSubject').val().trim();
           var remark = $('#txtDescription').val().trim();

           if (name === "" || email === "" || contact === "" || subject === "" || remark === "") {
               showAlertBox("Please fill in all fields before submitting.");
               return;
           }

           $.ajax({
               type: 'POST',
               url: 'contact.aspx/SaveRecord',
               data: JSON.stringify({
                   Name: name,
                   Email: email,
                   Contact: contact,
                   Subject: subject,
                   Remark: remark
               }),
               contentType: 'application/json; charset=utf-8',
               dataType: 'json',
               success: function (response) {
                   showAlertBox('WE HAVE RECEIVED YOUR DETAILS. WILL CONTACT YOU AS SOON AS POSSIBLE');
                   $('#txtName').val('');
                   $('#txtEmail').val('');
                   $('#txtMobile').val('');
                   $('#txtSubject').val('');
                   $('#txtDescription').val('');
               },
               error: function (xhr, status, error) {
                   showAlertBox("Error: " + error);
               }
           });
       }
   </script>
</asp:Content>