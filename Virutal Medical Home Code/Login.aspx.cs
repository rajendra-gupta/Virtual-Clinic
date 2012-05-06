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

public partial class Login : System.Web.UI.Page
{
    AuthenticationWebService objWS = new AuthenticationWebService();
    clsLogin objLogin = new clsLogin();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";

        string url = Request.Url.ToString();
        string[] split = url.Split('/');
        for (int i = 0; i < split.Length; i++)
        {
            if (split[i] == "Admin")
            {
                lblLogin.Text = "Admin Login";
            }
            else if (split[i] == "Doctor")
            {
                lblLogin.Text = "Doctor Login";
            }
            else if (split[i] == "KioskManager")
            {
                lblLogin.Text = "Manager Login";
            }
            else if (split[i] == "Patient")
            {
                lblLogin.Text = "Patient Login";
            }
        }
        if (Session["UserName"] != null)
        {
            FormsAuthentication.SignOut();
        }
    }
    protected void ImgBtnEmail_Click(object sender, EventArgs e)
    {
        string str1 = null;
        string[] UserName = null;
        try
        {
            if (txtusername.Text.Contains("@"))
            {
                string str = txtusername.Text;
                UserName = str.Split('@');
                clsLogin.UserName = UserName[0].ToString();
                str1 = UserName[0].ToString();
            }
            else
            {
                clsLogin.UserName = txtusername.Text.Trim();
                str1 = txtusername.Text.Trim();
                Session["Name"] = str1;
            }
            clsLogin.Password = txtpassword.Text.Trim();
            int id;
            //string Role = clsLogin.GetUserLogin(out id);
            string Role = objWS.WSLoginChecking(txtusername.Text, txtpassword.Text);

            if (Role == "NoUser")
                lblMsg.Text = "User Name and password mismatch. Try again.";
            else
            {
                string role = clsLogin.GetUserLogin(out id);
                Session["UserType"] = Role;

                Session["UserId"] = id;

                if (Role.ToLower() == "admin")
                {
                    Session["AdminId"] = clsLogin.GetAdminIdByUserId(Convert.ToInt32(Session["UserId"]));
                    Session["UserName"] = str1;
                    clsLogin.ActiveAdminOnlineStatus(Convert.ToInt32(Session["AdminId"]));

                    FormsAuthentication.RedirectFromLoginPage("Admin", false);
                }
                else if (Role.ToLower() == "doctor")
                {
                    Session["DoctorId"] = clsLogin.GetDoctorIdByUserId(Convert.ToInt32(Session["UserId"]));
                    Session["UserName"] = str1;
                    clsLogin.ActiveDoctorOnlineStatus(Convert.ToInt32(Session["DoctorId"]));
                    FormsAuthentication.RedirectFromLoginPage("Doctor", false);
                }
                else if (Role.ToLower() == "manager")
                {
                    Session["ManagerId"] = clsLogin.GetManagerIdByUserId(Convert.ToInt32(Session["UserId"]));
                    Session["UserName"] = str1;
                    clsLogin.ActiveManagerOnlineStatus(Convert.ToInt32(Session["ManagerId"]));
                    FormsAuthentication.RedirectFromLoginPage("KioskManager", false);
                }
                else if (Role.ToLower() == "patient")
                {
                    Session["PatientId"] = clsLogin.GetPatientIdByUserId(Convert.ToInt32(Session["UserId"]));
                    Session["UserName"] = str1;
                    clsLogin.ActivePatientOnlineStatus(Convert.ToInt32(Session["PatientId"]));
                    FormsAuthentication.RedirectFromLoginPage("Patient", false);
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
