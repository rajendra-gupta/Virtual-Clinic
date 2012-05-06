<%@ Page Language="C#" MasterPageFile="~/Doctor/DoctorMasterPage.master" AutoEventWireup="true" CodeFile="frmViewFeedBack.aspx.cs" Inherits="Doctor_frmViewFeedBack" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<center>
<br />
<br />
<asp:Button ID="btnFeed" runat="server" Text="Show FeedBack" 
        style="color: #FFFFFF; background-color: #5D7B9D" 
        Width="179px" onclick="btnFeed_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
<br />
<br />
<asp:GridView ID="GvFeedBack" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" 
        PageSize="5"  Width="450px" onpageindexchanging="GvFeedBack_PageIndexChanging" 
        >
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>

<asp:TemplateField HeaderText="Sender">
<ItemTemplate>
<asp:Label ID="lblName" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="MailId">
<ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("SenderMailId") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Date">
<ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="FeedBack">
                        <ItemTemplate > 
                        <asp:Panel ID="pnl1" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="txtComp" runat="server" Text='<%#Eval("FeedBack")%>'></asp:Label>
                        </asp:Panel></ItemTemplate>
                        </asp:TemplateField>


</Columns>
</asp:GridView>
<br />

<br />
<asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
</center>
</div>

</asp:Content>

