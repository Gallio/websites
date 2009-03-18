<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Downloads.aspx.cs" Inherits="Downloads" Title="Untitled Page" %>

<%@ OutputCache Duration="300" VaryByParam="*" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceHolder1" runat="Server">
    <h2>
        Downloads</h2>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <h4>
                <%# DataBinder.Eval(Container.DataItem, "Title") %>
            </h4>
            <%# DataBinder.Eval(Container.DataItem, "Description") %>
            <br />
            <a href="<%# DataBinder.Eval(Container.DataItem, "DownloadLink") %>" target="_blank">
                <%# DataBinder.Eval(Container.DataItem, "DownloadLink") %>
            </a>
            <br />
            Release notes can be found here:<br />
            <a href="<%# DataBinder.Eval(Container.DataItem, "ReleaseNotesLink") %>" target="_blank">
                <%# DataBinder.Eval(Container.DataItem, "ReleaseNotesLink") %>
            </a>
            <br />
            <small>Released on
                <%# DataBinder.Eval(Container.DataItem, "ReleaseDate") %>
            </small>
        </ItemTemplate>
        <SeparatorTemplate>
            <br />
            <br />
        </SeparatorTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:GallioDb %>" DeleteCommand="DELETE FROM [Release] WHERE [ID] = @original_ID AND [Title] = @original_Title AND [Description] = @original_Description AND [DownloadLink] = @original_DownloadLink AND [ReleaseNotesLink] = @original_ReleaseNotesLink AND [ReleaseDate] = @original_ReleaseDate"
        InsertCommand="INSERT INTO [Release] ([Title], [Description], [DownloadLink], [ReleaseNotesLink], [ReleaseDate]) VALUES (@Title, @Description, @DownloadLink, @ReleaseNotesLink, @ReleaseDate)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Release] ORDER BY [ReleaseDate] DESC"
        UpdateCommand="UPDATE [Release] SET [Title] = @Title, [Description] = @Description, [DownloadLink] = @DownloadLink, [ReleaseNotesLink] = @ReleaseNotesLink, [ReleaseDate] = @ReleaseDate WHERE [ID] = @original_ID AND [Title] = @original_Title AND [Description] = @original_Description AND [DownloadLink] = @original_DownloadLink AND [ReleaseNotesLink] = @original_ReleaseNotesLink AND [ReleaseDate] = @original_ReleaseDate">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_DownloadLink" Type="String" />
            <asp:Parameter Name="original_ReleaseNotesLink" Type="String" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="DownloadLink" Type="String" />
            <asp:Parameter Name="ReleaseNotesLink" Type="String" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_DownloadLink" Type="String" />
            <asp:Parameter Name="original_ReleaseNotesLink" Type="String" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="DownloadLink" Type="String" />
            <asp:Parameter Name="ReleaseNotesLink" Type="String" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <!--
    <h3>
        Release Builds</h3>
    <p>
        Below are the latest release builds. Also included are the gallio preview builds.</p>
    <asp:Label ID="errorLabel" Visible="False" runat="server" Text="Could not access build directory"
        ForeColor="#C00000"></asp:Label>
    <asp:GridView ID="devBuildsGrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
        ForeColor="#333333" GridLines="None" Width="515px" PageSize="5">
        <FooterStyle BackColor="#333E46" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="DownloadLink" DataTextField="Filename"
                HeaderText="Filename" Text="Download" />
            <asp:BoundField DataField="Uploaded" HeaderText="Uploaded" />
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#333E46" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    -->
    <h3>Development Builds</h3>
    <p>If you wish to download the latest development builds, they are available 
    <a href="http://ccnet.gallio.org/Distributables">here</a>.</p>
</asp:Content>

