using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JobCard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*if (IsPostBack)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            con.Open();
            string checkRegno = "SELECT count(*) FROM ServiceRecords WHERE RegNo = '" + reg_nobox.Text + "'";
            SqlCommand com1 = new SqlCommand(checkRegno, con);
            int temp = Convert.ToInt32(com1.ExecuteScalar().ToString());
            if (temp == 1)
            {
                ShowMessage("Record already exist!");
            }
        }*/
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
    void ShowMessage(string msg)
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");
    }
    protected void submit_jobcard_btn_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            con.Open();
            string insertquery = "INSERT INTO ServiceRecords (Title, FirstName, LastName, Email, JobCardNo, VehicleMake, VehicleModel, Color, VIN, RegNo, ServiceRequired, Comment) VALUES (@ttle, @firstn, @lastn, @eml, @jobno, @vmake, @vmodel, @clr, @vn, @reggy, @servicereq, @comment)";
            SqlCommand com = new SqlCommand(insertquery, con);

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
            if (CheckBoxList1.SelectedItem != null)
            {
                com.Parameters.AddWithValue("@servicereq", CheckBoxList1.SelectedItem.Text);
            }
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

}