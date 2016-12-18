using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mechanic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    void ShowMessage(string msg)
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");
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

            Label2.Visible = true; vmake_txtbbx.Visible = true; vmake_txtbbx.Enabled = false;
            Label3.Visible = true; vmodel_txtbx.Visible = true; vmodel_txtbx.Enabled = false;
            Label4.Visible = true; vcolo_txtbx.Visible = true; vcolo_txtbx.Enabled = false;
            Label5.Visible = true; regno_txtbx.Visible = true; regno_txtbx.Enabled = false;
            Label8.Visible = true; servreq_txtarea.Visible = true; com_txtarea.Disabled = true;
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
            com.Parameters.AddWithValue("@nextmile", milleagetxtbx.Text);
            com.Parameters.AddWithValue("@nextdate", datetxtbx.Text);
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
}