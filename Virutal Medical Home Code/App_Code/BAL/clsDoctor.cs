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
/// Summary description for clsDoctor
/// </summary>
public class clsDoctor
{
	public clsDoctor()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int UserId { get; set; }
    public int ComplaintId { get; set; }
    public string Reply { get; set; }
    public int DoctorId { get; set; }
    public string Special { get; set; }
    public DateTime Date { get; set; }
    public int SenderId { get; set; }
    public int ReceiverId { get; set; }
    public int PatientId { get; set; }

    public DataSet GetRegdDoctors()
    {
        try
        {
            string str = "select * from tbl_UserRegistration where Role='UserD' ";

            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetManagers()
    {
        try
        {
            string str = "select * from tbl_UserRegistration where Role='Manager' ";

            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetDoctors()
    {
        try
        {
            string str = "select * from tbl_UserRegistration where Role='Doctor' ";

            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetDoctorsBySpecial()
    {
        try
        {
            string str = "select * from tbl_UserRegistration where Role='Doctor' and Specialization='"+Special+"'";

            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetDoctorsByPatientId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@PatientId", PatientId);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure,"sp_GetDoctorsByPatientId",p);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetManagersByPatientId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@PatientId", PatientId);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetManagersByPatientId", p);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string AcceptRegdDoctors()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@UserId", UserId);
            p[1] = new SqlParameter("@Message", SqlDbType.VarChar, 100);
            p[1].Direction = ParameterDirection.Output;
             //p[2] = new SqlParameter("@AdminId", SenderId);
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "sp_AcceptRegdDoctors", p);
            return p[1].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string RejectRegdDoctor()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@UserId", UserId);
            p[1] = new SqlParameter("@Message", SqlDbType.VarChar, 100);
            p[1].Direction = ParameterDirection.Output;
           // p[2] = new SqlParameter("@AdminId", SenderId);
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "sp_RejectRegdDoctors", p);
            return p[1].Value.ToString();
        }
        catch (Exception ex)
        {
            
            throw new ArgumentException(ex.Message);
        }
    }
    public string InsertReply()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@ComplaintId", ComplaintId);
            p[1] = new SqlParameter("@AnswerText", Reply);
            p[2] = new SqlParameter("@Message", SqlDbType.VarChar, 100);
            p[2].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "sp_InsertReply", p);
            return p[2].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetComplaintsByDoctorId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@DoctorId",DoctorId );
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetComplaintsByDoctorId", p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetApmtsByDocId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@DoctorId", DoctorId);
            p[1] = new SqlParameter("@Date", Date);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetApmtsByDocId", p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetSpecializations()
    {
        try
        {
            string str = "select Specialization from tbl_UserRegistration where Role='Doctor' ";

            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetFeedBackByReceiverId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ReceiverId", ReceiverId);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure,"sp_GetFeedBackByReceiverId",p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetPrescriptionsByDoctor()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@DoctorId",DoctorId);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetPrescriptionsByDoctor", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
}
