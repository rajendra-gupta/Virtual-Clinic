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

public partial class frmSignOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["UserType"].ToString() == "Admin")
                clsLogin.InActiveAdminOnlineStatus(Convert.ToInt32(Session["AdminId"]));
            if (Session["UserType"].ToString() == "Doctor")
                clsLogin.InActiveDoctorOnlineStatus(Convert.ToInt32(Session["DoctorId"]));
            if (Session["UserType"].ToString() == "Patient")
                clsLogin.InActivePatientOnlineStatus(Convert.ToInt32(Session["PatientId"]));
            if (Session["UserType"].ToString() == "Manager")
                clsLogin.InActiveManagerOnlineStatus(Convert.ToInt32(Session["ManagerId"]));

            Session.Abandon();
            Session.Clear();
            //Response.Redirect("../Default.aspx");
            FormsAuthentication.SignOut();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;

        }
    }
}
