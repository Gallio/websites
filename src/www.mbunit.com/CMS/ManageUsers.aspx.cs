using System;
using System.Web;
using System.Web.UI;

public partial class CMS_ManageUsers : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HttpContext.Current.User.IsInRole("Administrator"))
            Response.Redirect("~/CMS/Default.aspx");
    }
}