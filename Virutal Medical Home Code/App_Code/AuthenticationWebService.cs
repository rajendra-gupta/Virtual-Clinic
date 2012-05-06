using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using VirtualMedicalHome.DAL;

/// <summary>
/// Summary description for AuthenticationWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class AuthenticationWebService : System.Web.Services.WebService {

    public AuthenticationWebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }
    public string WSLoginChecking(string UserName, string Password)
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
            SqlHelper.ExecuteNonQuery(clsConnection.Connection, CommandType.StoredProcedure, "spLoginChecking", p);
            //Id = Convert.ToInt32(p[3].Value);
            return p[2].Value.ToString();
        }
        catch (Exception ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
}

