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

public partial class Customers_frmUpdateMyProfile : System.Web.UI.Page
{
    clsLogin objCust = new clsLogin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["AdminId"] != null)
            {
                GetPersonalDetails();
            }
        }
    }
    void ClearData()
    {
        txtAddress.Text = "";
        txtPhone.Text = "";
        txtEmail.Text = "";
    }
    void GetPersonalDetails()
    {
        objCust.RegUserId = Convert.ToInt32(Session["AdminId"]);
        DataSet ds = objCust.GetUserDetails();
        DataRow dr = ds.Tables[0].Rows[0];
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtEmail.Text = dr["Email"].ToString();
            txtAddress.Text = dr["Address"].ToString();
            txtPhone.Text = dr["PhoneNo"].ToString();
            BrowseImage1.BindImage(dr["FileName"].ToString(), (byte[])dr["Image"]);

        }

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            objCust.RegUserId = Convert.ToInt32(Session["AdminId"]);
            objCust.PhoneNo = txtPhone.Text;
            objCust.Email = txtEmail.Text;
            objCust.Address = txtAddress.Text;
            objCust.Image = (byte[])Session["Photo"];
            objCust.FileName = Convert.ToString(Session["FileName"]);
            lblMsg.Text = objCust.UpdateProfile();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearData();
        lblMsg.Text = "";
    }
}
