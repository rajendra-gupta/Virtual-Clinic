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

public partial class Doctor_frmViewFeedBack : System.Web.UI.Page
{
    clsDoctor objDoc = new clsDoctor();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["DoctorId"] != null)
            { 
              
            }
        }
    }
    protected void btnFeed_Click(object sender, EventArgs e)
    {
        try
        {
            objDoc.ReceiverId = Convert.ToInt32(Session["DoctorId"]);
            DataSet ds = objDoc.GetFeedBackByReceiverId();
            ViewState["Data"] = ds;

            if (ds.Tables[0].Rows.Count > 0)
            {
                GvFeedBack.DataSource = ds.Tables[0];
                GvFeedBack.DataBind();
            }
            else
            {
                lblMsg.Text = "No FeedBack Available..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void GvFeedBack_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvFeedBack.PageIndex = e.NewPageIndex;
                GvFeedBack.DataSource = ds.Tables[0];
                GvFeedBack.DataBind();
            }
            else
            {
                lblMsg.Text = "No FeedBack Available..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
