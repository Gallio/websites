<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h1>Welcome to Gallio.</h1>
    <p>
        The Gallio Automation Platform is an open, extensible, and neutral system for 
        .NET that provides a common object model, runtime services and tools (such as 
        test runners) that may be leveraged by any number of test frameworks.</p>
    <p>
        The Gallio platform seeks to facilitate the creation of a rich ecosystem of 
        interoperable testing tools produced by and for the community at large so as to 
        address a far wider range of testing needs than any previous independent testing 
        framework has done before. <em>Unit tests</em>, <em>integration tests</em>, <em>
        performance tests</em>, and even <em>semi-automated test harnesses</em> should 
        all be able to leverage common facilities where appropriate. Moreover, they 
        should present consistent interfaces to the world so that they can easily be 
        integrated into the systems and processes of the enterprise.</p>
        <p>
            At present Gallio can run tests from 
            <a href="http://www.mbunit.com" class="sF">MbUnit</a> versions 2 and 3,
            <a href="http://msdn.microsoft.com/en-us/library/ms182486.aspx" class="sF">MSTest</a>,  
            <a href="http://nbehave.org/" class="sF">NBehave</a>, 
            <a href="http://www.nunit.org/index.php" class="sF">NUnit</a>, 
            <a href="http://www.codeplex.com/xunit" class="sF">xUnit.Net</a>,
            <a href="http://www.csunit.org/" class="sF">csUnit</a>, and
            <a href="http://rspec.info/" class="sF">RSpec</a>.
            &nbsp;Gallio provides tool support and integration with 
            <a href="http://www.autodesk.com/" class="sF">AutoCAD</a>,
            <a href="http://confluence.public.thoughtworks.org/display/CCNET/Welcome+to+CruiseControl.NET" class="sF">
            CCNet</a>, 
            <a href="http://msdn2.microsoft.com/en-us/library/0k6kkbsd.aspx" class="sF">
            MSBuild</a>, 
            <a href="http://nant.sourceforge.net/" class="sF">NAnt</a>, 
            <a href="http://www.ncover.com/" class="sF">NCover</a>,
            <a href="http://research.microsoft.com/Pex/" class="sF">Pex</a>,  
            <a href="http://www.microsoft.com/windowsserver2003/technologies/management/powershell/default.mspx" class="sF">
            Powershell</a>,
            <a href="http://www.jetbrains.com/resharper/index.html" class="sF">Resharper</a>, 
            <a href="http://www.testdriven.net/" class="sF">TestDriven.Net</a>, 
            <a href="http://www.typemock.com/" class="sF">TypeMock</a>, and
            <a href="http://msdn.microsoft.com/en-us/vsts2008/products/default.aspx" class="sF">Visual Studio Team System</a>.
        </p>
    <p>
        Gallio also includes its own command-line runner, Echo, and a Windows GUI, 
        Icarus. Additional runners are planned or under development. Third parties are 
        also encouraged to leverage the Gallio platform as part of their own 
        applications.</p>
    <p>
        Gallio has a rich plug-in model that enables integration with additional frameworks and tools
        of your own design.  Tests can be implemented in almost any language or format provided
        that a suitable extension has been installed.</p>
    <p> <a href="Downloads.aspx">
        <img src="images/downloadnow.png" alt="Download the latest version of gallio." style="float:left; margin-right:14px;"/></a>
        To download the latest version of Gallio, click on the link below or visit the 
        downloads page for other available downloads.
    </p>
    <p>
        We invite you to explore our website, download the latest releases, and 
        experience our vision of a unified testing platform. We hope it excites you as 
        much as it has excited us!&nbsp; If so, we invite you to join our development team or 
        see how your favorite .NET tool can leverage the Gallio Automation Platform!
    </p>
</asp:Content>
<asp:Content ContentPlaceHolderID="RightSideBarContent1" runat="server">
    <div id="rightSideBarHeader">
        <a href="rss/galliorss.xml">
        <img src="images/rss24.png" width="24px" height="24px" 
        alt="subcribe" style="vertical-align:middle; margin-right:34px;"/>
        </a>latest news
    </div>
    <div class="newsBar">
        <asp:Repeater ID="newsItems" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <strong>
                <%# DataBinder.Eval(Container.DataItem, "Title") %>
            </strong>
            <br />
            <br />
            <%# DataBinder.Eval(Container.DataItem, "Text") %>
            <br />
            <br />
            <small>
                <%# DataBinder.Eval(Container.DataItem, "Created") %>
                -
                <%# DataBinder.Eval(Container.DataItem, "Author") %>
            </small>
        </ItemTemplate>
        <SeparatorTemplate>
            <br />
            <hr />
        </SeparatorTemplate>
    </asp:Repeater>
    <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GallioDb %>"
        ProviderName="<%$ ConnectionStrings:GallioDb.ProviderName %>"
        SelectCommand="SELECT TOP 3 [Title], [Text], [Created], [Author] FROM [NewsItems] ORDER BY [Created] DESC">
    </asp:SqlDataSource>
    </div>
</asp:Content>

