<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="FAQ" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Frequently Asked Questions</h2>
    <p></p>
    <h3>General</h3>
    <div class="question">Is Gallio a unit test framework?</div>
    <div class="answer">No.  Gallio is a test automation platform.  It provides tools and services needed to run and manipulate tests written using a wide range of other frameworks.  Most any existing framework can be integrated given a suitable adapter plugin.</div>
    <p></p>
    <h3>Test Runners</h3>
    <div class="question">Will Gallio run from the console?</div>
    <div class="answer">Yes.  Gallio's "Echo" test runner makes it easy to run tests from the console.</div>
    <div class="question">Does Gallio have a GUI runner?</div>
    <div class="answer">Yes.  Gallio's "Icarus" test runner provides a Windows based GUI for interactively running tests.</div>
    <p></p>
    <h3>MbUnit</h3>
    <div class="question">What is Gallio's relationship to MbUnit?</div>
    <div class="answer">Gallio was originally the codename for MbUnit.  Later it became a project unto its own with the purpose of building a common reusable test harness and a rich suite of interoperable tools for use with any supported framework.
The Gallio test model enables MbUnit to work with Gallio in the same way that any other supported framework works with Gallio.</div>
    <div class="question">Is MbUnit v3 just a variation of MbUnit v2 that can run on Gallio?</div>
    <div class="answer">No.  MbUnit v3 is a complete rewrite that can do much more than v2.</div>
    <div class="question">Will Gallio still run my old MbUnit v2 tests?</div>
    <div class="answer">Yes.  Gallio includes an adapter plugin for MbUnit v2 that will run your tests without any modification.</div>
    <div class="question">I see a lot of links and references to the MbUnit development team throughout the Gallio site.  Why is that?</div>
    <div class="answer">Most of the core development team is also part of the MbUnit development team, and since Gallio started out as an internal part of MbUnit, a lot of the MbUnit infrastructure (google-code, user groups, etc.) is still in use for the project production.</div>
    <p></p>
    <h3>Contributions</h3>
    <div class="question">I have a tool that might benefit from Gallio's features.  Is it possible for my tool to use or extend Gallio?</div>
    <div class="answer">Absolutely!  That's precisely what Gallio hopes to encourage.  Please contact us to find out how to proceed.</div>
    <div class="question">I think feature XYZ would be really cool.  How do we make it happen?</div>
    <div class="answer">Awesome!  Please open up a discussion on the development mailing list or create a new feature request item in the issue tracker.</div>
    <div class="question">I have implemented a new feature for Gallio.  How can I contribute it back to the project?</div>
    <div class="answer">Please contact the commit members on the development mailing lists.  If you are submitting code, we will request that you provide a patch file (an SVN
diff) that follows the Gallio coding conventions and includes a full suite of unit tests.  We also appreciate your help in updating the Gallio documentation and promoting your new feature so that others may know to take advantage of your work.</div>
    
</asp:Content>

