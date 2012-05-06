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

public partial class Patient_frmLabReports : System.Web.UI.Page
{
    clsReports objReport = new clsReports();
    clsDoctor objDoctor = new clsDoctor();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Session["PatientId"] = 1;
            if (Session["PatientId"] != null)
            {
                BindDoctros();
                BindManagers();
            }
        }
    }
    void BindManagers()
    {
        try
        {
            DataSet ds = objDoctor.GetManagers();
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlManager.DataSource = ds.Tables[0];
                ddlManager.DataValueField = "UserId";
                ddlManager.DataTextField = "UserName";
                ddlManager.DataBind();
                ddlManager.Items.Insert(0, "--Select Manager--");
            }
            else
            {
                lblMsg.Text = "No Doctors Available..";
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
    void BindDoctros()
    {
        try
        {
            DataSet ds = objDoctor.GetDoctors();
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
                lblMsg.Text = "No Doctors Available..";
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }

    void ClearData()
    {
        txtSugar.Text = "";
        txtECG.Text = "";
        txtBlood.Text = "";
        txtUrine.Text = "";
        ddlDoctor.SelectedIndex = 0;
        ddlManager.SelectedIndex = 0;
     }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            objReport.PatientId = Convert.ToInt32(Session["PatientId"]);
            objReport.DoctorId = Convert.ToInt32(ddlDoctor.SelectedItem.Value);
            objReport.ManagerId = Convert.ToInt32(ddlManager.SelectedItem.Value);
            objReport.ECG = txtECG.Text;
            objReport.BloodTest = txtBlood.Text;
            objReport.UrineTest = txtUrine.Text;
            objReport.Sugar = txtSugar.Text;
            lblMsg.Text = objReport.InsertLabReports();

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        ClearData();
        lblMsg.Text = "";
    }
}
