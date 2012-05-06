<%@ Page Language="C#" MasterPageFile="~/KioskManager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="frmSearch.aspx.cs" Inherits="Kiosk_Manager_frmSearch" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<center>
<br />
<br />
<table style="color: #FFFFFF; background-color: #5D7B9D; width: 213px;"> 
<tr>
<td>Select Role</td>
<td>
    <asp:DropDownList ID="ddlRole" runat="server" 
        onselectedindexchanged="ddlRole_SelectedIndexChanged" AutoPostBack="True">
    <asp:ListItem>--Select One--</asp:ListItem>
    <asp:ListItem>Patient</asp:ListItem>
    <asp:ListItem>Doctor</asp:ListItem>
    </asp:DropDownList>&nbsp;
    <%--<asp:Panel ID="pnlDoc" runat="server">
    <table>
    <tr>
<td><b>Specialization</b></td>
<td>
<asp:DropDownList ID="ddlSpecial" runat="server">
    </asp:DropDownList>
</td>
<td>
    <asp:RequiredFieldValidator ID="rfvSpecial" runat="server" ErrorMessage="*" ControlToValidate="ddlSpecial"></asp:RequiredFieldValidator>
</td>
</tr>
    </table>
    </asp:Panel>--%>
    
    <%--<asp:Panel ID="pnlPat" runat="server">
    <table>
    <tr>
<td><b>Registration<br />
    Date</b></td>
<td align="left"> 
From:&nbsp <asp:TextBox ID="txtFrom" runat="server"></asp:TextBox>
    <cc1:CalendarExtender ID="CalendarExtender1"
        runat="server" TargetControlID="txtTo">
    </cc1:CalendarExtender>
    <br />
  &nbsp;&nbsp;&nbsp;  To:
    <asp:TextBox ID="txtTo" runat="server"></asp:TextBox>
    <cc1:CalendarExtender ID="CalendarExtender2"
        runat="server" TargetControlID="txtTo">
    </cc1:CalendarExtender>
</td>
<td>
    <asp:RequiredFieldValidator ID="rfvFrom" runat="server" ErrorMessage="*" ControlToValidate="txtFrom"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="rfvTo" runat="server" ErrorMessage="*" ControlToValidate="txtTo"></asp:RequiredFieldValidator>
    
</td>
</tr>
    </table>
    </asp:Panel>--%>
</td>
<td>
   <asp:RequiredFieldValidator ID="rfvRole" runat="server" ErrorMessage="*" ControlToValidate="ddlRole"></asp:RequiredFieldValidator>
</td>
</tr>

<tr>
<td ></td>
<td colspan="2">
<asp:Panel ID="pnlDoc" runat="server">
    <table>
    <tr>
<td><b>Specialization</b></td>
<td>
<asp:DropDownList ID="ddlSpecial" runat="server" AutoPostBack="True">
    </asp:DropDownList>
</td>
<td>
    <asp:RequiredFieldValidator ID="rfvSpecial" runat="server" ErrorMessage="*" ControlToValidate="ddlSpecial"></asp:RequiredFieldValidator>
</td>
</tr>
    </table>
    </asp:Panel>
    
   <asp:Panel ID="pnlPat" runat="server">
    <table>
    <tr>
<td><b>Registration<br />
    Date</b></td>
<td align="left"> 
From:&nbsp <asp:TextBox ID="txtFrom" runat="server"></asp:TextBox>
    <cc1:CalendarExtender ID="CalendarExtender1"
        runat="server" TargetControlID="txtFrom">
    </cc1:CalendarExtender>
    <br />
  &nbsp;&nbsp;&nbsp;&nbsp;  To:
    <asp:TextBox ID="txtTo" runat="server"></asp:TextBox>
    <cc1:CalendarExtender ID="CalendarExtender2"
        runat="server" TargetControlID="txtTo">
    </cc1:CalendarExtender>
</td>
<td>
    <asp:RequiredFieldValidator ID="rfvFrom" runat="server" ErrorMessage="*" ControlToValidate="txtFrom"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="rfvTo" runat="server" ErrorMessage="*" ControlToValidate="txtTo"></asp:RequiredFieldValidator>
    
</td>
</tr>
    </table>
    </asp:Panel>

</td>
</tr>
<tr>
<td></td>
<td colspan="2" align="right">
    <asp:Button ID="btnSearch" BorderColor="MediumSeaGreen" 
                                    BackColor="#5D7B9D" ForeColor="White" runat="server"
                                    Text="Search" Height="25px" Width="124px" 
        onclick="btnSearch_Click"   />
</td>
</tr>
</table>
<%--<asp:Button ID="btnShow" runat="server" Text="Show Complaints " 
        onclick="btnShow_Click" style="color: #FFFFFF; background-color: #5D7B9D" 
        Width="119px" />--%>

<br />
<asp:GridView ID="GvDoctors" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" 
        PageSize="5"  Width="450px" 
        onpageindexchanging="GvDoctors_PageIndexChanging">
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<asp:TemplateField HeaderText="DoctorName">
<ItemTemplate>
<asp:Label ID="lblId" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Experience">
<ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("Experience") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Email">
<ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="From">
                        <ItemTemplate > 
                        <asp:Label ID="txtFrom" runat="server" Text='<%#Eval("FromTime")%>'></asp:Label>
                       </ItemTemplate>
                        </asp:TemplateField>
 <asp:TemplateField HeaderText="To">
                        <ItemTemplate > 
                        <asp:Label ID="txtTo" runat="server" Text='<%#Eval("ToTime")%>'></asp:Label>
                       </ItemTemplate>
                        </asp:TemplateField>
                        
    <%--<asp:TemplateField HeaderText="Reply">
    <ItemTemplate>
    <asp:LinkButton ID="lbReply" runat="server" Text="Reply" CommandArgument='<%#Eval("ComplaintId") %>' CommandName="Reply" ></asp:LinkButton>
    </ItemTemplate>
    </asp:TemplateField>                    
--%>

</Columns>
</asp:GridView>
<br />
<asp:GridView ID="GvPatient" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" 
        PageSize="5"  Width="450px" onpageindexchanging="GvPatient_PageIndexChanging" 
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
<asp:Label ID="lblId" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="RegdDate">
<ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("DOR") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Email">
<ItemTemplate>
<asp:Label ID="lblMail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<%--<asp:TemplateField HeaderText="Disease">
<ItemTemplate>
 <asp:Panel ID="pnl1" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
 <asp:Label ID="lblDisease" runat="server" Text='<%#Eval("InheritedDiseases") %>'></asp:Label>
</asp:Panel>
</ItemTemplate>
</asp:TemplateField>--%>

</Columns>
</asp:GridView>

<br />
<asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
</center>
</div>

</asp:Content>

