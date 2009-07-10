using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

[XmlType]
public class Group
{
    [XmlAttribute]
    public string Name { get; set; }

    [XmlElement("Screenshot")]
    public Screenshot[] Screenshots { get; set; }
}
