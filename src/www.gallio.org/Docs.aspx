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
      a writer or editor please send a message to the <a href="http://groups.google.com/group/gallio-book">gallio-book</a> mailing list.
      </em>
    </p>
	
	<h3>Wiki</h3>
	<p>
	  The Gallio Wiki contains additional documentation and resources provided by the community.
	</p>
    <ul>
    <li><a href="wiki">Gallio Wiki</a></li>
    </ul>	
	
    <h3>API Documentation</h3>
    <p>
      The API documentation describes all types and members of the Gallio and MbUnit API.
      The same information is also available in Visual Studio via Intellisense and integrated
      F1 help.
    </p>
    <ul>
    <li><a href="api/index.aspx">Gallio API Documentation online</a></li>
    <li><a href="api/Gallio.chm">Gallio API Documentation in CHM format</a> (downloadable)</li>
    </ul>
    <h3>Release Notes</h3>
    <p>
      The release notes contain tons of information about particular releases including
      announcements and examples of new and noteworthy features in Gallio and MbUnit,
      some of which may not yet be documented in the Book.  Worth reading.
    </p>
    <ul>
      <li><a href="http://blog.bits-in-motion.com/search/label/release%20notes">Gallio Release Notes</a></li>
    </ul>
	
    <h3>Links</h3>
    <ul>
    <li><a href="api/html/N_MbUnit_Framework.htm">MbUnit v3 Framework</a>: <a href="api/html/T_MbUnit_Framework_Assert.htm">Assert</a>, <a href="api/html/T_MbUnit_Framework_AssertEx.htm">AssertEx</a>, <a href="api/html/N_MbUnit_Framework_ContractVerifiers.htm">Contract Verifiers</a>, <a href="api/html/T_Gallio_Framework_TestLog.htm">TestLog</a>, <a href="api/html/T_Gallio_Framework_TestStep.htm">TestStep</a>, <a href="api/html/T_Gallio_Framework_TestContext.htm">TestContext</a>, <a href="api/html/T_Gallio_Framework_Tasks.htm">Task Manager</a></li>
    <li><a href="api/html/N_Gallio_NAntTasks.htm">Gallio NAnt Tasks</a></li>
    <li><a href="api/html/N_Gallio_MSBuildTasks.htm">Gallio MSBuild Tasks</a></li>
    <li><a href="api/html/T_Gallio_Ambience_Ambient.htm">Gallio Ambience Test Data Repository</a></li>
    </ul>
	
    <h3>Tips</h3>
    <ul>
    <li>For documentation about the command-line test runner, type "Gallio.Echo.exe /?" at the command-line.</li>
    <li>For documentation about the PowerShell cmdlet, type "help Run-Gallio" in PowerShell.</li>
    <li>For additional API documentation about types and operations provided by Gallio, MbUnit and other components, hit F1 in Visual Studio.</li>
    <li>For information on how to integrate Gallio with CruiseControl.Net, look in the "extras/ccnet" folder within the Gallio installation directory.</li>
    <li>To enable TeamCity integration, you must specify "Gallio.TeamCityIntegration.TeamCityExtension, Gallio.TeamCityIntegration" as a test runner extension argument to the Echo, NAnt, MSBuild, or PowerShell test runners.</li>
    </ul>
</asp:Content>

