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
/// Summary description for clsManager
/// </summary>
public class clsManager
{
	public clsManager()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string Reply { get; set; }
    public int ManagerId { get; set; }
    public int ComplaintId { get; set; }
    public DateTime Date { get; set; }
    public int ReceiverId { get; set; }
    public DateTime FromDate { get; set; }
    public DateTime ToDate { get; set; }


    public DataSet GetComplaintsByManagerId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ManagerId", ManagerId);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetComplaintsByManagerId", p);
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
    public DataSet GetFeedBackByReceiverId()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ReceiverId", ReceiverId);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetFeedBackByReceiverId", p);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetPatientsByDate()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@FromDate", FromDate);
            p[1] = new SqlParameter("@ToDate", ToDate);
            
           return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetPatientsByDate", p);
            
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
}
