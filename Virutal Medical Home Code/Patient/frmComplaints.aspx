<%@ Page Language="C#" MasterPageFile="~/Patient/PatientMasterPage.master" AutoEventWireup="true" CodeFile="frmComplaints.aspx.cs" Inherits="Patient_frmComplaints" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <center>
            <br />
            <br />
            <br />
            <asp:UpdatePanel ID="panel1" runat="server">
               <Triggers>               
               <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
               </Triggers>
                <ContentTemplate>
                    <table style="border: thin solid #5D7B9D; background-color:window ; width: 500px; ">
                        <tr>
                            <td  colspan="3" style="background-color:#5D7B9D;" >
                                <b style="color: #FFFFFF">Complaints Master </b>
                            </td>
                            </tr>
                        <tr>
                        <td style=" background-color:#5D7B9D" class="style1">
                                Select One</td>
                            <td style="background-color:#5D7B9D" colspan="2">
                                <asp:RadioButtonList AutoPostBack="true" ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                                    RepeatDirection="Horizontal" style="color: #FFFFFF">
                                    <asp:ListItem>Doctor
                                    </asp:ListItem>
                                    <asp:ListItem>Manager</asp:ListItem>
                                </asp:RadioButtonList>
                            </td >
                            
                        </tr>
                        <tr>
                         <td >Select Complainee</td>
                        <td  >
                            <asp:DropDownList ID="ddlRole" runat="server" 
                                >
                                
                            </asp:DropDownList>
                            </td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvRole" runat="server" ErrorMessage="*" ControlToValidate="ddlRole"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        
                         <tr>
                        <td colspan="3"></td>
                        </tr>
                        
                        
                       <tr>
                       <td>Complaint Text</td>
                       <td><asp:TextBox ID="txtComplaint" TextMode="MultiLine" runat="server" 
                               Height="112px" Width="206px"></asp:TextBox></td>
                       <td>
                    <asp:RequiredFieldValidator ID="rfvComplaint" runat="server" ErrorMessage="*" ControlToValidate="txtComplaint"></asp:RequiredFieldValidator>
    
                       </td>
                       </tr>
                     <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td></td>
                        
                        <td colspan="2" style="text-align: right; font-weight: 700;">
                                &nbsp;&nbsp;
                                <asp:Button ID="btnSubmit" BorderColor="MediumSeaGreen" 
                                    BackColor="#797A80" ForeColor="White" runat="server"
                                    Text="Submit" Height="25px" Width="82px" OnClick="btnSubmit_Click" 
                                     />&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btncancel" BorderColor="Red" ForeColor="White" BackColor="#797A80" runat="server"
                                    Text="Cancel" Height="25px" Width="60px" OnClick="btncancel_Click" 
                                    CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3"  align="left" style="background-color:#5D7B9D">
                            </td>
                        </tr>
                 </table>
                       <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

                </ContentTemplate>
            </asp:UpdatePanel>
        </center>
</div>
</asp:Content>

