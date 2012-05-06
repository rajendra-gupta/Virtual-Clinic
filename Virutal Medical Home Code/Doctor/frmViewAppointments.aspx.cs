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

public partial class Doctor_frmViewAppointments : System.Web.UI.Page
{
    clsDoctor objDoctor = new clsDoctor();
    clsAppointment objApmt = new clsAppointment();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GvHistory.Visible = false;
            tblPres.Visible = false;
            lblMsg.Text = "";
           // Session["DoctorId"] = 2;
            if (Session["DoctorId"] != null)
            {

            }
        }
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            GvApmts.Visible = false;
            objDoctor.DoctorId = Convert.ToInt32(Session["DoctorId"]);
            objDoctor.Date = Convert.ToDateTime(txtDate.Text);
            DataSet ds = objDoctor.GetApmtsByDocId();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvApmts.DataSource = ds.Tables[0];
                GvApmts.DataBind();
                GvApmts.Visible = true;
            }
            else
            {
                tblPres.Visible = false;
                lblMsg.Text = "No Appointments Available on this Date..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void GvApmts_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvApmts.PageIndex = e.NewPageIndex;
                GvApmts.DataSource = ds.Tables[0];
                GvApmts.DataBind();
                GvApmts.Visible = true;
            }
            else
            {
                lblMsg.Text = "No Appointments Available..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void GvApmts_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "History")
            {
                tblPres.Visible = true;
                objApmt.PatientId = Convert.ToInt32(e.CommandArgument);
                ViewState["Id"] = Convert.ToInt32(e.CommandArgument);
                objApmt.DoctorId = Convert.ToInt32(Session["DoctorId"]);
                int j;
                DataSet ds = objApmt.GetPatientHistory(out j);
                ViewState["ApmtId"] = j;
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GvHistory.DataSource = ds.Tables[0];
                    GvHistory.DataBind();
                    GvHistory.Visible = true;
                }
                else
                {
                    lblMsg.Text = "This is First Visit";
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            objApmt.NewPresc = txtPre.Text;
            objApmt.PatientId = Convert.ToInt32(ViewState["Id"]);
            objApmt.DoctorId = Convert.ToInt32(Session["DoctorId"]);
            lblMsg.Text = objApmt.UpdatePrescription();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
