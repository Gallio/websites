<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Title="GUI Runner - MbUnit's Quick Start Guide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceHolder" runat="Server">
    <h3>
        GUI Runner</h3>
    <ol>
        <li>
            <p>
                Open the MbUnit.GUI application located in the MbUnit install folder:</p>
            <p>
                <a href="images/quickstart/qs120.gif" target="_blank">
                    <img src="images/quickstart/small/qs120.gif" /></a>
            </p>
            <p>
                <a href="images/quickstart/qs121.gif" target="_blank">
                    <img src="images/quickstart/small/qs121.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                Go to Assemblies->Add Assemblies. Navigate to the test project’s output folder and
                search for the MyFirstMbUnitProject.dll assembly:</p>
            <p>
                <a href="images/quickstart/qs125.gif" target="_blank">
                    <img src="images/quickstart/small/qs125.gif" /></a>
            </p>
            <p>
                <a href="images/quickstart/qs130.gif" target="_blank">
                    <img src="images/quickstart/small/qs130.gif" /></a>
            </p>
            <p>
                The application will load the tests and you’ll be able to see them at the left,
                grouped by different attributes. Actually these categories correspond to attributes
                you can apply to the tests. For example, the Author attribute lets you specify the
                author of a test. Since we didn't apply it to our test class, it will appear under
                the Authors - Anonymous branch.</p>
        </li>
        <li>
            <p>
                Expand the Authors -> Anonymous branch and select the “MyFixture” node.</p>
            <p>
                <a href="images/quickstart/qs153.gif" target="_blank">
                    <img src="images/quickstart/small/qs153.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                Press the Run button, which will make the application to run anything you have selected
                (the tests under the MyFixture node in this case):</p>
            <p>
                <a href="images/quickstart/qs154.gif" target="_blank">
                    <img src="images/quickstart/small/qs154.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                MbUnit reports that two tests were run, and that one of them failed:</p>
            <p>
                <a href="images/quickstart/qs157.gif" target="_blank">
                    <img src="images/quickstart/small/qs157.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                You can see the full stack trace of the failed test by clicking on it:</p>
            <p>
                <a href="images/quickstart/qs164.gif" target="_blank">
                    <img src="images/quickstart/small/qs164.gif" /></a>
            </p>
        </li>
    </ol>
    <p>
        That is. If you haven't done it, you should see <a href="running.aspx">other ways to
            run your tests</a>.</p>
</asp:Content>
