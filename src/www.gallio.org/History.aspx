<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="History" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>How a great Unit Testing framework begat Gallio.</h2>
    <p>In January 2004 <span id="intelliTXT">Marc Clifton</span>, a frequent contributor 
        at <a href="http://www.codeproject.com">Codeproject</a>, wrote a series of articles 
        that sought to expand the unit testing discussion.&nbsp; Among other things, Marc 
        proposed a formalization of various 
        <a href="http://www.codeproject.com/KB/architecture/autp5.aspx">test patterns</a> 
        beyond basic TDD.&nbsp; Marc then took his ideas into code as AUT 
        (Advanced Unit Testing), an independed project that you can find at Codeproject.</p>
    <p>Two months later, Jonathan &quot;Peli&quot; de Halleux took a look at Marc&#39;s proposals and 
        created <a href="http://www.codeproject.com/KB/architecture/gunit.aspx">gUnit</a> 
        (which was later renamed to MbUnit) while recovering from surgery in a hospital.&nbsp; 
        In fact, Peli wrote most of MbUnit while still in the hospital.</p>
    <p>MbUnit had some new ideas and concepts and it caught the attention of 
       <a href="http://weblogs.asp.net/NUnitAddin/">Jamie 
        Cansdale</a> who while on a trip to Brussels hooked up with Peli to work on an 
        add-on for <a href="http://www.testdriven.net/">TD.net</a>. TD.net started life as a NUnit project and so this made 
        MbUnit the next framework after NUnit to be supported by TD.net, as such since 
        the very early days of this great tool there has been MbUnit support.</p>
    <p>In 2005 Peli made MbUnit opensource and continued working on the framework while 
        finishing his PhD. Shortly after completing his PhD he accepted a job with 
        Microsoft as a SDE\T on the CLR team.&nbsp; Unable to carry on MbUnit, he handed 
        it over to Jamie Cansdale as short time caretaker. Peli blogged about needing 
        someone to take on MbUnit and shortly after Andy Stopford as a long time MbUnit 
        user read this and stepped up.</p>
    <p>Since then MbUnit has grown as a framework and project, with two major releases 
        and triple the downloads per release it has firmly rooted itself in main stream 
        Microsoft .net culture as a viable unit test framework next to NUnit.</p>
    <p>In the autumn of 2007, MbUnit v3 - a ground up rewrite of MbUnit, started.&nbsp; In 
        one of those funny turn of events, v3 was to be code named &quot;Gallileo&quot; 
        but due to a typo became &quot;Gallio&quot;.&nbsp; The name stuck and development continued on 
        MbUnit v3, code name: Gallio.</p>
    <p>With MbUnit V3 developmement well under way, long time MbUnit core member 
        <a href="http://blog.bits-in-motion.com/">Jeff Brown</a> attended the <a href="http://altdotnet.org/">Alt.Net</a>
         conference in Austin, Texas.&nbsp; Following 
        discussions with other programmers at the conference, Jeff made the case to the 
        MbUnit team that there was value to the community at large in isolating the test <i>runner</i> 
        capabilities of the system to create a neutral platform upon which MbUnit could 
        then be hosted as one of many supported frameworks.&nbsp;  
        Other open-source and commercial projects would be able to leverage the platform's services to 
        create rich, interoperable and extensible testing solutions, thereby adding great value to the community.</p>
    <p>After much discussion, the decision was made to separate the test runner from 
        MbUnit and Gallio the Automation Platform was born.</p>
    <p>Going forward the Gallio Project seeks to become visible to other open source 
        projects so that the capabilities of the platform can bring unity and value to 
        the many projects in the testing space.</p>
</asp:Content>

