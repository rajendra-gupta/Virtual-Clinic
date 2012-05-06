<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="frmAppointmentsReport.aspx.cs" Inherits="Admin_Reports_frmAppointmentsReport" Title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script language="javascript" type="text/javascript">
 
    function callPrint(elementId)
    {
       var prtContent = document.getElementById(elementId);                
       var WinPrint = window.open('','', 'left=0,top=0,width=1000,height=600,toolbar=2,scrollbars=2,status=0');
       var docColor="Black";
       var strInnerHTML=prtContent.innerHTML;
       var strModifiedInnerHTMl=strInnerHTML.replace(/white/g,docColor);
       WinPrint.document.write(strModifiedInnerHTMl);
       WinPrint.document.close();
       WinPrint.focus();
       WinPrint.print();
       WinPrint.close();
    }   
    
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<br />
<br />
<asp:Label ID="lblAgents" runat="server" Text="Appointments Report" 
        style="font-weight: 700; text-decoration: underline; color: #5D7B9D" ></asp:Label>
<br />
<br />
<table style="color: #FFFFFF; background-color: #5D7B9D;">
<tr>
<td>
Date
</td>
<td>
    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate">
    </cc1:CalendarExtender>
</td>
<td>
    <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate"
        ErrorMessage="*"></asp:RequiredFieldValidator>
</td>
<td>
 <asp:Button ID="btnGet" BorderColor="MediumSeaGreen" 
                                    BackColor="#5D7B9D" ForeColor="White" runat="server"
                                    Text="Get" Height="25px" Width="124px" 
        CausesValidation="false" onclick="btnGet_Click"   /></td>
</tr>
<tr>
<td colspan="4"></td>
</tr>
<tr>
<td>Dates</td>
<td align="left"> 
From:&nbsp <asp:TextBox ID="txtFrom" runat="server"></asp:TextBox>
    <cc1:CalendarExtender ID="CalendarExtender2"
        runat="server" TargetControlID="txtFrom">
    </cc1:CalendarExtender>
    <br />
  &nbsp;&nbsp;&nbsp;&nbsp;  To:
    <asp:TextBox ID="txtTo" runat="server"></asp:TextBox>
    <cc1:CalendarExtender ID="CalendarExtender3"
        runat="server" TargetControlID="txtTo">
    </cc1:CalendarExtender>
</td>
<td>
    <asp:RequiredFieldValidator ID="rfvFrom" runat="server" ErrorMessage="*" ControlToValidate="txtFrom"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="rfvTo" runat="server" ErrorMessage="*" ControlToValidate="txtTo"></asp:RequiredFieldValidator>
    
</td>
<td>
 <asp:Button ID="btnShow" BorderColor="MediumSeaGreen" 
                                    BackColor="#5D7B9D" ForeColor="White" runat="server"
                                    Text="Show" Height="30px" Width="124px" 
        CausesValidation="false" onclick="btnShow_Click"  />
</td>
</tr>
</table>
        <br />
<br />
<div id="divPolicy" >
                                    <asp:GridView ID="grdApmt" runat="server" AllowPaging="True" 
                                        AutoGenerateColumns="False" PageSize="5" Width="200px" onpageindexchanging="grdApmt_PageIndexChanging" 
                                        >
                                        <Columns>
                                            <asp:TemplateField HeaderText="PatientName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("Patient")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Doctor">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDoc" runat="server" Text='<%#Eval("Doctor")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAbbreviation" runat="server" Text='<%#Eval("Apmt_Date")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>                                            
                                            
                                            
                                        </Columns>
                                    </asp:GridView>
                                    </div>
                                    <br />
<asp:Button ID="btnPrint" runat="server" Text="Print Report" OnClientClick="callPrint('divPolicy')" />
<br />

<asp:Label ID="lblMsg" runat="server" ForeColor="red"></asp:Label>
<br />
</center>

</asp:Content>

