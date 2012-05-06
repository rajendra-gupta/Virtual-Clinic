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
/// Summary description for clsAppointment
/// </summary>
public class clsAppointment
{
	public clsAppointment()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int Age { get; set; }
    public string Weight { get; set; }
    public int Height { get; set; }
    public string BP { get; set; }
    public string Prescription { get; set; }
    public string visitedDoctor { get; set; }
    public string Medicines { get; set; }
    public string History { get; set; }
    public int  PatientId{ get; set; }
    public int DoctorId { get; set; }
    public DateTime Date { get; set; }
    public string Time { get; set; }
    public int ApmtId { get; set; }
    public int ManagerId { get; set; }
    public string NewPresc { get; set; }

    public string InsertAppointment()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[13];
            p[0] = new SqlParameter("@PatientId", PatientId);
            p[1] = new SqlParameter("@DoctorId",DoctorId);
            p[2] = new SqlParameter("@Date", Date);
            p[3] = new SqlParameter("@History", History);
            p[4] = new SqlParameter("@Medicines",Medicines);
            p[5] = new SqlParameter("@VisitedDoctor",visitedDoctor);
            p[6] = new SqlParameter("@Prescription",Prescription);
            p[7] = new SqlParameter("@BP", BP);
            p[8] = new SqlParameter("@Age", Age);
            p[9] = new SqlParameter("@Height",Height);
            p[10] = new SqlParameter("@Weight", Weight);            
            p[11] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[11].Direction = ParameterDirection.Output;
            p[12] = new SqlParameter("@ManagerId", ManagerId);
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "sp_InsertAppointment", p);
            return p[11].Value.ToString();
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
     
    }
    public DataSet GetApmtRequests()
    {
        try
        {
         return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetApmtRequests",null);
        }
        catch (Exception ex)
        {
             throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAppointmentsByDocId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@Date", Date);
            p[1] = new SqlParameter("@DoctorId", DoctorId);                    
            //p[2] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            //p[2].Direction = ParameterDirection.Output;
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetAppointmentsByDocId", p);
            
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetPatientHistory(out int i)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@PatientId",PatientId);
            p[1] = new SqlParameter("@DoctorId", DoctorId);
            p[2] = new SqlParameter("@ApmtId", SqlDbType.Int);
            p[2].Direction = ParameterDirection.Output;
            DataSet ds = SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetPatientHistory", p);
            if (!p[2].IsNullable)
                i = 0;
            else
                i = Convert.ToInt32(p[2].Value);
            return ds;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string ConfirmApmt()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@Time", Time);
            p[1] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[1].Direction = ParameterDirection.Output;
            p[2] = new SqlParameter("@DoctorId", DoctorId);
            p[3] = new SqlParameter("@Date", Date);
            p[4] = new SqlParameter("@ApmtId", ApmtId);
            p[5] = new SqlParameter("@ManagerId", ManagerId);
            //p[6] = new SqlParameter("@PatientId", PatientId);
             SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "sp_ConfirmApmt12", p);
             return p[1].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string CancelApmt()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@ApmtId", ApmtId);
            p[1] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[1].Direction = ParameterDirection.Output;            
          
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "sp_CancelApmt", p);
            return p[1].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public string UpdatePrescription()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@PatientId",PatientId);
            p[1] = new SqlParameter("@NewPresc",NewPresc);
            p[2] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[2].Direction = ParameterDirection.Output;
            p[3] = new SqlParameter("@DoctorId", DoctorId);
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "sp_UpdatePrescription", p);
            return p[2].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetPrescriptionsByPatientId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@PatientId",PatientId);
          return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetPrescriptionsByPatientId", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
}
