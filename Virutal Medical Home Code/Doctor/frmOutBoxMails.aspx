﻿<%@ Page Language="C#" MasterPageFile="~/Doctor/DoctorMasterPage.master" AutoEventWireup="true" CodeFile="frmOutBoxMails.aspx.cs" Inherits="Admin_frmOutBoxMails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="javascript" >
    function HighlightRow(chkB) 
{
var IsChecked = chkB.checked;    

if(IsChecked)
{
  chkB.parentElement.parentElement.parentElement.style.backgroundColor = 'Yellow';

    }
     else 
     
     {

    chkB.parentElement.parentElement.parentElement.style.backgroundColor = 'white';

    }


}




    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <table border="0" cellpadding="0" cellspacing="0" height="100%" style="font-size: 0.8em;
            font-family: Microsoft Sans Serif" width="100%">
            <tr>
                <td height="20" style="width: 749px">
                </td>
            </tr>
            <tr style="color: #000000">
                <td style="width: 749px; height: 665px;" valign="top">
                   
                    <table>
                        <tr>
                            <td valign="top">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="22" style="width: 5px">
                                            <img alt="" border="0" height="22" src="../Images/form_tab_start_off.gif" width="5" /></td>
                                        <td background="../Images/tbl_haut.gif">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td background="../Images/form_tab_bg_off.gif" class="form_tab_off" style="padding-left: 15px">
                                                        <a class="A_Tab" href="http://www.aceproject.com/demo/server01/Inbox.asp"><span style="color: #000000">
                                                            <asp:LinkButton ID="LinkButton3" runat="server" Font-Bold="True" ForeColor="#004E60"
                                                                PostBackUrl="~/Doctor/frmInboxMails.aspx" Font-Names="Microsoft Sans Serif" 
                                                            Font-Size="8pt">Inbox</asp:LinkButton></span></a></td>
                                                    <td style="color: #000000">
                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <img alt="" border="0" height="22" src="../Images/form_tab_btw_off_on.gif"
                                                                        width="25" /></td>
                                                                <td background="EditMessage_files/form_tab_bg_off.gif" class="form_tab_off" style="background-image: url(../Images/form_tab_bg_on.gif)">
                                                                    <a class="A_Tab" href="http://www.aceproject.com/demo/server01/SentMessages.asp"><span
                                                                        style="color: #000000">
                                                                        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" ForeColor="#004E6D"
                                                                            PostBackUrl="~/Doctor/frmOutBoxMails.aspx" 
                                                                        Font-Names="Microsoft Sans Serif" Font-Size="8pt">Outbox</asp:LinkButton></span></a></td>
                                                                <td style="color: #000000">
                                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td style="height: 21px">
                                                                                <img alt="" border="0" height="22" src="../Images/form_tab_btw_on_off.gif"
                                                                                    width="25" /></td>
                                                                            <td background="EditMessage_files/form_tab_bg_on.gif" class="form_tab_on" style="background-image: url(../Images/form_tab_bg_off.gif); height: 21px;">
                                                                                <a class="A_Tab" href="http://www.aceproject.com/demo/server01/EditMessage.asp" name="onglet">
                                                                                    <span style="color: #000000">
                                                                                        <asp:LinkButton ID="LinkButton2" runat="server" Font-Bold="True" ForeColor="#004E60"
                                                                                            PostBackUrl="~/Doctor/frmComposeMail.aspx" 
                                                                                    Font-Names="Microsoft Sans Serif" Font-Size="8pt">Compose</asp:LinkButton></span></a></td>
                                                                            <td style="color: #000000; height: 21px;">
                                                                                <img alt="" border="0" height="22" src="../Images/form_tab_end_off.gif" width="25" /></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <!--  onglets -->
                                        </td>
                                        <td height="22" width="5">
                                            <img alt="" border="0" height="22" src="../Images/tbl_haut_d.gif" width="5" /></td>
                                    </tr>
                                    
                                    
                                </table>
                            </td>
                        </tr>
                        <tr>
                                                        <td align="center">
                                                        <asp:Label ID="lblMsg" runat="server" 
                                                                
                                                                style="color: #003300; font-family: Arial; font-size: medium; background-color: #00CC00; font-weight: 700;"></asp:Label>
                                                        </td>
                                                        </tr>
                        <tr>
                                                                <td style="height: 368px; background-color: whitesmoke">
                                                                    <!-- group info -->

                                                                    <br />
                                                                    <br />
                                                                    <asp:Button ID="cmdAll" runat="server" OnClick="cmdAll_Click" Text="Read " Font-Bold="True"
                                                                        Font-Names="Microsoft Sans Serif" Font-Size="8pt" ForeColor="Desktop" BackColor="White"
                                                                        BorderColor="#404040" BorderStyle="Outset" BorderWidth="1px" Height="20px" 
                                                                        Width="79px" />
                                                                    &nbsp;&nbsp; &nbsp;
                                                                    <asp:Button ID="CmdUnRead" runat="server"  Text="Un Read " Font-Bold="True"
                                                                        Font-Names="Microsoft Sans Serif" Font-Size="8pt" ForeColor="Desktop" BackColor="White"
                                                                        BorderColor="#404040" BorderStyle="Outset" BorderWidth="1px" Height="20px" 
                                                                        Width="79px" onclick="CmdUnRead_Click" />
                                                                    &nbsp;&nbsp; &nbsp;
                                                                    <asp:Button ID="CheckAll" runat="server" OnClick="CheckAll_Click"
                                                                        Text="Check All" Font-Bold="True" Font-Names="Microsoft Sans Serif" Font-Size="8pt"
                                                                        ForeColor="Desktop" BackColor="White" BorderColor="#404040" BorderStyle="Outset"
                                                                        BorderWidth="1px" Height="21px" Width="72px" />&nbsp; <span style="font-size: 8pt">&nbsp;&nbsp;
                                                                        </span>
                                                                    <asp:Button ID="UncheckAll" runat="server" OnClick="UncheckAll_Click" Text="Uncheck All"
                                                                        Font-Bold="True" Font-Names="Microsoft Sans Serif" Font-Size="8pt" ForeColor="Desktop"
                                                                        BackColor="White" BorderColor="#404040" BorderStyle="Outset" BorderWidth="1px"
                                                                        Height="20px" Width="100px" />&nbsp;&nbsp;&nbsp; &nbsp;
                                                                        <asp:Button ID="cmdDelete"
                                                                            runat="server" BackColor="White" BorderColor="#404040" BorderStyle="Outset" BorderWidth="1px"
                                                                            Font-Bold="True" Font-Italic="False" ForeColor="Desktop" Height="20px" OnClick="cmdDelete_Click"
                                                                            Text="Delete" Width="74px" />
                                                                    &nbsp;
                                                                    <table border="0" width="100%">
                                                                        <tr>
                                                                            <td valign="top">
                                                                                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                                                                        BackColor="White" CellPadding="4" CellSpacing="1" 
                                                                                   
                                                                                        EmptyDataText="No messages at all. " ForeColor="#333333" 
                                                                                    GridLines="None" Height="132px"
                                                                                         Width="752px" Font-Bold="False"
                                                                                        Font-Names="Microsoft Sans Serif" Font-Size="8pt" Font-Underline="False"
                                                                                        BorderColor="Desktop" BorderStyle="Outset" BorderWidth="1px" 
                                                                                        ShowFooter="True" AllowPaging="True" 
                                                                                        onrowdatabound="GridView1_RowDataBound" 
                                                                                        onpageindexchanging="GridView1_PageIndexChanging" PageSize="12" 
                                                                                        onselectedindexchanging="GridView1_SelectedIndexChanging" 
                                                                                        onrowcommand="GridView1_RowCommand1" onrowcreated="GridView1_RowCreated">
                                                                                        <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPrevious" 
                                                                                            NextPageText="Next" PreviousPageText="Previous" />                                                                                            
                                                                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                                        <EmptyDataRowStyle BackColor="Desktop" BorderColor="Snow" BorderStyle="Solid" BorderWidth="1px"
                                                                                            Font-Bold="True" ForeColor="Snow" />
                                                                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Right" />
                                                                                        <Columns>
                                                                                            <asp:TemplateField ControlStyle-Width="5%" HeaderStyle-Width="5%">
                                                                                                <HeaderTemplate>
                                                                                                    Select
                                                                                                </HeaderTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <asp:CheckBox ID="chk1" runat="server" onclick="javascript:HighlightRow(this);"   />
                                                                                                </ItemTemplate>
                                                                                                <ControlStyle Width="5%"></ControlStyle>
                                                                                                <HeaderStyle Width="5%" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField ControlStyle-Width="20%" HeaderText="SenderName">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="linkSendername" Font-Bold="true" ForeColor="Black" runat="server"
                                                                                                        Text='<%#Eval("UserName") %>' CommandArgument='<%#Eval("EmailId") %>' CommandName="EmailId"></asp:LinkButton>
                                                                                                    <asp:Label ID="lblReadstatus" runat="server" Text='<%#Eval("EmailReadStatus") %>'
                                                                                                        Visible="false"></asp:Label>
                                                                                                    <asp:Label ID="lblid" runat="server" Text='<%#Eval("EmailId") %>' Visible="false"></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ControlStyle Width="20%"></ControlStyle>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField ControlStyle-Width="60%" ItemStyle-Width="60%" HeaderText="Subject">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="linksubject" Font-Bold="true" ForeColor="Black" runat="server"
                                                                                                        Text='<%#Eval("emailsubjecttext") %>' CommandArgument='<%#Eval("EmailId") %>' CommandName="EmailId" Width="100%"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <ControlStyle Width="60%"></ControlStyle>
                                                                                                <ItemStyle Width="60%" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField ControlStyle-Width="15%" HeaderText="Date">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="linkDate" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Date") %>'
                                                                                                        CommandArgument='<%#Eval("EmailId") %>' CommandName="EmailId"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <ControlStyle Width="15%"></ControlStyle>
                                                                                            </asp:TemplateField>
                                                                                        </Columns>
                                                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                                        <EditRowStyle BackColor="#999999" />
                                                                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle BackColor="#284775" ForeColor="White" Font-Bold="true" Font-Size="Medium" HorizontalAlign="Right" />
                                                                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                                    </asp:GridView>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <br />
                                                                    <table>
                                                                        <tr>
                                                                            <td align="center">
                                                                            <asp:Label ID="lblError" runat="server" style="font-size: x-small; color: #FF3300"></asp:Label>
                                                                               </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                    </table>
                    <p>
                        <br />
                    </p>
                    <table border="0" width="100%">
                        <tr>
                            <td align="left" style="width: 460px; height: 20px">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="15" style="width: 749px" valign="bottom">
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

