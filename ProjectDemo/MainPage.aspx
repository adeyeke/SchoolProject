<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage" ValidateRequest="false" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 84%;
        }
        .auto-style4 {
            width: 58%;
        }
        .auto-style6 {
            width: 160px;
        }
        .auto-style7 {
            width: 100%;
        }
        .auto-style12 {
            width: 71px;
        }
        .auto-style13 {
            width: 431px;
        }
        .auto-style15 {
            width: 70px;
        }
        #TextArea1 {
            height: 214px;
            width: 422px;
        }
        .auto-style18 {
            width: 67%;
        }
        .auto-style19 {
            width: 66%;
        }
        .auto-style22 {
            width: 52%;
            height: 42px;
        }
        .auto-style24 {
            width: 155px;
            height: 42px;
        }
        .auto-style27 {
            width: 155px;
        }
        .auto-style28 {
            width: 52%;
        }
        .auto-style30 {
            width: 44px;
        }
        .auto-style38 {
            width: 153px;
        }
        .auto-style40 {
            width: 76%;
        }
        .auto-style41 {
            width: 392px;
            height: 19px;
        }
        .auto-style42 {
            width: 76%;
            height: 19px;
        }
        .auto-style43 {
            width: 153px;
            height: 19px;
        }
        .auto-style44 {
            height: 19px;
        }
        .auto-style45 {
            width: 44px;
            height: 19px;
        }
        .auto-style47 {
            width: 154px;
        }
        .auto-style48 {
            width: 154px;
            height: 42px;
        }
        .auto-style50 {
            width: 392px;
        }
        .auto-style51 {
            width: 130px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="4" 
            Height="1145px" Width="847px" style="margin-right: 23px">
            <cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
                <HeaderTemplate>Add New Customer<br /></HeaderTemplate>
                <ContentTemplate>
                    <table class="auto-style1">
            <tr>
                <td class="auto-style47">Title</td>
                <td class="auto-style28">
                    <asp:DropDownList ID="ddlTitle" runat="server" ValidationGroup="Add_Cust_Tab">
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
                <td class="auto-style27">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                        ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="ddlTitle" 
                        InitialValue="Select Title" ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style48">First Name</td>
                <td class="auto-style22">
                    <asp:TextBox ID="fname" runat="server" ValidationGroup="Add_Cust_Tab"></asp:TextBox>
                </td>
                <td class="auto-style24">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                        ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="fname" 
                        ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style47">Last Name</td>
                <td class="auto-style28">
                    <asp:TextBox ID="lname" runat="server" ValidationGroup="Add_Cust_Tab"></asp:TextBox>
                </td>
                <td class="auto-style27">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                        ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="lname" 
                        ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style47">Email</td>
                <td class="auto-style28">
                    <asp:TextBox ID="email" runat="server" TextMode="Email" 
                        ValidationGroup="Add_Cust_Tab"></asp:TextBox>
                </td>
                <td class="auto-style27">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                        ControlToValidate="email" ErrorMessage="Required Field" ForeColor="Red" 
                        ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style47">Phone No</td>
                <td class="auto-style28">
                    <asp:DropDownList ID="ddl_countryname" runat="server" AutoPostBack="True" 
                        OnSelectedIndexChanged="ddl_countryname_SelectedIndexChanged" 
                        style="margin-left: 0px" ValidationGroup="Add_Cust_Tab">
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="ddl_countrycode" runat="server" AutoPostBack="True" 
                        OnSelectedIndexChanged="ddl_countrycode_SelectedIndexChanged" 
                        ValidationGroup="Add_Cust_Tab">
                    </asp:DropDownList>
                    <asp:TextBox ID="phone" runat="server" TextMode="Phone" 
                        style="margin-left: 11px" Width="87px" MaxLength="9" 
                        ValidationGroup="Add_Cust_Tab"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="phone_FilteredTextBoxExtender" runat="server" 
                        TargetControlID="phone" FilterType="Numbers" 
                        BehaviorID="_content_phone_FilteredTextBoxExtender" />
                </td>
                <td class="auto-style27">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                        ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="phone" 
                        ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style47">Gender</td>
                <td class="auto-style28">
                    <asp:DropDownList ID="ddlgender" runat="server" ValidationGroup="Add_Cust_Tab">
                        <asp:ListItem>Select Gender</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style27">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                        ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="ddlgender" 
                        InitialValue="Select Gender" ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style47">&nbsp;</td>
                <td class="auto-style28">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style47">&nbsp;</td>
                <td class="auto-style28">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
            </tr>
        </table>
                    <table class="auto-style1">
            <tr>
                <td class="auto-style50">Vehicle Make</td>
                <td class="auto-style40">
                    <asp:DropDownList ID="ddlVehicleMake" runat="server" AutoPostBack="True" 
                        OnSelectedIndexChanged="ddlVehicleMake_SelectedIndexChanged" 
                        ValidationGroup="Add_Cust_Tab">
                    </asp:DropDownList>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                        ErrorMessage="Required Field" ForeColor="Red" 
                        ControlToValidate="ddlVehicleMake" ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style50">Vehicle Model</td>
                <td class="auto-style40">
                    <asp:DropDownList ID="ddlVehicleModel" runat="server" AutoPostBack="True" 
                        OnSelectedIndexChanged="ddlVehicleModel_SelectedIndexChanged" 
                        ValidationGroup="Add_Cust_Tab">
                    </asp:DropDownList>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                        ErrorMessage="Required Field" ForeColor="Red" 
                        ControlToValidate="ddlVehicleModel" ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style30">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style41">
                    <asp:Label ID="Label31" runat="server" Text="Transmission"></asp:Label>
                </td>
                <td class="auto-style42">
                    <asp:DropDownList ID="ddl_trans" runat="server" ValidationGroup="Add_Cust_Tab">
                        <asp:ListItem>-- Select Type --</asp:ListItem>
                        <asp:ListItem>Automatic</asp:ListItem>
                        <asp:ListItem>Manual</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style43">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                        ControlToValidate="ddl_trans" ErrorMessage="Required Field" ForeColor="Red" 
                        ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style44"></td>
                <td class="auto-style44"></td>
                <td class="auto-style45"></td>
            </tr>
            <tr>
                <td class="auto-style50">
                    <asp:Label ID="Label32" runat="server" Text="Fuel"></asp:Label>
                </td>
                <td class="auto-style40">
                    <asp:DropDownList ID="ddl_fuel" runat="server" ValidationGroup="Add_Cust_Tab">
                        <asp:ListItem>-- Select --</asp:ListItem>
                        <asp:ListItem>Petrol</asp:ListItem>
                        <asp:ListItem>Diesel</asp:ListItem>
                        <asp:ListItem>Hybrid</asp:ListItem>
                        <asp:ListItem>Electric</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" 
                        ControlToValidate="ddl_fuel" ErrorMessage="Required Field" ForeColor="Red" 
                        ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style30">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style50">
                    <asp:Label ID="Label33" runat="server" Text="Year"></asp:Label>
                </td>
                <td class="auto-style40">
                    <asp:DropDownList ID="ddl_year" runat="server" ValidationGroup="Add_Cust_Tab">
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
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                        ControlToValidate="ddl_year" ErrorMessage="Required Field" ForeColor="Red" 
                        ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style30">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style50">Reg No</td>
                <td class="auto-style40">
                    <asp:TextBox ID="regno" runat="server" ValidationGroup="Add_Cust_Tab"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                        ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="regno" 
                        ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style30">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style50">Color</td>
                <td class="auto-style40">
                    <asp:DropDownList ID="ddlColors" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="ColorName" 
                        DataValueField="ColorName" ValidationGroup="Add_Cust_Tab">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT [ColorName] FROM [Colors]"></asp:SqlDataSource>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                        ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="ddlColors" 
                        ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style30">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style50">VIN</td>
                <td class="auto-style40">
                    <asp:TextBox ID="vin" runat="server" ValidationGroup="Add_Cust_Tab"></asp:TextBox>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                        ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="vin" 
                        ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style8"></td>
                <td class="auto-style30"></td>
            </tr>
            <tr>
                <td class="auto-style50">Odomoter</td>
                <td class="auto-style40">
                    <asp:TextBox ID="odometer" runat="server" ValidationGroup="Add_Cust_Tab"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="odometer_FilteredTextBoxExtender" 
                        runat="server" TargetControlID="odometer"  FilterType="Numbers" 
                        BehaviorID="_content_odometer_FilteredTextBoxExtender"/>
                </td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                        ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="odometer" 
                        ValidationGroup="Add_Cust_Tab"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style30">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style50">&nbsp;</td>
                <td class="auto-style40">
                    <asp:Button ID="submitbtn" runat="server" OnClick="submitbtn_Click" 
                        Text="Submit" style="height: 26px" ValidationGroup="Add_Cust_Tab" />
                    <input id="Reset1" type="reset" value="Reset" /></td>
                <td class="auto-style38">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style30">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style50">&nbsp;</td>
                <td class="auto-style40">
                    &nbsp;</td>
                <td class="auto-style38">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style30">&nbsp;</td>
            </tr>
        </table>
                </ContentTemplate>
            </cc1:TabPanel>
            <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                <HeaderTemplate>Create Job Card</HeaderTemplate>
                <ContentTemplate>
                    <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="regno_search_txtbox" ErrorMessage="Enter Reg No" 
                        ForeColor="Red" ValidationGroup="create_job_tab"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label17" runat="server" Text="RegNo"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="regno_search_txtbox" runat="server" 
                        ValidationGroup="create_job_tab"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Button4" runat="server" Text="Search" 
                        OnClick="search_btn_Click" Width="63px" ValidationGroup="create_job_tab" />
                </td>
                <td>
                    <input id="Reset2" type="reset" value="Reset" /></td>
            </tr>
        </table>
                    <fieldset>
            <legend>
                Customer Details
            </legend>
        <table class="auto-style1">
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label18" runat="server" Text="Title"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="title_txtbox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="title_txtbox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style12">
                    <asp:Label ID="Label19" runat="server" Text="Vehicle Make"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="vmake_txtbox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style18">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="vmake_txtbox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label20" runat="server" Text="First Name"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="fname_txtbox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="fname_txtbox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style12">
                    <asp:Label ID="Label21" runat="server" Text="Vehicle Model"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="vmodel_txtbox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style18">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="vmodel_txtbox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label22" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="lname_txtbox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="lname_txtbox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style12">
                    <asp:Label ID="Label23" runat="server" Text="Color"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="color_txtbox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style18">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="color_txtbox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label24" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="email_txtbx" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="email_txtbx" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style12">
                    <asp:Label ID="Label25" runat="server" Text="Reg No"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="reg_nobox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style18">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="reg_nobox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label26" runat="server" Text="Job Card No"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="jb_cardtxbx" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="jb_cardtxbx" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style12">
                    <asp:Label ID="Label27" runat="server" Text="VIN"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="vin_txtbx" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style18">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="vin_txtbx" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style12">
                    <asp:Label ID="Label28" runat="server" Text="Transmission"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="trans_txtbx" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style18">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="trans_txtbx" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style12">
                    <asp:Label ID="Label29" runat="server" Text="Fuel"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="fuel_txtbx" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style18">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="fuel_txtbx" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style12">
                    <asp:Label ID="Label30" runat="server" Text="Year"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="yr_txbox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style18">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="yr_txbox" ErrorMessage="Required Field" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
            </fieldset>
                    <fieldset style="height: 160px; width: 492px">
        <legend>
            Service Required
        </legend>
        <asp:CheckBoxList ID="CheckBoxList2" runat="server">
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
            <textarea id="coment_area" runat="server"></textarea> </fieldset>
        <asp:Button ID="submit_jobcard_btn" runat="server" Text="Submit" OnClick="submit_jobcard_btn_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="Reset1" type="reset" value="Reset" />
   
                </ContentTemplate>
            </cc1:TabPanel>
            <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                <HeaderTemplate>Update Job Card<br /></HeaderTemplate>
                <ContentTemplate>
                    <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="jobno_searchbx" ErrorMessage="Required Field" 
                        ForeColor="Red" ValidationGroup="update_job_tab"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label8" runat="server" Text="Job Card No"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="jobno_searchbx" runat="server" 
                        ValidationGroup="update_job_tab"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Search_btn" runat="server" Text="Search" 
                        OnClick="Search_btn_Click" ValidationGroup="update_job_tab" />
                </td>
            </tr>
        </table>
                    <fieldset>
        <legend style="width: 186px">
            Customer Vehicle Details
        </legend>
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label9" runat="server" Text="Vehicle Make" Visible="False"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="vmake_txtbbx" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Vehicle Model" Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="vmodel_txtbx" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Vehicle Color" Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="vcolo_txtbx" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="Reg No" Visible="False"></asp:Label>
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
                    <asp:Label ID="Label13" runat="server" Text="Service Required" Visible="False"></asp:Label>
                </td>
                <td>
                    <textarea id="servreq_txtarea" visible="False" runat="server"></textarea> </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label14" runat="server" Text="Comments" Visible="False"></asp:Label>
                </td>
                <td>
                    <textarea id="com_txtarea" visible="False" runat="server"></textarea> </td>
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
        <textarea id="repair_summtxtarea" runat="server"></textarea>
    </fieldset>
    <fieldset>
        <legend>Recommendation</legend>
        <textarea id="recom_txtarea" runat="server"></textarea>
    </fieldset>
    <fieldset>
        <legend>Select Next Service Date and Milleage</legend>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label15" runat="server" Text="Date"></asp:Label>
                </td>
                <td>
        <asp:TextBox ID="datetxtbx" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="datetxtbx_CalendarExtender" runat="server" 
                        TargetControlID="datetxtbx" 
                        BehaviorID="_content_datetxtbx_CalendarExtender" />
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label16" runat="server" Text="Milleage"></asp:Label>
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
                </ContentTemplate>
            </cc1:TabPanel>
            <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
                <HeaderTemplate>Send SMS</HeaderTemplate>
            <ContentTemplate><asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager><br /><table class="auto-style7"><tr>
                <td class="auto-style51"><asp:Label 
                    ID="Label7" runat="server" Text="To:"></asp:Label></td><td><asp:TextBox 
                        ID="TextBox7" runat="server" ></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="TextBox7_FilteredTextBoxExtender" 
                        runat="server" TargetControlID="TextBox7" FilterType="Numbers"/>
                    <cc1:AutoCompleteExtender 
                        ID="TextBox7_AutoCompleteExtender" runat="server" 
                        BehaviorID="TextBox7_AutoCompleteExtender" DelimiterCharacters="" 
                        ServicePath="" TargetControlID="TextBox7" ServiceMethod="GetPhoneNos"
                        MinimumPrefixLength="1" CompletionSetCount="1"></cc1:AutoCompleteExtender></td></tr>
                <tr>
                    <td class="auto-style51">
                        <asp:Label ID="Label34" runat="server" Text="Choose Template"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                            OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" 
                            RepeatColumns="3" AutoPostBack="True">
                            <asp:ListItem>New Customer</asp:ListItem>
                            <asp:ListItem>Service Reminder</asp:ListItem>
                            <asp:ListItem>Job Complete</asp:ListItem>
                            <asp:ListItem>Progress Report</asp:ListItem>
                            <asp:ListItem>Office Closed</asp:ListItem>
                            <asp:ListItem>Greetings</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr><td 
                        class="auto-style51">&nbsp;</td><td><textarea id="TextArea1" runat="server" 
                            maxlength="160"></textarea> </td></tr><tr>
                <td 
                    class="auto-style51">&nbsp;</td><td><asp:Button ID="Button3" runat="server" 
                        Text="Send" /></td></tr></table></ContentTemplate></cc1:TabPanel>
            <cc1:TabPanel ID="TabPanel5" runat="server" HeaderText="TabPanel5">
                <HeaderTemplate>Search</HeaderTemplate>
                <ContentTemplate><asp:SqlDataSource ID="SqlDataSourceRegistration" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" 
                        
                        
                        
                        SelectCommand="SELECT [JobCardNo], [DateCreated], [ServiceRequired], [DateUpdated], [Technician], [RepairSummary], [RegNo], [Comment] FROM [ServiceRecords]"></asp:SqlDataSource><table class="auto-style1"><tr><td class="auto-style15"><asp:Label ID="Label1" runat="server" Text="Phone No:"></asp:Label></td><td class="auto-style6">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <cc1:FilteredTextBoxExtender ID="TextBox1_FilteredTextBoxExtender" 
                            runat="server" TargetControlID="TextBox1" FilterType="Numbers" 
                                BehaviorID="_content_TextBox1_FilteredTextBoxExtender" />
                        </td><td><asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" /></td></tr></table><table class="auto-style4"><tr><td class="auto-style15"><asp:Label ID="Label2" runat="server" Text="Reg No:"></asp:Label></td><td class="auto-style6"><asp:TextBox ID="TextBox2" runat="server" style="margin-left: 0px"></asp:TextBox></td><td><asp:Button 
                        ID="Button2" runat="server" Text="Search" OnClick="Button2_Click" /></td></tr></table><hr /><fieldset><legend>Customer Detials </legend><table class="auto-style7"><tr><td class="auto-style12"><asp:Label ID="Label3" runat="server" Text="Title"></asp:Label></td><td class="auto-style13"><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td></tr><tr><td class="auto-style12"><asp:Label ID="Label4" runat="server" Text="First Name"></asp:Label></td><td class="auto-style13"><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td></tr><tr><td class="auto-style12"><asp:Label ID="Label5" runat="server" Text="Last Name"></asp:Label></td><td class="auto-style13"><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td></tr><tr><td class="auto-style12"><asp:Label ID="Label6" runat="server" Text="Email"></asp:Label></td><td class="auto-style13"><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td></tr></table><hr style="border:0px; border-bottom: 1px dashed #ccc; background: #999" />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceRegistration" BackColor="#CCCCCC" 
                BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
                CellSpacing="2" ForeColor="Black" Height="159px" 
                Width="362px" 
                            AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"><Columns>
                                <asp:BoundField DataField="VehicleMake" HeaderText="VehicleMake" 
                    SortExpression="VehicleMake" /><asp:BoundField DataField="VehicleModel" HeaderText="VehicleModel" 
                    SortExpression="VehicleModel" /><asp:BoundField DataField="Year" HeaderText="Year" 
                    SortExpression="Year" /><asp:BoundField DataField="RegNo" HeaderText="RegNo" SortExpression="RegNo" /><asp:BoundField DataField="Color" HeaderText="Color" 
                    SortExpression="Color" />
                                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="View" 
                                    ShowHeader="True" Text="History" />
                                <asp:ButtonField HeaderText="Comments" Text="Notes" />
                            </Columns><FooterStyle BackColor="#CCCCCC" /><HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" /><PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" /><RowStyle BackColor="White" /><SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" /><SortedAscendingCellStyle BackColor="#F1F1F1" /><SortedAscendingHeaderStyle 
                            BackColor="Gray" /><SortedDescendingCellStyle BackColor="#CAC9C9" /><SortedDescendingHeaderStyle BackColor="#383838" /></asp:GridView><hr />
                        <asp:GridView ID="GridView2" runat="server" 
                DataSourceID="SqlDataSourceRegistration" AllowPaging="True" 
                            AutoGenerateColumns="False" DataKeyNames="JobCardNo" Height="192px" 
                            Width="796px">
                            <Columns>
                                <asp:BoundField DataField="JobCardNo" HeaderText="JobCardNo" ReadOnly="True" 
                                    SortExpression="JobCardNo" />
                                <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" 
                                    SortExpression="DateCreated" />
                                <asp:BoundField DataField="ServiceRequired" HeaderText="ServiceRequired" 
                                    SortExpression="ServiceRequired" />
                                <asp:BoundField DataField="DateUpdated" HeaderText="DateUpdated" 
                                    SortExpression="DateUpdated" />
                                <asp:BoundField DataField="Technician" HeaderText="Technician" 
                                    SortExpression="Technician" />
                                <asp:BoundField DataField="RepairSummary" HeaderText="RepairSummary" 
                                    SortExpression="RepairSummary" />
                                <asp:BoundField DataField="RegNo" HeaderText="RegNo" SortExpression="RegNo" />
                            </Columns>
                        </asp:GridView></fieldset></ContentTemplate>
            </cc1:TabPanel>
            <cc1:TabPanel ID="TabPanel6" runat="server" HeaderText="TabPanel6">
                <HeaderTemplate>
                    Reports
                </HeaderTemplate>
                <ContentTemplate>
                    <table class="auto-style7">
                        <tr>
                            <td>
                                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Button" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
            </cc1:TabPanel>
        </cc1:TabContainer>
    
    </div>
    </form>
</body>
</html>
