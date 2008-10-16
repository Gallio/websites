<%@ Page Language="C#" MasterPageFile="~/CMS/MasterPage.master" AutoEventWireup="true" CodeFile="AddRelease.aspx.cs" Inherits="CMS_AddRelease" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">
    <h3>
        Add Release</h3>
    <p>
        These releases are for main RTM/RC and are displayed on the Downloads page.&nbsp;
        For development builds, please use FTP to upload them into the builds directory
        of the site to be picked up my the site.</p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
            DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="72px" Width="410px">
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Rows="5" Text='<%# Bind("Description") %>'
                            TextMode="MultiLine" Width="321px" Height="106px"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DownloadLink" HeaderText="DownloadLink" SortExpression="DownloadLink" />
                <asp:BoundField DataField="ReleaseNotesLink" HeaderText="ReleaseNotesLink" SortExpression="ReleaseNotesLink" />
                <asp:TemplateField HeaderText="ReleaseDate" SortExpression="ReleaseDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>Please fill box: <asp:Label ID="Label3" runat="server" Text="<%# DateTime.Now.ToString() %>"></asp:Label>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:MbUnitDb %>" DeleteCommand="DELETE FROM [Release] WHERE [ID] = @original_ID AND [Title] = @original_Title AND [Description] = @original_Description AND [DownloadLink] = @original_DownloadLink AND [ReleaseNotesLink] = @original_ReleaseNotesLink AND [ReleaseDate] = @original_ReleaseDate"
            InsertCommand="INSERT INTO [Release] ([Title], [Description], [DownloadLink], [ReleaseNotesLink], [ReleaseDate]) VALUES (@Title, @Description, @DownloadLink, @ReleaseNotesLink, @ReleaseDate)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Release]"
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
    </p>
    
</asp:Content>

