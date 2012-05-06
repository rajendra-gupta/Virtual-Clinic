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

public partial class Doctor_frmViewComplaints : System.Web.UI.Page
{
    clsDoctor objDoctor = new clsDoctor();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tblReply.Visible = false;
            lblMsg.Text = "";
            //Session["DoctorId"] = 2;
            if (Session["DoctorId"] != null)
            {

            }
        }
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text ="";
            tblReply.Visible = false;
            GvComplaints.Visible = false;
            objDoctor.DoctorId = Convert.ToInt32(Session["DoctorId"]);
            DataSet ds = objDoctor.GetComplaintsByDoctorId();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvComplaints.DataSource = ds.Tables[0];
                GvComplaints.DataBind();
                GvComplaints.Visible = true;
            }
            else
            {
                lblMsg.Text = "No Complaints Found..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void GvComplaints_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];

            if (ds.Tables[0].Rows.Count > 0)
            {
                GvComplaints.PageIndex = e.NewPageIndex;
                GvComplaints.DataSource = ds.Tables[0];
                GvComplaints.DataBind();
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
    protected void GvComplaints_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Reply")
            {
                tblReply.Visible = true;
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["Id"] = id;
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
            objDoctor.ComplaintId = Convert.ToInt32(ViewState["Id"]);
            objDoctor.Reply = txtAnswer.Text;
            lblMsg.Text = objDoctor.InsertReply();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtAnswer.Text = "";
    }
}
