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
using System.IO;
using System.Data.Common;

public partial class UserControls_BrowseDocFile : System.Web.UI.UserControl
{
    #region for privte fields
    string strImageType = string.Empty;
    byte[] FileData = null;

    #endregion

    #region  for page load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
        }
        lblMessage.Text = "";
    }
    #endregion

    #region for public utility class
    public class UIUtilities
    {

        #region ReadFile to Convert Binary
        /// <summary>
        /// Get the Uploaded file and convert to binary for storing in Db
        /// </summary>
        /// <param name="PostedFileName">Uploaded file</param>
        /// <returns>Byte[] object</returns>
        public static byte[] ReadFile(string PostedFileName, string[] filetype)
        {
            bool isAllowedFileType = false;
            try
            {
                FileInfo file = new FileInfo(PostedFileName);

                foreach (string strExtensionType in filetype)
                {
                    if (strExtensionType.ToUpper() == file.Extension.ToUpper())
                    {
                        isAllowedFileType = true;
                        break;
                    }
                }
                if (isAllowedFileType)
                {
                    //Create a new filestream object based on the file chosen in the FileUpload control

                    FileStream fs = new FileStream(PostedFileName, FileMode.Open, FileAccess.Read);

                    //Create a binary reader object to read the binary contents of the file to upload

                    BinaryReader br = new BinaryReader(fs);

                    //dump the bytes read into a new byte variable named image

                    byte[] filecontent = br.ReadBytes((int)fs.Length);

                    //close the binary reader

                    br.Close();

                    //close the filestream

                    fs.Close();

                    return filecontent;
                }
                return null;
            }
            catch (Exception ex)
            {
                throw new ArgumentException("File Not Supporting to upload" + ex);
            }

        }
        #endregion

        #region GetTempFolderName
        /// <summary>
        /// returns the Temp Folder Name to store Images & resumes
        /// </summary>
        /// <returns>string Folder Name</returns>
        public static string GetTempFolderName()
        {
            string strTempFolderName = Environment.GetFolderPath(Environment.SpecialFolder.InternetCache) + @"\";

            if (Directory.Exists(strTempFolderName))
            {
                return strTempFolderName;
            }
            else
            {
                Directory.CreateDirectory(strTempFolderName);
                return strTempFolderName;
            }
        }
        #endregion
        #region Code For Converting Varformat to Image format

        public static string LoadImage(byte[] photoByte, string FileName)
        {
            string strFileName = null;
            if (photoByte != null && photoByte.Length > 1)
            {
                System.Drawing.Image newImage;

                //get the temporary internet folder path of the system to store the image file
                strFileName = UIUtilities.GetTempFolderName() + FileName;    //PhotoExtension;

                //write the binary data to memory stream 
                using (MemoryStream stream = new MemoryStream(photoByte))
                {
                    newImage = System.Drawing.Image.FromStream(stream);
                    //save the image file to temporary folder
                    newImage.Save(strFileName);
                }
            }
            return strFileName;
        }
        #endregion



    }
    #endregion

    #region for btn Show event
    protected void btnShowImg_Click(object sender, EventArgs e)
    {
        Session["DocFileContent"] = null;
        Session["DocFileName"] = null;
        HttpPostedFile postFile = this.Upload1.PostedFile;
        string strFileName = this.Upload1.FileName;
        try
        {
            if (this.Upload1.PostedFile != null)
            {

                //Check the selection of file
                if (string.IsNullOrEmpty(postFile.FileName))
                    lblMessage.Text = "Please select a file to Attach";
                else
                {
                    //Get binary value of the image file
                    FileData = UIUtilities.ReadFile(postFile.FileName, new string[] { ".doc", ".docx" });
                    if (FileData == null)
                    {
                        lblMessage.Text = "Word Documents Only Allowed.";
                    }
                    else
                    {
                        //persist the extension of the selected image file
                        //this.Page.RegisterHiddenField("hdnPhoto", Path.GetExtension(postFile.FileName));
                        if (Session["DocFileName"] == null)
                            Session.Add("DocFileName", strFileName);
                        else
                            Session["DocFileName"] = strFileName;
                        if (Session["DocFileContent"] == null)
                            Session.Add("DocFileContent", FileData);
                        else
                            Session["DocFileContent"] = FileData;
                        lblMessage.Text = "File Attached";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
    }
    #endregion
}
