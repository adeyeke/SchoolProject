<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MessageConfirnmationPage.aspx.cs" Inherits="MessageConfirnmationPage" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
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
                </asp:MenuItem>
            </Items>
        </asp:Menu>
    
        Job Card created!!<br />
        <br />
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustomerDetails.aspx">Go to Customer Details</asp:HyperLink>
    
    &nbsp;
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AddCustomer.aspx">Add Customer</asp:HyperLink>
    
    </div>
        </asp:Content>


