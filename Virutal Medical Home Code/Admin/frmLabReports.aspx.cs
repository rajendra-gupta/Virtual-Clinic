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

public partial class Admin_Reports_frmLabReports : System.Web.UI.Page
{
    clsUser objUser=new clsUser ();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { 
         BindPatients();
        }
    }
    void BindPatients()
    {
     try 
	{	        
		DataSet ds = objUser.GetPatients();
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddlPatients.DataSource = ds.Tables[0];
            ddlPatients.DataValueField="UserId";
            ddlPatients.DataTextField = "UserName";
            ddlPatients.DataBind();
            ddlPatients.Items.Insert(0, "--Select One--");
        }
        else
        {
            lblMsg.Text = "No Records Found..";
        }
	}
	catch (Exception ex)
	{
		lblMsg.Text=ex.Message;
	}
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        try
        {
            objUser.PatientId = Convert.ToInt32(ddlPatients.SelectedItem.Value);
            DataSet ds = objUser.GetLabReportsByPatientId();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvReports.DataSource = ds.Tables[0];
                GvReports.DataBind();
            }
            else
            {
                lblMsg.Text = "No Records Found..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    
    protected void GvReports_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvReports.PageIndex = e.NewPageIndex;
                GvReports.DataSource = ds.Tables[0];
                GvReports.DataBind();
            }
            else
            {
                lblMsg.Text = "No Records Found..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
