<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>
<asp:Content ID="content" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">
    <h2>Welcome to MbUnit</h2>
    <p>
    This is the home of the MbUnit Test Framework for .Net.&nbsp; MbUnit
    provides advanced unit testing support with advanced fixtures to enable developers and testers to test all aspects of their software.
    </p><p>
    There are two current versions of MbUnit, v2 and v3.
    </p><p>
    MbUnit v3 is the current version of the MbUnit Framework.  It is based on the <a href="http://www.gallio.org/">Gallio Test Automation Platform</a> which provides a stunning array of interoperable test tools.  MbUnit v3 has been rewritten from the ground up to provide a compelling suite of testing features, native support for .Net 2.0 and .Net 3.5, better documentation, and cross-platform compatibility with Mono.
    </p><p>
    MbUnit v2 is the older version of the MbUnit Framework.  It is still actively maintained for the benefit of existing users.  It is possible to use both MbUnit v2 and v3 at the same time with the Gallio test runners.  However, we recommend using mbunit v3 for all new test projects.
    </p>
    <p>
    For the latest information about Gallio and MbUnit v3, please visit the <a href="http://www.gallio.org/">Gallio</a> website.
    </p>
    <h3>
        Latest News</h3>
    <asp:Repeater ID="newsItems" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <strong>
                <%# DataBinder.Eval(Container.DataItem, "Title") %>
            </strong>
            <br />
            <%# DataBinder.Eval(Container.DataItem, "Text") %>
            <br />
            <small>Created at
                <%# DataBinder.Eval(Container.DataItem, "Created") %>
                by
                <%# DataBinder.Eval(Container.DataItem, "Author") %>
            </small>
        </ItemTemplate>
        <SeparatorTemplate>
            <br />
            <hr />
        </SeparatorTemplate>
    </asp:Repeater>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MbUnitDb %>"
        ProviderName="<%$ ConnectionStrings:MbUnitDb.ProviderName %>"
        SelectCommand="SELECT TOP 3 [Title], [Text], [Created], [Author] FROM [NewsItems] ORDER BY [Created] DESC">
    </asp:SqlDataSource>
    
</asp:Content>

