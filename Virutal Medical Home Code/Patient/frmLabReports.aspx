<%@ Page Language="C#" MasterPageFile="~/Patient/PatientMasterPage.master" AutoEventWireup="true" CodeFile="frmLabReports.aspx.cs" Inherits="Patient_frmLabReports" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
        }
        .style2
        {
            height: 80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
        <center>
            <br />
            <%--<asp:Label ID="lblHeading" BackColor="Window" ForeColor="#5D7B9D" 
                runat="server" Text="Company Details"
                
                Style="font-size: small; font-weight: 700; font-family: Verdana; text-decoration: underline;"></asp:Label>--%>
            <br />
            <br />
            <asp:UpdatePanel ID="panel1" runat="server">
               <Triggers>               
               
               <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
               
               <asp:AsyncPostBackTrigger ControlID="btncancel" EventName="Click" />
               </Triggers>
                <ContentTemplate>
                    <table style="border: thin solid #5D7B9D; background-color:#5D7B9D; width: 550px; ">
                        <tr>
                            <td class="style1">
                                <b>Lab Reports </b>
                            </td>
                            </tr>
                            <%--<tr>
                            <td >
                                <asp:RadioButtonList AutoPostBack="true" ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                                    RepeatDirection="Horizontal" style="color: #FFFFFF">
                                    <asp:ListItem>Add New Record
                                    </asp:ListItem>
                                    <asp:ListItem>Modify Old Record</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="text-align: left" >
                                <asp:DropDownList ID="ddlCompanyId" Enabled="False" runat="server" Height="44px"
                                    Width="120px" OnSelectedIndexChanged="ddlCompanyId_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>--%>
                    </table>
            
                    <table style="border: thin solid #5D7B9D; background-color: Window;  width: 550px;">
                        <%--<tr>
                            <td style="text-align: left" colspan="2">
                                <b>Select the mode of operation you want </b>
                            </td>
                            </tr>
                            <tr>
                            <td class="style1">
                                <asp:RadioButtonList AutoPostBack="true" ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                                    RepeatDirection="Horizontal" Height="16px">
                                    <asp:ListItem>Add New Record
                                    </asp:ListItem>
                                    <asp:ListItem>Modify Old Record</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="text-align: left" class="style6">
                                <asp:DropDownList ID="ddlDeptId" Enabled="False" runat="server" Height="44px"
                                    Width="120px" OnSelectedIndexChanged="ddlDeptId_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            </tr>
                        --%>
                        
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td class="style2" >Sugar</td>
                        <td class="style2" ><asp:TextBox ID="txtSugar" runat="server" TextMode="MultiLine" 
                                Height="79px" Width="166px"></asp:TextBox></td>
                        <td class="style2">
                        <asp:RequiredFieldValidator ID="rfvSugar" runat="server" ErrorMessage="*" ControlToValidate="txtSugar"></asp:RequiredFieldValidator>
                        </td>
                       
                        <td class="style2" >ECG</td>
                        <td  align="center" class="style2"><asp:TextBox ID="txtECG" runat="server" 
                                TextMode="MultiLine" Height="80px" Width="166px" 
                                ></asp:TextBox></td>
                        <td class="style2">
                        <asp:RequiredFieldValidator ID="rfvECG" runat="server" ErrorMessage="*" ControlToValidate="txtECG"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        
                        
                        <tr>
                        <td >Blood Test</td>
                        <td align="center">
                         <asp:TextBox ID="txtBlood" runat="server" TextMode="MultiLine"
                                style="margin-left: 0px" Height="80px" Width="163px"></asp:TextBox> 
                        </td>
                        <td>
                      <asp:RequiredFieldValidator ID="rfvBlood" runat="server" ErrorMessage="*" ControlToValidate="txtBlood"></asp:RequiredFieldValidator>
                            </td>
                        
                        <td >Urine Test</td>
                        <td  align="center"><asp:TextBox ID="txtUrine" runat="server" TextMode="MultiLine" Height="80px" 
                                Width="166px"></asp:TextBox></td>
                                <td>
                                   <asp:RequiredFieldValidator ID="rfvUrine" runat="server" ErrorMessage="*" ControlToValidate="txtUrine"></asp:RequiredFieldValidator>
                                </td>
                        </tr>
                     <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td>
                        Ref Doctor
                        </td>
                        <td>
                        <asp:DropDownList ID="ddlDoctor" runat="server"></asp:DropDownList>
                        </td>
                        <td>
                       <asp:RequiredFieldValidator ID="rfvDoctor" runat="server" ErrorMessage="*" ControlToValidate="ddlDoctor"></asp:RequiredFieldValidator>
             
                        </td>
                        <td >Manager</td>
                        <td><asp:DropDownList ID="ddlManager" runat="server"></asp:DropDownList></td>
                        <td>
                       <asp:RequiredFieldValidator ID="rfvManager" runat="server" ErrorMessage="*" ControlToValidate="ddlManager"></asp:RequiredFieldValidator>
             
                        </td>
                        </tr>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td colspan="3">
                            &nbsp;</td>
                        <td colspan="2" style="text-align: right; font-weight: 700;">
                                &nbsp;&nbsp;
                                <asp:Button ID="btnSubmit" BorderColor="MediumSeaGreen" 
                                    BackColor="#797A80" ForeColor="White" runat="server"
                                    Text="Submit" Height="25px" Width="124px" OnClick="btnSubmit_Click" 
                                     />&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btncancel" BorderColor="Red" ForeColor="White" BackColor="#797A80" runat="server"
                                    Text="Cancel" Height="25px" Width="60px" OnClick="btncancel_Click" 
                                    CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6"  align="left" style="background-color:#5D7B9D">
                            </td>
                        </tr>
                         
                
                        </table>
                       <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

                </ContentTemplate>
            </asp:UpdatePanel>
        </center>
</div>
</asp:Content>

