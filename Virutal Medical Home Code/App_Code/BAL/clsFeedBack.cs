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
/// Summary description for clsFeedBack
/// </summary>
public class clsFeedBack
{
	public clsFeedBack()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int SenderId { get; set; }
    public int ReceiverId { get; set; }
    
    public string FeedBack { get; set; }

    public string InsertFeedBack()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0]=new SqlParameter ("@SenderId",SenderId);
            p[1]=new SqlParameter ("@ReceiverId",ReceiverId);            
            p[2]=new SqlParameter ("@Message",SqlDbType.VarChar,250);
            p[2].Direction=ParameterDirection.Output;
            p[3] = new SqlParameter("@FeedBack", FeedBack);
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "sp_InsertFeedBack", p);
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
            string str = "select * from tbl_FeedBack where ReceiverId=" + ReceiverId;
        return SqlHelper.ExecuteDataset(clsConnection.Connection, CommandType.Text,str);

        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
}
