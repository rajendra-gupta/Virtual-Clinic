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

public partial class Patient_frmViewPrescriptions : System.Web.UI.Page
{
    clsAppointment objApmt = new clsAppointment();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["PatientId"] != null)
            {
                GetPrescriptions();
            }
        }
    }
    void GetPrescriptions()
    {
        try
        {
            objApmt.PatientId = Convert.ToInt32(Session["PatientId"]);
            DataSet ds = objApmt.GetPrescriptionsByPatientId();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvHistory.DataSource = ds.Tables[0];
                GvHistory.DataBind();
            }
            else
            {
                lblMsg.Text = "No Prescriptions available..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;  
        }
    }
    protected void GvHistory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvHistory.PageIndex = e.NewPageIndex;
                GvHistory.DataSource = ds.Tables[0];
                GvHistory.DataBind();
            }
            else
            {
                lblMsg.Text = "No records found..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
