<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true"
    title="Installing MbUnit - MbUnit's Quick Start Guide" %>

<asp:content id="Content1" contentplaceholderid="contentPlaceHolder" runat="Server">
    <h3>
        Installing MbUnit</h3>
    <p>
        Installing MbUnit is a fairly simple process:</p>
    <ol>
        <li><p>Download the latest MbUnit release (which at the time of this writing is MbUnit
            2.4.197.exe):</p>
            <p>
                <a href="images/quickstart/qs0.gif" target="_blank"><img src="images/quickstart/small/qs0.gif" /></a>
            </p>
        </li>
        <li><p>Run the installer you've just downloaded:</p>
        <p>
                <a href="images/quickstart/qs12.gif" target="_blank"><img src="images/quickstart/small/qs12.gif" /></a>
            </p>
        </li>
        <li><p>Currently, the installer is a little bit unfriendly: it won't ask you where to put
            the files or whether you want it to integrate MbUnit with <a href="http://www.testdriven.net/">
                TestDriven.NET</a>. Hopefully by the time you are reading this there will be
            an improved version:</p>
            <p>
                <a href="images/quickstart/qs15.gif" target="_blank"><img src="images/quickstart/small/qs15.gif" /></a>
            </p>
        </li>
        <li><p>In case you are wondering, the installer will create a folder called MbUnit under
            your %Program Files Folder% folder:</p>
            <p>
                <a href="images/quickstart/qs23.gif" target="_blank"><img src="images/quickstart/small/qs23.gif" /></a>
            </p>
        </li>
        <li><p>If you open the folder, you'll see a bunch of assemblies and some executables:</p>
            <ul>
                <li>The MbUnit.Framework.dll assembly is the one you are going to work with most of
                    the time, because it contains most of the features.</li>
                <li>The MbUnit.Framework.2.0.dll assembly contains some features available only for
                    .NET 2.0.</li>
                <li>The MbUnit.Cons.exe file allows you to run your tests from the command line.</li>
                <li>The MbUnit.GUI.exe runner allows you to load and run your tests within a graphical
                    environment.</li>
                <li>The MbUnit.AddIn.dll assembly is a plugin for <a href="http://www.testdriven.net/">
                    TestDriven.NET</a>.</li>
                <li>The VSSnippets folder contains some code snippets for Visual Studio (version 2005
                     and above only).</li>
            </ul>
        <p>
                <a href="images/quickstart/qs29.gif" target="_blank"><img src="images/quickstart/small/qs29.gif" /></a>
            </p>
        </li>
    </ol>
<p>That's all. Now it's time to <a href="creating-a-test-project.aspx">create a new test project</a>.</p>
</asp:content>
