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

public partial class Kiosk_Manager_frmProvideAppointments : System.Web.UI.Page
{
    clsAppointment objApmt = new clsAppointment();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblMsg.Text = "";
            tblTime.Visible = false;
            GvAvailability.Visible = false;
            GvRequests.Visible = false;
            Session["ManagerId"] = 7;

            //if (Session["ManagerId"] != null)
            //{ 
             
            //}
            
        }
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        try
        {
            GvRequests.Visible = false;
            tblTime.Visible = false;
            GvAvailability.Visible = false;
            DataSet ds = objApmt.GetApmtRequests();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvRequests.DataSource = ds.Tables[0];
                GvRequests.DataBind();
                GvRequests.Visible = true;
            }
            else
            {
                lblMsg.Text = "No Apmt Requests Available..";
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
    protected void GvRequests_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count != 0)
            {
                GvRequests.PageIndex = e.NewPageIndex;
                GvRequests.DataSource = ds.Tables[0];
                GvRequests.DataBind();
                GvRequests.Visible = true;
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
    Label lbldate;
    protected void GvRequests_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            tblTime.Visible = false;
            GvAvailability.Visible = false;
            
            if (e.CommandName == "Availability")
            {
                
                foreach (GridViewRow item in GvRequests.Rows)
                {
                    lbldate = (Label)item.FindControl("lblDate");
                }
                //int DocId = Convert.ToInt32(e.CommandArgument);
                objApmt.DoctorId = Convert.ToInt32(e.CommandArgument);
                ViewState["Doctor"] = Convert.ToInt32(e.CommandArgument);
                objApmt.Date =Convert.ToDateTime(lbldate.Text);
                ViewState["Date"] = lbldate.Text;
                DataSet ds = objApmt.GetAppointmentsByDocId();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GvAvailability.DataSource = ds.Tables[0];
                    GvAvailability.DataBind();
                    GvAvailability.Visible = true;
                }
                else
                {
                    lblMsg.Text = "No Appointments Found.";
                }
            }
            else if (e.CommandName == "Reply")
            {
                int Id= Convert.ToInt32(e.CommandArgument);
                ViewState["Id"] = Id;
                tblTime.Visible = true;
            }
            else if (e.CommandName == "Cancel")
            {
                tblTime.Visible = false;
                GvAvailability.Visible = false;
                objApmt.ApmtId = Convert.ToInt32(e.CommandArgument);
                lblMsg.Text = objApmt.CancelApmt();
                //SendRejectMail(Convert.ToInt32(e.CommandArgument));
                btnShow_Click(sender, e);
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
            objApmt.ApmtId = Convert.ToInt32(ViewState["Id"]);
            objApmt.DoctorId =Convert.ToInt32( ViewState["Doctor"]);
            objApmt.ManagerId = Convert.ToInt32(Session["ManagerId"]);
            objApmt.Date = Convert.ToDateTime(ViewState["Date"]);
            if (ddlTime.SelectedItem.Text == "AM")
            {
                objApmt.Time = txtTime.Text;
            }
            else
            {
                objApmt.Time = (Convert.ToInt32(txtTime.Text) + 12).ToString();
            }
          
            lblMsg.Text = objApmt.ConfirmApmt();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
        
    }
}
