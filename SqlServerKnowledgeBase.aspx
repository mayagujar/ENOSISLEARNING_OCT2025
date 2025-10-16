<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="SqlServerKnowledgeBase.aspx.cs" Inherits="ENOSISLEARNING.KnowledgeBase.SqlServerKnowledgeBase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    
   <style type="text/css">
       .lable
         {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
       <h1 style="font:300;background-color:#0099FF; color:floralwhite;text-align:center;font-size: xx-large;">Tutorials</h1>
       <h3 style="background-color:aliceblue;padding:40px;margin:40px;border:1px solid brown"> 
       <asp:Label ID="Label3" runat="server" Text="Tutorials" ForeColor="White" Font-Size="X-Large" BorderStyle="Solid" Width="109px" Height="39px" Font-Names="arial" BackColor="Teal" CssClass="lable"></asp:Label>
           
                   <p> <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://www.tutorialgateway.org/sql/" ForeColor="black" Font-Size="Larger" >https://www.tutorialgateway.org/sql/ </asp:HyperLink></p>
                
                    <p><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="https://www.tutorialspoint.com/ms_sql_server/index.htm" ForeColor="Black" Font-Size="Larger" >https://www.tutorialspoint.com/ms_sql_server/index.htm</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="https://www.sqlservertutorial.net/" ForeColor="Black" Font-Size="Larger" >https://www.sqlservertutorial.net/</asp:HyperLink></p>
                
                      <br />
               <hr style="border:1px solid brown;" />
       
        <asp:Label ID="Label14" runat="server" Text="Interview Questions" ForeColor="White" Font-Size="X-Large" BorderStyle="Solid" Width="217px" BackColor="Teal" CssClass="lable" Height="39px"></asp:Label>
 
  <p><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="https://www.enosislearning.com/Interview_Questions.aspx?lag=SQL%20Server" ForeColor="Black" Font-Size="Larger" > https://www.enosislearning.com/Interview_Questions.aspx?lag=SQL%20Server </asp:HyperLink></p>
                             <br />
           <hr style="border:1px solid brown;" /> 
        <asp:Label ID="Label4" runat="server" Text="Exams / Online Quiz" ForeColor="White"  Font-Size="X-Large" BorderStyle="Solid" Width="222px" BackColor="Teal" CssClass="lable" Height="39px"></asp:Label>
        
        
                    <p><asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="https://career.guru99.com/sql-server-quiz/" ForeColor="Black" Font-Size="Larger" > https://career.guru99.com/sql-server-quiz/ </asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="https://www.tutorialsteacher.com/online-test/sqlserver-test" ForeColor="Black" Font-Size="Larger" > https://www.tutorialsteacher.com/online-test/sqlserver-test </asp:HyperLink></p>
                    
                  <p><asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="https://www.w3schools.com/sql/sql_quiz.asp" ForeColor="Black" Font-Size="Larger" > https://www.w3schools.com/sql/sql_quiz.asp </asp:HyperLink></p>
                
                   <p> <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="https://www.onlineinterviewquestions.com/sql-server-mcq/" ForeColor="Black" Font-Size="Larger" > https://www.onlineinterviewquestions.com/sql-server-mcq/ </asp:HyperLink></p>
              
    
</asp:Content>


