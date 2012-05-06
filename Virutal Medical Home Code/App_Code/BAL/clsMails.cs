using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using VirtualMedicalHome.DAL;
/// <summary>
/// Summary description for clsMails
/// </summary>
public class clsMails
{
	public clsMails()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private int emailId;
    private int emailSenderId;
    private string emaildate;
    private string emailSubjectText;
    private string eMailBodyMsg;
    private byte[] emailAttachFileContent;
    private string emailAttachFileName;
    private int emailReciptedId;

    public int EmailId { get { return emailId; } set { emailId = value; } }
    public int EmailSenderId { get { return emailSenderId; } set { emailSenderId = value; } }
    public string Emaildate { get { return emaildate; } set { emaildate = value; } }
    public string EmailSubjectText { get { return emailSubjectText; } set { emailSubjectText = value; } }
    public string EMailBodyMsg { get { return eMailBodyMsg; } set { eMailBodyMsg = value; } }
    public byte[] EmailAttachFileContent { get { return emailAttachFileContent; } set { emailAttachFileContent = value; } }
    public string EmailAttachFileName { get { return emailAttachFileName; } set { emailAttachFileName = value; } }
    public int EmailReciptedId { get { return emailReciptedId; } set { emailReciptedId = value; } }

   
    
    public int  InsertEmailMaster()
    {
        try
        {
            SqlParameter []p=new SqlParameter[6];
            p[0]=new SqlParameter("@EmailSenderId",EmailSenderId);
            p[1]=new SqlParameter("@EmailSubjectText",EmailSubjectText);
            p[2]=new SqlParameter("@EMailBodyMsg",EMailBodyMsg);
            p[3]=new SqlParameter("@EmailAttachFileContent",EmailAttachFileContent);
            p[4]=new SqlParameter("@EmailAttachFileName",EmailAttachFileName);
            p[5] = new SqlParameter("@EmailReceiverId", EmailReciptedId);

            return SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "sp_InsertEmailMaster", p);
             
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetDoctorsEmailIds()
    {
        try
        {
            DataSet ds = new DataSet();
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetDoctorsEmailIds");
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetManagersEmailIds()
    {
        try
        {
            DataSet ds = new DataSet();
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "SP_GetManagersEmailIds");
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetPatientsEmailIds()
    {
        try
        {
            DataSet ds = new DataSet();
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "SP_GetPatientsEmailIds");
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet ShowAdminEmails()
    {
        try
        {
            DataSet ds = new DataSet();
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "SP_AdminEmailiddesplay");
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }


    public static DataSet ShowFacultyEmailsStudentWise(int id)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlParameter p = new SqlParameter("@studentid", id);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "SP_FacultyidemailsselectStudentId", p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }

    public static DataSet ShowStudentEmailsFacultyWise(int id)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlParameter p = new SqlParameter("@Facultyid", id);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "SP_studentidemailsselectFacultyid", p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }


    public static DataSet ShowInboxdetails(int id)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlParameter p = new SqlParameter("@ReceiptendId", id);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "Sp_ShowInboxdetails", p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }

    public static DataSet ShowOutboxdetails(int id)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlParameter p = new SqlParameter("@senderid", id);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "Sp_ShowOutboxdetails", p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet ShowInBoxEmailDetailsById(int Emailid1)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlParameter p = new SqlParameter("@Emailid", Emailid1);


            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "Sp_ShowInBoxEmailDetailsById", p);

        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }

    public static DataSet ShowOutBoxEmailDetailsById(int Emailid1)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlParameter p = new SqlParameter("@Emailid", Emailid1);


            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "Sp_ShowOutBoxEmailDetailsById", p);

        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }

    public static int UpdateEmailDeleteStatusInbox(int p)
    {
        try
        {
            return SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.Text, "update tbl_EmailDetails set EmailDeleteStatus=1 where Emailid=" + p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
    public static int UpdateEmailDeleteStatusOutbox(int p)
    {
        try
        {
            return SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.Text, "update tbl_emailsmaster set EmailDeleteStatus=1 where Emailid=" + p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
}
