<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Users" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div>
    
        <asp:Label ID="welcomelabel" runat="server" Text="Welcome"></asp:Label>
    
        <br />
        <br />
        <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal">
            <DynamicMenuStyle BackColor="MintCream" />
            <DynamicMenuItemStyle BorderColor="White" BorderWidth="3px" BorderStyle="Solid" />
            <DynamicHoverStyle Font-Bold="true" />
            <DynamicSelectedStyle BackColor="Black" />
            <Items>
                <asp:MenuItem Text="File" Value="File">
                    <asp:MenuItem Text="Add Customer" Value="Add Customer" NavigateUrl="~/AddCustomer.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Create Job Card" Value="Create Job Card" 
                        NavigateUrl="~/JobCard.aspx">
                        <asp:MenuItem Text="New Customer" Value="New Customer" NavigateUrl="~/JobCard.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Existing Customer" Value="Existing Customer" 
                            NavigateUrl="~/JobCard.aspx"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Send Message" Value="Send Message" NavigateUrl="~/SendMessage.aspx"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Edit" Value="Edit">
                    <asp:MenuItem NavigateUrl="~/CustomerDetails.aspx" Text="Customer Details" Value="Customer Details">
                        <asp:MenuItem Text="Search" Value="Search" NavigateUrl="~/Search.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Print" Value="Print" NavigateUrl="#"></asp:MenuItem>
                    </asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
    
        <br />
        <br />
        <br />
    
        <br />
    
    </div>
        <asp:Button ID="logout_butn" runat="server" OnClick="logout_butn_Click" Text="Logout" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Registration.aspx" Visible="False">Register New Staff</asp:HyperLink>
        </asp:Content>
