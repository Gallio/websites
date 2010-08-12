<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Docs.aspx.cs" Inherits="Docs" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="RightSideBarContent1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Documentation</h2>
	
	<h3>Wiki</h3>
	<p>
	  The Gallio Wiki contains documentation about how to get started,
	  how stuff works and all sorts of other stuff.  Please feel free to contribute.
	</p>
    <ul>
    <li><a href="wiki"><b>Gallio Wiki</b></a></li>
	<li><a href="oldwiki/MbUnit/index.html">Old MbUnit v2 Wiki</a> (read only archive)</li>
    </ul>	
	
    <h3>API Documentation</h3>
    <p>
      The API documentation describes all types and members of the Gallio and MbUnit API.
      The same information is also available in Visual Studio via Intellisense and integrated
      F1 help.
    </p>
    <ul>
    <li><a href="api/index.aspx">Gallio and MbUnit v3 API Documentation online</a></li>
    <li><a href="api/Gallio.chm">Gallio and MbUnit v3 API Documentation in CHM format</a> (downloadable)</li>
    <li><a href="api-v2/index.aspx">MbUnit v2 API Documentation online</a></li>
    <li><a href="api-v2/MbUnit.chm">MbUnit v2 API Documentation in CHM format</a> (downloadable)</li>
    </ul>
	
    <h3>Release Notes</h3>
    <p>
      The release notes contain tons of information about particular releases including
      announcements and examples of new and noteworthy features in Gallio and MbUnit,
      some of which may not yet be documented in the Book.  Worth reading.
    </p>
    <ul>
      <li><a href="http://gallio.org/wiki/doku.php?id=release_notes">Gallio Release Notes</a></li>
    </ul>
	
    <h3>Gallio Book</h3>
    <p>
      <em>The book is currently incomplete.  If you would like to volunteer as
      a writer or editor please send a message to the <a href="http://groups.google.com/group/gallio-book">gallio-book</a> mailing list.
      </em>
    </p>	
    <p>
      The Gallio Book contains the consolidated documentation and tutorials for the Gallio
      Platform, MbUnit Framework and tools.
    </p>
    <ul>
    <li><a href="book/XHtml/index.html">Gallio Book online</a></li>
    <li><a href="book/GallioBook.chm">Gallio Book in CHM format</a> (downloadable)</li>
    <li><a href="book/GallioBook.pdf">Gallio Book in PDF format</a> (downloadable)</li>
    </ul>
</asp:Content>

