using System;

/// <summary>
/// Summary description for DownloadItem
/// </summary>
public class DownloadItem
{
    private string fileName;

    public string Filename
    {
        get { return fileName; }
        set { fileName = value; }
    }

    private String uploaded;

    public String Uploaded
    {
        get { return uploaded; }
        set { uploaded = value; }
    }

    private string downloadLink;
    private string description;
    private string size;
    private int downloads;

    public string DownloadLink
    {
        get { return downloadLink; }
        set { downloadLink = value; }
    }

    public string Description
    {
        get { return description; }
        set { description = value; }
    }

    public string Size
    {
        get { return size; }
        set { size = value; }
    }

    public int Downloads
    {
        get { return downloads; }
        set { downloads = value; }
    }
}
