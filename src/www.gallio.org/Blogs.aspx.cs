using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml;

public partial class Blogs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string technoratiAPI = ConfigurationManager.AppSettings["technoratiAPI"];
        string technoratiTerm = ConfigurationManager.AppSettings["technoratiTerm"];

        List<Blog> taggedPosts = GetTechnoratiPosts(technoratiAPI, technoratiTerm);

        if (taggedPosts.Count > 0)
        {
            blogRepeater.DataSource = taggedPosts;
            blogRepeater.DataBind();
        }
        else
        {
            DisplayError("No blog posts returned");
        }
    }

    private List<Blog> GetTechnoratiPosts(string technoratiAPI, string technoratiTerm)
    {
        int limit = 40;
        string url = string.Format("http://api.technorati.com/tag?key={0}&tag={1}&limit={2}", technoratiAPI, technoratiTerm, limit);
        List<Blog> taggedPosts = new List<Blog>();
        Dictionary<string, Weblog> webLogs = new Dictionary<string, Weblog>();

        try
        {
            XmlDocument xmlResultsSet = new XmlDocument();
            xmlResultsSet.Load(new XmlTextReader(url));
            XmlNodeList xmlResponse = xmlResultsSet.SelectNodes("/tapi/document/item");

            foreach (XmlNode post in xmlResponse)
            {
                try
                {
                    Blog blog = new Blog();
                    Weblog webLog;
                    blog.Title = post["title"].InnerText;
                    blog.Description = post["excerpt"].InnerText;
                    blog.Created = Convert.ToDateTime(post["created"].InnerText);
                    blog.Url = post["permalink"].InnerText;

                    if (!webLogs.ContainsKey(post["weblog"]["url"].InnerText))
                    {
                        webLog = new Weblog();
                        webLog.Name = post["weblog"]["name"].InnerText;
                        webLog.Url = post["weblog"]["url"].InnerText;
                        webLog.Rss = post["weblog"]["rssurl"].InnerText;
                        webLog.LastUpdated = Convert.ToDateTime(post["weblog"]["lastupdate"].InnerText);

                        if (BloggerIsNotASoftwareBlogger(webLog.Name))
                            continue;

                        webLogs.Add(webLog.Url, webLog);
                    }
                    else
                    {
                        webLog = webLogs[post["weblog"]["url"].InnerText];
                    }

                    blog.Weblog = webLog;

                    if (!PostAlreadyProcessed(blog, taggedPosts))
                        taggedPosts.Add(blog);
                }
                catch (Exception)
                { } //eat, only one failed to process...
            }
        }
        catch
        {
            DisplayError("Could not connect to Technorati");
        }

        return taggedPosts;
    }

    private bool PostAlreadyProcessed(Blog blog, List<Blog> processedBlogs)
    {
        foreach (Blog foundBlog in processedBlogs)
        {
            if (foundBlog.Title.Equals(blog.Title) && foundBlog.Created.Equals(blog.Created))
                return true;
        }
        return false;
    }

    private bool BloggerIsNotASoftwareBlogger(string weblog)
    {
        // Yeah I know I've hard-coded these...
        string[] bloggers = { "Michael Halcomb", "Quelveneto" };
        foreach (string blogger in bloggers)
        {
            if (weblog.Contains(blogger))
                return true;
        }
        return false;
    }

    private void DisplayError(string message)
    {
        errorLabel.Text += message + "<br/>";
        errorLabel.Visible = true;
        blogRepeater.Visible = false;
    }
}
