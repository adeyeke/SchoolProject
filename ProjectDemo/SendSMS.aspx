<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendSMS.aspx.cs" Inherits="SendSMS" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content9" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="Phon No"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="phoneno_txtbox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="phoneno_txtbox" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Message"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="message_txt" runat="server" Height="113px" Width="194px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator0" runat="server" ControlToValidate="message_txt" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
    
        <asp:Button ID="Button1" runat="server" Text="Send" OnClick="Button1_Click" />
                </td>
                <td class="auto-style4">
        <input id="Reset1" type="reset" value="Reset" /></td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <div>
    
&nbsp;&nbsp;&nbsp;
        </div>
   </asp:Content>
