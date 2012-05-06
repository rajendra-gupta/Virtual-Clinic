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
/// Summary description for clsReports
/// </summary>
public class clsReports
{
	public clsReports()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int PatientId { get; set; }
    public int DoctorId { get; set; }
    public int ManagerId { get; set; }
    public string Sugar { get; set; }
    public string ECG { get; set; }
    public string BloodTest { get; set; }
    public string UrineTest { get; set; }
    public DateTime Date { get; set; }
    public DateTime FromDate { get; set; }
    public DateTime ToDate { get; set; }


    public string InsertLabReports()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[8];
            p[0] = new SqlParameter("@PatientId", PatientId);
            p[1] = new SqlParameter("@DoctorId", DoctorId);
            p[2] = new SqlParameter("@Sugar", Sugar);
            p[3]=new SqlParameter ("@ECG",ECG);
            p[4] = new SqlParameter("@Blood", BloodTest);
            p[5] = new SqlParameter("@Urine", UrineTest);
            p[6] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[6].Direction = ParameterDirection.Output;
            p[7] = new SqlParameter("@ManagerId", ManagerId);
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "sp_InsertLabReports", p);
            return p[6].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetPatientsDataByDate()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@Date", Date);
           
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetPatientsDataByDate", p);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetPatientsDataByMonth()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[2];            
            p[0] = new SqlParameter("@FromDate", FromDate);
            p[1] = new SqlParameter("@ToDate", ToDate);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetPatientsDataByMonth", p);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet GetAppointmentsByDate()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@Date", Date);

            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetAppointmentsByDate", p);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetAppointmentsByMonth()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@FromDate", FromDate);
            p[1] = new SqlParameter("@ToDate", ToDate);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetAppointmentsByMonth", p);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
}
