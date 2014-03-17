using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing; // this is for styling the link button of main buttons: Complaints, Comments, and Appreciations


public partial class feedback : System.Web.UI.Page
{
    protected void Page_LoadComplete(object sender, EventArgs e)// change the title of master page
    {
        Master.pp_masterTitle = " FEEDBACK | NIPIGON DISTRICT MEMORIAL HOSPITAL";
    }

    protected void Page_Load(object sender, EventArgs e)// set the defualt for MultiView Control/ Set the subrebind
    {
        if (!Page.IsPostBack)
        {
            SetDefaultView();
            _subRebind();
        }

    }

    private void SetDefaultView() // set the index 0 for defult display
    {
        MultiView.ActiveViewIndex = 1;
    }

    protected void btnComplains_Click(object sender, EventArgs e) //set the active view for first link by click the btnProblems
    {
        MultiView.ActiveViewIndex = 0;
        btn_complains.BackColor = ColorTranslator.FromHtml("#82C1A9");// change the background color of top button fo Multiview
        btn_comments.BackColor = ColorTranslator.FromHtml("#E2E2E2");
        btn_appreciations.BackColor = ColorTranslator.FromHtml("#E2E2E2");
        lbl_txtMsg.Text = string.Empty;
    }
    protected void btnComments_Click(object sender, EventArgs e)//set the active view for first link by click the btnComments
    {
        MultiView.ActiveViewIndex = 1;
        btn_comments.BackColor = ColorTranslator.FromHtml("#82C1A9");
        btn_complains.BackColor = ColorTranslator.FromHtml("#E2E2E2");
        btn_appreciations.BackColor = ColorTranslator.FromHtml("#E2E2E2");
        lbl_txtMsg.Text = string.Empty;
    }
    protected void btnAppreciations_Click(object sender, EventArgs e)//set the active view for first link by click the btnComplains
    {
        MultiView.ActiveViewIndex = 2;
        btn_appreciations.BackColor = ColorTranslator.FromHtml("#82C1A9");
        btn_complains.BackColor = ColorTranslator.FromHtml("#E2E2E2");
        btn_comments.BackColor = ColorTranslator.FromHtml("#E2E2E2");
        lbl_txtMsg.Text = string.Empty;
    }

    linqFeedback objLinq = new linqFeedback(); // make new instance from feedback class

    private void _subRebind()// Define the function for reset or cancel
    {
        txtView1_fname.Text = string.Empty;
        txtView1_email.Text = string.Empty;
        txtView1_title.Text = string.Empty;
        txtView1_content.Text = string.Empty;
        txtView2_fname.Text = string.Empty;
        txtView2_email.Text = string.Empty;
        txtView2_title.Text = string.Empty;
        txtView2_content.Text = string.Empty;
        txtView3_fname.Text = string.Empty;
        txtView3_email.Text = string.Empty;
        txtView3_title.Text = string.Empty;
        txtView3_content.Text = string.Empty;
    }
    // Define the message based on output  
    private void _txtMsg(bool flag)
    {
        if (flag)
        {
            lbl_txtMsg.Text = "Thank you. Your feedback has been sent successfuly, and we will replay you in 2 to 3 business days.";
        }
        else
        {
            lbl_txtMsg.Text = "Sorry, try again";
        }
    }

    protected void sendData(object sender, CommandEventArgs e)
    {
        switch (e.CommandName) // Define the case of Insert the database
        {
            case "InsertComp":
                _txtMsg(objLinq.commitInsert(txtView1_fname.Text, txtView1_email.Text, ddlView1_rdepartment.Text, txtView1_title.Text, txtView1_content.Text, hdfView1_section.Value)); // Dispaly the proper message by click the insert button for complaint
                _subRebind();
                break;
            case "InsertComm":
                _txtMsg(objLinq.commitInsert(txtView2_fname.Text, txtView2_email.Text, ddlView2_rdepartment.Text, txtView2_title.Text, txtView2_content.Text, hdfView2_section.Value)); // Dispaly the proper message by click the insert button for comment
                _subRebind();
                break;
            case "InsertApp":
                _txtMsg(objLinq.commitInsert(txtView3_fname.Text, txtView3_email.Text, ddlView3_rdepartment.Text, txtView3_title.Text, txtView3_content.Text, hdfView3_section.Value)); // Dispaly the proper message by click the insert button for appreciation
                _subRebind();
                break;
            case "Cancel":// referesh the page
                _subRebind();
                break;
        }
    }
}