<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="PowerBIKnowledgeBase.aspx.cs" Inherits="ENOSISLEARNING.KnowledgeBase.PowerBIKnowledgeBase" %>
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
     <h1 style="font:300;background-color:#0099FF; color:floralwhite;text-align:center;font-size: xx-large;">POWER BI KNOWLEDGE BASE</h1>
       <h3 style="background-color:aliceblue;padding:40px;margin:40px;border:1px solid brown"> 
       <asp:Label ID="Label3" runat="server" Text="Tutorials" ForeColor="White" Font-Size="X-Large" BorderStyle="Solid" Width="103px" Height="33px" Font-Names="arial" BackColor="Teal" CssClass="lable"></asp:Label>
           
                   <p> <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://www.tutorialgateway.org/power-bi-tutorial/" ForeColor="black" Font-Size="Larger" >https://www.tutorialgateway.org/power-bi-tutorial/ </asp:HyperLink></p>
                
                    <p><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="https://data-flair.training/blogs/power-bi-tutorial/" ForeColor="Black" Font-Size="Larger" > https://data-flair.training/blogs/power-bi-tutorial/ </asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="https://www.mssqltips.com/sqlservertip/6792/analyzing-and-visualizing-data-with-microsoft-power-bi-certification/" ForeColor="Black" Font-Size="Larger" > https://www.mssqltips.com/sqlservertip/6792/analyzing-and-visualizing-data-with-microsoft-power-bi-certification/ </asp:HyperLink></p>
                
                    <p><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="https://docs.microsoft.com/en-us/learn/certifications/exams/da-100?tab=tab-learning-paths" ForeColor="Black" Font-Size="Larger" > https://docs.microsoft.com/en-us/learn/certifications/exams/da-100?tab=tab-learning-paths </asp:HyperLink></p>
                    <br />
               <hr style="border:1px solid brown;" />
       
        <asp:Label ID="Label14" runat="server" Text="Case - Study" ForeColor="White" Font-Size="X-Large" BorderStyle="Solid" Width="141px" BackColor="Teal" CssClass="lable" Height="35px"></asp:Label>
 
  <p><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="https://docs.microsoft.com/en-us/power-bi/create-reports/sample-customer-profitability" ForeColor="Black" Font-Size="Larger" > https://docs.microsoft.com/en-us/power-bi/create-reports/sample-customer-profitability </asp:HyperLink></p>
              
  <p><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="https://www.mssqltips.com/sqlservertip/6792/analyzing-and-visualizing-data-with-microsoft-power-bi-certification/" ForeColor="Black"  Font-Size="Larger"> https://www.mssqltips.com/sqlservertip/6792/analyzing-and-visualizing-data-with-microsoft-power-bi-certification/ </asp:HyperLink></p>
 <p><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="https://docs.microsoft.com/en-us/learn/certifications/exams/da-100?tab=tab-learning-paths" ForeColor="Black" Font-Size="Larger" > https://docs.microsoft.com/en-us/learn/certifications/exams/da-100?tab=tab-learning-paths</asp:HyperLink></p>
  <p><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="https://hevodata.com/learn/top-10-best-power-bi-dashboard-examples-in-2021/" ForeColor="Black" Font-Size="Larger" >https://hevodata.com/learn/top-10-best-power-bi-dashboard-examples-in-2021/ </asp:HyperLink></p>
                <br />
           <hr style="border:1px solid brown;" />
        <asp:Label ID="Label4" runat="server" Text="Deployment" ForeColor="White"  Font-Size="X-Large" BorderStyle="Solid" Width="136px" BackColor="Teal" CssClass="lable"></asp:Label>
        
        
                    <p><asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="https://www.red-gate.com/simple-talk/databases/sql-server/bi-sql-server/deploying-securing-updating-power-bi-reports/" ForeColor="Black" Font-Size="Larger" >https://www.red-gate.com/simple-talk/databases/sql-server/bi-sql-server/deploying-securing-updating-power-bi-reports/ </asp:HyperLink></p>
               
                    
                <br /> 
    <hr style="border:1px solid brown;" />
       
        <asp:Label ID="Label5" runat="server" Text="Interview Questions" ForeColor="White"  Font-Size="X-Large" BorderStyle="Solid" Width="215px" BackColor="Teal" CssClass="lable"></asp:Label>
       
                    <p><asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="https://www.enosislearning.com/Interview_Questions.aspx?lag=POWERBI" ForeColor="Black" Font-Size="Larger" >https://www.enosislearning.com/Interview_Questions.aspx?lag=POWERBI</asp:HyperLink></p>
                
                   <p> <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="https://data-flair.training/blogs/power-bi-interview-questions/" ForeColor="Black" Font-Size="Larger" >https://data-flair.training/blogs/power-bi-interview-questions/ </asp:HyperLink></p>
              <br />   
    <hr style="border:1px solid brown;"/>
         <p><asp:Label ID="Label6" runat="server" Text="Exams / Online Quiz" ForeColor="White" Font-Size="X-Large" BorderStyle="Solid" Width="217px" BackColor="Teal" CssClass="lable"></asp:Label></p>
        
                   <p> <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="https://data-flair.training/blogs/power-bi-quiz/" ForeColor="Black" Font-Size="Larger" > https://data-flair.training/blogs/power-bi-quiz/ </asp:HyperLink></p>
               
                   
                 <br />
    <hr style="border:1px solid brown;" />
           
        </h3>

</asp:Content>


