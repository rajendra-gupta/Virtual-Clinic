<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="frmRegistration.aspx.cs" Inherits="frmRegistration" Title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<%@ Register src="~/UserControls/BrowseImage.ascx" tagname="BrowseImage" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div >
        <center>           
           
            <br />
            <asp:UpdatePanel ID="panel1" runat="server">
               <Triggers>               
               <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
               </Triggers>
                <ContentTemplate>
                   
            
                    <table style="border: thin solid #5D7B9D; background-color: Window;  width: 350px; ">
                        <tr>
                        <td colspan="6" align="center" style=" background-color:#5D7B9D" >
                            <b>&nbsp;Registration Form </b>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td >FirstName</td>
                        <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="*" ControlToValidate="txtName" ></asp:RequiredFieldValidator>
                        </td>
                        <td colspan="3" rowspan="4">
                            
                            <uc1:BrowseImage ID="BrowseImage1" runat="server" 
                                DefaultImageUrl="~/Images/NoImage.jpg" />
                            
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                            <td >MiddleName</td>
                            <td><asp:TextBox ID="txtMName" runat="server"></asp:TextBox></td>
                        <td>
                        
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td >LastName</td>
                        <td><asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                        </td> 
                        <td>Gender</td>                       
                        <td>
                            <asp:DropDownList ID="ddlGender" runat="server">
                            <asp:ListItem>--Select One--</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvGender" runat="server" ErrorMessage="*" ControlToValidate="ddlGender" ></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td>
                        DOB
                        </td>
                        <td><asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                            <cc1:CalendarExtender runat="server" TargetControlID="txtDOB">
                            </cc1:CalendarExtender>
                        </td>
                        <td>
                       <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ErrorMessage="*" ControlToValidate="txtDOB" ></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            Role
                        </td>
                        <td valign="middle">
                            <asp:DropDownList ID="ddlRole" runat="server" 
                                onselectedindexchanged="ddlRole_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem>--Select One--</asp:ListItem>
                            <asp:ListItem>Patient</asp:ListItem>
                            <asp:ListItem>Manager</asp:ListItem>
                            <asp:ListItem>Doctor</asp:ListItem>
                            </asp:DropDownList> &nbsp;
                            <asp:Panel ID="pnl2" runat="server">
                            <table>
                            <tr>
                            <td>Qualification</td>
                            <td>
                            <asp:TextBox ID="txtQual" runat="server" ></asp:TextBox>
                            </td>
                            <td>
                              <asp:RequiredFieldValidator ID="rfvQual" runat="server" ErrorMessage="*" ControlToValidate="txtQual" ></asp:RequiredFieldValidator>
                     
                            </td>
                            </tr>
                            <tr>
                            <td>Specialization</td>
                            <td><asp:TextBox ID="txtSpec" runat="server" ></asp:TextBox></td>
                            <td>
                           <asp:RequiredFieldValidator ID="rfvSpec" runat="server" ErrorMessage="*" ControlToValidate="txtSpec" ></asp:RequiredFieldValidator>
                
                            </td>
                            </tr>
                            <tr>
                            <td>Experience</td>
                            <td><asp:TextBox ID="txtExp" runat="server" ></asp:TextBox></td>
                            <td>
                           <asp:RequiredFieldValidator ID="rfvExp" runat="server" ErrorMessage="*" ControlToValidate="txtExp" ></asp:RequiredFieldValidator>
                
                            </td>
                            </tr>
                            <tr>
                            <td >
                                &nbsp;Timings</td>
            <td align="left" >
                From &nbsp;
                <asp:TextBox ID="txtTime1" runat="server" Width="58px"></asp:TextBox><asp:DropDownList
                    ID="ddlTime1" runat="server" >
                    <asp:ListItem>AM</asp:ListItem>
                    <asp:ListItem>PM</asp:ListItem>
                </asp:DropDownList>
                <br />
                
                &nbsp;&nbsp; To &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtTime2" runat="server" Width="58px"></asp:TextBox><asp:DropDownList
                    ID="ddlTime2" runat="server" >
                    <asp:ListItem>AM</asp:ListItem>
                    <asp:ListItem>PM</asp:ListItem>
                </asp:DropDownList>
                <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" ClearMaskOnLostFocus="False"
                    Mask="99:99" MaskType="Time" TargetControlID="txtTime1">
                </cc1:MaskedEditExtender>
                <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" ClearMaskOnLostFocus="False"
                    Mask="99:99" MaskType="Time" TargetControlID="txtTime2">
                </cc1:MaskedEditExtender>
            </td>
            
                            </tr>
                            </table>
                            </asp:Panel>
                            
                                                        <asp:Panel ID="Pnl_Patient" runat="server">
                            <table>
                            <%--<tr>
                            <td>Height(cm)</td>
                            <td>
                            <asp:TextBox ID="txtHeight" runat="server" ></asp:TextBox>
                            </td>
                            <td>
                              <asp:RequiredFieldValidator ID="rfvHeight" runat="server" ErrorMessage="*" ControlToValidate="txtHeight" ></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rvHeight" runat="server" ErrorMessage="*" 
                                    ControlToValidate="txtHeight" MaximumValue="200" MinimumValue="50" 
                                    Type="Integer"></asp:RangeValidator>
                            </td>
                            </tr>--%>
                            <tr>
                            <td>Blood Group</td>
                            <td><asp:TextBox ID="txtBlood" runat="server" ></asp:TextBox></td>
                            <td>
                           <asp:RequiredFieldValidator ID="rfvBlood" runat="server" ErrorMessage="*" ControlToValidate="txtBlood" ></asp:RequiredFieldValidator>
                
                            </td>
                            </tr>
                            <tr>
                            <td>Inherited Diseases</td>
                            <td><asp:TextBox ID="txtDisease" runat="server" Height="60px" ></asp:TextBox></td>
                            <td>
                           <asp:RequiredFieldValidator ID="rfvDisease" runat="server" ErrorMessage="*" ControlToValidate="txtDisease" ></asp:RequiredFieldValidator>
                
                            </td>
                            </tr>
                            
                            </table>
                            </asp:Panel>

                            </td>
                        <td>
                        
                       <asp:RequiredFieldValidator ID="rfvRole" runat="server" ErrorMessage="*" ControlToValidate="ddlRole" ></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td>
                        Email
                        </td>
                        <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ErrorMessage="*" ControlToValidate="txtEmail"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                            <td>PhoneNo</td>
                            <td><asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                    ControlToValidate="txtPhone" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    
                                                          <asp:RegularExpressionValidator ID="regPhone" ControlToValidate="txtPhone" runat="server" 
                                    ErrorMessage="*" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
       
                            </td>
                        </tr>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td >
                            UserName</td>
                        <td >
                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                        </td>
                        <td >
                      <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="*" ControlToValidate="txtUserName" ></asp:RequiredFieldValidator>
                        </td>
                        <td rowspan="2" >
                        Address
                        </td>
                        <td rowspan="2" >
                            <asp:TextBox ID="txtAddress" TextMode="MultiLine" runat="server" Height="80px" 
                                Width="176px"></asp:TextBox>
                            </td>
                        <td rowspan="2" >
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                ControlToValidate="txtAddress" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                        <td>Password</td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                ControlToValidate="txtPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td colspan="3">
                            &nbsp;</td>
                        <td colspan="3">
                         <asp:Button ID="btnSubmit" runat="server"  Text="Submit" 
                                ForeColor="White" BorderColor="MediumSeaGreen" BackColor="#797A80" 
                                onclick="btnSubmit_Click" />
                          &nbsp;
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="false" Text="Cancel" ForeColor="White" 
                                BorderColor="red" BackColor="#797A80" onclick="btnCancel_Click" />
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

