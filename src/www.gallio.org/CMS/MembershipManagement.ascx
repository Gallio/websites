<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MembershipManagement.ascx.cs"
    Inherits="CMS_MembershipManagement" %>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
    DataSourceID="SqlDataSource1" Height="138px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
    PageSize="5" Width="447px">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GallioDb %>"
    SelectCommand="SELECT dbo.aspnet_Users.UserName, dbo.aspnet_Membership.Email, dbo.aspnet_Membership.LastLoginDate FROM dbo.aspnet_Membership INNER JOIN dbo.aspnet_Users ON dbo.aspnet_Membership.UserId = dbo.aspnet_Users.UserId">
</asp:SqlDataSource>
<hr />
<asp:Label ID="status" runat="server" Font-Bold="True"></asp:Label><br />
<strong>Details</strong>
<asp:DetailsView ID="memberDetails" runat="server" Height="50px" Width="448px">
</asp:DetailsView>
<br />
<strong>User In</strong> <strong>Roles</strong><br />
<asp:Repeater ID="CheckBoxRepeater" runat="server">
    <ItemTemplate>
        <asp:CheckBox ID="checkBox1" runat="server" Checked='<%# IsUserInRole(Container.DataItem.ToString())%>'
            Text='<%# Container.DataItem.ToString()%>' OnCheckedChanged="UserRoleChanged" />
        <br />
    </ItemTemplate>
</asp:Repeater>
<br />
<br />
<br />
<strong>Management</strong><br />
<asp:LinkButton ID="disableUser" runat="server" OnClick="disableUser_Click">Disable User</asp:LinkButton>
<asp:LinkButton ID="enableUser" runat="server" OnClick="EnableUser_Click">Enable User</asp:LinkButton>
