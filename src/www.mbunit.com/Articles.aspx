<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Articles.aspx.cs" Inherits="Articles" Title="MbUnit Articles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">
    <h3>
        Articles</h3>
    <p>
        Below is a list of articles relating to the MbUnit framework and TDD in general.</p>
    <asp:Repeater ID="articlesRepeater" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
      <ItemTemplate>
         <strong><a href="<%# DataBinder.Eval(Container.DataItem, "Link") %>" target="_blank"><%# DataBinder.Eval(Container.DataItem, "Title") %></a></strong><br />
         <%# DataBinder.Eval(Container.DataItem, "Text") %><br />
         <small>Created at <%# DataBinder.Eval(Container.DataItem, "Created") %> by <%# DataBinder.Eval(Container.DataItem, "Author") %></small>
      </ItemTemplate>
      <SeparatorTemplate>
        <br /><hr/>
      </SeparatorTemplate>
    </ItemTemplate>
    </asp:Repeater>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MbUnitDb %>"
        ProviderName="<%$ ConnectionStrings:MbUnitDb.ProviderName %>"
        SelectCommand="SELECT Title, Text, Link, Created, Author FROM Articles ORDER BY [Created] DESC">
    </asp:SqlDataSource>
    <p>
        If you have wrote an article, then please let us know via the <a href="http://groups.google.com/group/mbunituser">mailing list</a>.</p>
</asp:Content>

