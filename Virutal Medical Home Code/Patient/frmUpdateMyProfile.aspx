<%@ Page Language="C#" MasterPageFile="~/Patient/PatientMasterPage.master" AutoEventWireup="true" CodeFile="frmUpdateMyProfile.aspx.cs" Inherits="Customers_frmUpdateMyProfile" Title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<%@ Register src="~/UserControls/BrowseImage.ascx" tagname="BrowseImage" tagprefix="uc1" %>


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
                   
            
                    <table style="border: thin solid #5D7B9D; background-color: Window;  width: 670px;">
                        <tr>
                        <td colspan="6" align="center" style=" background-color:#5D7B9D" >
                            <b>Update My Profile </b>
                        </td>
                        </tr>
                       
                        
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td>
                            Image</td>
                        <td><uc1:BrowseImage ID="BrowseImage1" runat="server" 
                                DefaultImageUrl="~/Images/NoImage.jpg" /></td>
                        <td>
                            &nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>
                                &nbsp;</td>
                       </tr>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td >
                            Email</td>
                        <td >
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        </td>
                        <td >
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="*" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>   
                        </td>
                        <td rowspan="2" >
                        Address
                        </td>
                        <td rowspan="2" >
                            <asp:TextBox ID="txtAddress" TextMode="MultiLine" runat="server" Height="80px" 
                                Width="176px"></asp:TextBox>
                            </td>
                        <td rowspan="2" >
                            &nbsp;</td>
                        </tr>
                        <tr>
                        <td>PhoneNo</td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server" ></asp:TextBox>
                                                         <asp:RegularExpressionValidator ID="regPhone" ControlToValidate="txtPhone" runat="server" 
                                    ErrorMessage="*" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>

                            </td>
                        <td>
                            &nbsp;</td>
                        </tr>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td colspan="3">
                            &nbsp;</td>
                        <td colspan="3">
                         <asp:Button ID="btnUpdate" runat="server"  Text="Update" 
                                ForeColor="White" BorderColor="MediumSeaGreen" BackColor="#797A80" 
                                onclick="btnUpdate_Click" />
                          &nbsp;
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="false" Text="Cancel" ForeColor="White" 
                                BorderColor="red" BackColor="#797A80" onclick="btnCancel_Click" />
                        </td>
                        </tr>
                         <tr>
                <td colspan="6">
                    </td>
                </tr>
                        <tr>
                        <td colspan="6" style="background-color:#5D7B9D"></td>
                        </tr>
                        
               
                        </table>
                       <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

                </ContentTemplate>
            </asp:UpdatePanel>
        </center>
    </div>

</asp:Content>

