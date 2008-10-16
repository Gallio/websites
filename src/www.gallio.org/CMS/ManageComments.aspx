<%@ Page Language="C#" MasterPageFile="~/CMS/CMS.master" AutoEventWireup="true" CodeFile="ManageComments.aspx.cs" Inherits="CMS_ManageComments" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>
        Manage Comments</h3>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" DataKeyNames="PageID,CommentID" DataSourceID="SqlDataSource1"
            PageSize="5" Width="503px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="PageID" HeaderText="PageID" InsertVisible="False" ReadOnly="True"
                    SortExpression="PageID" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                <asp:BoundField DataField="Posted" HeaderText="Posted" SortExpression="Posted" />
                <asp:BoundField DataField="Body" HeaderText="Body" SortExpression="Body" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GallioDb %>"
            DeleteCommand="DELETE FROM dbo.CMS_Comments WHERE CommentID = @CommentID" SelectCommand="SELECT dbo.CMS_Page.PageID, dbo.CMS_Page.Title, dbo.CMS_Comments.CommentID, dbo.CMS_Comments.Username, dbo.CMS_Comments.Author, dbo.CMS_Comments.Posted, dbo.CMS_Comments.Body FROM dbo.CMS_Page INNER JOIN dbo.CMS_Comments ON dbo.CMS_Page.PageID = dbo.CMS_Comments.PageID ORDER BY dbo.CMS_Comments.Posted DESC">
            <DeleteParameters>
                <asp:Parameter Name="CommentID" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

