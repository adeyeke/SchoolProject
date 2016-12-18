using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExcelLibrary.CompoundDocumentFormat;
using ExcelLibrary.SpreadSheet;
using System.IO;
using System.ServiceModel;

public partial class CustomerDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Bindgrid();

        }  
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the runtime error "  
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
    } 

    private void Bindgrid()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        string query = "select * from Customer";//not recommended this i have wrtten just for example,write stored procedure for security  
        SqlDataAdapter com = new SqlDataAdapter(query, con);
        DataSet dr = new DataSet();
        com.Fill(dr);
        //CustomerDetailsView.DataSource = dr.Tables[0];
        CustomerDetailsView.DataBind();
        con.Close();

    }  

    protected void CustomerDetailsView_SelectedIndexChanged(object sender, EventArgs e)
    {
            /*string email = CustomerDetailsView.SelectedRow.Cells[6].Text;
            Session["Value"] = email;
            Response.Redirect("SendMessage.aspx");*/

            string phone = CustomerDetailsView.SelectedRow.Cells[5].Text.Trim();
            Session["Value"] = phone;
            Response.Redirect("SendSMS.aspx");

        string fname = CustomerDetailsView.SelectedRow.Cells[3].Text;
        string lname = CustomerDetailsView.SelectedRow.Cells[4].Text;
        

        //Response.Write("First Name: " + fname + " " + "Last Name: " + lname + " " + "Phone No: " + email);
        

        //Server.Transfer("SendMessage.aspx");
    }

    public string Phone
    {
        get
        {
            return CustomerDetailsView.SelectedRow.Cells[5].Text;
        }
    }

    private void rep_bind()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        string query = "select * from Customer where FirstName = '" + TextBox1.Text + "'";

        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        da.Fill(ds);

    }

    protected void search_btn_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        string searchedword = "select * from Customer where (LastName like '%" + TextBox1.Text.ToString() + "%')";
        SqlDataSourceRegistration.SelectCommand = searchedword;     
       
    }
    protected void excelfile_btn_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }

    private void ExportGridToExcel()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "Customer Details" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        CustomerDetailsView.GridLines = GridLines.Both;
        CustomerDetailsView.HeaderStyle.Font.Bold = true;
        CustomerDetailsView.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();
        

    }
}