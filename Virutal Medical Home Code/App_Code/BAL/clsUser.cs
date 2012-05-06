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
/// Summary description for clsUser
/// </summary>
public class clsUser
{
	public clsUser()
	{
		//
		// TODO: Add constructor logic here
		//
	}
   
    public string FirstName { get; set; }
    public string MiddleName { get; set; }
    public string LastName { get; set; }
    public string Email { get; set; }
    public string Address { get; set; }
    public string PhoneNo { get; set; }
    public int UserId { get; set; }
    public string UserName { get; set; }
    public string Password { get; set; }
    public DateTime DOB { get; set; }
    public byte[] Image { get; set; }
    public string FileName { get; set; }
    public DateTime DOR { get; set; }
    public string Role { get; set; }
    public string Specialization { get; set; }
    public string Qualification { get; set; }
    public string FromTime { get; set; }
    public string ToTime { get; set; }
    public string Experience { get; set; }
    public string BloodGroup { get; set; }
    public int Height { get; set; }
    public string Disease { get; set; }
    public string Gender { get; set; }

    public int PatientId { get; set; }


    public string InsertUserRegistration()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[22];
            p[0] = new SqlParameter("@UserName", UserName);
            p[1] = new SqlParameter("@Password", Password);
            p[2] = new SqlParameter("@FirstName", FirstName);
            p[3] = new SqlParameter("@MiddleName", MiddleName);
            p[4] = new SqlParameter("@LastName", LastName);
            p[5] = new SqlParameter("@Email", Email);
            p[6] = new SqlParameter("@Address", Address);
            p[7] = new SqlParameter("@Phone", PhoneNo);
            p[8] = new SqlParameter("@DOB", DOB);
            p[9] = new SqlParameter("@DOR", DOR);
            p[10] = new SqlParameter("@Image", Image);
            p[11] = new SqlParameter("@FileName", FileName);
            p[12] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[12].Direction = ParameterDirection.Output;
            p[13] = new SqlParameter("@Role", Role);
            p[14] = new SqlParameter("@Special", Specialization);
            p[15] = new SqlParameter("@Qual", Qualification);
            p[16] = new SqlParameter("@FromTime", FromTime);
            p[17] = new SqlParameter("@ToTime", ToTime);
            p[18] = new SqlParameter("@Experience", Experience);
            //p[19] = new SqlParameter("@Height", Height);
            p[19] = new SqlParameter("@Blood", BloodGroup);
            p[20] = new SqlParameter("@Disease", Disease);
            p[21] = new SqlParameter("@Gender", Gender);
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "sp_InsertUserRegistration", p);
            return p[12].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet GetLabReportsByPatientId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@PatientId", PatientId);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetLabReportsByPatientId", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetPatients()
    {
        try
        {
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetPatients", null);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
}
