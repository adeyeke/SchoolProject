<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerDetails.aspx.cs" Inherits="CustomerDetails" MasterPageFile="~/MasterPage.master"  EnableEventValidation="false"%>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Menu ID="Menu2" runat="server" Orientation="Horizontal">
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
                        <asp:MenuItem Text="Search" Value="Search" NavigateUrl="~/CustomerDetails.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Print" Value="Print" NavigateUrl="#"></asp:MenuItem>
                    </asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSourceRegistration" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT [DateCreated], [Title], [FirstName], [LastName], [PhoneNo], [VehicleMake], [VehicleModel], [Year], [RegNo], [Color] FROM [Customer]"></asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="Search"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;
        <asp:Button ID="search_btn" runat="server" OnClick="search_btn_Click" Text="Go" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="excelfile_btn" runat="server" OnClick="excelfile_btn_Click" Text="Creat Excel File" />
    <div>
    
    </div>
        <asp:GridView ID="CustomerDetailsView" runat="server" AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSourceRegistration" Width="695px" style="margin-top: 3px; margin-right: 0px;" 
            OnSelectedIndexChanged="CustomerDetailsView_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" SortExpression="PhoneNo" />
                <asp:BoundField DataField="VehicleMake" HeaderText="VehicleMake" SortExpression="VehicleMake" />
                <asp:BoundField DataField="VehicleModel" HeaderText="VehicleModel" SortExpression="VehicleModel" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                <asp:BoundField DataField="RegNo" HeaderText="RegNo" SortExpression="RegNo" />
                <asp:BoundField DataField="Color" HeaderText="Color" SortExpression="Color" />
                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Action" ShowHeader="True" Text="Send SMS" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <p>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/AddCustomer.aspx">Add Another Customer</asp:HyperLink>
        </p>
   </asp:Content>