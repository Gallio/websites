<%@ Page Language="C#" MasterPageFile="~/CMS/CMS.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="CMS_ManageUsers" Title="Untitled Page" %>

<%@ Register Src="MembershipManagement.ascx" TagName="MembershipManagement" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Membership Management</h3>
    <p>
        <uc1:MembershipManagement ID="MembershipManagement1" runat="server" />
    </p>
    <hr />
    <p>
        <strong>Create New User</strong></p>
    <p>
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
        &nbsp;</p>
</asp:Content>

