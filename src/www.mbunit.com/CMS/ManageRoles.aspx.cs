using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CMS_ManageRoles : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!HttpContext.Current.User.IsInRole("Administrator"))
            Response.Redirect("~/CMS/Default.aspx");
    }

    protected void linkButton2_Click(object sender, EventArgs e)
    {
        string roleName = txtRoleName.Text.Trim();
        if (roleName == "")
            return;

        Roles.CreateRole(roleName);
        status.Text = "Role created";
    }

    public void LinkButtonClick(object sender, CommandEventArgs e)
    {
        if (e.CommandName.Equals("delete"))
        {
            string roleName = (string) e.CommandArgument;

            Roles.DeleteRole(roleName);

            status.Text = "Role deleted";
        }
    }
    protected void allRolesDataSource_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.Cancel = true;
    }
}