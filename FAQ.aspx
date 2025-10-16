<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" Async="true" CodeBehind="FAQ.aspx.cs" Inherits="ENOSISLEARNING.FAQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
<div id="msgboxpanel" runat="server"></div>
<div class="container section-faq" style="min-height:500px;"><!--main starts-->
<div class="faqmain">
<h2 style="background-color:#006495 ; padding:10px; margin:10px 0px; color:#fff">Frequently Asked Questions <span class="white">(FAQs)</span></h2>

<div class="panel-group" id="accordion">
 
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
    <span class="fa fa-plus myicon"></span>1. How can I join the training programs conducted at enosis learning?</a>
</h4>
</div>
<div id="collapseOne" class="panel-collapse collapse in">
<div class="panel-body">
<p>For attending the training program, you need to do the registration online or by coming to the office.</p>
</div>
</div>
</div>
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="fa fa-caret-down"></span>2. How do I register for a training program?</a>
</h4>
</div>
<div id="collapseTwo" class="panel-collapse collapse">
<div class="panel-body">
<p>For registration, you need to fill the registration form online or can do it by coming to the office. 
For online registration, you registration will be confirmed once the registration fees is received in the bank account. </p>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="fa fa-plus myicon"></span>3. Can I get refund of the registration fees?</a>
</h4>
</div>
<div id="collapseThree" class="panel-collapse collapse">
<div class="panel-body">
<p>The registration fee will be refunded if the cancellation is done, 3 days before the start of the training session.</p>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"><span class="fa fa-plus myicon"></span>4. Is the registration fees included in the training fees?</a>
</h4>
</div>
<div id="collapseFour" class="panel-collapse collapse">
<div class="panel-body">
<p>Yes, the registration fee is included in the training fees.</p>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseFive"><span class="fa fa-plus myicon"></span>5. What if I miss some of the training sessions?</a>
</h4>
</div>
<div id="collapseFive" class="panel-collapse collapse">
<div class="panel-body">
<p>If you have missed some of the sessions, then you can attend the immediate next training batch to complete the missed sessions.</p>
</div>
</div>
</div>
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseSix"><span class="fa fa-plus myicon"></span>6. How many times I can attend the training sessions?</a>
</h4>
</div>
<div id="collapseSix" class="panel-collapse collapse">
<div class="panel-body">
<p>You can attend the training any number of times in that calendar year, based upon the availability. The details will be given to you by the training coordinator.</p>
</div>
</div>
</div>



</div>



               
</div>
</div>

</asp:Content>
