<%@ WebHandler Language="C#" Class="ShowNewsAccordionImage" %>

 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public class ShowNewsAccordionImage : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        int _an_id = Convert.ToInt32(context.Request.QueryString["an_id"]);
        context.Response.ContentType = "image/jpeg";
        Stream strm = ShowImage(_an_id);
        byte[] buffer = new byte[4096];
        int byteSeq = strm.Read(buffer, 0, 4096);
        while (byteSeq > 0)
        {
            context.Response.OutputStream.Write(buffer, 0, byteSeq);
            byteSeq = strm.Read(buffer, 0, 4096);
        }  
    }
 
    public Stream ShowImage(int _id)
    {
        linqNewsAccordion objNewsAccordion = new linqNewsAccordion();

        return new MemoryStream(objNewsAccordion.getNewsAccordionByID(_id).First().an_img.ToArray());
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}