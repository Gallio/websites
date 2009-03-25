<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RoadMap.aspx.cs" Inherits="RoadMap" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <h2>Roadmap</h2>
        <p>
            This page describes a tentative goals for upcoming Gallio releases. The information 
            presented here is of course subject to change.
        </p>
        
        <h3>Gallio v3.0.6</h3>
        <ul>
            <li>New features, improved performance, better tools integration.</li>
            <li>ReSharper v4.5 support.</li>
        </ul>
        
        <h3>Gallio v3.0.7</h3>
        <ul>
            <li>New plugin API for improved startup performance.</li>
            <li>Statistics collection API.</li>
        </ul>
        
        <h3>Gallio v3.1</h3>
        <ul>
            <li>Adopt message bus architecture.  Testing as a service.</li>
            <li>Support for non-.Net based test frameworks.</li>
            <li>Get Gallio Archimedes under way to function as the hub of a distributed test platform.</li>
        </ul>
        
</asp:Content>

