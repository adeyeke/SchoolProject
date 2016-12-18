using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class SendMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            to_email.Text = Session["Value"].ToString();
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //string rowValue = Session["Value"].ToString();
        //to_email.Text = rowValue;

        MailMessage msg = new MailMessage();
        msg.From = new MailAddress("yaadewale55@gmail.com");
        msg.To.Add(to_email.Text);
        msg.Subject = subject.Text;
        msg.Body = message_area.Text;
        msg.IsBodyHtml = true;

        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        System.Net.NetworkCredential netwrkcred = new System.Net.NetworkCredential();
        netwrkcred.UserName = "yaadewale55@gmail.com";
        netwrkcred.Password = "Tomo55lade";
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = netwrkcred;
        smtp.Port = 587;
        smtp.EnableSsl = true;
        smtp.Send(msg);

        Response.Redirect("MessageConfirnmationPage.aspx");
        Session["Message"] = msg;
        Response.Write("Message sent!");
    }
}