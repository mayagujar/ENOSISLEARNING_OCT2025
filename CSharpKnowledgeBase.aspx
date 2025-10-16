<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="CSharpKnowledgeBase.aspx.cs" Inherits="ENOSISLEARNING.KnowledgeBase.CSharpKnowledgeBase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style type="text/css">
       .lable
         {
            border-top-left-radius: 30px;
            border-top-right-radius: 30px;
            border-bottom-left-radius: 30px;
            border-bottom-right-radius: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<body>
   
        <h1 style="font:300;background-color:#0099FF; color:floralwhite;text-align:center;font-size: xx-large;">CSHARP Tutorials</h1>
       <h3 style="background-color:aliceblue;padding:40px;margin:40px;border:1px solid brown">
       <asp:Label ID="Label3" runat="server" Text=".Net Framework" ForeColor="White" Font-Size="X-Large" BorderStyle="Solid" Width="182px" Height="33px" Font-Names="arial" BackColor="Teal" CssClass="lable"></asp:Label>
           
                   <p> <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://www.c-sharpcorner.com/UploadFile/cb1429/net-framework-overview/" ForeColor="black" Font-Size="Larger" >https://www.c-sharpcorner.com/UploadFile/cb1429/net-framework-overview/</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="https://www.geeksforgeeks.org/introduction-to-net-framework/" ForeColor="Black" Font-Size="Larger" >https://www.geeksforgeeks.org/introduction-to-net-framework/</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="https://www.geeksforgeeks.org/c-sharp-net-framework-basic-architecture-component-stack/?ref=rp" ForeColor="Black" Font-Size="Larger" >https://www.geeksforgeeks.org/c-sharp-net-framework-basic-architecture-component-stack/?ref=rp</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="https://www.geeksforgeeks.org/garbage-collection-in-c-sharp-dot-net-framework/?ref=rp" ForeColor="Black" Font-Size="Larger" >https://www.geeksforgeeks.org/garbage-collection-in-c-sharp-dot-net-framework/?ref=rp</asp:HyperLink></p>
                    <br />
               <hr style="border:1px solid brown;" />
       
        <asp:Label ID="Label14" runat="server" Text="CSharp" ForeColor="White" Font-Size="X-Large" BorderStyle="Solid" Width="89px" BackColor="Teal" CssClass="lable"></asp:Label>
 
  <p><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="https://www.tutlane.com/tutorial/csharp" ForeColor="Black" Font-Size="Larger" >https://www.tutlane.com/tutorial/csharp</asp:HyperLink></p>
             
  <p><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="https://www.tutorialspoint.com/csharp/index.htm" ForeColor="Black"  Font-Size="Larger">https://www.tutorialspoint.com/csharp/index.htm</asp:HyperLink></p>
 <p><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="https://www.tutorialsteacher.com/csharp/csharp-tutorials" ForeColor="Black" Font-Size="Larger" >https://www.tutorialsteacher.com/csharp/csharp-tutorials</asp:HyperLink></p>
  <p><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="https://www.c-sharpcorner.com" ForeColor="Black" Font-Size="Larger" >https://www.c-sharpcorner.com</asp:HyperLink></p>
  <p> <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="https://www.codeproject.com/" ForeColor="Black" Font-Size="Larger" >https://www.codeproject.com/</asp:HyperLink></p>
               <br />
           <hr style="border:1px solid brown;" />
        <asp:Label ID="Label4" runat="server" Text="OOPS" ForeColor="White"  Font-Size="X-Large" BorderStyle="Solid" Width="66px" BackColor="Teal" CssClass="lable"></asp:Label>
       
       
                    <p><asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="http://www.codeproject.com/Articles/22769/Introduction-to-Object-Oriented-Programming-Concep" ForeColor="Black" Font-Size="Larger" >http://www.codeproject.com/Articles/22769/Introduction-to-Object-Oriented-Programming-Concep</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="http://www.codeproject.com/Articles/1445/Introduction-to-inheritance-polymorphism-in-C" ForeColor="Black" Font-Size="Larger" >http://www.codeproject.com/Articles/1445/Introduction-to-inheritance-polymorphism-in-C</asp:HyperLink></p>
                <br />
    <hr style="border:1px solid brown;" />
       
        <asp:Label ID="Label5" runat="server" Text="Collections in .Net" ForeColor="White"  Font-Size="X-Large" BorderStyle="Solid" Width="200px" BackColor="Teal" CssClass="lable"></asp:Label>
       
                    <p><asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="https://www.c-sharpcorner.com/article/collections-in-net/" ForeColor="Black" Font-Size="Larger" >https://www.c-sharpcorner.com/article/collections-in-net/</asp:HyperLink></p>
               
                   <p> <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="https://www.geeksforgeeks.org/collections-in-c-sharp/" ForeColor="Black" Font-Size="Larger" >https://www.geeksforgeeks.org/collections-in-c-sharp/</asp:HyperLink></p>
              <br />  
    <hr style="border:1px solid brown;"/>
         <p><asp:Label ID="Label6" runat="server" Text="Best Practices" ForeColor="White" Font-Size="X-Large" BorderStyle="Solid" Width="151px" BackColor="Teal" CssClass="lable"></asp:Label></p>
       
                   <p> <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="https://www.c-sharpcorner.com/blogs/c-sharp-coding-guidelines-and-best-practices-v10" ForeColor="Black" Font-Size="Larger" >https://www.c-sharpcorner.com/blogs/c-sharp-coding-guidelines-and-best-practices-v10</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="https://docs.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/coding-conventions#naming-conventions" ForeColor="Black" Font-Size="Larger" >https://docs.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/coding-conventions#naming-conventions</asp:HyperLink></p>
                 <br />
      <hr style="border:1px solid brown;" />
          <asp:Label ID="Label9" runat="server" Text="Delegates" ForeColor="White" Font-Size="X-Large" BorderStyle="Solid" Width="83px" BackColor="Teal" CssClass="lable"></asp:Label>
       
                    <p><asp:HyperLink ID="HyperLink26" runat="server" NavigateUrl="https://www.c-sharpcorner.com/UploadFile/puranindia/C-Sharp-net-delegates-and-events/" ForeColor="Black" Font-Size="Larger" >https://www.c-sharpcorner.com/UploadFile/puranindia/C-Sharp-net-delegates-and-events/</asp:HyperLink></p>
                        <br />
        <hr style="border:1px solid brown;"/>
          <asp:Label ID="Label10" runat="server" Text="ExceptionHanding" ForeColor="White" Font-Size="X-Large" BorderStyle="Solid" Width="200px" BackColor="Teal" CssClass="lable"></asp:Label>
       
                    <p><asp:HyperLink ID="HyperLink27" runat="server" NavigateUrl="https://www.c-sharpcorner.com/article/exception-handling-in-C-Sharp/" ForeColor="Black" Font-Size="Larger" >https://www.c-sharpcorner.com/article/exception-handling-in-C-Sharp/</asp:HyperLink></p>
                        <br />
        <hr style="border:1px solid brown;" />
               
            <asp:Label ID="Label11" runat="server" Text="DLL in .Net" ForeColor="White" Font-Size="X-Large" BorderStyle="Solid" Width="121px" BackColor="Teal" CssClass="lable"></asp:Label>
                    <p><asp:HyperLink ID="HyperLink28" runat="server" NavigateUrl="https://www.c-sharpcorner.com/UploadFile/1e050f/creating-and-using-dll-class-library-in-C-Sharp/" ForeColor="Black" Font-Size="Larger" >https://www.c-sharpcorner.com/UploadFile/1e050f/creating-and-using-dll-class-library-in-C-Sharp/</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink29" runat="server" NavigateUrl="https://www.onlinebuff.com/article_how-to-deploy-an-assembly-into-gacglobal-assembly-cache-_38.html" ForeColor="Black" Font-Size="Larger" >https://www.onlinebuff.com/article_how-to-deploy-an-assembly-into-gacglobal-assembly-cache-_38.html</asp:HyperLink></p>
                <br />
    <hr style="border:1px solid brown;" />

           </h3>
             <h1 style="font:300;background-color:#0099FF;color:floralwhite;text-align:center; font-size: xx-large;">InterviewQuestions</h1>
    <h3 style="background-color:aliceblue;padding:40px;margin:40px;border:1px solid brown">
       
                    <p><asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="https://www.enosislearning.com/Interview_Questions.aspx?lag=Csharp" ForeColor="Black" Font-Size="Larger" >https://www.enosislearning.com/Interview_Questions.aspx?lag=Csharp</asp:HyperLink></p>
               
                   <p> <asp:HyperLink ID="HyperLink18" runat="server" NavigateUrl="https://www.c-sharpcorner.com/UploadFile/puranindia/C-Sharp-interview-questions/" ForeColor="Black" Font-Size="Larger" >https://www.c-sharpcorner.com/UploadFile/puranindia/C-Sharp-interview-questions/</asp:HyperLink></p>
               
                   <p> <asp:HyperLink ID="HyperLink19" runat="server" NavigateUrl="https://www.guru99.com/c-sharp-interview-questions.html" ForeColor="Black" Font-Size="Larger" >https://www.guru99.com/c-sharp-interview-questions.html</asp:HyperLink></p>
     <br />
       </h3>

                <hr style="border:1px solid brown;" />
             <h1 style="font:300;background-color:#0099FF;color:floralwhite;text-align:center; font-size: xx-large;">Quiz/Tests</h1>
    <h3 style="background-color:aliceblue;padding:40px;margin:40px;border:1px solid brown">

       
                    <p><asp:HyperLink ID="HyperLink20" runat="server" NavigateUrl="https://tests4geeks.com/c-sharp-online-test" ForeColor="Black" Font-Size="Larger" >https://tests4geeks.com/c-sharp-online-test</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink21" runat="server" NavigateUrl="https://www.withoutbook.com/OnlineTestStart.php?quizId=71" ForeColor="Black" Font-Size="Larger" >https://www.withoutbook.com/OnlineTestStart.php?quizId=71</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink22" runat="server" NavigateUrl="https://www.tutorialsteacher.com/online-test/csharp-test" ForeColor="Black" Font-Size="Larger" >https://www.tutorialsteacher.com/online-test/csharp-test</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink23" runat="server" NavigateUrl="https://www.tutorialspoint.com/csharp/csharp_online_quiz.htm" ForeColor="Black" Font-Size="Larger" >https://www.tutorialspoint.com/csharp/csharp_online_quiz.htm</asp:HyperLink></p>
               
                    <p><asp:HyperLink ID="HyperLink24" runat="server" NavigateUrl="https://www.testdome.com/for-jobseekers" ForeColor="Black" Font-Size="Larger" >https://www.testdome.com/for-jobseekers</asp:HyperLink></p>
               
                  <p> <asp:HyperLink ID="HyperLink25" runat="server" NavigateUrl="http://www.pskills.org/csharp.jsp" ForeColor="Black" Font-Size="Larger" >http://www.pskills.org/csharp.jsp</asp:HyperLink></p>
                <br />
      </h3>
    
    </body>
   
</asp:Content>