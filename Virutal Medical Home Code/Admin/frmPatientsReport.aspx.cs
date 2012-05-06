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

public partial class Admin_Reports_frmPatientsReport : System.Web.UI.Page
{
    clsReports objReport = new clsReports();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblMsg.Text = "";
        }
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            objReport.FromDate = Convert.ToDateTime(txtFrom.Text);
            objReport.ToDate = Convert.ToDateTime(txtTo.Text);
            DataSet ds = objReport.GetPatientsDataByMonth();
            ViewState["Data1"] = ds;
            if (ds.Tables[0].Rows.Count > 0)
            {
                grdPatients.DataSource = ds.Tables[0];
                grdPatients.DataBind();
                grdPatients.Visible = true;
                txtDate.Text = "";
            }
            else
            {
                grdPatients.Visible = false;
                txtDate.Text = "";
                lblMsg.Text = "No Patients Registered between these Dates..";
            }

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

        
    }
    protected void btnGet_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            objReport.Date = Convert.ToDateTime(txtDate.Text);

            DataSet ds = objReport.GetPatientsDataByDate();
            ViewState["Data"] = ds;

            if (ds.Tables[0].Rows.Count > 0)
            {
                grdPatients.DataSource = ds.Tables[0];
                grdPatients.DataBind();
                grdPatients.Visible = true;
                txtFrom.Text = "";
                txtTo.Text = "";
            }
            else
            {
                grdPatients.Visible = false;
                txtFrom.Text = "";
                txtTo.Text = "";
                lblMsg.Text = "No Patients Registered on this Date..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void grdPatients_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data1"];
            if (ds.Tables[0].Rows.Count > 0)
            {
                grdPatients.PageIndex = e.NewPageIndex;
                grdPatients.DataSource = ds.Tables[0];
                grdPatients.DataBind();
                grdPatients.Visible = true;
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
