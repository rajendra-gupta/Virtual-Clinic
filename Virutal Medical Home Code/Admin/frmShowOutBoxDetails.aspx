﻿<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true"
    CodeFile="frmShowOutBoxDetails.aspx.cs" Inherits="Admin_frmShowOutBoxDetails"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" height="100%" style="font-size: 0.8em;
            font-family: MS Sans Serif" width="100%">
            <tr>
                <td height="20">
                    
                </td>
            </tr>
            <tr style="color: #000000">
                <td valign="top">
                    <br />
                    <table width="579">
                        <tr>
                            <td valign="top" style="width: 566px">
                                <table border="0" cellpadding="0" cellspacing="0" width="576">
                                    <tr>
                                        <td height="22" width="5">
                                            <img alt="" border="0" height="22" src="../Images/form_tab_start_off.gif" width="5" />
                                        </td>
                                        <td background="../Images/tbl_haut.gif" width="566">
                                            <!--  onglets -->
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td background="../Images/form_tab_bg_off.gif" class="form_tab_off" style="padding-left: 15px">
                                                        <span style="color: #000000">
                                                            <asp:LinkButton ID="LinkButton3" runat="server" Font-Bold="True" ForeColor="#004E69"
                                                                PostBackUrl="~/Admin/frmInboxMails.aspx" Font-Names="Microsoft Sans Serif" Font-Size="8pt">Inbox</asp:LinkButton></span>
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
                                                                        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" ForeColor="#004E67"
                                                                            PostBackUrl="~/Admin/frmOutBoxMails.aspx" Font-Names="Microsoft Sans Serif" Font-Size="8pt">Outbox</asp:LinkButton></span></a>
                                                                </td>
                                                                <td style="color: #000000">
                                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td>
                                                                                <img alt="" border="0" height="22" src="../Images/form_tab_btw_off_off.gif" width="25" />
                                                                            </td>
                                                                            <td background="../Images/form_tab_bg_off.gif" class="form_tab_off">
                                                                                <a class="A_Tab" href="http://www.aceproject.com/demo/server01/EditMessage.asp">
                                                                                    <asp:LinkButton ID="LinkButton2" runat="server" Font-Bold="True" ForeColor="#004566"
                                                                                        PostBackUrl="~/Admin/frmComposeMail.aspx" Font-Names="Microsoft Sans Serif" Font-Size="8pt">Compose</asp:LinkButton></a>
                                                                            </td>
                                                                            <td>
                                                                                <img alt="" border="0" height="22" src="../Images/form_tab_end_off.gif" width="25" />
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
                                        <td height="22" width="5">
                                            <img alt="" border="0" height="22" src="../Images/tbl_haut_d.gif" width="5" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td background="../Images/tbl_g.gif" width="5" style="height: 480px">
                                        </td>
                                        <td class="form_bgcolor" style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px;
                                            padding-top: 10px; background-color: whitesmoke; height: 480px;" width="546">
                                            <!-- 2 columns form -->
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="width: 454px; background-color: whitesmoke" valign="top">
                                                        <!-- column 1 -->
                                                        <!-- group start -->
                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td style="width: 457px">
                                                                    <!-- group info -->
                                                                    <br />
                                                                    &nbsp; &nbsp;&nbsp;
                                                                    <%--            <asp:Button ID="BtnReply" runat="server" Text="Reply" OnClick="BtnReply_Click" Width="54px" Font-Names="Microsoft Sans Serif" Font-Size="8pt" ForeColor="#004769" BackColor="White" BorderColor="#404040" BorderStyle="Outset" BorderWidth="1px" Font-Bold="True" />
                                                                        &nbsp;<asp:Button ID="BtnForword" runat="server" Text="Forword" OnClick="BtnForword_Click" Font-Names="Microsoft Sans Serif" Font-Size="8pt" ForeColor="#004769" BackColor="White" BorderColor="#404040" BorderStyle="Outset" BorderWidth="1px" Font-Bold="True" />
                                                                        &nbsp; &nbsp;&nbsp;<asp:Button ID="BtnDelete" runat="server" Text="Delete" OnClick="BtnDelete_Click" Font-Names="Microsoft Sans Serif" Font-Size="8pt" ForeColor="#004769" BackColor="White" BorderColor="#404040" BorderStyle="Outset" BorderWidth="1px" Font-Bold="True" />--%><br />
                                                                    &nbsp;
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:GridView ID="GridInboxdetails" Width="100%" runat="server" CellPadding="4" ForeColor="#333333"
                                                                                    GridLines="None" AutoGenerateColumns="False" OnRowCommand="GridInboxdetails_RowCommand"
                                                                                    ShowFooter="True">
                                                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                                    <EditRowStyle BackColor="#999999" />
                                                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                                    <Columns>
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <table style="text-align: left">
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            Subject :
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:Label ID="txtSubject" Text='<%#Eval("emailsubjecttext") %>' runat="server" Width="350px"></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            Date :
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:Label ID="txtDate" Text='<%#Eval("Emaildate") %>' runat="server" Width="350px"></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            Body :
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:TextBox ID="txtBody" runat="server" Height="100px" Text='<%#Eval("emailbodymsg") %>'
                                                                                                                TextMode="MultiLine" Width="350px"></asp:TextBox>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            Attach File :
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:LinkButton ID="linkAttach" Text='<%#Eval("EmailAttachFileName") %>' CommandArgument='<%#Eval("Emailid") %>'
                                                                                                                runat="server">
                                                                                                            </asp:LinkButton>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                <table style="text-align: left">
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <!-- back to contour -->
                                        </td>
                                        <td background="../Images/tbl_d.gif" width="5" style="height: 480px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="5" width="5">
                                            <img alt="" border="0" height="5" src="../Images/tbl_bas_g.gif" width="5" />
                                        </td>
                                        <td background="../Images/tbl_bas.gif" height="5" width="566">
                                        </td>
                                        <td height="5" width="5">
                                            <img alt="" border="0" height="5" src="../Images/tbl_bas_d.gif" width="5" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 71%">
                        <tr>
                            <td style="width: 534px">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
