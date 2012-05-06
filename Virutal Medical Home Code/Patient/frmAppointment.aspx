<%@ Page Language="C#" MasterPageFile="~/Patient/PatientMasterPage.master" AutoEventWireup="true" CodeFile="frmAppointment.aspx.cs" Inherits="Patient_frmAppointment" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <center>
            <br />
            <asp:Label ID="lblHeading" BackColor="Window" ForeColor="#5D7B9D" runat="server" Text="Appointment Form"
                Style="font-size: small; font-weight: 700; font-family: Verdana"></asp:Label>
            <br />
            <br />
            <asp:UpdatePanel ID="panel1" runat="server">
               <Triggers>               
              
               <asp:AsyncPostBackTrigger ControlID="ddlDoctor" EventName="SelectedIndexChanged" />
               <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
               
               <asp:AsyncPostBackTrigger ControlID="btncancel" EventName="Click" />
             
               

               </Triggers>
                <ContentTemplate>
                    <table style="border: thin solid #5D7B9D; background-color:window; width: 700px; ">
                         <tr>
                            <td colspan="6" style="background-color: #5D7B9D"></td>
                            </tr>
                   
                                              
                        
                        <%--<tr>
                         <td >Patient Name</td>
                        <td  >
                           <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                            </td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="*" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                        </td>
                        <td >Doctor Name</td>
                        <td >
                            <asp:DropDownList ID="ddlDoctor" runat="server" AutoPostBack="True" 
                                Height="44px" 
                                Width="120px">
                            </asp:DropDownList>
                            </td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvDoctor" runat="server" ErrorMessage="*" ControlToValidate="ddlDoctor"></asp:RequiredFieldValidator>
                        </td>
                        </tr>--%>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td >Apmt_Date</td>
                        <td  >
                            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate">
                            </cc1:CalendarExtender>
                            </td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvDate" runat="server" ErrorMessage="*" ControlToValidate="txtDate"></asp:RequiredFieldValidator>
                        </td>
                        <td >Doctor</td>
                        <td  >
                            <%--<asp:TextBox ID="txtTime1" runat="server" Width="58px"></asp:TextBox><asp:DropDownList
                    ID="ddlTime1" runat="server" >
                    <asp:ListItem>AM</asp:ListItem>
                    <asp:ListItem>PM</asp:ListItem>
                </asp:DropDownList>
                <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" ClearMaskOnLostFocus="False"
                    Mask="99:99" MaskType="Time" TargetControlID="txtTime1">
                </cc1:MaskedEditExtender>    --%>     
                <asp:DropDownList ID="ddlDoctor" runat="server" AutoPostBack="True" 
                                Height="44px" 
                                Width="120px">
                            </asp:DropDownList>                   
                            </td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvDoctor" runat="server" ErrorMessage="*" ControlToValidate="ddlDoctor"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        
                        
                       <tr>
                        <td >B.P</td>
                        <td  >
                            <asp:TextBox ID="txtBP" runat="server" ></asp:TextBox>
                           </td>
                           <td>
                           <asp:RequiredFieldValidator ID="rfvBP" runat="server" ErrorMessage="*" ControlToValidate="txtBP"></asp:RequiredFieldValidator>
                           </td>
                           <td >Height</td>
                        <td >
                            <asp:TextBox ID="txtHeight" runat="server" ></asp:TextBox>
                           </td>
                           <td>
                           <asp:RequiredFieldValidator ID="rfvHeight" runat="server" ErrorMessage="*" ControlToValidate="txtHeight"></asp:RequiredFieldValidator>
                           </td>
                        </tr>
                     <tr>
                        <td colspan="6"></td>
                        </tr>
                         <tr>
                        <td >Age</td>
                        <td  >
                            <asp:TextBox ID="txtAge" runat="server" ></asp:TextBox>
                           </td>
                           <td>
                           <asp:RequiredFieldValidator ID="rfvAge" runat="server" ErrorMessage="*" ControlToValidate="txtAge"></asp:RequiredFieldValidator>
                           </td>
                           <td >Weight</td>
                        <td >
                            <asp:TextBox ID="txtWeight" runat="server" ></asp:TextBox>
                           </td>
                           <td>
                           <asp:RequiredFieldValidator ID="rfvWeight" runat="server" ErrorMessage="*" ControlToValidate="txtWeight"></asp:RequiredFieldValidator>
                           </td>
                        </tr>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td>Manager</td>
                        <td>
                            <asp:DropDownList ID="ddlManager" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvManager" runat="server" ErrorMessage="*" ControlToValidate="ddlManager"></asp:RequiredFieldValidator></td>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td>
                                Disease History</td>
                            <td>
                                <asp:TextBox ID="txtHistory" runat="server" Height="76px" 
                                    TextMode="MultiLine" Width="150px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvHistory" runat="server" 
                                    ControlToValidate="txtHistory" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td>Visited Doctor
                                <br />
                                Details</td>
                            <td>
                                <asp:TextBox ID="txtVisited" runat="server" Height="76px" 
                                    TextMode="MultiLine" Width="150px"></asp:TextBox>
                            </td>
<%--                           <td>
                       <asp:RequiredFieldValidator ID="rfvVisited" runat="server" 
                                    ControlToValidate="txtVisited" ErrorMessage="*"></asp:RequiredFieldValidator>
                  
                           </td> 
--%>                           
                            <%--<td >
                            <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
                           </td>
                           <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtMaxTerm"></asp:RequiredFieldValidator>
                           </td--%>
                            </tr>
                            <tr>
                                <td colspan="6">
                                </td>
                            </tr>
                            <tr>
                        <td >Medicines Used</td>
                        <td  >
                            <asp:TextBox ID="txtMedicine" TextMode="MultiLine" runat="server" 
                                Height="76px" Width="150px" ></asp:TextBox>
                           </td>
                           <td>
                           <asp:RequiredFieldValidator ID="rfvMedicine" runat="server" ErrorMessage="*" ControlToValidate="txtMedicine"></asp:RequiredFieldValidator>
                           </td>
                           <td >Doctor
                               <br />
                               Prescription</td>
                        <td >
                            <asp:TextBox ID="txtPresc" runat="server" TextMode="MultiLine" Height="76px" 
                                Width="150px" ></asp:TextBox>
                           </td>
                           <td>
<%--                           <asp:RequiredFieldValidator ID="rfvPresc" runat="server" ErrorMessage="*" ControlToValidate="txtPresc"></asp:RequiredFieldValidator>
--%>                           </td>
                        </tr>
                            <tr>
                                <td colspan="6">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <%--<asp:Button ID="btnShowAll" runat="server" BackColor="#797A80" 
                                        BorderColor="MediumSeaGreen" CausesValidation="False" ForeColor="White" 
                                        onclick="btnShowAll_Click" Text="ShowAll" Width="95px" />--%>
                                </td>
                                <td colspan="3">
                                    <asp:Button ID="btnSubmit" runat="server" BackColor="#797A80" 
                                        BorderColor="MediumSeaGreen"  ForeColor="White" Height="25px" 
                                        OnClick="btnSubmit_Click" Text="Submit" Width="124px" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btncancel" runat="server" BackColor="#797A80" BorderColor="Red" 
                                        CausesValidation="False" ForeColor="White" Height="25px" 
                                        OnClick="btncancel_Click" Text="Cancel" Width="60px" />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="6" style="background-color:#5D7B9D">
                                </td>
                            </tr>
                            </table>
                            <br />
<%--                            <table>
                            <tr>
                                <td colspan="6">
                                   <asp:GridView ID="grdAllPolicies" runat="server" AllowPaging="True" 
                                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                                        GridLines="None" PageSize="5" Width="200px" 
                                        onpageindexchanging="grdAllPolicies_PageIndexChanging">
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="PolicyName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("PolicyName")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CompanyName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("CompanyName")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LaunchDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAbbreviation" runat="server" Text='<%#Eval("LaunchDate")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EndDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("EndDate")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MinAmount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("MinAmount")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MaxAmount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("MaxAmount")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MinAge">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("MinAge")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MaxAge">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("MaxAge")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MinTerm">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("MinTerm")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MaxTerm">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("MaxTerm")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                        </Columns>
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                    </asp:GridView>
                               </td>                           </tr>
                            <tr>
                                <td colspan="6">
                                    <asp:Button ID="btnCloseGrid" runat="server" BackColor="#797A80" ForeColor="White"
                                        BorderColor="Red" CausesValidation="False" Height="21px" 
                                        onclick="btnCloseGrid_Click" Text="Close" Width="90px" />
                                </td>
                            </tr>
                        
                        </table>
--%>                       <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

                </ContentTemplate>
            </asp:UpdatePanel>
        </center>
</div>
</asp:Content>

