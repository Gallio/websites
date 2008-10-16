<%@ Page Language="C#" MasterPageFile="~/CMS/CMS.master" AutoEventWireup="true" CodeFile="ManageRoles.aspx.cs" Inherits="CMS_ManageRoles" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Manage Roles</h3>
    <asp:Label ID="status" runat="server" Font-Bold="True"></asp:Label><br />
 
    <asp:GridView ID="GridView1" runat="server"
        AutoGenerateColumns="false" 
        DataSourceID="allRolesDataSource" 
        EmptyDataText="There are no matching roles in the system.">
        <Columns>
            <asp:TemplateField HeaderText="Role Name" ItemStyle-Width="200">
                <ItemTemplate>
                    <%# Container.DataItem %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton runat="server" id="linkButton1" text="Delete" commandname="delete" CommandArgument='<%# Container.DataItem %>' forecolor="black" oncommand="LinkButtonClick" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataRowStyle Font-Italic="True" />
    </asp:GridView>
    
    <br />
    
    <div>
        <table>
            <tr>
                <td>
                    <asp:TextBox ID="txtRoleName" runat="server" ValidationGroup="new" CssClass="adminlabel"/>
                    <asp:Button runat="server" id="addRole" text="Add" commandname="add" forecolor="black" oncommand="LinkButtonClick" ValidationGroup="new" CssClass="frmbutton" OnClick="linkButton2_Click" />
                    <asp:RequiredFieldValidator ID="RoleNameRequiredFieldValidator" runat="server" ControlToValidate="txtRoleName" Display="Dynamic" EnableClientScript="true" ValidationGroup="new">required</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>
    
    <asp:ObjectDataSource ID="allRolesDataSource" runat="server"
        SelectMethod="GetAllRoles"
        TypeName="System.Web.Security.Roles" OldValuesParameterFormatString="original_{0}" OnDeleting="allRolesDataSource_Deleting" >
    </asp:ObjectDataSource>
</asp:Content>

