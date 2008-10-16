<%@ Page Language="C#" MasterPageFile="~/CMS/CMS.master" AutoEventWireup="true" CodeFile="UploadBuild.aspx.cs" Inherits="CMS_UploadBuild" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h3>
        Upload Development Build</h3>
    <p>
        Upload a build<br />
        <asp:FileUpload ID="fileUpload" runat="server" /></p>
        
        <asp:Button id="UploadButton" 
           Text="Upload file"
           OnClick="UploadButton_Click"
           runat="server">
       </asp:Button>    
       
       <hr />
       
       <asp:Label id="UploadStatusLabel"
           runat="server">
       </asp:Label>  
</asp:Content>

