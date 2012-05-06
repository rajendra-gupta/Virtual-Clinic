<%@ Page Language="C#" MasterPageFile="~/Doctor/DoctorMasterPage.master" AutoEventWireup="true" CodeFile="frmViewAppointments.aspx.cs" Inherits="Doctor_frmViewAppointments" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<center>
<br />
    <asp:Label ID="lblHead" runat="server" Text="View Appointments" style="color: #5D7B9D;  font-weight: 700;"></asp:Label>
    <br />
<br />
<table style="color: #FFFFFF; background-color: #5D7B9D; font-weight: 700;" >
<tr>
<td>Date</td>
<td>
    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate">
    </cc1:CalendarExtender>
</td>
<td>
    <asp:RequiredFieldValidator ID="rfvDate" runat="server" ErrorMessage="*" ControlToValidate="txtDate"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td colspan="3"></td>
</tr>
<tr>
<td></td>
<td colspan="2">
<asp:Button ID="btnShow" runat="server" Text="Show" 
        onclick="btnShow_Click" style="color: #FFFFFF; background-color: #5D7B9D; font-weight: 700;" 
        Width="100px" />

</td>
</tr>
</table>
<br />
<br />
<asp:GridView ID="GvApmts" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" 
        PageSize="5"  Width="450px" 
        onpageindexchanging="GvApmts_PageIndexChanging" onrowcommand="GvApmts_RowCommand" 
        
        >
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<asp:TemplateField HeaderText="PatientName">
<ItemTemplate>
<asp:LinkButton ID="lblId" runat="server" Text='<%#Eval("UserName") %>' 
CommandArgument='<%#Eval("PatientId") %>' CommandName="History" CausesValidation="false"></asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>

                        
    <asp:TemplateField HeaderText="Time">
    <ItemTemplate>
<asp:Label ID="lblTime" runat="server" Text='<%#Eval("Apmt_Time") %>'></asp:Label>
    </ItemTemplate>
    </asp:TemplateField>                    
<asp:TemplateField HeaderText="DiseaseHistory">
<ItemTemplate>
<asp:Panel ID="pnlDisease" runat="server"  Width="200px" Height="50px" ScrollBars="Vertical">
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("DiseaseHistory") %>'></asp:Label>
</asp:Panel>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
<br />
<asp:GridView ID="GvHistory" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" 
        PageSize="5"  Width="450px" 
        >
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<asp:TemplateField HeaderText="PatientName">
<ItemTemplate>
<asp:Label ID="lblId" runat="server" Text='<%#Eval("UserName") %>' ></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="LastVisit">
    <ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("Apmt_Date") %>'></asp:Label>
    </ItemTemplate>
    </asp:TemplateField>    
<%--<asp:TemplateField HeaderText="Condition">
<ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("DiseaseHistory") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>--%>
<asp:TemplateField HeaderText="Prescription">
<ItemTemplate>
<asp:Panel ID="pnlPres" runat="server" Width="200px" Height="50px" ScrollBars="Vertical">
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("Prescription") %>'></asp:Label>
</asp:Panel>
</ItemTemplate>
</asp:TemplateField>                        
</Columns>
</asp:GridView>

<br />
<table id="tblPres" runat="server" style="color: #FFFFFF; background-color: #5D7B9D; font-weight: 700;">
<tr>
<td>New Prescription</td>
<td>
    <asp:TextBox ID="txtPre" TextMode="MultiLine" runat="server" Height="95px"></asp:TextBox></td>
<td>
    <asp:RequiredFieldValidator ID="rfvPre" runat="server" ErrorMessage="*" ControlToValidate="txtPre"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td colspan="3"></td>
</tr>
<tr>
<td></td>
<td colspan="2">
<asp:Button ID="btnSubmit" runat="server" Text="Submit" 
         style="color: #FFFFFF; background-color: #5D7B9D; font-weight: 700;" 
        Width="100px" onclick="btnSubmit_Click" />

</td>
</tr>
</table>
<asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
<br />
</center>
</div>

</asp:Content>

