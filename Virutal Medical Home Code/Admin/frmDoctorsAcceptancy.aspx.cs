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
using System.Web.Mail;
public partial class Admin_frmAcceptDoctors : System.Web.UI.Page
{
    clsDoctor objDoctor = new clsDoctor();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["AdminId"] != null)
            { 
             
            }
        }
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        try
        {
            //lblMsg.Text = "";

            DataSet ds = objDoctor.GetRegdDoctors();
            ViewState["Data"] = ds;
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvDoctors.DataSource = ds.Tables[0];
                GvDoctors.DataBind();
            }
            else
            {
                lblMsg.Text = "No Registrered Doctors Available..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    void SendMails(int Id)
    {
        DataSet ds = (DataSet)ViewState["Data"];
        DataRow dr = ds.Tables[0].Select("UserId=" + Id)[0];

        MailMessage objMail = new MailMessage();
        objMail.From = "VirtualMedicalHome";
        objMail.To = "Localhost";
        objMail.Subject = "Status of Doctor Request";
        objMail.Body = "Your Request for Doctor is Accepted.. Your Email : " + dr["Email"].ToString();
        SmtpMail.SmtpServer = "LocalHost";
        SmtpMail.Send(objMail);

    }
    void SendRejectMail(int Id)
    {
        DataSet ds = (DataSet)ViewState["Data"];
        DataRow dr = ds.Tables[0].Select("UserId=" + Id)[0];

        MailMessage objMail = new MailMessage();
        objMail.From = "VirtualMedicalHome";
        objMail.To = "Localhost";
        objMail.Subject = "Status of Doctor Request";
        objMail.Body = "Your Request for Doctor is Rejected.. Your Email : " + dr["Email"].ToString();
        SmtpMail.SmtpServer = "LocalHost";
        SmtpMail.Send(objMail);

    }
    protected void GvDoctors_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            DataSet ds = (DataSet)ViewState["Data"];
            if (ds.Tables[0].Rows.Count > 0)
            {
                GvDoctors.PageIndex = e.NewPageIndex;
                GvDoctors.DataSource = ds.Tables[0];
                GvDoctors.DataBind();
            }
            else
            {
                lblMsg.Text = "No Registrered Doctors Available..";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void GvDoctors_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Accept")
            {
                //objDoctor.SenderId = Convert.ToInt32(Session["AdminId"]);
                objDoctor.UserId = Convert.ToInt32(e.CommandArgument);
                lblMsg.Text = objDoctor.AcceptRegdDoctors();
                SendMails(Convert.ToInt32(e.CommandArgument));
                btnShow_Click(sender, e);
            }
            else if (e.CommandName == "Reject")
            {
                //objDoctor.SenderId = Convert.ToInt32(Session["AdminId"]);

                objDoctor.UserId = Convert.ToInt32(e.CommandArgument);
                lblMsg.Text = objDoctor.RejectRegdDoctor();
                SendRejectMail(Convert.ToInt32(e.CommandArgument));
                btnShow_Click(sender, e);
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
