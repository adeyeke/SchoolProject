using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Twilio;
using System.Configuration;

public partial class SendSMS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //sets the phone number in the row the SendSMS button is clicked into the To textbox
        phoneno_txtbox.Text = Session["Value"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string ACCOUNT_SID = "AC0de882fa5e451d04ad3cd5c52a9ef159";
        string AUTH_TOKEN = "f6edad968806fafb4ef2bd1d6bce0da3";

        TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);
        client.SendSmsMessage("+12815009789", phoneno_txtbox.Text, message_txt.Text);
        Response.Redirect("CustomerDetails.aspx");
    }
}