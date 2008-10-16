<%@ Page Language="C#" MasterPageFile="~/CMS/MasterPage.master" AutoEventWireup="true" CodeFile="AddArticle.aspx.cs" Inherits="CMS_AddArticle" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">
    <h2>
        Add Article</h2>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateInsertButton="True"
        AutoGenerateRows="False" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="109px" Width="371px">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="ID" />
            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Title") %>' Width="221px"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Title") %>' Width="221px"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Text" SortExpression="Text">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Rows="5" Text='<%# Bind("Text") %>' TextMode="MultiLine"
                        Width="221px"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Rows="5" Text='<%# Bind("Text") %>' TextMode="MultiLine"
                        Width="351px" Height="138px"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Text") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Link" HeaderText="Link" SortExpression="Link" />
            <asp:TemplateField HeaderText="Created" SortExpression="Created">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Created") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Created") %>'></asp:TextBox>Please fill box: <asp:Label ID="Label3" runat="server" Text="<%# DateTime.Now.ToString() %>"></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Created") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:MbUnitDb %>" DeleteCommand="DELETE FROM [Articles] WHERE [ID] = @original_ID AND [Title] = @original_Title AND [Text] = @original_Text AND [Link] = @original_Link AND [Created] = @original_Created AND [Author] = @original_Author"
        InsertCommand="INSERT INTO [Articles] ([Title], [Text], [Link], [Created], [Author]) VALUES (@Title, @Text, @Link, @Created, @Author)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Articles]"
        UpdateCommand="UPDATE [Articles] SET [Title] = @Title, [Text] = @Text, [Link] = @Link, [Created] = @Created, [Author] = @Author WHERE [ID] = @original_ID AND [Title] = @original_Title AND [Text] = @original_Text AND [Link] = @original_Link AND [Created] = @original_Created AND [Author] = @original_Author">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_Text" Type="String" />
            <asp:Parameter Name="original_Link" Type="String" />
            <asp:Parameter Name="original_Created" Type="DateTime" />
            <asp:Parameter Name="original_Author" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Text" Type="String" />
            <asp:Parameter Name="Link" Type="String" />
            <asp:Parameter Name="Created" Type="DateTime" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_Text" Type="String" />
            <asp:Parameter Name="original_Link" Type="String" />
            <asp:Parameter Name="original_Created" Type="DateTime" />
            <asp:Parameter Name="original_Author" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Text" Type="String" />
            <asp:Parameter Name="Link" Type="String" />
            <asp:Parameter Name="Created" Type="DateTime" />
            <asp:Parameter Name="Author" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

