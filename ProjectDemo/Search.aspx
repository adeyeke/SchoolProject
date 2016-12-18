<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content11" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="height: 978px; width: 676px">
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
                        <asp:MenuItem Text="Search" Value="Search" NavigateUrl="#"></asp:MenuItem>
                        <asp:MenuItem Text="Print" Value="Print" NavigateUrl="#"></asp:MenuItem>
                    </asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
        <fieldset>
            <legend>Search Customer</legend>
                    <asp:SqlDataSource ID="SqlDataSourceRegistration" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" 
                        
                
                SelectCommand="SELECT [JobCardNo], [DateCreated], [ServiceRequired], [DateUpdated], [Technician], [RepairSummary] FROM [ServiceRecords]">
                    </asp:SqlDataSource>
            <table class="auto-style1">
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label1" runat="server" Text="Enter Phone No:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Height="19px" Width="154px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td>
                    <asp:Button ID="phone_search_btn" runat="server" Text="Search" 
                        OnClick="phone_search_btn_Click" />
                </td>
            </tr>
        </table>
        </fieldset>
        
        &nbsp;
&nbsp;
        <br />
        <fieldset>
            <legend>Search for Vehicle</legend>
             <table class="auto-style1">
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label2" runat="server" Text="Enter Reg No:"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox2" runat="server" Height="16px" Width="165px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style7">
                    <asp:Button ID="reg_search_btn" runat="server" Text="Search" 
                        OnClick="RegNo_search_btn_Click" />
                </td>
            </tr>
        </table>
        </fieldset>
        <br />
        <br />
        <hr />
        <br />
        <fieldset style="height: 561px; width: 619px">
            <legend>Customer Details</legend>
                    <table class="auto-style3">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label3" runat="server" Text="Title"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label4" runat="server" Text="First Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label5" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label6" runat="server" Text="Email"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label7" runat="server" Text="Gender"></asp:Label>
                </td>

                <td>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
            <hr style="border:0px; border-bottom: 1px dashed #ccc; background: #999" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceRegistration" BackColor="#CCCCCC" 
                BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
                CellSpacing="2" ForeColor="Black" Height="159px" 
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="362px">
            <Columns>
                <asp:BoundField DataField="VehicleMake" HeaderText="VehicleMake" 
                    SortExpression="VehicleMake" />
                <asp:BoundField DataField="VehicleModel" HeaderText="VehicleModel" 
                    SortExpression="VehicleModel" />
                <asp:BoundField DataField="Year" HeaderText="Year" 
                    SortExpression="Year" />
                <asp:BoundField DataField="RegNo" HeaderText="RegNo" SortExpression="RegNo" />
                <asp:BoundField DataField="Color" HeaderText="Color" 
                    SortExpression="Color" />
                <asp:CommandField HeaderText="Action" ShowEditButton="True" ShowHeader="True" 
                    SelectText="" />
                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="View" 
                    ShowHeader="True" Text="History" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
            <hr />

            <asp:GridView ID="GridView2" runat="server" 
                DataSourceID="SqlDataSourceRegistration">
            </asp:GridView>

        </fieldset>
        <br />
        </div>
   </asp:Content>


<asp:Content ID="Content12" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 462px;
        }
        .auto-style2 {
            width: 98px;
        }
        .auto-style3 {
            width: 582px;
        }
        .auto-style4 {
            width: 102px;
        }
        .auto-style6 {
            width: 123px;
        }
        .auto-style7 {
            width: 166px;
        }
        .auto-style8 {
            width: 98px;
            height: 35px;
        }
        .auto-style9 {
            width: 166px;
            height: 35px;
        }
    </style>
</asp:Content>



