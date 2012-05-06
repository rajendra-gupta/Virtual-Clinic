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

public partial class Admin_frmComplaints : System.Web.UI.Page
{
    cls_Complaints objComp = new cls_Complaints();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GvDoctor.Visible = false;
            GvManager.Visible = false;
           
        }
    }
    
    protected void btnDoctor_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            GvManager.Visible = false;
            DataSet ds = objComp.GetComplaints();
            ViewState["Data"] = ds;
            
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvDoctor.DataSource = ds.Tables[0];
                GvDoctor.DataBind();
                GvDoctor.Visible = true;
            }
            else
            {
                lblMsg.Text = "No Complaints Available About Doctor..";
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
            lblMsg.Text = "";
            GvDoctor.Visible = false;
            DataSet ds = objComp.GetComplaints();
            ViewState["Data1"] = ds;

            if (ds.Tables[1].Rows.Count > 0)
            {
                GvManager.DataSource = ds.Tables[1];
                GvManager.DataBind();
                GvManager.Visible = true;
            }
            else
            {
                lblMsg.Text = "No Complaints Available About Manager..";
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
            lblMsg.Text = "";
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count != 0)
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
    protected void GvManager_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            DataSet ds = (DataSet)ViewState["Data1"];
            if (ds.Tables[1].Rows.Count != 0)
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
    protected void GvDoctor_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            objComp.ComplaintId = Convert.ToInt32(e.CommandArgument);
            int i=objComp.SendComplaints();
            if(i>0)
            {
                lblMsg.Text = "Complaint forward to Doctor Successfully..";
            }

            else
            {
                lblMsg.Text = "Error.. Try again..";
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
    protected void GvManager_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            objComp.ComplaintId = Convert.ToInt32(e.CommandArgument);
            int i = objComp.SendComplaints();
            if (i > 0)
            {
                lblMsg.Text = "Complaint forward to Manager Successfully..";
            }

            else
            {
                lblMsg.Text = "Error.. Try again..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    
}
