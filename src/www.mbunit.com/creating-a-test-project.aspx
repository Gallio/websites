<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Title="Creating Your First Test Project - MbUnit's Quick Start Guide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceHolder" runat="Server">
    <h3>
        Creating Your First Test Project</h3>
    <p>
        Now that you have <a href="installing.aspx">installed MbUnit</a>, you obviously
        need to create a test project (otherwise you won't have any test to run =D). So,
        start Visual Studio and follow these steps:</p>
    <ol>
        <li>
            <p>
                Create a new project named "MyFirstMbUnitProject":</p>
            <p>
                <a href="images/quickstart/qs36.gif" target="_blank">
                    <img src="images/quickstart/small/qs36.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                Go to "Add Reference..." and find the MbUnit.Framework.dll assembly:</p>
            <p>
                <a href="images/quickstart/qs45.gif" target="_blank">
                    <img src="images/quickstart/small/qs45.gif" /></a>
            </p>
            <p>
                <a href="images/quickstart/qs55.gif" target="_blank">
                    <img src="images/quickstart/small/qs55.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                Add the appropriate "using" statement:</p>
            <p>
                <a href="images/quickstart/qs63.gif" target="_blank">
                    <img src="images/quickstart/small/qs63.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                Add the "TestFixture" attribute on top of the class declaration, which tells MbUnit
                that our class contains tests. The name of the class doesn't matter, but we'll change
                it to "MyFixture":</p>
            <p>
                <a href="images/quickstart/qs80.gif" target="_blank">
                    <img src="images/quickstart/small/qs80.gif" /></a>
            </p>
        </li>
        <li>
            <p>
                You need some tests now, so use the paste the following code within the class:</p>
            <div style="font-family: Courier New; font-size: 10pt; color: black; background: white;">
                <p style="margin: 0px;">
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; [Test]</p>
                <p style="margin: 0px;">
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span style="color: blue;">public</span> <span
                        style="color: blue;">void</span> MyFirstTest()</p>
                <p style="margin: 0px;">
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; {</p>
                <p style="margin: 0px;">
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span style="color: blue;">
                        int</span> x = 5;</p>
                <p style="margin: 0px;">
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Assert.AreEqual(x * x,
                    25);</p>
                <p style="margin: 0px;">
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }</p>
                <p style="margin: 0px;">
                    &nbsp;</p>
                <p style="margin: 0px;">
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; [Test]</p>
                <p style="margin: 0px;">
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span style="color: blue;">public</span> <span
                        style="color: blue;">void</span> MyFirstFailingTest()</p>
                <p style="margin: 0px;">
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; {</p>
                <p style="margin: 0px;">
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span style="color: blue;">
                        int</span> x = 3;</p>
                <p style="margin: 0px;">
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Assert.AreEqual(x * x,
                    27);</p>
                <p style="margin: 0px;">
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }</p>
            </div>
            <p>
                Take a minute to see what's going on here. We have 2 public void methods. From the
                names you can expect the second one to fail. Note the Assert.AreEqual calls. You
                use assertions to tell MbUnit what do you expect to happen when you run your tests.
                If those assertions fail then your tests will fail too. In this example we are not
                testing any logic. In the real world, your test project will reference the code
                (assembly) that you want to test.</p>
        </li>
        <li>
            <p>
                Now build your solution:</p>
            <p>
                <a href="images/quickstart/qs105.gif" target="_blank">
                    <img src="images/quickstart/small/qs105.gif" /></a>
            </p>
            <p>
                If everything goes well <a href="running.aspx">it's time to run your tests</a>.</p>
        </li>
    </ol>
</asp:Content>
