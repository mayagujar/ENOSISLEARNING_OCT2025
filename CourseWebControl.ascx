<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CourseWebControl.ascx.cs" Inherits="ENOSISLEARNING.CourseWebControl" %>
    <style>   
.content-page
{
    box-sizing:border-box;
}
        .lab {
            font-size: 16px;
           /* font-weight: bold;*/
            color: #333;
            height:30px;
            position:relative;
            top:-1px;
            left:5px;
            font-weight:bold;

        }
.nested-grid {
    margin-top: 10px;
    padding: 0;
    border-top: 1px solid #ddd;
    display: none;
}

.toggle-topics {
    cursor: pointer;
    background-color:transparent;
    border:none;
    color:black;
    font-size:15px;
}

/*.toggle-topics:hover {
    color: #007bff;
}*/

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
.item{
   position:relative;
   top:-10px;
}
.grid-item {
    padding: 0px;  /* Adds spacing inside the row */
    margin-bottom: -10px;  /* Creates vertical gap */
    border: 1px solid #ddd;  /* Optional: Add border for clarity */
    background: #f4f8f9;  /* Optional: Keep a clean look */
    height:35px;
    border-radius:5px;
}
.item2
{
    position:relative;
    top:-40px;
}

    </style>
   <div class="content-page">
        <!-- GridView for Chapters -->
<asp:GridView ID="gvChapters" runat="server" DataKeyNames="Chapter_Id" CssClass="table table-borderless" AutoGenerateColumns="false" 
              OnRowDataBound="gvChapters_RowDataBound" 
              BorderStyle="None" BorderColor="transparent" RowStyle-BackColor="transparent">
    <Columns>
        <asp:TemplateField HeaderStyle-BorderStyle="None" HeaderStyle-Width="100px" HeaderStyle-Font-Size="20px" ItemStyle-Height="20px" ItemStyle-CssClass="item2" ItemStyle-BackColor="white" ItemStyle-BorderStyle="None">
            <ItemTemplate>
                <div class="grid-item">
                    <!-- Chapter Number -->
                    <asp:Label Text='<%#Eval("Chapter_Number") %>' runat="server" CssClass="lab"/>

                    <!-- Toggle Button -->
                    <button type="button" class="toggle-topics"
                            style="width:30px;height:30px;padding:2px;position:relative;top:0px;left:88%;
                                   color:#333;font-weight:bold;font-size:20px">+</button>
                </div>
                
                <!-- Nested GridView (Topics) -->
                <div class="nested-grid" style="display: none;background-color:transparent">
                    <asp:GridView ID="gvTopics" runat="server" CssClass="table table-borderless" AutoGenerateColumns="false" BorderStyle="None" 
                                  BorderColor="transparent" BackColor="Transparent">
                        <Columns>
                            <asp:BoundField DataField="Topic_Name" SortExpression="Topic_Name" HeaderStyle-CssClass="lab" ItemStyle-CssClass="item2"/>
                        </Columns>
                    </asp:GridView>
                </div>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
    </div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        // Toggle topics visibility - only one open at a time
        $(document).on('click', '.toggle-topics', function () {
            var $row = $(this).closest('tr'); // Get the parent row
            var $nestedGrid = $row.find('.nested-grid'); // Find the nested grid within the row

            // Close all other nested grids and reset button text
            $('.nested-grid').not($nestedGrid).slideUp(200);
            $('.toggle-topics').not(this).text('+');

            // Toggle the current nested grid visibility
            if ($nestedGrid.is(':visible')) {
                $nestedGrid.slideUp(200);
                $(this).text('+');
            } else {
                $nestedGrid.stop(true, true).slideDown(200);
                $(this).text('-');
            }
        });
        // Search filter for chapters
        $('#txtChapterFilter').on('keyup', function () {
            var searchText = $(this).val().toLowerCase();
            $('#gvChapters tbody tr').each(function () {
                var chapter = $(this).find('.lab').text().toLowerCase();
                $(this).toggle(chapter.includes(searchText));
            });
        });
    });
</script>

