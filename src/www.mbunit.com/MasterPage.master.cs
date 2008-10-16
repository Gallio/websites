using System;
using System.Web.Security;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lnkLogout_Click1(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("~/default.aspx", false);
    }
}
