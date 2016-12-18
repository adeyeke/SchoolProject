<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMessage.aspx.cs" Inherits="SendMessage" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <div class="auto-style1">
            <asp:Menu ID="Menu3" runat="server" Orientation="Horizontal">
            <DynamicMenuStyle BackColor="MintCream" />
            <DynamicMenuItemStyle BorderColor="White" BorderWidth="3px" BorderStyle="Solid" />
            <DynamicHoverStyle Font-Bold="true" />
            <DynamicSelectedStyle BackColor="Black" />
            <Items>
                <asp:MenuItem Text="File" Value="File">
                    <asp:MenuItem Text="Add Customer" Value="Add Customer" NavigateUrl="~/AddCustomer.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Create Job Card" Value="Create Job Card" NavigateUrl="#">
                        <asp:MenuItem Text="New Customer" Value="New Customer" NavigateUrl="#"></asp:MenuItem>
                        <asp:MenuItem Text="Existing Customer" Value="Existing Customer" NavigateUrl="#"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Send Message" Value="Send Message" NavigateUrl="~/SendMessage.aspx"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Edit" Value="Edit">
                    <asp:MenuItem NavigateUrl="~/CustomerDetails.aspx" Text="Customer Details" Value="Customer Details">
                        <asp:MenuItem Text="Search" Value="Search" NavigateUrl="#"></asp:MenuItem>
                        <asp:MenuItem Text="Print" Value="Print" NavigateUrl="#"></asp:MenuItem>
                    </asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <table class="auto-style2">
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label1" runat="server" Text="To"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="to_email" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label2" runat="server" Text="Subject:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="subject" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="subject" ErrorMessage="Please type in a message" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label3" runat="server" Text="Message"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="message_area" runat="server" Height="118px" style="margin-left: 0px" Width="241px" BorderStyle="None"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please type in a message" ForeColor="Red" ControlToValidate="message_area"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Button ID="send_btn" runat="server" Text="Send" OnClick="Button1_Click" Width="76px" />
                        &nbsp;&nbsp;
                        <input id="Reset1" type="reset" value="Reset" /></td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
            </table>
        </div>
            </asp:Content>

