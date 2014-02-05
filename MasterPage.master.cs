using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private string _title = "Welcome To Nipigon District Memorial Hospital";
    public string pp_masterTitle
    {
        get { return _title; }
        set { _title = value; }
    }
}
