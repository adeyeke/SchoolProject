using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    int temp = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink1.Visible = false;
        //HyperLink2.Visible = false;
    }
    void ShowMessage(string msg)
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");
    }
    protected void logn_button_Click(object sender, EventArgs e)
    {
        //Connection string to the database is stored in the web config file and referenced here
        //without exposing the database credentials and can be accessed from anywhere in the
        //application
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);//reference to the name of the databse
        con.Open();//opens database connection

        //check the staff ID in database
        string checkuser = "SELECT count(*) FROM UserData WHERE StaffID = '" + staffidlogn.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, con);
        temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        con.Close();

        //to check the users password from the table if it matches the staff id
        if (temp == 1)
        {
            con.Open();
            string checkPasswordQuery = "select Password from UserData where StaffID = '" + staffidlogn.Text + "'";
            SqlCommand passCom = new SqlCommand(checkPasswordQuery, con);
            string password = passCom.ExecuteScalar().ToString().Replace(" ", "");

            //when it matches
            if (password == passwordlogn.Text)
            {
                Session["New"] = staffidlogn.Text;
                Response.Write("Password is correct");
                Response.Redirect("Users.aspx");
            }
            else
            {
                ShowMessage("Password is incorrect");//doesnt match
            }

        }
        else
        {
            ShowMessage("Staff ID is incorrect");//incorrect staff ID
        }
    }
}