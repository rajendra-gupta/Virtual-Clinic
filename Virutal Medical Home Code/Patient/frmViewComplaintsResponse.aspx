<%@ Page Language="C#" MasterPageFile="~/Patient/PatientMasterPage.master" AutoEventWireup="true" CodeFile="frmViewComplaintsResponse.aspx.cs" Inherits="Patient_frmViewComplaintsResponse" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<center>
<br />
<br />
<asp:Button ID="btnDoctor" runat="server" Text="Show Doctor Response" 
        onclick="btnDoctor_Click" style="color: #FFFFFF; background-color: #5D7B9D" 
        Width="179px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnManager" runat="server" Text="Show Manager Response" 
        onclick="btnManager_Click" style="color: #FFFFFF; background-color: #5D7B9D" 
        Width="179px" />
<br />
<br />
<asp:GridView ID="GvDoctor" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" 
        PageSize="5"  Width="450px" 
        onpageindexchanging="GvDoctor_PageIndexChanging">
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>

<asp:TemplateField HeaderText="ComplaintDate">
<ItemTemplate>
<asp:Label ID="lblName" runat="server" Text='<%#Eval("Comp_Date") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="ComplaintText">
                        <ItemTemplate > 
                        <asp:Panel ID="pnl1" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="txtComp" runat="server" Text='<%#Eval("Comp_Text")%>'></asp:Label>
                        </asp:Panel></ItemTemplate>
                        </asp:TemplateField>
<asp:TemplateField HeaderText="ReplyDate">
<ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("Reply_Date") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="ReplyText">
                        <ItemTemplate > 
                        <asp:Panel ID="pnl1" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="txtAnswer" runat="server" Text='<%#Eval("Reply_Text")%>'></asp:Label>
                        </asp:Panel></ItemTemplate>
                        </asp:TemplateField>
<asp:TemplateField HeaderText="Doctor">
<ItemTemplate>
<asp:Label ID="lblName" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>

<%--<asp:TemplateField HeaderText="Address">
<ItemTemplate>
<asp:LinkButton ID="lblAccept" Text="Acceptancy" CausesValidation="false" CommandArgument='<%#Eval("UserId") %>' CommandName="Acceptancy" runat="server" ></asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>--%>

</Columns>
</asp:GridView>
<br />
<asp:GridView ID="GvManager" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" 
        PageSize="5"  Width="450px" 
        onpageindexchanging="GvManager_PageIndexChanging">
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>

<asp:TemplateField HeaderText="ComplaintDate">
<ItemTemplate>
<asp:Label ID="lblName" runat="server" Text='<%#Eval("Comp_Date") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="ComplaintText">
                        <ItemTemplate > 
                        <asp:Panel ID="pnl1" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="txtComp" runat="server" Text='<%#Eval("Comp_Text")%>'></asp:Label>
                        </asp:Panel></ItemTemplate>
                        </asp:TemplateField>
<asp:TemplateField HeaderText="ReplyDate">
<ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("Reply_Date") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="ReplyText">
                        <ItemTemplate > 
                        <asp:Panel ID="pnl1" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="txtAnswer" runat="server" Text='<%#Eval("Reply_Text")%>'></asp:Label>
                        </asp:Panel></ItemTemplate>
                        </asp:TemplateField>
<asp:TemplateField HeaderText="Manager">
<ItemTemplate>
<asp:Label ID="lblName" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>

<%--<asp:TemplateField HeaderText="Address">
<ItemTemplate>
<asp:LinkButton ID="lblAccept" Text="Acceptancy" CausesValidation="false" CommandArgument='<%#Eval("UserId") %>' CommandName="Acceptancy" runat="server" ></asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>--%>

</Columns>
</asp:GridView>

<br />
<asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
</center>
</div>

</asp:Content>

