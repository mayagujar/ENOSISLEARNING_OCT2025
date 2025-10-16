<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendMail.aspx.cs" ValidateRequest="false" Inherits="ENOSISLEARNING.SendMail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="media/css/style.css" rel="stylesheet" type="text/css" />
<link href="media/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="media/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<title></title>
<style type="text/css">
.style1
{
width: 89px;
text-align: left;
padding-right: 10px;
float: left;
font-size: 16px;
font-weight: bold;
}
.style2
{
width: 450px;
}
</style>
</head>
<body>
<form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager" runat="server" ></asp:ScriptManager>
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0">
<div class="logo-wrapper">
<div class="logo-image"> <img src="media/images/logo.png" alt="logo" title="logo" /> </diV>
</div>
</div>
</div>
<div class="clearfix"></div>
<div class="container">
<div class="row" style="margin-top:20px">
<div class="send-sms-wrpr">
        
<div>
<fieldset style="width:500px;">
<table align="center"  cellspacing="0" cellpadding="0">
<tr>
<td class="style1">To<span style="float:right; margin-right:5px;">:</span></td>
<td class="style2">
<asp:TextBox ID="txtto" runat="server" Width="450px" />
</td>
</tr>
<tr>
<td class="style1">
&nbsp;
</td>
</tr>
<tr>
<td class="style1">Cc<span style="float:right; margin-right:5px;">:</span></td>
<td class="style2">
<asp:TextBox ID="txtcc" runat="server" Width="450px" />
</td>
</tr>
<tr>
<td class="style1">
&nbsp;
</td>

<tr>
<td class="style1">Subject<span style="float:right; margin-right:5px;">:</span></td>
<td class="style2">
<asp:TextBox ID="txtsubject" runat="server" Width="450px" />
</td>
</tr>
<tr>
<td class="style1">
&nbsp;
</td>
</tr>
<tr>
<td colspan="2" align="left">
<table>
<tr style="">
<td class="style1">Files<span style="float:right; margin-right:5px;">:</span></td>
<td style="float:left;margin-right:10px;">
<asp:HyperLink NavigateUrl="" Text="" runat="server" ID="hykFile1"  />
</td>
<td style="float:left;margin-right:10px;">
<asp:HyperLink NavigateUrl="" Text="" runat="server" ID="hykFile2"  />
</td>
<td style="float:left;margin-right:10px;">
<asp:HyperLink NavigateUrl="" Text="" runat="server" ID="hykFile3" />
</td>
<td style="float:left;margin-right:10px;">
<asp:HyperLink NavigateUrl="" Text="" runat="server" ID="hykFile4" />
</td>
</tr>   
</table>
</td>
</tr>
<tr>
            
<td  colspan="2">
                
<asp:TextBox ID="txtbody" runat="server"  TextMode="MultiLine"  Width="500px" Height="140px" style="max-height:300px;"/>
</td>
</tr>
        
       
<tr>
<td class="style1">
&nbsp;
</td>
<td align="right">
<asp:Button ID="btnSend" runat="server" Text="Send"  OnClick="btnSend_Click" CssClass="submit-btn-lg-usr-tbl-nw" />
</td>
</tr>

</table>
</fieldset>
</div>
    
</div>
</div></div>
    
<div class="row">
<div class="footer-fullpage">
<p>Copyright &copy;2017 Enosis Learning. All Rights Reserved.</p>
</div>
</div>
</form>
</body>
</html>
