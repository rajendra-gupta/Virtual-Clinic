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

public partial class Patient_frmOnlineChat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["PatientId"] != null)
            {

            }         
        }
        GetOnlineAdminInfo();
        GetOnlineDoctorsInfo();
        GetOnlineManagersInfo();
    }
    void GetOnlineAdminInfo()
    {
        try
        {
            DataSet ds = clsLogin.GetOnlineAdminData();
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdAdmin.DataSource = ds.Tables[0];
                grdAdmin.DataBind();
            }
            else
            {
                grdAdmin.EmptyDataText = "No Admin is Online";
                grdAdmin.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    void GetOnlineDoctorsInfo()
    {
        try
        {
            clsLogin.PatientId = Convert.ToInt32(Session["PatientId"]);
            DataSet ds = clsLogin.GetOnlineDoctorsDataByPatient();
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdDoctor.DataSource = ds.Tables[0];
                grdDoctor.DataBind();
            }
            else
            {
                grdDoctor.EmptyDataText = "No Doctor is Online";
                grdDoctor.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    void GetOnlineManagersInfo()
    {
        try
        {
            DataSet ds = clsLogin.GetOnlineManagersData();
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdManager.DataSource = ds.Tables[0];
                grdManager.DataBind();
            }
            else
            {
                grdManager.EmptyDataText = "No Manager is Online";
                grdManager.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        try
        {
            GetOnlineDoctorsInfo();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void BT_Send_Click(object sender, EventArgs e)
    {
        try
        {
            string sChannel = "1";
        string sUser = Session["UserName"].ToString() + "( " + Session["UserType"].ToString() + " )";

        if (TB_ToSend.Text.Length > 0)
        {
            clsChat.AddMessage(sChannel, sUser, TB_ToSend.Text);
            TB_ToSend.Text = "";
        }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
