using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Credits : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ProcessStartInfo start = new ProcessStartInfo("svn.exe", "cat http://mb-unit.googlecode.com/svn/trunk/v3/Credits.html");
        start.RedirectStandardOutput = true;
        start.CreateNoWindow = true;
        start.UseShellExecute = false;

        using (Process process = Process.Start(start))
        {
            string output = process.StandardOutput.ReadToEnd();
            process.WaitForExit();

            output = new Regex("<body>(?<content>.*)</body>", RegexOptions.Singleline).Match(output).Groups["content"].Value;

            if (process.ExitCode != 0 || output.Length == 0)
            {
                output = "Oh no!  We were unable to retrieve Credits.html file from SVN to display here.";
            }

            creditsHtml.Text = output;
        }
    }
}
