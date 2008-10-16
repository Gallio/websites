<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Docs.aspx.cs" Inherits="Docs" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="RightSideBarContent1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Documentation</h2>
    <h3>Gallio Book</h3>
    <p>
      The Gallio Book contains the consolidated documentation and tutorials for the Gallio
      Platform, MbUnit Framework and tools.
    </p>
    <ul>
    <li><a href="book/XHtml/index.html">Gallio Book online</a></li>
    <li><a href="book/GallioBook.chm">Gallio Book in CHM format</a> (downloadable)</li>
    <li><a href="book/GallioBook.pdf">Gallio Book in PDF format</a> (downloadable)</li>
    </ul>
    <p>
      <em>The book is currently a work in progress.  If you would like to volunteer as
      a writer or editor please send a message to the <a href="http://groups.google.com/group/gallio-dev">gallio-dev</a> mailing list.
      </em>
    </p>
    <h3>API Documentation</h3>
    <p>
      The API documentation describes all types and members of the Gallio and MbUnit API.
      The same information is also availble in Visual Studio via Intellisense and integrated
      F1 help.
    </p>
    <ul>
    <li><a href="api/html/index.html">Gallio API Documentation online</a></li>
    <li><a href="api/Gallio.chm">Gallio API Documentation in CHM format</a> (downloadable)</li>
    </ul>
</asp:Content>

