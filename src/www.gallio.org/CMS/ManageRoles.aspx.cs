﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class CMS_ManageRoles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HttpContext.Current.User.IsInRole("Administrator"))
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
            string roleName = (string)e.CommandArgument;

            Roles.DeleteRole(roleName);

            status.Text = "Role deleted";
        }
    }
    protected void allRolesDataSource_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.Cancel = true;
    }
}
