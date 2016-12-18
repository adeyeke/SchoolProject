using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        GridView2.Visible = false;
    }
    void ShowMessage(string msg)
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");
    }
    protected void search_btn_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        //string searchedword = "select * from Customer where (LastName like '%" + TextBox1.Text.ToString() + "%')";
        
    }
    protected void phone_search_btn_Click(object sender, EventArgs e)
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
    protected void RegNo_search_btn_Click(object sender, EventArgs e)
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
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            con.Open();
            string checkRegNo = "select JobCardNo, DateCreated, ServicedRequired, DateUpdated, Technician, RepairSummary from ServiceRecords where RegNo = '" + GridView1.SelectedRow.Cells[3].Text + "'";
            GridView2.Visible = true;
        }
        catch (Exception ex)
        {
            Response.Write("Error" + ex.Message);
        }
    }
}