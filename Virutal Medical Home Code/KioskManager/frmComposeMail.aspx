<%@ Page Language="C#" MasterPageFile="~/KioskManager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="frmComposeMail.aspx.cs" Inherits="Admin_frmComposeMail" Title="Untitled Page" %>

<%@ Register src="../UserControls/BrowseFile.ascx" tagname="BrowseFile" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div>
        <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
        <asp:AsyncPostBackTrigger ControlID="rdbAdmin" EventName="CheckedChanged" />
        <asp:AsyncPostBackTrigger ControlID="rdbstudent" EventName="CheckedChanged" />
        <asp:AsyncPostBackTrigger ControlID="rdbAll" EventName="CheckedChanged" />
       

        </Triggers>
        <ContentTemplate>--%>
        <table>
            <tr>
                <td valign="top">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td height="22" width="5">
                                <img alt="" border="0" height="22" src="../Images/form_tab_start_off.gif" width="5" />
                            </td>
                            <td background="../Images/tbl_haut.gif" class="style1">
                                <!--  onglets -->
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td background="../Images/form_tab_bg_off.gif" class="form_tab_off" style="padding-left: 15px">
                                            <a class="A_Tab" href="http://www.aceproject.com/demo/server01/Inbox.asp"><span style="color: #000000">
                                                <asp:LinkButton ID="LinkButton3" runat="server" Font-Bold="True" ForeColor="#004D60"
                                                    PostBackUrl="~/KioskManager/frmInboxMails.aspx" 
                                                Font-Names="Microsoft Sans Serif" Font-Size="8pt" CausesValidation="False">Inbox</asp:LinkButton></span></a>
                                        </td>
                                        <td style="color: #000000">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <img alt="" border="0" height="22" src="../Images/form_tab_btw_off_off.gif" width="25" />
                                                    </td>
                                                    <td background="../Images/form_tab_bg_off.gif" class="form_tab_off">
                                                        <a class="A_Tab" href="http://www.aceproject.com/demo/server01/SentMessages.asp"><span
                                                            style="color: #000000">
                                                            <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" ForeColor="#004760"
                                                                PostBackUrl="~/KioskManager/frmOutBoxMails.aspx" 
                                                            Font-Names="Microsoft Sans Serif" Font-Size="8pt" CausesValidation="False">Outbox</asp:LinkButton></span></a>
                                                    </td>
                                                    <td style="color: #000000">
                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td style="height: 22px">
                                                                    <img alt="" border="0" height="22" src="../Images/form_tab_btw_off_on.gif" width="25" />
                                                                </td>
                                                                <td background="../Images/form_tab_bg_on.gif" class="form_tab_on" style="height: 22px">
                                                                    <a class="A_Tab" href="http://www.aceproject.com/demo/server01/EditMessage.asp" name="onglet">
                                                                        <span style="color: #000000">
                                                                            <asp:LinkButton ID="LinkButton2" runat="server" Font-Bold="True" ForeColor="#004560"
                                                                                PostBackUrl="~/KioskManager/frmComposeMail.aspx" 
                                                                        Font-Names="Microsoft Sans Serif" Font-Size="8pt">Compose</asp:LinkButton></span></a>
                                                                </td>
                                                                <td style="color: #000000; height: 22px;">
                                                                    <img alt="" border="0" height="22" src="../Images/form_tab_end_on.gif" width="25" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td height="22" style="color: #000000; width: 20px;">
                                <img alt="" border="0" height="22" src="../Images/tbl_haut_d.gif" width="5" />
                            </td>
                        </tr>
                        <tr style="color: #000000">
                            <td background="../Images/tbl_g.gif" height="5" width="5">
                            </td>
                            <td style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; padding-top: 10px;
                                background-color: whitesmoke;" class="style1">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 112%">
                                    <tr>
                                        <td class="DataFont" style="padding-left: 4px; width: 386px">
                                            <table>
                                                <tr>
                                                    <td>
                                                        Select Emails :
                                                    </td>
                                                    <td colspan="2">
                                                        Doctor :
                                                        <asp:RadioButton ID="rdbDoctor" GroupName="rb" runat="server" AutoPostBack="True"
                                                            OnCheckedChanged="rdbDoc_CheckedChanged" />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        Manager&nbsp; :
                                                        <asp:RadioButton ID="rdbMngr" GroupName="rb" runat="server" AutoPostBack="True"
                                                            OnCheckedChanged="rdbMngr_CheckedChanged" />
                                                        <br />
&nbsp;Patient&nbsp; :
                                                        <asp:RadioButton ID="rdbPatient" GroupName="rb" runat="server" 
                                                            AutoPostBack="True" oncheckedchanged="rdbPatient_CheckedChanged"  />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        All&nbsp; :
                                                        <asp:RadioButton ID="rdbAll" GroupName="rb" runat="server" AutoPostBack="True" OnCheckedChanged="rdbAll_CheckedChanged" />

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left" valign="top">
                                                        To :
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:Panel ID="pnlsingle" runat="server">
                                                            <asp:DropDownList ID="ddlto1" runat="server" Width="350px">
                                                            </asp:DropDownList>
                                                        </asp:Panel>
                                                        <asp:Panel ID="pnlmultiple" runat="server" Visible="false">
                                                            <asp:ListBox ID="lstallItems" runat="server" Height="101px" SelectionMode="Multiple"
                                                                Width="350px">
                                                                <asp:ListItem>Select Email Id</asp:ListItem>
                                                            </asp:ListBox>
                                                        </asp:Panel>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ControlToValidate="ddlto1" ID="RequiredFieldValidator3"
                                                            runat="server" ErrorMessage="*" InitialValue="--Select EmailId--"></asp:RequiredFieldValidator>
                                                        <asp:RequiredFieldValidator ControlToValidate="lstallItems" ID="RequiredFieldValidator4"
                                                            runat="server" ErrorMessage="*" InitialValue="--Select EmailId--"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left" valign="top">
                                                        Subject :
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox ID="txtsubject" runat="server" Width="350px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ControlToValidate="txtsubject" ID="RequiredFieldValidator2"
                                                            runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left" valign="top">
                                                        Body&nbsp; :
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:TextBox ID="txtbody" runat="server" Height="120px" TextMode="MultiLine" Width="350px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ControlToValidate="txtbody" ID="RequiredFieldValidator1"
                                                            runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        &nbsp;
                                                    </td>
                                                    <td style="text-align: left">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Attachment File :
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <uc1:BrowseFile ID="BrowseFile1" runat="server" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style6" colspan="2">
                                                        fields marked with ( * ) are mandetory
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="text-align: center">
                                                        <asp:Label ID="lblMsg" runat="server" Style="font-size: small; color: #FF0000"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30" style="padding-left: 3px; width: 386px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-left: 5px; width: 386px">
                                            <!-- ***   Buttons   *** -->
                                            <asp:Button ID="BtnSend" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Outset"
                                                BorderWidth="1px" Font-Bold="True" Font-Names="Microsoft Sans Serif" Font-Size="8pt"
                                                ForeColor="#004B65" Height="23px" OnClick="BtnSend_Click" Text="Send" UseSubmitBehavior="False"
                                                Width="79px" />
                                            &nbsp;&nbsp;<asp:Button ID="BtnCancel" runat="server" BackColor="White" BorderColor="Black"
                                                BorderStyle="Outset" BorderWidth="1px" Font-Bold="True" Font-Names="Microsoft Sans Serif"
                                                Font-Size="8pt" ForeColor="#004B65" Height="23px" 
                                                OnClick="BtnCancel_Click" Text="Cancel"
                                                Width="75px" CausesValidation="False" />
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <!-- 2 columns form -->
                                <!-- back to contour -->
                            </td>
                            <%--<td background="../Images/tbl_d.gif" height="5" style="width: 20px">
                            </td>--%>
                        </tr>
                        
                    </table>
                </td>
            </tr>
        </table>
        <%-- </ContentTemplate>
             </asp:UpdatePanel>--%>
    </div>

</asp:Content>

