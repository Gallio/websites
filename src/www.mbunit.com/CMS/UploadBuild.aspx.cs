using System;
using System.IO;
using System.Web;
using System.Web.UI;

public partial class CMS_UploadBuild : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HttpContext.Current.User.IsInRole("Website Editor"))
            Response.Redirect("~/CMS/Default.aspx");
    }

    protected void UploadButton_Click(object sender, EventArgs e)
    {
        String savePath = Path.Combine(Request.PhysicalApplicationPath, "builds");
        if (fileUpload.HasFile && Path.GetExtension(fileUpload.FileName).Contains("exe"))
        {
            String fileName = fileUpload.FileName;

            savePath = Path.Combine(savePath, fileName);

            fileUpload.SaveAs(savePath);

            UploadStatusLabel.Text = "Your file was saved as " + fileName;
        }
        else
        {
            UploadStatusLabel.Text = "You did not specify a build to upload.";
        }
    }
}