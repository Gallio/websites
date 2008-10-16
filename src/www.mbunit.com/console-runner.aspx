<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Title="Console Runner - MbUnit's Quick Start Guide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceHolder" runat="Server">
    <h3>
        Console Runner</h3>
    <ol>
        <li>Open a console and CD to the MbUnit install folder:
            <p>
                <a href="images/quickstart/qs172.gif" target="_blank">
                    <img src="images/quickstart/small/qs172.gif" /></a>
            </p>
        </li>
        <li>Type MbUnit.Cons.exe "YOURVISUALSTUDIOPROJECTSFOLDER\MyFirstMbUnitProject\MyFirstMbUnitProject\bin\Debug\MyFirstMbUnitProject.dll":
            <p>
                <a href="images/quickstart/qs175.gif" target="_blank">
                    <img src="images/quickstart/small/qs175.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                Press Enter. The application will run the tests:</p>
            <p>
                <a href="images/quickstart/qs180.gif" target="_blank">
                    <img src="images/quickstart/small/qs180.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                You can see that one test succeeded and the other one failed:</p>
            <p>
                <a href="images/quickstart/qs183.gif" target="_blank">
                    <img src="images/quickstart/small/qs183.gif" /></a>
            </p>
        </li>
    </ol>
    <p>
        That's all, pretty simple isn't it? The console runner also accepts arguments to
        control the way it run the tests, but you have to refer to the documentation for
        details. Now, if you haven't done it, you should see <a href="running.aspx">other ways
            to run your tests</a>.</p>
</asp:Content>
