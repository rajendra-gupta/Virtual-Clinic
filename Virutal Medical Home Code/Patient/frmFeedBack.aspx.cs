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

public partial class Patient_frmFeedBack : System.Web.UI.Page
{
    clsDoctor objDoctor = new clsDoctor();
    clsFeedBack objFeed = new clsFeedBack();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblMsg.Text = "";
            ddlRole.Visible = false;
            //Session["PatientId"] =1;

            if (Session["PatientId"] != null)
            {

            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            objFeed.SenderId = Convert.ToInt32(Session["PatientId"]);
            objFeed.ReceiverId = Convert.ToInt32(ddlRole.SelectedItem.Value);
            objFeed.FeedBack = txtFeed.Text;
            lblMsg.Text = objFeed.InsertFeedBack();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        txtFeed.Text = "";
        ddlRole.SelectedIndex = 0;
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (RadioButtonList1.SelectedIndex == 0)
            {
                lblMsg.Text = "";
                objDoctor.PatientId = Convert.ToInt32(Session["PatientId"]);
                DataSet ds = objDoctor.GetDoctorsByPatientId();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlRole.DataSource = ds.Tables[0];
                    ddlRole.DataValueField = "UserId";
                    ddlRole.DataTextField = "UserName";
                    ddlRole.DataBind();
                    ddlRole.Visible = true;
                    ddlRole.Items.Insert(0, "--Select Doctor--");
                }
                else
                {
                    lblMsg.Text = "No Doctors Available..";
                }
            }
            else
            {
                lblMsg.Text = "";
                objDoctor.PatientId = Convert.ToInt32(Session["PatientId"]);
                DataSet ds = objDoctor.GetManagersByPatientId();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlRole.DataSource = ds.Tables[0];
                    ddlRole.DataValueField = "UserId";
                    ddlRole.DataTextField = "UserName";
                    ddlRole.DataBind();
                    ddlRole.Visible = true;
                    ddlRole.Items.Insert(0, "--Select Manager--");
                }
                else
                {
                    lblMsg.Text = "No Managers Available..";
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
        
    }
}
