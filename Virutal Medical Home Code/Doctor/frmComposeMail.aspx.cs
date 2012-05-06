using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Admin_frmComposeMail : System.Web.UI.Page
{
    Cls_EmailMaster objEmailmaster = new Cls_EmailMaster();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

                if (Session["DoctorId"] != null)
                { 
                 
                }
                ddlto1.Items.Insert(0, "--Select EmailId--");
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }

    }
    protected void rdbAll_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = Cls_EmailMaster.GetAllMailIds();

            pnlmultiple.Visible = true;
            pnlsingle.Visible = false;
            if (ds.Tables[0].Rows.Count != 0)
            {
                lstallItems.DataSource = ds.Tables[0];
                lstallItems.DataTextField = "Username";
                lstallItems.DataValueField = "UserId";
                lstallItems.DataBind();
            }
            else
            {
                ddlto1.Items.Clear();

            }
            lstallItems.Items.Insert(0, "--Select EmailId--");
            lstallItems.SelectedIndex = 0;
            txtbody.Text = "";
            txtsubject.Text = "";
            lblMsg.Text = "";
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }

    }
    protected void BtnSend_Click(object sender, EventArgs e)
    {
        int j = 0;
        try
        {
            string str = "";
            System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
            byte[] data = encoding.GetBytes(str);

            objEmailmaster.EmailSenderId = Convert.ToInt32(Session["DoctorId"]);
            objEmailmaster.EMailBodyMsg = txtbody.Text;
            objEmailmaster.EmailSubjectText = txtsubject.Text;


            if (Session["FileName"] != null && Session["FileContent"] != null)
            {
                objEmailmaster.EmailAttachFileName = Convert.ToString(Session["FileName"]);
                objEmailmaster.EmailAttachFileContent = (byte[])Session["FileContent"];
            }
            else
            {
                objEmailmaster.EmailAttachFileName = "";
                objEmailmaster.EmailAttachFileContent = data;
            }
            if (rdbAll.Checked == true)
            {
                for (int i = 0; i < lstallItems.Items.Count; i++)
                {

                    if (lstallItems.Items[i].Selected == true)
                    {
                        objEmailmaster.EmailReciptedId = Convert.ToInt32(lstallItems.Items[i].Value);
                        j = objEmailmaster.InsertEmailMaster();

                        lblMsg.Text = "Your message has been sent..";

                    }
                    lstallItems.Items[i].Selected = false;
                }
            }
            else
            {
                objEmailmaster.EmailReciptedId = Convert.ToInt32(ddlto1.SelectedValue);
                j = objEmailmaster.InsertEmailMaster();
                if (j > 0)
                {
                    ClearData();
                    lblMsg.Text = "Your message has been sent..";
                }
                else
                {
                    lblMsg.Text = "Message Failed..";
                }
            }
            if (j > 0)
            {
                ClearData();
                lblMsg.Text = "Your message has been sent..";
            }
            else
            {
                lblMsg.Text = "Message Failed..";
            }

        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }

    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        ClearData();
    }
    public void ClearData()
    {
        Session["FileName"] = null;
        Session["FileContent"] = null;
        txtsubject.Text = "";
        txtbody.Text = "";
        if (ddlto1.SelectedIndex != 0)
            ddlto1.SelectedIndex = 0;
        if (lstallItems.SelectedIndex != 0)
        {
            lstallItems.SelectedIndex = 0;
        }
        lblMsg.Text = "";
    }
    protected void rdbDoc_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = Cls_EmailMaster.ShowDoctorEmails();
            pnlsingle.Visible = true;
            pnlmultiple.Visible = false;
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlto1.DataSource = ds.Tables[0];
                ddlto1.DataTextField = "Username";
                ddlto1.DataValueField = "UserId";
                ddlto1.DataBind();
            }
            else
            {
                ddlto1.Items.Clear();

            }
            ddlto1.Items.Insert(0, "--Select EmailId--");
            txtbody.Text = "";
            txtsubject.Text = "";
            lblMsg.Text = "";
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }

    }
    protected void rdbMngr_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = Cls_EmailMaster.GetManagersEmailIds();

            pnlsingle.Visible = true;
            pnlmultiple.Visible = false;
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlto1.DataSource = ds.Tables[0];
                ddlto1.DataTextField = "Username";
                ddlto1.DataValueField = "UserId";
                ddlto1.DataBind();
            }
            else
            {
                ddlto1.Items.Clear();

            }
            ddlto1.Items.Insert(0, "--Select EmailId--");
            txtbody.Text = "";
            txtsubject.Text = "";
            lblMsg.Text = "";
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
    protected void rdbPatient_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = Cls_EmailMaster.ShowPatientEmails();

            pnlsingle.Visible = true;
            pnlmultiple.Visible = false;
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlto1.DataSource = ds.Tables[0];
                ddlto1.DataTextField = "Username";
                ddlto1.DataValueField = "UserId";
                ddlto1.DataBind();
            }
            else
            {
                ddlto1.Items.Clear();

            }
            ddlto1.Items.Insert(0, "--Select EmailId--");
            txtbody.Text = "";
            txtsubject.Text = "";
            lblMsg.Text = "";
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
}
