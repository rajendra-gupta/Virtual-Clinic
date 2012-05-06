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

public partial class frmRegistration : System.Web.UI.Page
{
    clsDoctor objDoctor=new clsDoctor ();
    clsUser objUser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Pnl_Patient.Visible = false;
            pnl2.Visible = false;
        }
    }
    void ClearData()
    {
        txtName.Text = "";
        txtMName.Text = "";
        txtLName.Text = "";
        txtAddress.Text = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtUserName.Text = "";
        txtPassword.Text = "";
        txtDOB.Text = "";
        txtTime2.Text = "";
        txtTime1.Text = "";
        txtSpec.Text = "";
        txtQual.Text = "";
        txtExp.Text = "";
        //txtHeight.Text = "";
        txtBlood.Text = "";
        txtDisease.Text = "";
        //lblDOR.Text = "";
        BrowseImage1.Clearimage();

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string str1 = "";
            string str2 = "";
            if (pnl2.Visible == true)
            {
                str1 = ddlTime1.SelectedItem.Text;
                str2 = ddlTime2.SelectedItem.Text;
            }
            objUser.UserName = txtUserName.Text;
            objUser.Password = txtPassword.Text;
            objUser.FirstName = txtName.Text;
            objUser.MiddleName = txtMName.Text;
            objUser.LastName = txtLName.Text;
            objUser.Address = txtAddress.Text;
            objUser.PhoneNo = txtPhone.Text;
            objUser.Email = txtEmail.Text;
            objUser.Image = (byte[])Session["Photo"];
            objUser.FileName = Convert.ToString(Session["FileName"]);
            objUser.DOB = Convert.ToDateTime(txtDOB.Text);
            objUser.DOR = Convert.ToDateTime(System.DateTime.Now.ToLongDateString().ToString());
            objUser.Role = ddlRole.SelectedItem.Text;
                objUser.Specialization = txtSpec.Text;
                objUser.Qualification = txtQual.Text;
                objUser.FromTime = txtTime1.Text + str1;
                objUser.ToTime = txtTime2.Text + str2;
                objUser.Experience = txtExp.Text;
                //objUser.Height = Convert.ToInt32(txtHeight.Text);
                objUser.BloodGroup = txtBlood.Text;
                objUser.Disease = txtDisease.Text;
                objUser.Gender = ddlGender.SelectedItem.Text;
            lblMsg.Text = objUser.InsertUserRegistration();
            ClearData();
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
        pnl2.Visible = false;
        Pnl_Patient.Visible = false;
        if (ddlRole.Items.Count != 0)
            ddlRole.SelectedIndex = 0;
    }
    protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlRole.SelectedIndex == 3)
        {
            txtTime2.Text = "";
            txtTime1.Text = "";
            txtSpec.Text = "";
            txtQual.Text = "";
            txtExp.Text = "";
            pnl2.Visible = true;
            Pnl_Patient.Visible = false;
        }
        else if(ddlRole.SelectedIndex==1)
        {
            //txtHeight.Text = "";
            txtBlood.Text = "";
            txtDisease.Text = "";
            pnl2.Visible = false;
            Pnl_Patient.Visible = true;
        }
        else
        {
            pnl2.Visible = false;
            Pnl_Patient.Visible = false;
        }



    }
}
