<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Screenshots.aspx.cs" Inherits="Screenshots" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 style="text-align:center">Gallio Screenshots</h2>

    <div align="center">
        <div>
            <a id="FullImageLink">
                <img id="FullImage" src="screenshots/DefaultImage.png"/>
            </a>
        </div>
        <div class="screenshot-label">
            <label id="FullImageDescription">Gallio can be used in numerous ways to provide apt automation solution for your company. <br/>Click on thumbnail's below for more information about the features provided by Gallio.</label>                
        </div>
    </div>
</asp:Content>

