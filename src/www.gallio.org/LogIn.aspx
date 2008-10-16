<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="LogIn" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3 style="text-align: left">
        Login</h3>
    For gallio.org authenciated users only.<br />
    <br />
       <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/CMS/Default.aspx" />
</asp:Content>

