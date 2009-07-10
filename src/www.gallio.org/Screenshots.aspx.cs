using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml;
using System.Xml.Serialization;
using Image=System.Web.UI.WebControls.Image;
using BaseImage = System.Drawing.Image;

public partial class Screenshots : System.Web.UI.Page
{
    private const string ScreenshotsFolderName = "screenshots";
    private const string ThumbnailsFolderName = "Thumbnails";
    private const string PreviewsFolderName = "Previews";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        const string screenshotsLocation = @"~/" + ScreenshotsFolderName;

        string screenshotsFolderPath = MapPath(screenshotsLocation);
        
        IList<ImageData> imageDataList = GetImageData(screenshotsFolderPath);

        ScaleImages(screenshotsFolderPath, imageDataList);

        LayoutImages(imageDataList);
    }

    private IList<ImageData> GetImageData(string screenshotsFolderPath)
    {
        XmlSerializer serializer = new XmlSerializer(typeof(ScreenshotData));
        string screenshotDataPath = Path.Combine(screenshotsFolderPath, "ScreenshotData.xml");

        ScreenshotData screenshotData;
        using (Stream stream = File.OpenRead(screenshotDataPath))
            screenshotData = (ScreenshotData) serializer.Deserialize(stream);

        return  (from @group in screenshotData.Groups
                 from screenshot in @group.Screenshots
                 select new ImageData()
                 {
                     GroupName = @group.Name,
                     FileName = screenshot.FileName,
                     AltText = screenshot.AltText,
                     Description = screenshot.Description
                 }).ToArray();
    }

    private void ScaleImages(string screenshotFolderPath, IList<ImageData> imageDataList)
    {
        string thumbnailsFolderPath = Path.Combine(screenshotFolderPath, ThumbnailsFolderName);
        string previewsFolderPath = Path.Combine(screenshotFolderPath, PreviewsFolderName);

        if (!Directory.Exists(thumbnailsFolderPath))
            Directory.CreateDirectory(thumbnailsFolderPath);

        if (!Directory.Exists(previewsFolderPath))
            Directory.CreateDirectory(previewsFolderPath);

        foreach (ImageData image in imageDataList)
        {
            string imagePath = Path.Combine(screenshotFolderPath, image.FileName);
            string thumbnailPath = Path.Combine(thumbnailsFolderPath, GetThumnailName(image.FileName));
            string previewPath = Path.Combine(previewsFolderPath, GetPreviewImageName(image.FileName));

            if (!File.Exists(thumbnailPath) || !File.Exists(previewPath))
            {
                using (BaseImage originalImage = BaseImage.FromFile(imagePath),
                    thumbnail = ImageThumnails.GenerateThumbnail(originalImage, new Size(100, 100)),
                    preview = ImageThumnails.GenerateThumbnail(originalImage, new Size(640, 480)))
                {
                    thumbnail.Save(thumbnailPath);
                    preview.Save(previewPath);
                }
            }
        }
    }

    private void LayoutImages(IList<ImageData> imageDataList)
    {
        foreach (ImageData imageData in imageDataList)
        {
            HyperLink link = new HyperLink();
            link.Attributes.Add("onclick", string.Format(CultureInfo.InvariantCulture,
                "SetImage(\"{0}/{1}/{2}\", \"{3}\", \"{4}\", \"{0}/{5}\")",
                ScreenshotsFolderName,
                PreviewsFolderName,
                JavaScriptEncode(GetPreviewImageName(imageData.FileName)),
                JavaScriptEncode(imageData.AltText),
                JavaScriptEncode(imageData.Description),
                JavaScriptEncode(imageData.FileName)));

            Image image = new Image
            {
                ImageUrl = ScreenshotsFolderName + "/" + ThumbnailsFolderName + "/" + GetThumnailName(imageData.FileName),
                Height = 100,
                Width = 100,
                AlternateText = imageData.AltText
            };

            link.Controls.Add(image);
            Form.FindControl("ContentPlaceHolder1").Controls.Add(link);
        }
    }

    private static string GetThumnailName(string fileName)
    {
        return Path.ChangeExtension(fileName, ".thumb" + Path.GetExtension(fileName));
    }

    private static string GetPreviewImageName(string fileName)
    {
        return Path.ChangeExtension(fileName, ".preview" + Path.GetExtension(fileName));
    }

    private static string JavaScriptEncode(string str)
    {
        return str.Replace("\'", @"\'").Replace("\"", @"\""");
    }

    private class ImageData
    {
        public string GroupName { get; set; }
        public string FileName { get; set; }
        public string AltText { get; set; }
        public string Description { get; set; }
    }
}
