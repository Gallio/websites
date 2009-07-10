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
        const string screenshotsLocation = @"~/"+ScreenshotsFolderName;

        string absoluteFilePathToScreenshotsFolder = MapPath(screenshotsLocation);
        string absolutePathToThumnailsFolder = Path.Combine(absoluteFilePathToScreenshotsFolder, ThumbnailsFolderName);
        string absolutePathToPreviewsFolder = Path.Combine(absoluteFilePathToScreenshotsFolder, PreviewsFolderName);
        string relativePathToThumbnailsFolder = Path.Combine(screenshotsLocation, "Thumbnails");

        if (!Directory.Exists(absolutePathToThumnailsFolder))
            Directory.CreateDirectory(absolutePathToThumnailsFolder);

        if (!Directory.Exists(absolutePathToPreviewsFolder))
            Directory.CreateDirectory(absolutePathToPreviewsFolder);
        
        IList<ImageData> imageDataList = GetImageData(absoluteFilePathToScreenshotsFolder);

        DirectoryInfo directoryInfo = new DirectoryInfo(absoluteFilePathToScreenshotsFolder);
        FileInfo[] listOfFiles = directoryInfo.GetFiles("*.png");

        //1. Scale Images 
        foreach (FileInfo file in listOfFiles)
        {
            using(BaseImage originalImage = BaseImage.FromFile(file.FullName),
                thumbnail = ImageThumnails.GenerateThumbnail(originalImage, new Size(100, 100)),
                preview = ImageThumnails.GenerateThumbnail(originalImage, new Size(640, 480)))
            {
                thumbnail.Save(Path.Combine(absolutePathToThumnailsFolder, GetThumnailName(file.Name)));
                preview.Save(Path.Combine(absolutePathToPreviewsFolder, GetPreviewImageName(file.Name)));
            }
        }
//        //1. Create Groups
//        IEnumerable<string> groupNames = (from imageData in imageDataList
//                                  select imageData.GroupName).Distinct();
//
//        foreach(string groupName in groupNames)
//        {
//            Form.FindControl("ContentPlaceHolder1").Controls.Add(new Panel { ID = groupName, GroupingText = groupName }); 
//        }

        //2. Add Images to those groups
        foreach (FileInfo file in listOfFiles)
        {
            string thumbnail = Path.Combine(relativePathToThumbnailsFolder, GetThumnailName(file.Name));
            string imageName=file.Name.Replace(".png","");
            if (imageName == "DefaultImage")
                continue;

            ImageData fileData = (from imageData in imageDataList
                                  where imageData.FileName == imageName
                                  select imageData).Single();
            
            Image img=new Image
            {
                ImageUrl = thumbnail,
                Height = 100,
                Width = 100,
                AlternateText = fileData.AltText
            };

            HyperLink link = new HyperLink();
            link.Attributes.Add("onclick", string.Format(CultureInfo.InvariantCulture,
                "SetImage(\"{0}/{1}/{2}\", \"{3}\", \"{4}\", \"{0}/{5}\")",
                ScreenshotsFolderName, 
                PreviewsFolderName,
                JavaScriptEncode(GetPreviewImageName(file.Name)),
                JavaScriptEncode(fileData.AltText),
                JavaScriptEncode(fileData.Description),
                JavaScriptEncode(file.Name)));

            link.Controls.Add(img);

            //Form.FindControl(fileData.GroupName).Controls.Add(link);
            Form.FindControl("ContentPlaceHolder1").Controls.Add(link); 
            //Controls.Add(link); 
        }
    }

    private static string GetThumnailName(string fileName)
    {
        return fileName.Replace(".", ".thumb.");
    }

    private static string GetPreviewImageName(string fileName)
    {
        return fileName.Replace(".", ".preview.");
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

    private IList<ImageData> GetImageData(string absoluteFilePathToScreenshotsFolder)
    {
        XmlSerializer serializer = new XmlSerializer(typeof(ScreenshotData));
        string screenshotDataPath = Path.Combine(absoluteFilePathToScreenshotsFolder, "ScreenshotData.xml");

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
}
