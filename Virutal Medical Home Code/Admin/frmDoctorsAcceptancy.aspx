<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="frmDoctorsAcceptancy.aspx.cs" Inherits="Admin_frmAcceptDoctors" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<center>
<br />
<asp:Label ID="lblHead" runat="server" Text="Doctors Acceptancy Form" 
        
        style="color: #5D7B9D; font-weight: 700; font-size: medium; text-decoration: underline"></asp:Label>

<br />
<br />
<asp:Button ID="btnShow" runat="server" Text="Show Registered Doctors" 
        onclick="btnShow_Click" Height="26px" 
        style="color: #FFFFFF; background-color: #5D7B9D" Width="175px" />
<br />
<br />
<asp:GridView ID="GvDoctors" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None"  
        PageSize="5" onpageindexchanging="GvDoctors_PageIndexChanging" 
        onrowcommand="GvDoctors_RowCommand"  >
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<%--<asp:TemplateField HeaderText="Select">
<ItemTemplate>
<asp:CheckBox ID="chkSelect" runat="server" />
</ItemTemplate>
</asp:TemplateField>--%>
<asp:TemplateField HeaderText="DoctorName">
<ItemTemplate>
<asp:Label ID="lblName" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Specialization">
<ItemTemplate>
<asp:Label ID="lblSpl" runat="server" Text='<%#Eval("Specialization") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Qualification">
<ItemTemplate>
<asp:Label ID="lblQual" runat="server" Text='<%#Eval("Qualification") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Email">
<ItemTemplate>
<asp:Label ID="lblEMail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<%--<asp:TemplateField HeaderText="Address">
<ItemTemplate>
<asp:Label ID="lblAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>--%>
<asp:TemplateField HeaderText="Accept">
<ItemTemplate>
<asp:LinkButton ID="lblAccept" Text="Accept" CausesValidation="false" CommandArgument='<%#Eval("UserId") %>' CommandName="Accept" runat="server" ></asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Reject">
<ItemTemplate>
<asp:LinkButton ID="lblReject" Text="Reject" CausesValidation="false" CommandArgument='<%#Eval("UserId") %>' CommandName="Reject" runat="server" ></asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
<br />
<br />
<asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
</center>
</div>

</asp:Content>

