<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobCard.aspx.cs" Inherits="JobCard" MasterPageFile="~/MasterPage.master" %>
<asp:Content ID="Content10" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div>
        <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal">
            <DynamicMenuStyle BackColor="MintCream" />
            <DynamicMenuItemStyle BorderColor="White" BorderWidth="3px" BorderStyle="Solid" />
            <DynamicHoverStyle Font-Bold="true" />
            <DynamicSelectedStyle BackColor="Black" />
            <Items>
                <asp:MenuItem Text="File" Value="File">
                    <asp:MenuItem Text="Add Customer" Value="Add Customer" NavigateUrl="~/AddCustomer.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Create Job Card" Value="Create Job Card" NavigateUrl="#">
                        <asp:MenuItem Text="New Customer" Value="New Customer" NavigateUrl="~/JobCard.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Existing Customer" Value="Existing Customer" NavigateUrl="#"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Send Message" Value="Send Message" NavigateUrl="~/SendMessage.aspx"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Edit" Value="Edit">
                    <asp:MenuItem NavigateUrl="~/CustomerDetails.aspx" Text="Customer Details" Value="Customer Details">
                        <asp:MenuItem Text="Search" Value="Search" NavigateUrl="~/Search.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Print" Value="Print" NavigateUrl="~/CustomerDetails.aspx"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Mechanic.aspx" Text="Update Job" Value="Update Job"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="regno_search_txtbox" ErrorMessage="Enter Reg No" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="RegNo"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="regno_search_txtbox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="search_btn" runat="server" Text="Search" OnClick="search_btn_Click" Width="63px" />
                </td>
                <td>
                    <input id="Reset2" type="reset" value="Reset" /></td>
            </tr>
        </table>
        <br />
        <fieldset>
            <legend>
                Customer Details
            </legend>
        <table class="auto-style1">
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label2" runat="server" Text="Title"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="title_txtbox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="title_txtbox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style9">
                    <asp:Label ID="Label5" runat="server" Text="Vehicle Make"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="vmake_txtbox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="vmake_txtbox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label3" runat="server" Text="First Name"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="fname_txtbox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="fname_txtbox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style10">
                    <asp:Label ID="Label6" runat="server" Text="Vehicle Model"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="vmodel_txtbox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="vmodel_txtbox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label4" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="lname_txtbox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="lname_txtbox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style10">
                    <asp:Label ID="Label7" runat="server" Text="Color"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="color_txtbox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="color_txtbox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label10" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="email_txtbx" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="email_txtbx" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style10">
                    <asp:Label ID="Label8" runat="server" Text="Reg No"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="reg_nobox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="reg_nobox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label14" runat="server" Text="Job Card No"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="jb_cardtxbx" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="jb_cardtxbx" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style10">
                    <asp:Label ID="Label9" runat="server" Text="VIN"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="vin_txtbx" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="vin_txtbx" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10">
                    <asp:Label ID="Label11" runat="server" Text="Transmission"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="trans_txtbx" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="trans_txtbx" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10">
                    <asp:Label ID="Label12" runat="server" Text="Fuel"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="fuel_txtbx" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="fuel_txtbx" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10">
                    <asp:Label ID="Label13" runat="server" Text="Year"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="yr_txbox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="yr_txbox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
            </fieldset>
    
    </div>
    <fieldset style="height: 160px; width: 492px">
        <legend>
            Service Required
        </legend>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server">
            <asp:ListItem Value="full_service">Full Service</asp:ListItem>
            <asp:ListItem Value="oil_change">Oil Change</asp:ListItem>
            <asp:ListItem Value="repair">Repairs</asp:ListItem>
            <asp:ListItem Value="gm">General Maintenance</asp:ListItem>
            <asp:ListItem Value="balnce_align">Balancing &amp; Alignment</asp:ListItem>
            <asp:ListItem Value="others">Others</asp:ListItem>
        </asp:CheckBoxList>
       
    </fieldset>
        <br />
        <fieldset>
            <legend>
                Comments
            </legend>
            <textarea id="coment_area" name="coment_area" runat="server"></textarea></fieldset>
        <asp:Button ID="submit_jobcard_btn" runat="server" Text="Submit" OnClick="submit_jobcard_btn_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="Reset1" type="reset" value="Reset" />
   
   </asp:Content>
