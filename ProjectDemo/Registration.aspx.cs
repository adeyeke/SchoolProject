using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    int temp = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            con.Open();
            string checkuser = "SELECT count(*) FROM UserData WHERE StaffID = '"+ username.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, con);
            temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp == 1)
            {
                Response.Write("Staff already exist");
            }

            con.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (temp == 0)
        {
            try
            {
                Guid newGuid = Guid.NewGuid();

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                con.Open();
                string insertquery = "insert into UserData (Id,StaffID, Password, Email, Priority) values (@id, @staffid, @pass, @email, @priority)";
                SqlCommand com = new SqlCommand(insertquery, con);
                com.Parameters.AddWithValue("@id", newGuid.ToString());
                com.Parameters.AddWithValue("@staffid", username.Text);
                com.Parameters.AddWithValue("@pass", password.Text);
                com.Parameters.AddWithValue("@email", email.Text);
                com.Parameters.AddWithValue("@priority", DropDownList1.SelectedItem.ToString());

                com.ExecuteNonQuery();
                Response.Redirect("Manager.aspx");
                Response.Write("Registration is succesful");

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error" + ex.ToString());
            }
        }
    }
}