<%@ Page Title="" Language="C#" MasterPageFile="~/LEARNING.Master" AutoEventWireup="true" CodeBehind="UpdatedCourseContent.aspx.cs" Inherits="ENOSISLEARNING.UpdatedCourseContent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
.table
{
    width:900px;
}
   
        .lab {
            font-size: 18px;
            font-weight: bold;
            color: black;
        }

.nested-grid {
    margin-top: 10px;
    padding: 0;
    border-top: 1px solid #ddd;
    display: none;
}

.toggle-topics {
    cursor: pointer;
}

.toggle-topics:hover {
    color: #007bff;
}

.pagination {
    display: flex;
    justify-content: left;
    list-style-type: none;
    padding: 0;
    border-color:white;
}

.pagination a,
.pagination .page-button {
    margin: 0 5px;
    padding: 10px 15px;
    text-decoration: none;
    color: #007bff;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #fff;
    cursor: pointer;
}

.pagination .page-button:hover {
    background-color: #007bff;
    color: white;
}

.pagination .current {
    background-color: #007bff;
    color: white;
    font-weight: bold;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="content-page" style="margin-top:10px;margin-left:25px;">
        <!-- GridView for Chapters -->
<asp:GridView ID="gvChapters" runat="server" DataKeyNames="Chapter_Id" CssClass="table table-borderless" AutoGenerateColumns="false" 
              OnRowDataBound="gvChapters_RowDataBound" AllowPaging="true" PageSize="5" OnPageIndexChanging="gvChapters_PageIndexChanging" 
              BorderStyle="None" BorderColor="White" PagerStyle-CssClass="pagination" PagerStyle-HorizontalAlign="Left" RowStyle-BackColor="#ccccff">
    <Columns>
        <asp:TemplateField HeaderStyle-BorderStyle="None" HeaderText="Course Details" HeaderStyle-Width="100px" HeaderStyle-Font-Size="20px">
            <ItemTemplate>
                <!-- Chapter Number -->
                <asp:Label Text='<%#Eval("Chapter_Number") %>' runat="server" CssClass="lab"/>
                
                <!-- Toggle Button -->
                <button type="button" class="btn btn-sm btn-primary toggle-topics" 
                        style="width:30px;height:30px;padding:3px;position:relative;top:0px;left:88%">+</button>
                
                <!-- Nested GridView (Topics) -->
                <div class="nested-grid" style="display: none;">
                    <asp:GridView ID="gvTopics" runat="server" CssClass="table table-borderless" AutoGenerateColumns="false" BorderStyle="None" 
                                  BorderColor="White">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr. No" HeaderStyle-CssClass="lab" HeaderStyle-BorderColor="White" HeaderStyle-Width="90px">
                                 <ItemTemplate>
                                     <p class="list"> <%#Container.DataItemIndex+1 %></p>
                                 </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Topic_Name" HeaderText="Topic Name" SortExpression="Topic_Name" HeaderStyle-CssClass="lab" />
                        </Columns>
                    </asp:GridView>
                </div>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <PagerSettings Mode="Numeric" Position="Bottom" />
    <PagerStyle CssClass="pagination" HorizontalAlign="Left" />
</asp:GridView>
    </div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        // Toggle topics visibility - only one open at a time
        $(document).on('click', '.toggle-topics', function () {
            var $nestedGrid = $(this).next('.nested-grid');

            // Close all other nested grids and reset button text
            $('.nested-grid').not($nestedGrid).slideUp(200); // 400 ms for smooth slideUp
            $('.toggle-topics').not(this).text('+'); // Reset text for other buttons

            // Toggle the current nested grid visibility
            if ($nestedGrid.is(':visible')) {
                $nestedGrid.slideUp(200); // 400 ms for smooth slideUp
                $(this).text('+'); // Change button text
            } else {
                $nestedGrid.stop(true, true).slideDown(200); // 400 ms for smooth slideDown
                $(this).text('-'); // Change button text
            }
        });

        // Search filter for chapters
        $('#txtChapterFilter').on('keyup', function () {
            var searchText = $(this).val().toLowerCase();
            $('#gvChapters tbody tr').each(function () {
                var chapter = $(this).find('td:first').text().toLowerCase();
                $(this).toggle(chapter.includes(searchText));
            });
        });
    });
</script>
</asp:Content>
