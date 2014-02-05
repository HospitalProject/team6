using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _index : System.Web.UI.Page
{
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_masterTitle = " HOME | NIPIGON DISTRICT MEMORIAL HOSPITAL";
    }
}