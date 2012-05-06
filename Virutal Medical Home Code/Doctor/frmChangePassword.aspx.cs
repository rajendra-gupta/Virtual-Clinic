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

public partial class Customers_frmChangePassword : System.Web.UI.Page
{
    clsLogin objChange = new clsLogin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["DoctorId"] != null)
            { 
              
            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            objChange.RegUserId = Convert.ToInt32(Session["DoctorId"]);
            //objChange.RegdUserId = objChange.GetUserIdByCustomerId();
            objChange.OldPwd = txtOld.Text;
            objChange.NewPwd = txtNew.Text;
            objChange.ConfirmPwd = txtConfirm.Text;
            lblMsg.Text = objChange.ChangePassword();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtConfirm.Text = "";
        txtNew.Text = "";
        txtOld.Text = "";
        lblMsg.Text = "";
    }
}
