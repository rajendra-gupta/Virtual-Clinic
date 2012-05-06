<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="frmComplaints.aspx.cs" Inherits="Admin_frmComplaints" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<center>
<br />
<br />
<asp:Button ID="btnDoctor" runat="server" Text="Complaints about Doctor" 
         style="color: #FFFFFF; background-color: #5D7B9D" 
        Width="179px" onclick="btnDoctor_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnManager" runat="server" Text="Complaints about Manager" 
         style="color: #FFFFFF; background-color: #5D7B9D" 
        Width="179px" onclick="btnManager_Click"  />
<br />
<br />
<asp:GridView ID="GvDoctor" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" 
        PageSize="5"  Width="450px" 
        onpageindexchanging="GvDoctor_PageIndexChanging" 
        onrowcommand="GvDoctor_RowCommand">
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
<asp:Label ID="lblPatient" runat="server" Text='<%#Eval("Patient") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="ComplaintDate">
<ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("Comp_Date") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="ComplaintText">
                        <ItemTemplate > 
                        <asp:Panel ID="pnl1" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="txtComp" runat="server" Text='<%#Eval("Comp_Text")%>'></asp:Label>
                        </asp:Panel></ItemTemplate>
                        </asp:TemplateField>

<asp:TemplateField HeaderText="Doctor">
<ItemTemplate>
<asp:Label ID="lblDoctor" runat="server" Text='<%#Eval("Doctor") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Send">
<ItemTemplate>
<asp:LinkButton ID="lbSend" runat="server" Text="Send" CommandName="Send" CommandArgument='<%#Eval("ComplaintId") %>'></asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>


</Columns>
</asp:GridView>
<br />
<asp:GridView ID="GvManager" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" 
        PageSize="5"  Width="450px" 
        onpageindexchanging="GvManager_PageIndexChanging" 
        onrowcommand="GvManager_RowCommand">
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
<asp:Label ID="lblPatient" runat="server" Text='<%#Eval("Patient") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="ComplaintDate">
<ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("Comp_Date") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="ComplaintText">
                        <ItemTemplate > 
                        <asp:Panel ID="pnl1" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="txtComp" runat="server" Text='<%#Eval("Comp_Text")%>'></asp:Label>
                        </asp:Panel></ItemTemplate>
                        </asp:TemplateField>

<asp:TemplateField HeaderText="Manager">
<ItemTemplate>
<asp:Label ID="lblManager" runat="server" Text='<%#Eval("Manager") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Send">
<ItemTemplate>
<asp:LinkButton ID="lbSend" runat="server" Text="Send" CommandName="Send" CommandArgument='<%#Eval("ComplaintId") %>'></asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>


</Columns>
</asp:GridView>

<br />
<asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
</center>
</div>

</asp:Content>

