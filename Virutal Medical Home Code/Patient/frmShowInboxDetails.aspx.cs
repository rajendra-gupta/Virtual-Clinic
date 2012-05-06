using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Admin_frmShowInboxDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            DataSet ds = Cls_EmailMaster.ShowEmailDetailsidwiseInbox(Convert.ToInt32(Request["id"]));
            if (ds.Tables[0].Rows.Count != 0)
            {
                GridInboxdetails.DataSource = ds.Tables[0];
                GridInboxdetails.DataBind();
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
    protected void GridInboxdetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            DataSet ds = Cls_EmailMaster.ShowEmailDetailsidwiseInbox(Convert.ToInt32(e.CommandArgument));
            if (ds.Tables[0].Rows.Count != 0)
            {
                byte[] FileContent = (byte[])ds.Tables[0].Rows[0][5];
                string FileName = (string)ds.Tables[0].Rows[0][6];
                string[] fileSplit = FileName.Split('.');
                int Loc = fileSplit.Length;
                string FileExtention = "." + fileSplit[Loc - 1].ToUpper();

                int i = 0;
                if (FileExtention == ".DOC" || FileExtention == ".DOCX")
                {
                    Response.ContentType = "application/vnd.ms-word";
                    Response.AddHeader("content-disposition", "inline;filename=" + FileName);
                    i = 1;
                }
                else if (FileExtention == ".XL" || FileExtention == ".XLS" || FileExtention == ".XLSX")
                {
                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("content-disposition", "inline;filename=" + FileName);
                    i = 1;
                }
                else if (FileExtention == ".PDF")
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "inline;filename=" + FileName);
                    i = 1;
                }
                else if (FileExtention == ".TXT")
                {
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("content-disposition", "inline;filename=" + FileName);
                    i = 1;
                }
                if (i == 1)
                {
                    Response.Charset = "";
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.BinaryWrite(FileContent);
                    Response.End();
                }
                else
                    lblMsg.Text = "Problom in downloading the file..";

            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }

}
