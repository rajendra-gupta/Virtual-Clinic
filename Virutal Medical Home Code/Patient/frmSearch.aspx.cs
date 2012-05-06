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

public partial class Patient_frmSearch : System.Web.UI.Page
{
    clsDoctor objDoctor = new clsDoctor();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["PatientId"] != null)
            {

            }
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            objDoctor.Special = ddlSpecial.SelectedItem.Text;
            DataSet ds = objDoctor.GetDoctorsBySpecial();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvDoctors.DataSource = ds.Tables[0];
                GvDoctors.DataBind();
            }
            else
            {
                lblMsg.Text = "No Doctors Found..";
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
            DataSet ds = (DataSet)ViewState["Data"];

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
}
