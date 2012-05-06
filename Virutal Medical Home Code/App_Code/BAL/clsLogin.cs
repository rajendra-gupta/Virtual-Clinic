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
/// Summary description for clsLogin
/// </summary>
public class clsLogin
{
	public clsLogin()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string UserName { get; set; }
    public static string Password { get; set; }
    public static string Role { get; set; }
   
    public static int EmpId { get; set; }
    public static int UserId { get; set; }

    public int RegUserId { get; set; }
    public string OldPwd { get; set; }
    public string NewPwd { get; set; }
    public string ConfirmPwd { get; set; }
    public string Email { get; set; }
    public string Address { get; set; }
    public string PhoneNo { get; set; }
    public byte[] Image { get; set; }
    public string FileName { get; set; }
    public static int PatientId { get; set; }
    public static int DoctorId { get; set; }

    public static string GetUserLogin(out int Id)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[4];

            p[0] = new SqlParameter("@UserName", UserName);
            p[1] = new SqlParameter("@Password", Password);
            p[2] = new SqlParameter("@Role", SqlDbType.VarChar, 20);
            p[2].Direction = ParameterDirection.Output;
            p[3] = new SqlParameter("@UserId", SqlDbType.Int);
            p[3].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "spLoginChecking", p);
            Id = Convert.ToInt32(p[3].Value);
            return p[2].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public string ChangePassword()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@OldPwd", OldPwd);
            p[1] = new SqlParameter("@NewPwd", NewPwd);
            p[2] = new SqlParameter("@ConfirmPwd", ConfirmPwd);
            p[3] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[3].Direction = ParameterDirection.Output;
            p[4] = new SqlParameter("@UserId", RegUserId);
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "sp_ChangePassword", p);
            return p[3].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetUserDetails()
    {
        try
        {
            string str = "select * from tbl_UserRegistration where UserId=" + this.RegUserId;
           return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.Text,str );
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public string UpdateProfile()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[7];
            p[0] = new SqlParameter("@UserId", RegUserId);
            p[1] = new SqlParameter("@PhoneNo", PhoneNo);
            p[2] = new SqlParameter("@Email", Email);
            p[3] = new SqlParameter("@Image", Image);
            p[4] = new SqlParameter("@FileName", FileName);
            p[5] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[5].Direction = ParameterDirection.Output;
            p[6] = new SqlParameter("@Address", Address);
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "sp_UpdateProfile", p);
            return p[5].Value.ToString();

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public static int GetAdminIdByUserId(int intUserId)
    {
        try
        {
            string str = "select UserId as AdminId from tbl_UserRegistration where Role='Admin' and UserId=" + intUserId;

            int Id = Convert.ToInt32(SqlHelper.ExecuteScalar(clsConnection.Connection, CommandType.Text, str));
            return Id;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public static int GetDoctorIdByUserId(int intUserId)
    {
        try
        {
            string str = "select UserId as DoctorId from tbl_UserRegistration where Role='Doctor' and UserId=" + intUserId;

            int Id = Convert.ToInt32(SqlHelper.ExecuteScalar(clsConnection.Connection, CommandType.Text, str));
            return Id;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static int GetManagerIdByUserId(int intUserId)
    {
        try
        {
            string str = "select UserId as ManagerId from tbl_UserRegistration where Role='Manager' and UserId=" + intUserId;

            int Id = Convert.ToInt32(SqlHelper.ExecuteScalar(clsConnection.Connection, CommandType.Text, str));
            return Id;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static int GetPatientIdByUserId(int intUserId)
    {
        try
        {
            string str = "select UserId as PatientId from tbl_UserRegistration where Role='Patient' and UserId=" + intUserId;

            int Id = Convert.ToInt32(SqlHelper.ExecuteScalar(clsConnection.Connection, CommandType.Text, str));
            return Id;
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetOnlineAdminData()
    {
        try
        {
            //SqlParameter[] p = new SqlParameter[1];
            //p[1] = new SqlParameter("@Admin", SqlDbType.VarChar, 50);
            //p[1].Direction = ParameterDirection.Output;
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetOnlineAdminData");
            
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetOnlineDoctorsData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetOnlineDoctorsData");
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetOnlineDoctorsDataByPatient()
    {
        try
        {
            SqlParameter p = new SqlParameter("@PatientId", PatientId);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetOnlineDoctorsDataByPatient", p);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetOnlinePatientDataByDoctor()
    {
        try
        {
            SqlParameter p = new SqlParameter("@DoctorId", DoctorId);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetOnlinePatientDataByDoctor", p);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static DataSet GetOnlinePatientsData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetOnlinePatientsData");
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public static DataSet GetOnlineManagersData()
    {
        try
        {
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetOnlineManagersData");
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static void ActiveAdminOnlineStatus(int Id)
    {
        try
        {
            string str = "Update tbl_OnlineAdmin set [status]=1 where AdminId=" + Id;
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static void InActiveAdminOnlineStatus(int Id)
    {
        try
        {
            string str = "Update tbl_OnlineAdmin set [status]=0 where AdminId=" + Id;
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
     public static void ActiveDoctorOnlineStatus(int Id)
    {
        try
        {
            string str = "Update tbl_OnlineDoctors set [status]=1 where DoctorId=" + Id;
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public static void InActiveDoctorOnlineStatus(int Id)
    {
        try
        {
            string str = "Update tbl_OnlineDoctors set [status]=0 where DoctorId=" + Id;
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public static void ActivePatientOnlineStatus(int Id)
    {
        try
        {
            string str = "Update tbl_OnlinePatients set [status]=1 where PatientId=" + Id;
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public static void InActivePatientOnlineStatus(int Id)
    {
        try
        {
            string str = "Update tbl_OnlinePatients set [status]=0 where PatientId=" + Id;
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public static void ActiveManagerOnlineStatus(int Id)
    {
        try
        {
            string str = "Update tbl_OnlineManagers set [status]=1 where ManagerId=" + Id;
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public static void InActiveManagerOnlineStatus(int Id)
    {
        try
        {
            string str = "Update tbl_OnlineManagers set [status]=0 where ManagerId=" + Id;
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.Text, str);
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

}



