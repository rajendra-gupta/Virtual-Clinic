<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="frmSearch.aspx.cs" Inherits="frmSearch" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<center>
<br />
<br />
<table style="color: #FFFFFF; background-color: #5D7B9D; width: 213px;"> 
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
<tr>
<td colspan="3"></td>
</tr>
<tr>
<td></td>
<td colspan="2">
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

&nbsp;<br />
<asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
</center>
</div>

</asp:Content>

