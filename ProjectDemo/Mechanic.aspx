<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Mechanic.aspx.cs" Inherits="Mechanic" MasterPageFile="~/MasterPage.master" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>


<asp:Content ID="Content12" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div>
    <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" Visible="false">
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
                    <asp:MenuItem NavigateUrl="~/Mechanic.aspx" Text="Update Job" Value="Update Job" Enabled="False"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="jobno_searchbx" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="Job Card No"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="jobno_searchbx" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Search_btn" runat="server" Text="Search" OnClick="Search_btn_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    <fieldset>
        <legend style="width: 186px">
            Customer Vehicle Details
        </legend>
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label2" runat="server" Text="Vehicle Make" Visible="False"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="vmake_txtbbx" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Vehicle Model" Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="vmodel_txtbx" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Vehicle Color" Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="vcolo_txtbx" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Reg No" Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="regno_txtbx" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Service Required" Visible="False"></asp:Label>
                </td>
                <td>
                    <textarea id="servreq_txtarea" name="servreq_txtarea" visible="false" runat="server"></textarea></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Comments" Visible="False"></asp:Label>
                </td>
                <td>
                    <textarea id="com_txtarea" name="com_txtarea" visible="false" runat="server"></textarea></td>
            </tr>
        </table>
    </fieldset>
    <fieldset>
        <legend>
            Parts Required
        </legend>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server">
            <asp:ListItem>Engine Oil</asp:ListItem>
            <asp:ListItem>Oil Filter</asp:ListItem>
            <asp:ListItem>Fuel Filter</asp:ListItem>
            <asp:ListItem>Transmission Oil</asp:ListItem>
            <asp:ListItem>Brake Pads (FR)</asp:ListItem>
            <asp:ListItem>Brake Pads (RR)</asp:ListItem>
            <asp:ListItem>Brake Disc</asp:ListItem>
        </asp:CheckBoxList>
    </fieldset>
    <fieldset>
        <legend>Technician In Charge</legend>
    &nbsp;
        <asp:DropDownList ID="ddl_techs" runat="server">
            <asp:ListItem>-- Select --</asp:ListItem>
            <asp:ListItem>Joe</asp:ListItem>
            <asp:ListItem>Sean</asp:ListItem>
            <asp:ListItem>Connor</asp:ListItem>
            <asp:ListItem>Dave</asp:ListItem>
            <asp:ListItem>Cormac</asp:ListItem>
        </asp:DropDownList>
    </fieldset>
    <fieldset>
        <legend>Repair Summary</legend>
        <textarea id="repair_summtxtarea" name="repair_summtxtarea" runat="server"></textarea>
    </fieldset>
    <fieldset>
        <legend>Recommendation</legend>
        <textarea id="recom_txtarea" name="recom_txtarea" runat="server"></textarea>
    </fieldset>
    <fieldset>
        <legend>Select Next Service Date and Milleage</legend>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label11" runat="server" Text="Date"></asp:Label>
                </td>
                <td>
        <asp:TextBox ID="datetxtbx" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="datetxtbx_CalendarExtender" runat="server" 
                        TargetControlID="datetxtbx" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label10" runat="server" Text="Milleage"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="milleagetxtbx" runat="server" Height="16px" 
                        style="margin-left: 0px" Width="161px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </fieldset>
        <asp:Button ID="submit_mech_btn" runat="server" Text="Submit" 
        OnClick="submit_mech_btn_Click1" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="Reset1" type="reset" value="Reset" />
   </asp:Content>
<asp:Content ID="Content13" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 203px;
        }
        .auto-style3 {
            width: 195px;
        }
        .auto-style4 {
            width: 189px;
        }
        .auto-style5 {
            width: 72px;
        }
    </style>
</asp:Content>

