<%@ Page Language="C#" MasterPageFile="~/KioskManager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="frmChangePassword.aspx.cs" Inherits="Customers_frmChangePassword" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <center>
            <br />
            <br />
            <br />
            <asp:UpdatePanel ID="panel1" runat="server">
               <Triggers>               
              <asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click" />
         
               <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
               </Triggers>
                <ContentTemplate>
                   
            
                    <table style="border: thin solid #5D7B9D; background-color:window;  width: 400px;">
                        <tr>
                        <td colspan="3" align="center" style=" background-color:#5D7B9D" >
                            <b style="text-decoration: underline">Change Password </b>
                        </td>
                        </tr>                    
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td >
                            Old Password</td>
                        <td >
                        <asp:TextBox ID="txtOld" TextMode="Password" runat="server"></asp:TextBox>
                        </td>
                        <td >
                           <asp:RequiredFieldValidator ID="rfvOld" runat="server" ErrorMessage="*" ControlToValidate="txtOld"></asp:RequiredFieldValidator> 
                        </td>                        
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>                        
                        <td >
                            New Password</td>
                        <td >
                        <asp:TextBox ID="txtNew" TextMode="Password" runat="server"></asp:TextBox>
                        </td>
                        <td >
                           <asp:RequiredFieldValidator ID="rfvNew" runat="server" ErrorMessage="*" ControlToValidate="txtNew"></asp:RequiredFieldValidator> 
                        </td>    
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>                        
                        <td >
                            Confirm Password</td>
                        <td >
                        <asp:TextBox ID="txtConfirm" TextMode="Password" runat="server"></asp:TextBox>
                        </td>
                        <td >
                           <asp:RequiredFieldValidator ID="rfvConfirm" runat="server" ErrorMessage="*" ControlToValidate="txtConfirm"></asp:RequiredFieldValidator> 
                        </td>    
                        </tr>
                        
                        <tr>
                        <td colspan="3" >
                            </td>
                        </tr>
                        <tr>
                        <td >
                            </td>
                        <td colspan="2">
                         <asp:Button ID="btnUpdate" runat="server"  Text="Update" ForeColor="White"
                                 BorderColor="MediumSeaGreen" BackColor="#797A80" 
                                onclick="btnUpdate_Click" />
                          &nbsp;
                        <asp:Button ID="btnCancel" runat="server" ForeColor="White" CausesValidation="false" Text="Cancel"  
                                BorderColor="red" BackColor="#797A80" onclick="btnCancel_Click" />
                        </td>
                        </tr>
                         <tr>
                <td colspan="3">
                    </td>
                </tr>
                        <tr>
                        <td colspan="3" style="background-color:#5D7B9D"></td>
                        </tr>                       
                        </table>
                        <br />
                       <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

                </ContentTemplate>
            </asp:UpdatePanel>
        </center>
    </div>

</asp:Content>

