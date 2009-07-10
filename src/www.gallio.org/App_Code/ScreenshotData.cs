using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

[XmlRoot("ScreenshotData")]
[XmlType]
public class ScreenshotData
{
    [XmlElement("Group")]
    public Group[] Groups { get; set; }
}
