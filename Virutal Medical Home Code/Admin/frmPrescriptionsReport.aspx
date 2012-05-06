<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="frmPrescriptionsReport.aspx.cs" Inherits="Admin_Reports_frmPrescriptionsReport" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script language="javascript" type="text/javascript">
 
    function callPrint(elementId)
    {
       var prtContent = document.getElementById(elementId);                
       var WinPrint = window.open('','', 'left=0,top=0,width=1000,height=600,toolbar=2,scrollbars=2,status=0');
       var docColor="Black";
       var strInnerHTML=prtContent.innerHTML;
       var strModifiedInnerHTMl=strInnerHTML.replace(/white/g,docColor);
       WinPrint.document.write(strModifiedInnerHTMl);
       WinPrint.document.close();
       WinPrint.focus();
       WinPrint.print();
       WinPrint.close();
    }   
    
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="divPolicy">
<center>
<br />
<asp:Label ID="lblAgents" runat="server" Text="Prescriptions Report" 
        style="font-weight: 700; text-decoration: underline; color: #5D7B9D" ></asp:Label>

    <br />

<br />

<table style="color: #FFFFFF; background-color: #5D7B9D; width: 207px;" >
<tr>
<td>Specialization</td>
<td>
    <asp:DropDownList ID="ddlSpecial" runat="server" 
        onselectedindexchanged="ddlSpecial_SelectedIndexChanged" 
        AutoPostBack="True">
    </asp:DropDownList>
</td>
<td>
    <asp:RequiredFieldValidator ID="rfvSpec" runat="server" ErrorMessage="*" ControlToValidate="ddlSpecial"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
SelectDoctor
</td>
<td>
<asp:DropDownList ID="ddlDoctor" runat="server">
    </asp:DropDownList>
</td>
<td>
    <asp:RequiredFieldValidator ID="rfvDoc" runat="server" ErrorMessage="*" ControlToValidate="ddlDoctor"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td></td>
<td colspan="2">
<asp:Button ID="btnShow" BorderColor="MediumSeaGreen" 
                                    BackColor="#5D7B9D" ForeColor="White" runat="server"
                                    Text="Show" Height="25px" Width="124px" 
        onclick="btnShow_Click"   />
</td>
</tr>
</table>
<br />
<asp:GridView ID="GvPresc" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" 
        PageSize="5"  Width="450px" 
        onpageindexchanging="GvPresc_PageIndexChanging">
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
<asp:TemplateField HeaderText="Disease">
<ItemTemplate>
<asp:Label ID="lblSugar" runat="server" Text='<%#Eval("DiseaseHistory") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Prescription">
<ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("NewPrescription") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>

</Columns>
</asp:GridView>
 <br />
<asp:Button ID="btnPrint" runat="server" Text="Print Report" OnClientClick="callPrint('divPolicy')" />
<br />
<asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

</center>
</div>
</asp:Content>

