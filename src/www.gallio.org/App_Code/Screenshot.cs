using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

[XmlType]
public class Screenshot
{
    [XmlElement("FileName")]
    public string FileName { get; set; }

    [XmlElement("AltText")]
    public string AltText { get; set; }

    [XmlElement("Description")]
    public string Description { get; set; }
}
