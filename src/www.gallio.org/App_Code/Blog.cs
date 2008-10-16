using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for Weblog
/// </summary>
public class Blog
{
    private string title;
    private DateTime created;
    private string description;
    private string url;
    private Weblog weblog;

    public Blog()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public string Title
    {
        get { return title; }
        set { title = value; }
    }

    public DateTime Created
    {
        get { return created; }
        set { created = value; }
    }

    public string Description
    {
        get { return description; }
        set { description = value; }
    }

    public string Url
    {
        get { return url; }
        set { url = value; }
    }

    public Weblog Weblog
    {
        get { return weblog; }
        set { weblog = value; }
    }
}
