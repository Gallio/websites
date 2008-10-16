<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RoadMap.aspx.cs" Inherits="RoadMap" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <h2>Roadmap</h2>
            A tentative roadmap for Gallio and MbUnit v3.</div>
        <p>
            This page describes a tendative roadmap for Gallio releases. The information 
            presented here is of course subject to change.
        </p>
        <p>
            Because MbUnit v3 is Gallio&#39;s first consumer, it is also represented here in 
            this roadmap. At least for now, Gallio and MbUnit v3 releases will therefore 
            coincide. This situation will change as more third party members are brought 
            on-board (at which point we shall update the roadmap to reflect their 
            contributions).
        </p>
        <h3>
            The Road from Alpha to Final</h3>
        <p>
            The Alpha releases represent an incremental built-out of the core Gallio 
            functions and features. Since Gallio is intended to be an open platform, our 
            intention is to get several third party contributors on board during the Alpha 
            phase to provide guidance and feedback related to these core services.
        </p>
        <h3>
            Alpha 1: Dogfood</h3>
        <p>
            <strong>Gallio Goals</strong>
        </p>
        <ul>
            <li>Achieve dogfood quality. </li>
            <li>Setup all necessary development infrastructure. </li>
            <li>First draft of the test object model. </li>
            <li>First draft of the test harness. </li>
            <li>First draft of plug-in extensibility architecture. </li>
            <li>Support rich execution logs. </li>
            <li>Standalone and VS 2005 integrated help documentation. </li>
            <li>Generate HTML, XHTML, XML and plain text reports. </li>
            <li>Deliver Gallio.Echo command line runner. </li>
            <li>Deliver Gallio.MSBuildTasks build tasks. </li>
            <li>Deliver Gallio.NAntTasks build tasks. </li>
            <li>Deliver Gallio.TDNetRunner extension for TestDriven.Net. </li>
            <li>Produce and distribute an installer. </li>
            <li>Write public design documentation. </li>
            <li>Begin the Gallio community process. </li>
            <li>Include plugins for MbUnit v3, MbUnit v2, NUnit, and xUnit.Net. </li>
        </ul>
        <p>
        </p>
        <p>
            <strong>MbUnit v3 Goals</strong>
        </p>
        <ul>
            <li>Achieve dogfood quality. </li>
            <li>Deliver basic MbUnit v3 stories. </li>
            <li>Recycle MbUnit v2.4 Assert classes mostly unchanged. </li>
            <li>Supported fixture types: TestFixture. </li>
            <li>Supported test types: Test, RowTest. </li>
            <li>Mostly proof-of-concept. </li>
        </ul>
        <p>
        </p>
        <p>
            <strong>Community Goals</strong>
        </p>
        <ul>
            <li>Get more people involved. </li>
        </ul>
        <p>
        </p>
        <h3>
            Alpha 2: Iterate</h3>
        <p>
            <strong>Gallio Goals</strong>
        </p>
        <ul>
            <li>Review the design thus far. </li>
            <li>Deliver Gallio.Icarus GUI test runner, first release. </li>
            <li>Deliver Gallio.ReSharperRunner extension for ReSharper. </li>
            <li>Deliver Gallio commandlet for use in PowerShell. </li>
            <li>Support tests written using DLR-based languages. eg. Can load tests declared in 
                files in addition to those declared in assemblies. </li>
            <li>Define plug-in extension points for the loader. </li>
            <li>Define a common test project file format that can be produced by the GUI and 
                used by all other runners. </li>
            <li>Enhance the quality of reports. eg. Add rich DHTML based reporting features.
            </li>
            <li>Create a new Gallio.Constraints library that defines predicates that can be used 
                in constraint-based assertions. This library may be used independently from the 
                rest of Gallio. </li>
            <li>Flesh out the data conversion and formatting services. </li>
            <li>Support passing in test parameters from the command-line. </li>
        </ul>
        <p>
        </p>
        <p>
            <strong>MbUnit v3 Goals</strong>
        </p>
        <ul>
            <li>Rewrite Assert classes to use common constraints. </li>
            <li>Completely redesign the XmlAssert feature using common constraints. </li>
            <li>Provide constraint-based assertions. </li>
            <li>Simplify the extensibility story. </li>
            <li>Provide data-driven testing features with common data sources such as in-line, 
                XML, CSV and SQL. </li>
        </ul>
        <p>
        </p>
        <p>
            <strong>Community Goals</strong>
        </p>
        <ul>
            <li>Get more people involved. </li>
            <li>Support NBehave. </li>
            <li>Try to get NUnit v3 on board with Gallio. </li>
                                <li>Build a Gallio community web site:
                <ul>
                    <li>Documentation. </li>
                    <li>Articles. </li>
                    <li>Blog links. </li>
                    <li>Community project showcase. </li>
                    <li>Download links. </li>
                    <li>Continuous integration build status. </li>
                    <li>etc...</li>
                </ul>
                                </li>
        </ul>
        <p>
        </p>
        <h3>
            Alpha 3: Refine</h3>
        <p>
            <strong>Gallio Goals</strong>
        </p>
        <ul>
            <li>Build multiple editions to support .Net 2.0, 3.0 and 3.5. </li>
            <li>Provide constraints based on .Net 3.5 lambdas and expression trees. </li>
            <li>Create a new Gallio.Generator library for test data generation. </li>
            <li>Performance monitoring features. </li>
            <li>Gallio.Icarus plug-in model for the GUI. </li>
            <li>MSTest plugin. </li>
        </ul>
        <p>
        </p>
        <p>
            <strong>MbUnit v3 Goals</strong>
        </p>
        <ul>
            <li>Mixins. </li>
            <li>Multi-agent tests. </li>
            <li>Model-based tests. </li>
            <li>Advanced data-driven test features. </li>
            <li>Solidify migration path for MbUnit v2.4 users. Ensure all features ported or 
                omitted and documented. </li>
            <li>Lightweight bolt-on integration features:
                <ul>
                    <li>WatiN (mixin to setup/teardown IE browser and capture screenshots and log 
                        output) </li>
                    <li>Selenium (mixin to setup/teardown Selenium state) </li>
                    <li>Rhino.Mocks (mixin to setup/teardown MockRepository and auto-VerifyAll())
                    </li>
                    <li>ASP.Net hosted test environment. </li>
                    <li>Database testing libraries. </li>
                    <li>etc... </li>
                </ul>
            </li>
        </ul>
        <p>
        </p>
        <p>
            <strong>Community Goals</strong>
        </p>
        <ul>
            <li>Get more people involved. </li>
            <li>Provide a migration path for ZaneBug users, if applicable. </li>
        </ul>
        <p>
        </p>
        <h3>
            Beta: Go! Go! Go!</h3>
        <p>
            <strong>Universal Goals</strong>
        </p>
        <ul>
            <li>API freeze. </li>
            <li>Increate test coverage. </li>
            <li>Bug bash. </li>
            <li>Apply code analysis tools. </li>
            <li>Implement at most a few minor features. </li>
            <li>Documentation review. </li>
            <li>Spit &amp; polish. </li>
        </ul>
        <p>
        </p>
        <p>
            <strong>Community Goals</strong>
        </p>
        <ul>
            <li>Solicit feedback and respond. </li>
            <li>Engineer a solid beta release to coincide with a significant developer 
                conference or other event. </li>
        </ul>
        <p>
        </p>
        <h2>
            Final</h2>
        <p>
            The current plan for Final release is to produce RC1, RC2 and RTM iterations 
            over a span of a few weeks. By this time, the Gallio platform itself should be 
            quite stable. While new features will be added, they will largely be low-risk 
            ones at the periphery. Potentially destabilizing changes will be set aside in a 
            fresh branch for the next release.
        </p>
        <p>
            <strong>Gallio Goals</strong>
        </p>
        <ul>
            <li>Mono compatibility. </li>
            <li>Implement new low-risk features. </li>
            <li>Review installer to enable incremental distribution of Gallio components and 
                plug-ins. That is, distribution of Gallio plug-ins (such as MbUnit) should 
                become decoupled so that they may evolve at different rates. </li>
            <li>Improve tools integration where possible. </li>
        </ul>
        <p>
        </p>
        <p>
            <strong>MbUnit Goals</strong>
        </p>
        <ul>
            <li>More advanced features. </li>
            <li>Make changes based on beta feedback. </li>
            <li>Produce a solid MbUnit v2.4 to v3 migration guide. </li>
            <li>Get started on an MbUnit v3 book. </li>
        </ul>
        <strong>Community Goals</strong>
        <ul>
            <li>Provide a Gallio bundle including popular community contributions. </li>
            <li>Write more tutorials, samples, and other support materials. </li>
            <li>Engage in promotional activities. </li>
        </ul>
        <p>
        </p>
        <h1>
            Beyond Final</h1>
        <p>
            It&#39;s impossible to say with any certainty what will happen after the Final 
            release. Still...
        </p>
        <ul>
            <li>We will continue to grow the community. </li>
            <li>We will continue to build useful and innovative features for a wide range of 
                needs. </li>
            <li>We will continue to pursue excellence. </li>
        </ul>

</asp:Content>

