<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center>
<table width="100%">
<tr>
<td style="width:25%">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/hos1.jpg" />
    </td>
<td style="width:50%" rowspan="3">
    <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/hos0.jpg" 
        Height="374px" Width="383px" />

</td>
<td style="width:25%">
    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/hos2.jpg" 
        Height="125px" Width="130px" />

</td>
</tr>
<tr>
<td style="width:25%">
    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/hos4.jpg" />
    </td>
<td style="width:25%">
    <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/hos5.jpg" 
        Height="125px" Width="130px" />

</td>
</tr>
<tr>
<td style="width:25%">
    <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/hos6.jpg" />
    </td>
<td style="width:25%">
    <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/hos7.jpg" 
        Height="125px" Width="130px" />

</td>
</tr>
</table>
</center>
    


</asp:Content>

