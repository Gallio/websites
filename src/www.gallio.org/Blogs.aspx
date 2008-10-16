<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Blogs.aspx.cs" Inherits="Blogs" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Recent Blog posts</h3>
    <p>Below are recent posts tagged with 'Gallio'.</p>
        <asp:Repeater ID="blogRepeater" runat="server">
            <ItemTemplate>
             <strong><a href="<%# DataBinder.Eval(Container.DataItem, "Url") %>" target="_blank"><%# DataBinder.Eval(Container.DataItem, "Title") %></a></strong><br />
             <%# DataBinder.Eval(Container.DataItem, "Description") %><br />
             <small>Created at <%# DataBinder.Eval(Container.DataItem, "Created") %> by <a href="<%# DataBinder.Eval(Container.DataItem, "Weblog.Url") %>" target="_blank"><%# DataBinder.Eval(Container.DataItem, "Weblog.Name") %></a></small>
          </ItemTemplate>
          <SeparatorTemplate>
            <br /><hr/>
          </SeparatorTemplate>
        </asp:Repeater>
    <br />
    <asp:Label ID="errorLabel" runat="server" ForeColor="#C00000" Visible="False"></asp:Label><br />
    Results provided by <a href="http://technorati.com/">Technorati</a>.
</asp:Content>

