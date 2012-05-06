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

public partial class Admin_frmOnlineChat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetOnlineDoctorsInfo();
            GetOnlinePatientsInfo();
            GetOnlineManagersInfo();
        }
    }
    void GetOnlineManagersInfo()
    {
        try
        {
            DataSet ds = clsLogin.GetOnlineManagersData();
            if (ds.Tables[0].Rows.Count != 0)
            {
                GvAManagers.DataSource = ds.Tables[0];
                GvAManagers.DataBind();
            }
            else
            {
                GvAManagers.EmptyDataText = "No Manager is Online";
                GvAManagers.DataBind();
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
            DataSet ds = clsLogin.GetOnlineDoctorsData();
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

    void GetOnlinePatientsInfo()
    {
        try
        {
            DataSet ds = clsLogin.GetOnlinePatientsData();
            if (ds.Tables[0].Rows.Count != 0)
            {
                grdPatient.DataSource = ds.Tables[0];
                grdPatient.DataBind();
            }
            else
            {
                grdPatient.EmptyDataText = "No Patient is Online";
                grdPatient.DataBind();
            }
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
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        try
        {
            GetOnlineDoctorsInfo();
            GetOnlinePatientsInfo();
            GetOnlineManagersInfo();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
