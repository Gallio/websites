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

using System.IO;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;

public partial class Downloads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
/*
        string downloadFrom = ConfigurationManager.AppSettings["downloadFrom"];

        List<DownloadItem> downloads = null;

        try
        {
            downloads = ProcessDownloads(downloadFrom);
        }
        catch (Exception ex)
        {
            displayError(ex.Message);
        }

        if (downloads != null && downloads.Count > 0)
        {
            devBuildsGrid.DataSource = downloads;
            devBuildsGrid.DataBind();
        }
        else
        {
            displayError("No releases found.");
        }
*/
    }

    private List<DownloadItem> ProcessDownloads(string downloadFrom)
    {
        string downloadDir;
        string html;
        List<DownloadItem> downloads;

        if (downloadFrom == "Google")
        {
            downloadDir = ConfigurationManager.AppSettings["googledownloadDir"];
            html = GetDownloadDirectoryOutput(downloadDir);
            if (html != string.Empty)
            {
                downloads = ProcessGoogleDownloads(downloadDir, html);
            }
            else
            {
                throw new IOException(string.Format("Could not access download links, please visit {0}", downloadDir));
            }
        }
        else
        {
            downloadDir = ConfigurationManager.AppSettings["mbunitdownloadDir"];
            html = GetDownloadDirectoryOutput(downloadDir);
            if (html != string.Empty)
            {
                downloads = ProcessBuildDownloads(downloadDir, html);
            }
            else
            {
                throw new IOException(string.Format("Could not access download links, please visit {0}", downloadDir));
            }
        }

        return downloads;
    }

    private List<DownloadItem> ProcessGoogleDownloads(string downloadDir, string html)
    {
        List<DownloadItem> downloads = new List<DownloadItem>();
        MatchCollection mclDownloads = GetDownloadsTable(html);
        if (mclDownloads.Count != 1)
        {
            string errorMessage = string.Format("Error processing details from download directory.  HTML format has changed. Please visit: {0} to download", downloadDir);
            throw new IOException(errorMessage);
        }
        else
        {
            Regex regexDownloadItem = new Regex("<tr onmouseover=(.*?)</tr>", RegexOptions.Singleline | RegexOptions.Multiline);
            MatchCollection releasesFound = regexDownloadItem.Matches(mclDownloads[0].Value);

            foreach (Match release in releasesFound)
            {
                try
                {
                    DownloadItem item = GetDownloadItemForRelease(release);

                    downloads.Add(item);
                }
                catch (Exception)
                { } //eat
            }
        }

        return downloads;
    }

    private DownloadItem GetDownloadItemForRelease(Match match)
    {
        DownloadItem item = new DownloadItem();
        Regex regex;
        MatchCollection matchCol;

        //Get link (1) and Filename (2)
        //<td class="vt id col_0">\s*<a href=\"(.*?)\" style="white-space:nowrap"\s*>\s*(.*?)\s*</a>\s*</td>
        regex = new Regex("<td class=\"vt id col_0\">\\s*<a href=\"(.*?)\" style=\"white-space:nowrap\"\\s*>\\s*(.*?)\\s*</a>\\s*</td>", RegexOptions.Singleline);
        matchCol = regex.Matches(match.Value);
        item.DownloadLink = matchCol[0].Groups[1].Value;
        item.Filename = matchCol[0].Groups[2].Value;

        //Description  (3rd)
        //<td class="vt col_1" width="100%"\s*onclick="if \(\!cancelBubble\) _go\('detail\?name=(.*?)&amp;can=2&amp;q='\)"\s*><a onclick="cancelBubble=true;" href="detail\?name=(.*?)&amp;can=2&amp;q=">(.*?)</a>\s*&nbsp;\s*<a\s*onclick="cancelBubble=true;"\s*class="label" href="list\?q=label:Featured">Featured</a>\s*</td>
        regex = new Regex("<td class=\"vt col_1\" width=\"100%\"\\s*onclick=\"if \\(\\!cancelBubble\\) _go\\('detail\\?name=(.*?)&amp;can=2&amp;q='\\)\"\\s*><a onclick=\"cancelBubble=true;\" href=\"detail\\?name=(.*?)&amp;can=2&amp;q=\">(.*?)</a>\\s*&nbsp;\\s*<a\\s*onclick=\"cancelBubble=true;\"\\s*class=\"label\" href=\"list\\?q=label:(.*?)\">(.*?)</a>\\s*</td>", RegexOptions.Singleline);
        matchCol = regex.Matches(match.Value);
        item.Description = matchCol[0].Groups[3].Value;

        //Upload Date (3rd)
        //<td class="vt col_2" onclick="if \(\!cancelBubble\) _go\('detail\?name=(.*?)&amp;can=2&amp;q='\)"\s*><a onclick="cancelBubble=true;" href="detail\?name=(.*?)&amp;can=2&amp;q=" style="white-space:nowrap">(.*?)</a></td>
        regex = new Regex("<td class=\"vt col_2\" onclick=\"if \\(\\!cancelBubble\\) _go\\('detail\\?name=(.*?)&amp;can=2&amp;q='\\)\"\\s*><a onclick=\"cancelBubble=true;\" href=\"detail\\?name=(.*?)&amp;can=2&amp;q=\" style=\"white-space:nowrap\">(.*?)</a></td>", RegexOptions.Singleline);
        matchCol = regex.Matches(match.Value);
        item.Uploaded = matchCol[0].Groups[3].Value;

        //Size
        //<td class="vt col_3" onclick="if \(\!cancelBubble\) _go\('detail\?name=(.*?)&amp;can=2&amp;q='\)"\s*><a onclick="cancelBubble=true;" href="detail\?name=(.*?)&amp;can=2&amp;q=" style="white-space:nowrap">(.*?)</a></td>
        regex = new Regex("<td class=\"vt col_3\" onclick=\"if \\(\\!cancelBubble\\) _go\\('detail\\?name=(.*?)&amp;can=2&amp;q='\\)\"\\s*><a onclick=\"cancelBubble=true;\" href=\"detail\\?name=(.*?)&amp;can=2&amp;q=\" style=\"white-space:nowrap\">(.*?)</a></td>", RegexOptions.Singleline);
        matchCol = regex.Matches(match.Value);
        item.Size = matchCol[0].Groups[3].Value;

        //Downloads
        //<td class="vt col_4" onclick="if \(\!cancelBubble\) _go\('detail\?name=(.*?)&amp;can=2&amp;q='\)"\s*><a onclick="cancelBubble=true;" href="detail\?name=(.*?)&amp;can=2&amp;q=" style="white-space:nowrap">(.*?)</a></td>
        regex = new Regex("<td class=\"vt col_4\" onclick=\"if \\(\\!cancelBubble\\) _go\\('detail\\?name=(.*?)&amp;can=2&amp;q='\\)\"\\s*><a onclick=\"cancelBubble=true;\" href=\"detail\\?name=(.*?)&amp;can=2&amp;q=\" style=\"white-space:nowrap\">(.*?)</a></td>", RegexOptions.Singleline);
        matchCol = regex.Matches(match.Value);
        item.Downloads = Convert.ToInt32(matchCol[0].Groups[3].Value);
        return item;
    }

    private void displayError(string errorMessage)
    {
        errorLabel.Text = errorMessage;
        errorLabel.Visible = true;
        devBuildsGrid.Visible = false;
    }

    private MatchCollection GetDownloadsTable(string html)
    {
        Regex regexDownloadTable = new Regex("<table cellspacing=0 cellpadding=2 border=0 class=\"results\" id=resultstable width=100%>(.*?)</table>", RegexOptions.Singleline);
        MatchCollection mclDownloads = regexDownloadTable.Matches(html);
        return mclDownloads;
    }

    private string GetDownloadDirectoryOutput(string url)
    {
        string html = string.Empty;

        try
        {
            WebClient webClient = new WebClient();
            byte[] reqHTML;
            reqHTML = webClient.DownloadData(url);
            UTF8Encoding objUTF8 = new UTF8Encoding();
            html = objUTF8.GetString(reqHTML);
        }
        catch (Exception)
        {
        }

        return html;
    }

    private List<DownloadItem> ProcessBuildDownloads(string downloadDir, string html)
    {
        //throw new NotImplementedException("Needs to be modified for new style");
        //  Process Build Directory
        //html = "<head><title>build.mutantdesign.co.uk - /builds/</title></head><body><H1>build.mutantdesign.co.uk - /builds/</H1><hr><pre><A HREF=\" / \">[To Parent Directory]</A><br><br>    Monday, November 21, 2005  8:33 PM      2251973 <A HREF=\"/builds/MbUnit-2.3.0.exe\">MbUnit-2.3.0.exe</A><br> Wednesday, November 23, 2005  9:36 AM      2251958 <A HREF=\"/builds/MbUnit-2.3.1.exe\">MbUnit-2.3.1.exe</A><br>    Monday, December 12, 2005  9:43 PM      2231225 <A HREF=\"/builds/MbUnit-2.3.11.exe\">MbUnit-2.3.11.exe</A><br> Wednesday, December 14, 2005 10:51 AM      2239306 <A HREF=\"/builds/MbUnit-2.3.13.exe\">MbUnit-2.3.13.exe</A><br>    Sunday, December 18, 2005  6:04 PM      2238969 <A HREF=\"/builds/MbUnit-2.3.15.exe\">MbUnit-2.3.15.exe</A><br>    Sunday, December 18, 2005  6:10 PM      2238976 <A HREF=\"/builds/MbUnit-2.3.16.exe\">MbUnit-2.3.16.exe</A><br>    Sunday, December 18, 2005  6:13 PM      2238980 <A HREF=\"/builds/MbUnit-2.3.17.exe\">MbUnit-2.3.17.exe</A><br>  Wednesday, January 04, 2006  1:49 AM      1294082 <A HREF=\"/builds/MbUnit-2.3.19.exe\">MbUnit-2.3.19.exe</A><br> Wednesday, November 23, 2005  9:53 AM      2251951 <A HREF=\"/builds/MbUnit-2.3.2.exe\">MbUnit-2.3.2.exe</A><br>   Thursday, January 19, 2006  2:59 PM      1294202 <A HREF=\"/builds/MbUnit-2.3.22.exe\">MbUnit-2.3.22.exe</A><br>     Friday, January 20, 2006  5:30 AM      1294179 <A HREF=\"/builds/MbUnit-2.3.23.exe\">MbUnit-2.3.23.exe</A><br></pre><hr></body>";

        Regex regRelease = new Regex("HREF\\s*=\\s*(?:\"\"(?<1>[^\"\"]*)\"\"|(?<1>\\S+))");
        Regex regDate = new Regex("<br>(.*?)<A HREF");

        MatchCollection mclRelease = regRelease.Matches(html);
        MatchCollection mclDate = regDate.Matches(html);

        List<DownloadItem> downloads = new List<DownloadItem>();

        if (mclRelease.Count > 0 && mclDate.Count > 0)
        {
            int matchCount = 0;

            foreach (Match build in mclRelease)
            {
                string releaseName = build.Value.Replace("HREF=\"", "").Trim();

                if (releaseName.Length > 1 && releaseName != "/\">[To")
                {
                    int i = releaseName.IndexOf("\">");
                    string release = releaseName.Substring(i + 2, releaseName.IndexOf("</A>") - i - 2);

                    string date = mclDate[matchCount].ToString();
                    date = date.Replace("<br>", "")
                                .Replace("<A HREF", "");
                    date = date.Trim();

                    date = date.Substring(0, date.LastIndexOf(" "))
                                 .Trim();

                    DownloadItem download = new DownloadItem();
                    download.Filename = release;
                    download.Uploaded = date;
                    download.DownloadLink = downloadDir + "/" + release;
                    downloads.Add(download);

                    matchCount++;
                }
            }
        }
        downloads.Reverse(); //So the newest is first...
        return downloads;
    }
}
