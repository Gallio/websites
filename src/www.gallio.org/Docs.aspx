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
    <li><a href="api/html/N_MbUnit_Framework.html">MbUnit v3 Framework</a>: <a href="api/html/T_MbUnit_Framework_Assert.html">Assert</a>, <a href="api/html/T_MbUnit_Framework_AssertEx.html">AssertEx</a>, <a href="api/html/N_MbUnit_Framework_ContractVerifiers.html">Contract Verifiers</a>, <a href="api/html/T_Gallio_Framework_TestLog.html">TestLog</a>, <a href="api/html/T_Gallio_Framework_TestStep.html">TestStep</a>, <a href="api/html/T_Gallio_Framework_TestContext.html">TestContext</a>, <a href="api/html/T_Gallio_Framework_Tasks.html">Task Manager</a></li>
    <li><a href="api/html/N_Gallio_NAntTasks.html">Gallio NAnt Tasks</a></li>
    <li><a href="api/html/N_Gallio_MSBuildTasks.html">Gallio MSBuild Tasks</a></li>
    <li><a href="api/html/T_Gallio_Ambience_Ambient.html">Gallio Ambience Test Data Repository</a></li>
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

