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

public partial class Kiosk_Manager_frmSearch : System.Web.UI.Page
{
    clsManager objMngr = new clsManager();
    clsDoctor objDoctor = new clsDoctor();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblMsg.Text = "";
            pnlDoc.Visible = false;
            GvDoctors.Visible = false;
            pnlPat.Visible = false;
            //Session["ManagerId"] = 7;

            if (Session["ManagerId"] != null)
            {

            }
        }
    }
    void BindSpecializations()
    {
        DataSet ds = objDoctor.GetSpecializations();
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddlSpecial.DataSource = ds.Tables[0];
            ddlSpecial.DataTextField = "Specialization";
            ddlSpecial.DataBind();
            ddlSpecial.Items.Insert(0, "--Select One--");
        }
        else
        {
            lblMsg.Text = "No Records Found..";
        }
    }
    protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
        if (ddlRole.SelectedIndex == 2)
        {
            pnlDoc.Visible = true;
            BindSpecializations();
            pnlPat.Visible = false;
            GvPatient.Visible = false;
        }
        else if(ddlRole.SelectedIndex==1)
        {
            pnlPat.Visible = true;
            pnlDoc.Visible = false;
            GvDoctors.Visible = false;
        }
        else
        {
            pnlPat.Visible = false;
            pnlDoc.Visible = false;
        }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
        if (ddlRole.SelectedIndex == 1)
        {
            lblMsg.Text = "";
            GvDoctors.Visible = false;
            objMngr.FromDate = Convert.ToDateTime(txtFrom.Text);
            objMngr.ToDate = Convert.ToDateTime(txtTo.Text);
            DataSet ds= objMngr.GetPatientsByDate();
            ViewState["Patients"] = ds;
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvPatient.DataSource = ds.Tables[0];
                GvPatient.DataBind();
                GvPatient.Visible = true;
            }
            else
            {
                lblMsg.Text = "No Doctors Found..";
            }

        }
        else if (ddlRole.SelectedIndex == 2)
        {
            lblMsg.Text = "";
            GvPatient.Visible = false;
            objDoctor.Special = ddlSpecial.SelectedItem.Text;
            DataSet ds = objDoctor.GetDoctorsBySpecial();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvDoctors.DataSource = ds.Tables[0];
                GvDoctors.DataBind();
                GvDoctors.Visible = true;
            }
            else
            {
                lblMsg.Text = "No Doctors Found..";
            }
        }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void GvDoctors_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds =(DataSet) ViewState["Data"];
            
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvDoctors.PageIndex = e.NewPageIndex;
                GvDoctors.DataSource = ds.Tables[0];
                GvDoctors.DataBind();
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
    protected void GvPatient_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Patients"];

            if (ds.Tables[0].Rows.Count > 0)
            {
                GvPatient.PageIndex = e.NewPageIndex;
                GvPatient.DataSource = ds.Tables[0];
                GvPatient.DataBind();
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
