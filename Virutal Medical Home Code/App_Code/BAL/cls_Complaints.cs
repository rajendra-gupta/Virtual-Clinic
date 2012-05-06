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
/// Summary description for cls_Complaints
/// </summary>
public class cls_Complaints
{
	public cls_Complaints()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int ComplaintId  { get; set; }
    public int ComplainerId { get; set; }
    public int ComplaineeId { get; set; }
    public string Complaint { get; set; }
    public DateTime Date    { get; set; }


    public string InsertComplaint()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("ComplainerId", ComplainerId);//patient
            p[1] = new SqlParameter("@ComplaineeId", ComplaineeId);
            p[2] = new SqlParameter("@Complaint", Complaint);            
            p[3] = new SqlParameter("@Message", SqlDbType.VarChar, 250);
            p[3].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "sp_InsertComplaints", p);
            return p[3].Value.ToString();
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetComplaints()
    {
        try
        {
            
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetComplaints",null);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
    public int SendComplaints()
    {
        try
        {
            string str="update tbl_ComplaintsMaster set Comp_Status='Process' where ComplaintId="+ComplaintId;

            return SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.Text,str);
           
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetResponses()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@PatientId", ComplainerId);
            return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.StoredProcedure, "sp_GetResponses", p);
        }
        catch (Exception ex)
        {

            throw new ArgumentException(ex.Message);
        }
    }
}
