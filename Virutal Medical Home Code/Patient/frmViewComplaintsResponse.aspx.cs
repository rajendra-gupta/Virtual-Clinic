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

public partial class Patient_frmViewComplaintsResponse : System.Web.UI.Page
{
    cls_Complaints objComp = new cls_Complaints();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblMsg.Text = "";
            //Session["PatientId"] = 1;
            if (Session["PatientId"] != null)
            {
                GvDoctor.Visible = false;
                GvManager.Visible = false;
            }
        }
    }
    protected void GvManager_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data1"];
            if (ds.Tables[1].Rows.Count > 0)
            {
                GvManager.PageIndex = e.NewPageIndex;
                GvManager.DataSource = ds.Tables[1];
                GvManager.DataBind();
                GvManager.Visible = true;
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
    protected void btnDoctor_Click(object sender, EventArgs e)
    {
        try
        {
            GvManager.Visible = false;
            lblMsg.Text = "";
            objComp.ComplainerId = Convert.ToInt32(Session["PatientId"]);
            DataSet ds = objComp.GetResponses();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvDoctor.DataSource = ds.Tables[0];
                GvDoctor.DataBind();
                GvDoctor.Visible = true;
            }
            else
            {
                lblMsg.Text = "No Responses Available..";
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
    protected void btnManager_Click(object sender, EventArgs e)
    {
        try
        {
            GvDoctor.Visible = false;
            lblMsg.Text = "";
            objComp.ComplainerId = Convert.ToInt32(Session["PatientId"]);
            DataSet ds = objComp.GetResponses();
            ViewState["Data1"] = ds;
            if (ds.Tables[1].Rows.Count > 0)
            {
                GvManager.DataSource = ds.Tables[1];
                GvManager.DataBind();
                GvManager.Visible = true;
            }
            else
            {
                lblMsg.Text = "No Responses Available..";
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
    protected void GvDoctor_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {

            DataSet ds = (DataSet)ViewState["Data"];

            if (ds.Tables[0].Rows.Count > 0)
            {
                GvDoctor.PageIndex = e.NewPageIndex;
                GvDoctor.DataSource = ds.Tables[0];
                GvDoctor.DataBind();
                GvDoctor.Visible = true;
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
