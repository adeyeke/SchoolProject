using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainPage : System.Web.UI.Page
{
    int temp = 0;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        //gets a value that indicates whether the page is not been rendered for a first time
        //or is not been loaded in response to a post back
        if (!IsPostBack)
        {
            BindCountryDropDown();
            BindVehicleDropDown();
        }
        else
        {
            //Connection string to the database is stored in the web config file and referenced here
            //without exposing the database credentials and can be accessed from anywhere in the
            //application
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            con.Open();
            string checkCustomer = "SELECT count(*) FROM Customer WHERE RegNo = '" + regno.Text + "'";
            SqlCommand com = new SqlCommand(checkCustomer, con);
            temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp == 1)
            {
                ShowMessage("Customer already exist with Reg No: " + regno.Text);
            }

            con.Close();
        }
        GridView1.Visible = false;
        GridView2.Visible = false;
        //TabPanel1.Visible = false;
    }

    private void BindVehicleDropDown()
    {
        con.Open();
        SqlCommand com = new SqlCommand("select * from VehicleMake", con);
        SqlDataAdapter da = new SqlDataAdapter(com);

        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();

        ddlVehicleMake.DataSource = ds;
        ddlVehicleMake.DataTextField = "Make";
        ddlVehicleMake.DataValueField = "VehicleID";
        ddlVehicleMake.DataBind();

        ddlVehicleMake.Items.Insert(0, new ListItem("-- Select --", "0"));
        ddlVehicleModel.Items.Insert(0, new ListItem("-- Select --", "0"));
        ddlColors.Items.Insert(0, new ListItem("-- Select --", "0"));
    }

    private void BindCountryDropDown()
    {
        con.Open();
        SqlCommand com = new SqlCommand("select * from CountryName", con);
        SqlDataAdapter da = new SqlDataAdapter(com);

        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();

        ddl_countryname.DataSource = ds;
        ddl_countryname.DataTextField = "Name";
        ddl_countryname.DataValueField = "CountryNameID";
        ddl_countryname.DataBind();

        ddl_countryname.Items.Insert(0, new ListItem("-- Select Country --", "0"));
    }

    //dialog box
    void ShowMessage(string msg)
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            con.Open();
            string searchPhoneNo = "select * from Customer where (PhoneNo like '%" + TextBox1.Text.ToString() + "%' )";
            string query = "select Title, FirstName, LastName, Email from Customer where PhoneNo = '" + TextBox1.Text.ToString() + "'";
            SqlDataSourceRegistration.SelectCommand = searchPhoneNo;
            GridView1.Visible = true;
            SqlCommand com = new SqlCommand(query, con);
            SqlDataReader reader = com.ExecuteReader();
            if (reader.Read())
            {
                TextBox3.Text = reader["Title"].ToString();
                TextBox4.Text = reader["FirstName"].ToString();
                TextBox5.Text = reader["LastName"].ToString();
                TextBox6.Text = reader["Email"].ToString();

                reader.Close();
                con.Close();

            }

        }
        catch (Exception ex)
        {

            Response.Write("Error:" + ex.Message);
        }
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            con.Open();
            string checkRegNo = "select * from ServiceRecords where (RegNo like '%" + GridView1.SelectedRow.Cells[3].Text.ToString() + "%' )";
            SqlDataSourceRegistration.SelectCommand = checkRegNo;
            GridView2.Visible = true;
        }
        catch (Exception ex)
        {
            Response.Write("Error" + ex.Message);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            con.Open();
            string searchRegNo = "select * from customer where (RegNo like '%" + TextBox2.Text.ToString() + "%')";
            string query = "select Title, FirstName, LastName, Email from Customer where RegNo = '" + TextBox2.Text.ToString() + "'";
            SqlDataSourceRegistration.SelectCommand = searchRegNo;
            GridView1.Visible = true;
            SqlCommand com = new SqlCommand(query, con);
            SqlDataReader reader = com.ExecuteReader();
            if (reader.Read())
            {
                TextBox3.Text = reader["Title"].ToString();
                TextBox4.Text = reader["FirstName"].ToString();
                TextBox5.Text = reader["LastName"].ToString();
                TextBox6.Text = reader["Email"].ToString();

                reader.Close();
                con.Close();

            }
        }
        catch (Exception ex)
        {
            Response.Write("Error:" + ex.Message);
        }
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetPhoneNos(string prefixText)
    {
        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("select * from Customer where PhoneNo like @phone+'%'", con);
        cmd.Parameters.AddWithValue("@phone", prefixText);
        SqlDataAdapter adpt = new SqlDataAdapter(cmd);
        adpt.Fill(dt);

        List<string> PhoneNos = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            PhoneNos.Add(dt.Rows[i][6].ToString());
        }
        return PhoneNos;
    }
    protected void Search_btn_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        string query = "select VehicleMake, VehicleModel, Color, RegNo, ServiceRequired, Comment from ServiceRecords where JobCardNo = '" + jobno_searchbx.Text + "'";
        SqlCommand com = new SqlCommand(query, con);

        SqlDataReader reader = com.ExecuteReader();
        if (reader.Read())
        {
            vmake_txtbbx.Text = reader["VehicleMake"].ToString();
            vmodel_txtbx.Text = reader["VehicleModel"].ToString();
            vcolo_txtbx.Text = reader["Color"].ToString();
            regno_txtbx.Text = reader["RegNo"].ToString();
            servreq_txtarea.Value = reader["ServiceRequired"].ToString();
            com_txtarea.Value = reader["Comment"].ToString();

            reader.Close();
            con.Close();

            Label14.Visible = true; vmake_txtbbx.Visible = true; vmake_txtbbx.Enabled = false;
            Label13.Visible = true; vmodel_txtbx.Visible = true; vmodel_txtbx.Enabled = false;
            Label12.Visible = true; vcolo_txtbx.Visible = true; vcolo_txtbx.Enabled = false;
            Label11.Visible = true; regno_txtbx.Visible = true; regno_txtbx.Enabled = false;
            Label10.Visible = true; servreq_txtarea.Visible = true; com_txtarea.Disabled = true;
            Label9.Visible = true; com_txtarea.Visible = true; servreq_txtarea.Disabled = true;

        }
        else
        {
            ShowMessage("Job Card Number does not exist");
        }
        
    }
    protected void submit_mech_btn_Click1(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            con.Open();
            DateTime date = DateTime.Now;
            string updatequery = "Update ServiceRecords set Technician = @tech, NextServiceDate = @nextdate, DateUpdated = @dateupdate, NextServiceMilleage = @nextmile, RepairSummary = @repsumm where JobCardNo = '" + jobno_searchbx.Text + "'";
            SqlCommand com = new SqlCommand(updatequery, con);

            com.Parameters.AddWithValue("@tech", ddl_techs.SelectedItem.ToString());
            com.Parameters.AddWithValue("@repsumm", repair_summtxtarea.Value);

            if (milleagetxtbx != null)
            {
                com.Parameters.AddWithValue("@nextmile", milleagetxtbx.Text);
            }
            else
            {
                milleagetxtbx.Text = "Not Applicable";
            }
            
            if (datetxtbx != null)
            {
                com.Parameters.AddWithValue("@nextdate", datetxtbx.Text);
            }
            else
            {
                datetxtbx.Text = "Not Applicable";
            }
            
            com.Parameters.AddWithValue("@dateupdate", date);

            /*List<String> CheckBoxListStr = new List<string>();
            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected && CheckBoxList1.SelectedItem != null)
                {
                    com.Parameters.AddWithValue("@repsumm", CheckBoxList1.SelectedItem.Text);
                }
            }*/

            com.ExecuteNonQuery();
            ShowMessage("Job card sucessfully updated");
            //Response.Redirect("MessageConfirnmationPage.aspx");

            con.Close();

            jobno_searchbx.Text = string.Empty;
            vmake_txtbbx.Text = string.Empty;
            vmodel_txtbx.Text = string.Empty;
            vcolo_txtbx.Text = string.Empty;
            regno_txtbx.Text = string.Empty;
            servreq_txtarea.Value = string.Empty;
            com_txtarea.Value = string.Empty;
            CheckBoxList1.ClearSelection();
            ddl_techs.ClearSelection();
            repair_summtxtarea.Value = string.Empty;
            recom_txtarea.Value = string.Empty;
            datetxtbx.Text = string.Empty;
            milleagetxtbx.Text = string.Empty;
        }
        catch (Exception ex)
        {
            Response.Write("Error" + ex.Message);
        }
    }
    protected void search_btn_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        string query = "SELECT Title,FirstName,LastName, Email, VehicleMake,VehicleModel, Transmission, Fuel, Year, RegNo, Color, VIN FROM Customer WHERE RegNo = '" + regno_search_txtbox.Text + "'";


        SqlCommand com = new SqlCommand(query, con);
        SqlDataReader reader = com.ExecuteReader();
        if (reader.Read())
        {
            title_txtbox.Text = reader["Title"].ToString();
            fname_txtbox.Text = reader["FirstName"].ToString();
            lname_txtbox.Text = reader["LastName"].ToString();
            vmake_txtbox.Text = reader["VehicleMake"].ToString();
            vmodel_txtbox.Text = reader["VehicleModel"].ToString();
            color_txtbox.Text = reader["Color"].ToString();
            reg_nobox.Text = reader["RegNo"].ToString();
            vin_txtbx.Text = reader["VIN"].ToString();
            email_txtbx.Text = reader["Email"].ToString();
            trans_txtbx.Text = reader["Transmission"].ToString();
            fuel_txtbx.Text = reader["Fuel"].ToString();
            yr_txbox.Text = reader["Year"].ToString();

            reader.Close();
            con.Close();

            title_txtbox.Enabled = false;
            fname_txtbox.Enabled = false;
            lname_txtbox.Enabled = false;
            vmake_txtbox.Enabled = false;
            vmodel_txtbox.Enabled = false;
            color_txtbox.Enabled = false;
            reg_nobox.Enabled = false;
            vin_txtbx.Enabled = false;
            email_txtbx.Enabled = false;
            trans_txtbx.Enabled = false;
            fuel_txtbx.Enabled = false;
            yr_txbox.Enabled = false;
        }
        else
        {
            //ShowMessage("Reg No doesn't exist");
            Response.Write("Reg No doesn't exist");
        }
    }
    protected void submit_jobcard_btn_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            con.Open();
            string insertquery = "INSERT INTO ServiceRecords (Title, FirstName, LastName, Email, JobCardNo, VehicleMake, VehicleModel, Color, VIN, RegNo, ServiceRequired, Comment) VALUES (@ttle, @firstn, @lastn, @eml, @jobno, @vmake, @vmodel, @clr, @vn, @reggy, @servicereq, @comment)";
            SqlCommand com = new SqlCommand(insertquery, con);

            List<String> checkbxlst = new List<string>();
            foreach (ListItem item in CheckBoxList2.Items)
            {
                if (item.Selected && CheckBoxList2 != null)
                {
                    checkbxlst.Add(item.Text);
                }
            }
            string theList = String.Join(",", checkbxlst.ToArray());

            com.Parameters.AddWithValue("@ttle", title_txtbox.Text);
            com.Parameters.AddWithValue("@firstn", fname_txtbox.Text);
            com.Parameters.AddWithValue("@lastn", lname_txtbox.Text);
            com.Parameters.AddWithValue("@eml", email_txtbx.Text);
            com.Parameters.AddWithValue("@jobno", jb_cardtxbx.Text);
            com.Parameters.AddWithValue("@vmake", vmake_txtbox.Text);
            com.Parameters.AddWithValue("@vmodel", vmodel_txtbox.Text);
            com.Parameters.AddWithValue("@clr", color_txtbox.Text);
            com.Parameters.AddWithValue("@vn", vin_txtbx.Text);
            com.Parameters.AddWithValue("@reggy", reg_nobox.Text);
            com.Parameters.AddWithValue("@servicereq", theList);
            com.Parameters.AddWithValue("@comment", coment_area.Value);

            com.ExecuteNonQuery();
            Response.Redirect("MessageConfirnmationPage.aspx");

            con.Close();
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message);
        }
    }
    protected void submitbtn_Click(object sender, EventArgs e)
    {
        if (temp == 0)
        {
            try
            {
                Guid newGuid = Guid.NewGuid();

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                con.Open();
                string insertquery = "insert into Customer (Id,Title, FirstName, LastName, Email, PhoneNo, VehicleMake, VehicleModel, Transmission, Fuel, Year, RegNo, Color, VIN, Odometer) values (@id, @title, @fname, @lname, @email, @phoneno, @vehiclemake, @vehiclemodel, @transmission, @fuel, @year, @regno, @color, @vin, @odometer)";
                SqlCommand com = new SqlCommand(insertquery, con);
                com.Parameters.AddWithValue("@id", newGuid.ToString());
                com.Parameters.AddWithValue("@title", ddlTitle.SelectedItem.ToString());
                com.Parameters.AddWithValue("@fname", fname.Text);
                com.Parameters.AddWithValue("@lname", lname.Text.ToUpper());
                com.Parameters.AddWithValue("@email", email.Text);
                com.Parameters.AddWithValue("@phoneno", ddl_countrycode.SelectedItem.ToString().Trim() + phone.Text.Trim());
                com.Parameters.AddWithValue("@vehiclemake", ddlVehicleMake.SelectedItem.ToString());
                com.Parameters.AddWithValue("@vehiclemodel", ddlVehicleModel.SelectedItem.ToString());
                com.Parameters.AddWithValue("@transmission", ddl_trans.SelectedItem.ToString());
                com.Parameters.AddWithValue("@fuel", ddl_fuel.SelectedItem.ToString());
                com.Parameters.AddWithValue("@year", ddl_year.SelectedItem.ToString());
                com.Parameters.AddWithValue("@regno", regno.Text.ToUpper());
                com.Parameters.AddWithValue("@color", ddlColors.SelectedItem.ToString());
                com.Parameters.AddWithValue("@vin", vin.Text.ToUpper());
                com.Parameters.AddWithValue("@odometer", odometer.Text);

                com.ExecuteNonQuery();
                Response.Redirect("CustomerDetails.aspx");

                con.Close();
                ShowMessage("Registration is succesful! New customer added");
            }
            catch (Exception ex)
            {
                Response.Write("Error" + ex.ToString());
            }
        }
    }
    protected void ddlVehicleMake_SelectedIndexChanged(object sender, EventArgs e)
    {
        int VehicleID = Convert.ToInt32(ddlVehicleMake.SelectedValue);
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        SqlCommand com = new SqlCommand("select * from VehiceModel where VehicleID=" + VehicleID, con);
        SqlDataAdapter da = new SqlDataAdapter(com);

        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();

        ddlVehicleModel.DataSource = ds;
        ddlVehicleModel.DataTextField = "Model";
        ddlVehicleModel.DataValueField = "VehicleModelID";
        ddlVehicleModel.DataBind();

        ddlVehicleModel.Items.Insert(0, new ListItem("-- Select --", "0"));
    }
    protected void ddl_countryname_SelectedIndexChanged(object sender, EventArgs e)
    {
        int CountryNameID = Convert.ToInt32(ddl_countryname.SelectedValue);
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        SqlCommand com = new SqlCommand("select * from CountryCode where CountryNameID =" + CountryNameID, con);
        SqlDataAdapter da = new SqlDataAdapter(com);

        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();

        ddl_countrycode.DataSource = ds;
        ddl_countrycode.DataTextField = "Code";
        ddl_countrycode.DataValueField = "CountryCodeID";
        ddl_countrycode.DataBind();
    }
    protected void ddl_countrycode_SelectedIndexChanged(object sender, EventArgs e)
    {
        int CountryCodeID = Convert.ToInt32(ddl_countrycode.SelectedValue);
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        SqlCommand com = new SqlCommand("select * from CountryCode where CountryCodeID=" + CountryCodeID, con);
        SqlDataAdapter da = new SqlDataAdapter(com);

        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
    }
    protected void ddlVehicleModel_SelectedIndexChanged(object sender, EventArgs e)
    {
        int VehicleModelID = Convert.ToInt32(ddlVehicleModel.SelectedValue);
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        SqlCommand com = new SqlCommand("select * from VehiceModel where VehicleModelID=" + VehicleModelID, con);
        SqlDataAdapter da = new SqlDataAdapter(com);

        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "New Customer")
        {
            TextArea1.Value = "Dear XX,Blah de blah de blah. Thank you.";
        }
        else if (RadioButtonList1.SelectedValue == "Service Reminder")
        {
            TextArea1.Value = "Dear XX, Your vehicle is due for service. Thank you";
        }
        else if (RadioButtonList1.SelectedValue == "Greetings")
        {
            TextArea1.Value = "Dear XX,Just saying hi. Thank you";
        }
        else if (RadioButtonList1.SelectedValue == "Job Complete")
        {
            TextArea1.Value = "Dear XX, Your vehicle is ready. Thank you";
        }
        else if (RadioButtonList1.SelectedValue == "Progress Report")
        {
            TextArea1.Value = "Dear XX,Men at work. Thank you";
        }
        else if (RadioButtonList1.SelectedValue == "Office Closed")
        {
            TextArea1.Value = "Dear XX, Not working today. Thank you";
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            con.Open();

            string newQuery = "select ServiceRequired, Comment from ServiceRecords";
            SqlCommand com = new SqlCommand(newQuery, con);

            StreamWriter sw = File.AppendText(@"C:\Users\Adeyeke\Desktop\file.txt");
            SqlDataReader reader = com.ExecuteReader();
            sw.WriteLine("ServiceReq, comment");
            while (reader.Read())
            {
                sw.WriteLine(reader["ServiceRequired"].ToString());
                sw.WriteLine("," + reader["Comment"].ToString());
            }
            sw.WriteLine("Report at : " + DateTime.Now);
            sw.WriteLine("==============================================");

            sw.Close();
            reader.Close();
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Error" + ex.ToString());
        }
        //System.Diagnostics.Process.Start("Notepad.exe");
    }

    protected void GridView1_RowCommand(object sender, CommandEventArgs e)
    {
        string comandName = e.CommandName;
        
    }
}