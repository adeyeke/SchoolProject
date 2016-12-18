using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        //Roles.CreateRole("Admin");
        //Roles.AddUserToRole("Seun", "Admin");

        if (Session["New"] != null)
        {
            welcomelabel.Text += " "  +(Session["New"].ToString() + "!");
            if (Session["New"].ToString() == "admin")
            {
                HyperLink3.Visible = true;
            }
            if (Session["New"].ToString() == "sean")
            {
                Response.Redirect("Mechanic.aspx");
            }
        }
        else
            Response.Redirect("Login.aspx");
    }
    protected void logout_butn_Click(object sender, EventArgs e)
    {
        Session["New"] = null;
        //string display = "Information!";
        //ScriptManager.RegisterStartupScript(this, GetType(), "You have logged out", "alert('" + display + "');", true);
        Response.Redirect("Login.aspx");
    }
    
}