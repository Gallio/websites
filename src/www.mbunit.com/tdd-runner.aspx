<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Title="TestDriven.NET add-in - MbUnit's Quick Start Guide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceHolder" runat="Server">
    <h3>
        Using the TestDriven.NET add-in</h3>
    <p>
        This application was created by Jamie Cansdale, and it's probably the most popular
        way to run MbUnit (and other tests frameworks) when you are developing, because
        you don't need to leave Visual Studio.</p>
    <ol>
        <li>
            <p>
                Donwload <a href="http://www.testdriven.net/">TestDriven.NET</a> (there's a free
                version, but you'll need to register):</p>
            <p>
                <a href="images/quickstart/qs188.gif" target="_blank">
                    <img src="images/quickstart/small/qs188.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                Install the application (you will need to close Visual Studio if you have it opened):</p>
            <p>
                <a href="images/quickstart/qs204.gif" target="_blank">
                    <img src="images/quickstart/small/qs204.gif" /></a>
            </p>
            <p>
                <a href="images/quickstart/qs237.gif" target="_blank">
                    <img src="images/quickstart/small/qs237.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                Start Visual Studio and open the <a href="creating-a-test-project.aspx">test project
                    we created before</a>:</p>
           <p>
                <a href="images/quickstart/qs252.gif" target="_blank">
                    <img src="images/quickstart/small/qs252.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                Right-click the project and select "Run Test(s)":</p>
            <p>
                <a href="images/quickstart/qs263.gif" target="_blank">
                    <img src="images/quickstart/small/qs263.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                You'll see that one test succeeded and the other failed. This is actually reported
                by MbUnit to <a href="http://www.testdriven.net/">TestDriven.NET</a>, which outputs
                it to Visual Studio:</p>
            <p>
                <a href="images/quickstart/qs280.gif" target="_blank">
                    <img src="images/quickstart/small/qs280.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                You can see the stack trace of the failed test in the same output window:</p>
            <p>
                <a href="images/quickstart/qs286.gif" target="_blank">
                    <img src="images/quickstart/small/qs286.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                A great <a href="http://www.testdriven.net/">TestDriven.NET</a> feature is that
                you can run all the tests in a project, all the tests in a class or a single test.
                Let's try the latter. Right-click within any test you want to run and select "Run
                Test(s)":</p>
            <p>
                <a href="images/quickstart/qs293.gif" target="_blank">
                    <img src="images/quickstart/small/qs293.gif" /></a>
            </p>
            <p>
                <a href="images/quickstart/qs310.gif" target="_blank">
                    <img src="images/quickstart/small/qs310.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                In the output message you will also see a link to a report created by MbUnit. If
                you Control-click it Visual Studio will open it:</p>
            <p>
                <a href="images/quickstart/qs317.gif" target="_blank">
                    <img src="images/quickstart/small/qs317.gif" /></a>
            </p>
            <p>
                <a href="images/quickstart/qs319.gif" target="_blank">
                    <img src="images/quickstart/small/qs319.gif" /></a>
            </p>
            <p>
                <a href="images/quickstart/qs324.gif" target="_blank">
                    <img src="images/quickstart/small/qs324.gif" /></a>
            </p>
        </li>
    </ol>
    <p>
        That is. If you haven't done it, you should see <a href="running.aspx">other ways to
            run your tests</a>.</p>
</asp:Content>
