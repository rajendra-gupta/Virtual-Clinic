<%@ Page Language="C#" MasterPageFile="~/KioskManager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="frmProvideAppointments.aspx.cs" Inherits="Kiosk_Manager_frmProvideAppointments" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<center>
<br />
<br />
<asp:Button ID="btnShow" runat="server" Text="Show Requests " 
        onclick="btnShow_Click" style="color: #FFFFFF; background-color: #5D7B9D; font-weight: 700;" 
        Width="119px" />
<br />
<br />
<asp:GridView ID="GvRequests" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" 
        PageSize="5"  Width="450px" 
        onpageindexchanging="GvRequests_PageIndexChanging" 
        onrowcommand="GvRequests_RowCommand">
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
<asp:Label ID="lblId" runat="server" Text='<%#Eval("Patient") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="AppointmentDate">
<ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("Apmt_Date") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="DoctorName">
                        <ItemTemplate > 
                        
<%--                            <asp:Label ID="lblDate2" Visible="false" runat="server" Text='<%#Eval("Apmt_Date")%>'></asp:Label>
--%>                        <asp:LinkButton ID="lnkDoctor" runat="server" Text='<%#Eval("Doctor")%>'
                        CommandArgument='<%#Eval("DoctorId") %>' CommandName="Availability" CausesValidation="false"
                        ></asp:LinkButton>
                        </ItemTemplate>
                        </asp:TemplateField>
                        
    <asp:TemplateField HeaderText="Reply">
    <ItemTemplate>
    <asp:LinkButton ID="lbReply" runat="server" Text="Reply" CommandArgument='<%#Eval("AppointmentId") %>' CommandName="Reply" ></asp:LinkButton>
    </ItemTemplate>
    </asp:TemplateField>   
    <asp:TemplateField HeaderText="Cancel">
    <ItemTemplate>
    <asp:LinkButton ID="lblCancel" runat="server" Text="Cancel" CommandArgument='<%#Eval("AppointmentId") %>' CommandName="Cancel" CausesValidation="false"></asp:LinkButton>
    </ItemTemplate>
    </asp:TemplateField>                           

</Columns>
</asp:GridView>
<br />
<asp:GridView ID="GvAvailability" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" 
        PageSize="5"  Width="450px" >
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
<asp:TemplateField HeaderText="ApmtDate">
<ItemTemplate>
<asp:Label ID="lblDate" runat="server" Text='<%#Eval("Apmt_Date") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="FromTime">
<ItemTemplate>
<asp:Label ID="lblFrom" runat="server" Text='<%#Eval("FromTime") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="ToTime">
<ItemTemplate>
<asp:Label ID="lblTo" runat="server" Text='<%#Eval("ToTime") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
 <asp:TemplateField HeaderText="AppointedTimings">
<ItemTemplate>
<asp:Label ID="lblTime" runat="server" Text='<%#Eval("Apmt_Time") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>                   

</Columns>
</asp:GridView>
<br />
<table id="tblTime" runat="server" style="color: #FFFFFF; background-color: #5D7B9D" >
<tr>
<td style="font-weight: 700">Apmt_Time</td>
<td><asp:TextBox ID="txtTime" runat="server" Width="58px"></asp:TextBox><asp:DropDownList
                    ID="ddlTime" runat="server" >
                    <asp:ListItem>AM</asp:ListItem>
                    <asp:ListItem>PM</asp:ListItem>
                </asp:DropDownList>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="*" 
        ControlToValidate="txtTime" MaximumValue="12" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                <%--<cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" ClearMaskOnLostFocus="False"
                    Mask="99:99" MaskType="Time" TargetControlID="txtTime">
                </cc1:MaskedEditExtender>--%>
</td>
<td>
    <asp:RequiredFieldValidator ID="rfvTime" runat="server" ErrorMessage="*" 
        ControlToValidate="txtTime" InitialValue="__:__"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td></td>
<td colspan="2">
<asp:Button ID="btnSubmit" runat="server" Text="Submit " 
         style="color: #FFFFFF; background-color: #5D7B9D; font-weight: 700;" onclick="btnSubmit_Click" 
         />
</td>
</tr>
</table>
<asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
<br />
</center>
</div>
</asp:Content>

