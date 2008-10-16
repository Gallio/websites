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
public class Weblog
{
    private string name;
    private string url;
    private string rss;
    private DateTime lastUpdated;

    public Weblog()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public string Name
    {
        get { return name; }
        set { name = value; }
    }

    public string Url
    {
        get { return url; }
        set { url = value; }
    }

    public string Rss
    {
        get { return rss; }
        set { rss = value; }
    }

    public DateTime LastUpdated
    {
        get { return lastUpdated; }
        set { lastUpdated = value; }
    }
}
