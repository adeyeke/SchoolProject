<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCustomer.aspx.cs" Inherits="AddCustomer" MasterPageFile="~/MasterPage.master"%>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
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
                        <asp:MenuItem Text="Print" Value="Print" NavigateUrl="#"></asp:MenuItem>
                    </asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Title</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="ddlTitle" runat="server">
                        <asp:ListItem>Select Title</asp:ListItem>
                        <asp:ListItem>Mr</asp:ListItem>
                        <asp:ListItem>Mrs</asp:ListItem>
                        <asp:ListItem>Ms</asp:ListItem>
                        <asp:ListItem>Dr</asp:ListItem>
                        <asp:ListItem>Prof</asp:ListItem>
                        <asp:ListItem>Pastor</asp:ListItem>
                        <asp:ListItem>Elder</asp:ListItem>
                        <asp:ListItem>Sister</asp:ListItem>
                        <asp:ListItem>Engr</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="ddlTitle" InitialValue="Select Title"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">First Name</td>
                <td class="auto-style4">
                    <asp:TextBox ID="fname" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="fname"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Last Name</td>
                <td class="auto-style4">
                    <asp:TextBox ID="lname" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="lname"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Email</td>
                <td class="auto-style4">
                    <asp:TextBox ID="email" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="email" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Phone No</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="ddl_countryname" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_countryname_SelectedIndexChanged" style="margin-left: 0px">
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="ddl_countrycode" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_countrycode_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:TextBox ID="phone" runat="server" TextMode="Phone" style="margin-left: 11px" Width="87px" MaxLength="9"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="phone"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Gender</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="ddlgender" runat="server">
                        <asp:ListItem>Select Gender</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="ddlgender" InitialValue="Select Gender"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style6">Vehicle Make</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="ddlVehicleMake" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlVehicleMake_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="ddlVehicleMake"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style8"></td>
                <td class="auto-style8"></td>
            </tr>
            <tr>
                <td class="auto-style3">Vehicle Model</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="ddlVehicleModel" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlVehicleModel_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="ddlVehicleModel"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="Transmission"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="ddl_trans" runat="server">
                        <asp:ListItem>-- Select Type --</asp:ListItem>
                        <asp:ListItem>Automatic</asp:ListItem>
                        <asp:ListItem>Manual</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddl_trans" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label3" runat="server" Text="Fuel"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="ddl_fuel" runat="server">
                        <asp:ListItem>-- Select --</asp:ListItem>
                        <asp:ListItem>Petrol</asp:ListItem>
                        <asp:ListItem>Diesel</asp:ListItem>
                        <asp:ListItem>Hybrid</asp:ListItem>
                        <asp:ListItem>Electric</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddl_fuel" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="Year"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="ddl_year" runat="server">
                        <asp:ListItem>-- Select Year --</asp:ListItem>
                        <asp:ListItem>2001</asp:ListItem>
                        <asp:ListItem>2002</asp:ListItem>
                        <asp:ListItem>2003</asp:ListItem>
                        <asp:ListItem>2004</asp:ListItem>
                        <asp:ListItem>2005</asp:ListItem>
                        <asp:ListItem>2006</asp:ListItem>
                        <asp:ListItem>2007</asp:ListItem>
                        <asp:ListItem>2008</asp:ListItem>
                        <asp:ListItem>2009</asp:ListItem>
                        <asp:ListItem>2010</asp:ListItem>
                        <asp:ListItem>2011</asp:ListItem>
                        <asp:ListItem>2012</asp:ListItem>
                        <asp:ListItem>2013</asp:ListItem>
                        <asp:ListItem>2014</asp:ListItem>
                        <asp:ListItem>2015</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ddl_year" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Reg No</td>
                <td class="auto-style5">
                    <asp:TextBox ID="regno" runat="server">
</asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="regno"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Color</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="ddlColors" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ColorName" DataValueField="ColorName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT [ColorName] FROM [Colors]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="ddlColors"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">VIN</td>
                <td class="auto-style7">
                    <asp:TextBox ID="vin" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="vin"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style8"></td>
                <td class="auto-style8"></td>
            </tr>
            <tr>
                <td class="auto-style3">Odomoter</td>
                <td class="auto-style5">
                    <asp:TextBox ID="odometer" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="odometer"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="submitbtn" runat="server" OnClick="submitbtn_Click" Text="Submit" />
                    <input id="Reset1" type="reset" value="Reset" /></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Content>

