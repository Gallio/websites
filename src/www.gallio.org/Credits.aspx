<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Credits.aspx.cs" Inherits="Credits" Title="Untitled Page" %>
<%@ OutputCache Duration="600" VaryByParam="none" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Credits</h3>
    
    <asp:Literal ID="creditsHtml" runat="server" />

    <h3>Join us!</h3>
    <p>
    If you would like to work on the project, then please read the <a href="Development.aspx">development page</a>
    </p>
</asp:Content>

