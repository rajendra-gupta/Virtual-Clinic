<%@ Page Language="C#" MasterPageFile="~/Patient/PatientMasterPage.master" AutoEventWireup="true" CodeFile="frmViewPrescriptions.aspx.cs" Inherits="Patient_frmViewPrescriptions" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<center>
<br />
    <asp:Label ID="lblHead" runat="server" Text="View Prescriptions" style="color: #5D7B9D;  font-weight: 700;"></asp:Label>
    <br />
<br />
<br />


<asp:GridView ID="GvHistory" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" 
        PageSize="5"  Width="450px" onpageindexchanging="GvHistory_PageIndexChanging" 
        >
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<%--<asp:TemplateField HeaderText="PatientName">
<ItemTemplate>
<asp:Label ID="lblId" runat="server" Text='<%#Eval("UserName") %>' ></asp:Label>
</ItemTemplate>
</asp:TemplateField>--%>
<asp:TemplateField HeaderText="Apmt_Date">
    <ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("Apmt_Date") %>'></asp:Label>
    </ItemTemplate>
    </asp:TemplateField>    
<asp:TemplateField HeaderText="DiseaseHistory">
<ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("DiseaseHistory") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Prescription">
<ItemTemplate>
<asp:Panel ID="pnlPres" runat="server" Width="200px" Height="50px" ScrollBars="Vertical">
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("NewPrescription") %>'></asp:Label>
</asp:Panel>
</ItemTemplate>
</asp:TemplateField>                        
</Columns>
</asp:GridView>

<br />
<asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
<br />
</center>
</div>

</asp:Content>

