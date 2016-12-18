using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCustomer : System.Web.UI.Page
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
    }
    //method to show dialog box
    void ShowMessage(string msg)
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");
    }

    //method to bind the country name
    protected void BindCountryDropDown()
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

    protected void BindVehicleDropDown()
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

    /*protected void ddlColors_SelectedIndexChanged(object sender, EventArgs e)
    {
        int ColorID = Convert.ToInt32(ddlColors.SelectedValue);
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        SqlCommand com = new SqlCommand("select * from Colors where ColorID=" + ColorID, con);
        SqlDataAdapter da = new SqlDataAdapter(com);

        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();

        ddlColors.DataSource = ds;
        ddlColors.DataTextField = "ColorName";
        ddlColors.DataValueField = "ColorID";
        ddlColors.DataBind();

        ddlColors.Items.Insert(0, new ListItem("-- Select --", "0"));


    }*/


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
                com.Parameters.AddWithValue("@phoneno", ddl_countrycode.SelectedItem.ToString() + phone.Text);
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


   
}