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

public partial class Patient_frmAppointment : System.Web.UI.Page
{
    clsDoctor objDoctor = new clsDoctor();
    clsAppointment objApmt = new clsAppointment();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Session["PatientId"] = 1;
            if (Session["PatientId"] != null)
            {

            }
            BindDoctros();
            BindManagers();
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
                ddlDoctor.Items.Insert(0, "--Select One--");
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
                lblMsg.Text = "No Managers Available..";
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
    void ClearData()
    { 
        TextBox txt;
        Control ctr = this.Master.FindControl("ContentPlaceHolder1");
          foreach(Control c in ctr.Controls)
          {
          if(c is TextBox)
          {
           txt=(TextBox) c;
              txt.Text="";
          }
          }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            objApmt.Age = Convert.ToInt32(txtAge.Text);
            objApmt.BP = txtBP.Text;
            objApmt.Date = Convert.ToDateTime(txtDate.Text);
            objApmt.DoctorId = Convert.ToInt32(ddlDoctor.SelectedItem.Value);
            objApmt.PatientId = Convert.ToInt32(Session["PatientId"]);
            objApmt.ManagerId = Convert.ToInt32(ddlManager.SelectedItem.Value);
            objApmt.Height = Convert.ToInt32(txtHeight.Text);
            objApmt.History = txtHistory.Text;
            objApmt.Medicines = txtMedicine.Text;
            objApmt.Prescription = txtPresc.Text;
            objApmt.visitedDoctor = txtVisited.Text;
            objApmt.Weight = txtWeight.Text;
            lblMsg.Text = objApmt.InsertAppointment();
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        ClearData();
        ddlDoctor.SelectedIndex = 0;
    }
}
