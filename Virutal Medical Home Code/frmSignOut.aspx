<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="frmSignOut.aspx.cs" Inherits="frmSignOut" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<center>
    <br />
    <br />
    
    <table>
    <tr>
    <td colspan="2">
        <h4><b><asp:Label ID="lblId" runat="server" Text="You are Signed Out Successfully.."></asp:Label></b></h4>
        </td>
        </tr>
        <tr>
        <td colspan="2">
        <asp:Label ID="lblMsg" runat="server" ForeColor="red"></asp:Label>
        </td>
        </tr>
        </table>
    
</center>
</div>

</asp:Content>

