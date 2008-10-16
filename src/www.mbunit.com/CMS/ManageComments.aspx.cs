using System;
using System.Web;
using System.Web.UI;

public partial class CMS_ManageComments : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HttpContext.Current.User.IsInRole("Maintainer"))
            Response.Redirect("~/CMS/Default.aspx");
    }
}