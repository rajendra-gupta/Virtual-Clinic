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

public partial class Admin_frmOutBoxMails : System.Web.UI.Page
{
    Cls_EmailMaster objEmailMaster = new Cls_EmailMaster();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["ManagerId"] != null)
            {

            }
            Getdata();
        }
    }
    protected void cmdAll_Click(object sender, EventArgs e)
    {
        Cleardata();
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox status = (CheckBox)row.FindControl("chk1");
            Label l1 = (Label)row.FindControl("lblReadstatus");
            status.Checked = false;
            if (l1.Text == "True")
            {
                status.Checked = true;
                row.BackColor = System.Drawing.Color.Yellow;
            }

            else
            {
                row.BackColor = System.Drawing.Color.White;
            }

        }

    }
    protected void CheckAll_Click(object sender, EventArgs e)
    {
        Cleardata();
        foreach (GridViewRow gv in GridView1.Rows)
        {
            CheckBox ch = new CheckBox();
            ch = (CheckBox)gv.FindControl("chk1");
            ch.Checked = true;
            if (ch.Checked == true)
            {
                gv.BackColor = System.Drawing.Color.Yellow;
            }
        }

    }
    protected void UncheckAll_Click(object sender, EventArgs e)
    {
        int i = 0;
        Cleardata();
        foreach (GridViewRow gv in GridView1.Rows)
        {
            CheckBox ch = new CheckBox();
            ch = (CheckBox)gv.FindControl("chk1");
            ch.Checked = false;
            if (ch.Checked == false)
            {
                if (i == 0)
                {
                    gv.BackColor = System.Drawing.Color.White;
                    i = 1;
                }
                else if (i == 1)
                {
                    gv.BackColor = System.Drawing.Color.WhiteSmoke;
                    i = 0;
                }


            }
        }

    }
    protected void cmdDelete_Click(object sender, EventArgs e)
    {
        int i = 0;
        Cleardata();
        try
        {
            foreach (GridViewRow item in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)item.FindControl("chk1");


                if (chk.Checked)
                {
                    Label id = (Label)item.FindControl("lblid");
                    Cls_EmailMaster.UpdateEmailDeleteStatusOutbox(Convert.ToInt32(id.Text));
                    lblMsg.Text = "";
                    lblMsg.Visible = false;
                    i = 1;
                }
                else if (i == 0)
                {
                    lblMsg.Text = "Please Atleast One record is Selected..";
                    lblMsg.Visible = true;
                }

            }
            if (i == 1)
            {
                lblMsg.Text = "The conversation has been Delete the Record..";
                lblMsg.Visible = true;
            }
            Getdata();

        }


        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }

    public void Getdata()
    {
        try
        {
            GridView1.DataSource = Cls_EmailMaster.ShowOutboxdetails(Convert.ToInt32(Session["ManagerId"]));
            GridView1.DataBind();
            //  lblMsg.Text = "";
        }
        catch (Exception ex)
        {

            //  lblMsg.Text = ex.Message;
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label l1 = (Label)e.Row.FindControl("lblReadstatus");
                LinkButton link1 = (LinkButton)e.Row.FindControl("linkSendername");
                LinkButton link2 = (LinkButton)e.Row.FindControl("linksubject");
                LinkButton link3 = (LinkButton)e.Row.FindControl("linkDate");
                if (l1.Text == "True")
                {
                    link1.Font.Bold = false;
                    link2.Font.Bold = false;
                    link3.Font.Bold = false;

                }
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.RowStyle.BackColor = System.Drawing.Color.WhiteSmoke;
            GridView1.AlternatingRowStyle.BackColor = System.Drawing.Color.White;
            Getdata();
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }


    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {

        GridView1.SelectedRow.BackColor = System.Drawing.Color.Yellow;
    }

    protected void Chk_Changed(object sender, EventArgs e)
    {
        //Cleardata();

        //try
        //{
        //    foreach (GridViewRow gv in GridView1.Rows)
        //    {
        //        CheckBox ch = new CheckBox();
        //        ch = (CheckBox)gv.FindControl("chk1");
        //        if (ch.Checked == true)
        //        {

        //            GridView1.SelectedRowStyle.BackColor = System.Drawing.Color.Yellow;
        //        }

        //    }
        //}
        //catch (Exception ex)
        //{

        //    lblError.Text = ex.Message;
        //}



    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        // GridView1.SelectedRowStyle.BackColor = System.Drawing.Color.Yellow;
    }
    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EmailId")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("frmShowOutBoxDetails.aspx?id=" + id);
        }
    }
    protected void CmdUnRead_Click(object sender, EventArgs e)
    {
        Cleardata();
        try
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox status = (CheckBox)row.FindControl("chk1");
                Label l1 = (Label)row.FindControl("lblReadstatus");
                status.Checked = false;
                if (l1.Text == "False")
                {
                    status.Checked = true;
                    row.BackColor = System.Drawing.Color.Yellow;
                }

                else
                {
                    row.BackColor = System.Drawing.Color.White;

                }

            }

        }
        catch (Exception ex)
        {

            lblError.Text = ex.Message;
        }

    }
    public void Cleardata()
    {
        lblError.Text = "";
        lblMsg.Text = "";
    }
}
