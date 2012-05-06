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

public partial class Admin_Reports_frmAppointmentsReport : System.Web.UI.Page
{
    clsReports objReport = new clsReports();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblMsg.Text = "";
        }
    }
    protected void btnGet_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            objReport.Date = Convert.ToDateTime(txtDate.Text);

            DataSet ds = objReport.GetAppointmentsByDate();
            ViewState["Data"] = ds;

            if (ds.Tables[0].Rows.Count > 0)
            {
                grdApmt.DataSource = ds.Tables[0];
                grdApmt.DataBind();
                grdApmt.Visible = true;
                txtFrom.Text = "";
                txtTo.Text = "";
            }
            else
            {
                grdApmt.Visible = false;
                txtFrom.Text = "";
                txtTo.Text = "";
                lblMsg.Text = "No Appointments on this Date..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            objReport.FromDate = Convert.ToDateTime(txtFrom.Text);
            objReport.ToDate = Convert.ToDateTime(txtTo.Text);
            DataSet ds = objReport.GetAppointmentsByMonth();
            ViewState["Data1"] = ds;
            if (ds.Tables[0].Rows.Count > 0)
            {
                grdApmt.DataSource = ds.Tables[0];
                grdApmt.DataBind();
                grdApmt.Visible = true;
                txtDate.Text = "";
            }
            else
            {
                grdApmt.Visible = false;
                txtDate.Text = "";
                lblMsg.Text = "No Appointments  between these Dates..";
            }

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void grdApmt_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            DataSet ds = (DataSet)ViewState["Data1"];
            if (ds.Tables[0].Rows.Count > 0)
            {
                grdApmt.PageIndex = e.NewPageIndex;
                grdApmt.DataSource = ds.Tables[0];
                grdApmt.DataBind();
                grdApmt.Visible = true;
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
