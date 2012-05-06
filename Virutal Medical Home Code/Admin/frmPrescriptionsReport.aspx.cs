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

public partial class Admin_Reports_frmPrescriptionsReport : System.Web.UI.Page
{
    clsDoctor objDoctor = new clsDoctor();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindSpecializations();
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
    protected void btnShow_Click(object sender, EventArgs e)
    {
        try
        {
            objDoctor.DoctorId =Convert.ToInt32( ddlDoctor.SelectedItem.Value);
            DataSet ds = objDoctor.GetPrescriptionsByDoctor();
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvPresc.DataSource = ds.Tables[0];
                GvPresc.DataBind();
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
    protected void GvPresc_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void ddlSpecial_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            objDoctor.Special = ddlSpecial.SelectedItem.Text;
            DataSet ds = objDoctor.GetDoctorsBySpecial();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlDoctor.DataSource = ds.Tables[0];
                ddlDoctor.DataValueField = "UserId";
                ddlDoctor.DataTextField = "UserName";
                ddlDoctor.DataBind();
                ddlDoctor.Items.Insert(0, "--Select Doctor--");
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
