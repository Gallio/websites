<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="SiteLogin" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">
    <h3 style="text-align: left">
        Login</h3>
    For authenciated users only.<br />
    <br />
       <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/CMS/Default.aspx" />
</asp:Content>

