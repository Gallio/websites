using System;
using System.Web;
using System.Web.UI;

public partial class CMS_NewDocPage : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HttpContext.Current.User.IsInRole("Content Editor"))
            Response.Redirect("~/CMS/Default.aspx");
    }
}